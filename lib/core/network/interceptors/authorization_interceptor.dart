import 'dart:async';

import 'package:dating_app/app/data/datasource/local/local_signin/i_local_signin_service.dart';
import 'package:dating_app/core/navigation/app_navigation.dart';
import 'package:dating_app/core/navigation/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthorizationInterceptor extends Interceptor {
  // ignore: unused_field
  final Dio _dio;
  final ILocalSigninService _iLocalSigninService;
  Map<String, dynamic>? _headers;

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
        // Token'ı temizle
        await _iLocalSigninService.clearSignIn();

        // Sign in sayfasına yönlendir
        final navigatorKey = AppNavigation.navigatorKey;
        if (navigatorKey.currentContext != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            navigatorKey.currentContext!.pushNamed(AppRoutes.signInView.name);
          });
        }

        return handler.next(err);
      }
    }

    return handler.next(err);
  }
}
