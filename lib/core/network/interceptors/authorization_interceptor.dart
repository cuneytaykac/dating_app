import 'dart:async';
import 'dart:developer';

import 'package:dating_app/app/data/datasource/local/local_signin/i_local_signin_service.dart';
import 'package:dating_app/app/data/datasource/remote/sign_in/i_sign_in_service.dart';
import 'package:dating_app/app/data/model/sign_in/sign_in.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/navigation/app_navigation.dart';
import 'package:dating_app/core/navigation/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthorizationInterceptor extends Interceptor {
  // ignore: unused_field
  final Dio _dio;
  final ILocalSigninService _iLocalSigninService;
  final ISignInService _signInService = getIt.get<ISignInService>();
  Map<String, dynamic>? _headers;
  static bool _isRefreshing = false; // Lock mekanizması için static değişken
  static Completer<void>? _refreshCompleter; // Bekleyen istekler için completer

  AuthorizationInterceptor({
    required Dio dio,
    required ILocalSigninService iLocalSigninService,
    required Map<String, dynamic>? headers,
  }) : _dio = dio,
       _iLocalSigninService = iLocalSigninService,
       _headers = headers;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_headers == null || _headers?.isEmpty == true) {
      _headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": await _iLocalSigninService.getToken(),
      };
    } else {}

    options.headers.addAll(_headers!);

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // TOKEN_UNAVAILABLE hatasını kontrol et
    if (err.response?.statusCode == 400) {
      final responseData = err.response?.data;
      if (responseData is Map<String, dynamic> &&
          responseData['message'] == 'TOKEN_UNAVAILABLE') {
        try {
          // Eğer refresh işlemi devam ediyorsa, bekle
          if (_isRefreshing) {
            log(
              'Token yenileme işlemi devam ediyor, bekleniyor...',
              name: 'AuthorizationInterceptor',
            );
            await _refreshCompleter?.future;
            return _retryRequest(err, handler);
          }

          _isRefreshing = true;
          _refreshCompleter = Completer<void>();

          log(
            'Token yenileme başlatılıyor...',
            name: 'AuthorizationInterceptor',
          );

          // Kayıtlı kullanıcı bilgilerini al
          final signIn = await _getStoredSignInData();
          if (signIn?.email == null || signIn?.password == null) {
            throw Exception('Kayıtlı kullanıcı bilgileri bulunamadı');
          }

          // Sign in servisine istek at
          final result = await _signInService.postLogin(
            email: signIn!.email,
            password: signIn.password,
          );

          result.when(
            success: (response) async {
              if (response?.data != null) {
                // Yeni token bilgilerini kaydet
                final newSignIn = SignIn(
                  id: response!.data!.id,
                  email: signIn.email,
                  name: response.data!.name,
                  photoUrl: response.data!.photoUrl,
                  token: response.data!.token,
                  username: response.data!.username,
                  password: signIn.password,
                );

                await _iLocalSigninService.saveSignIn(newSignIn);

                // Headers'ı güncelle
                _headers = {
                  "Accept": "application/json",
                  "Content-Type": "application/json",
                  "Authorization": await _iLocalSigninService.getToken(),
                };

                _refreshCompleter?.complete();
                log(
                  'Token başarıyla yenilendi',
                  name: 'AuthorizationInterceptor',
                );
                return _retryRequest(err, handler);
              } else {
                throw Exception('Token yenileme yanıtı boş');
              }
            },
            failure: (error) {
              log(
                'Token yenileme hatası: $error',
                name: 'AuthorizationInterceptor',
              );
              _refreshCompleter?.completeError(error);
              throw Exception('Token yenileme başarısız: $error');
            },
          );
        } catch (e) {
          log('Token yenileme hatası: $e', name: 'AuthorizationInterceptor');
          _refreshCompleter?.completeError(e);

          // Token'ı temizle ve sign in sayfasına yönlendir
          await _iLocalSigninService.clearSignIn();

          final navigatorKey = AppNavigation.navigatorKey;
          if (navigatorKey.currentContext != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              navigatorKey.currentContext!.pushNamed(AppRoutes.signInView.name);
            });
          }

          return handler.next(err);
        } finally {
          _isRefreshing = false;
          _refreshCompleter = null;
        }
      }
    }

    return handler.next(err);
  }

  Future<SignIn?> _getStoredSignInData() async {
    try {
      // Local'den kayıtlı kullanıcı bilgilerini al
      return await _iLocalSigninService.getSignInData();
    } catch (e) {
      log(
        'Kayıtlı kullanıcı bilgileri alınamadı: $e',
        name: 'AuthorizationInterceptor',
      );
      return null;
    }
  }

  Future<void> _retryRequest(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      log('İstek tekrar deneniyor...', name: 'AuthorizationInterceptor');

      final originalRequest = err.requestOptions;
      // Yeni token ile header'ı güncelle
      final newToken = await _iLocalSigninService.getToken();
      originalRequest.headers["Authorization"] = newToken;

      final retryResponse = await _dio.fetch(originalRequest);

      log('Tekrar denenen istek başarılı', name: 'AuthorizationInterceptor');
      return handler.resolve(retryResponse);
    } catch (e) {
      log(
        'Tekrar denenen istek başarısız: $e',
        name: 'AuthorizationInterceptor',
      );
      return handler.next(err);
    }
  }
}
