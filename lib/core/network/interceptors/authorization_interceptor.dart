import 'dart:async';

import 'package:dating_app/app/data/datasource/local/local_signin/i_local_signin_service.dart';
import 'package:dio/dio.dart';

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
    return handler.next(err);
  }
}
