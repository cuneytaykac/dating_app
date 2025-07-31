import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';
import 'package:dating_app/core/network/enum/request_method_enum.dart';
import 'package:dating_app/core/network/interfaces/base_network_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkManager {
  NetworkManager setPath({required String path});

  NetworkManager setBaseUrl({required String path});

  NetworkManager setRequestMethod({
    required RequestMethodEnum requestMethodEnum,
  });

  ResultDecode<K, BaseNetworkErrorType> execute<T extends BaseNetworkModel, K>(
    T responseModel,
  );

  ResultDecode<String, BaseNetworkErrorType> executeString();

  ResultDecode<Response, BaseNetworkErrorType> executeResponse();

  NetworkManager setQueryParameters({
    required Map<String, dynamic> queryParameters,
  });

  NetworkManager setBody({required Map<String, dynamic>? bodyJson});

  NetworkManager setBodyFormData({FormData? formData});

  NetworkManager setHeaders({Map<String, dynamic> header});

  NetworkManager setInterceptor();

  NetworkManager setFunctionName({required String? functionName});

  NetworkManager setSignInHeader();

  NetworkManager clearFormData();
}
