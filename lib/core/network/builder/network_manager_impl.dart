import 'dart:async'; // For Completer, StreamSubscription
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart'; // Required for ConnectivityResult.none check in listener
import 'package:dating_app/app/data/datasource/local/local_signin/i_local_signin_service.dart';
import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';
import 'package:dating_app/core/firebase/crashlytics/crashlytics_manager.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/network/builder/network_manager.dart';
import 'package:dating_app/core/network/enum/request_method_enum.dart';
import 'package:dating_app/core/network/interceptors/authorization_interceptor.dart';
import 'package:dating_app/core/network/interfaces/base_network_model.dart';
import 'package:dating_app/core/network/layers/network_connectivity.dart';
import 'package:dating_app/core/network/layers/network_decoding.dart';
import 'package:dating_app/core/result/result.dart';
import 'package:dating_app/core/utility/connectivity/connectivity_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
// For ConnectivityController
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@Injectable(as: NetworkManager)
class NetworkManagerImpl extends NetworkManager {
  final _dio = Dio();

  Map<String, dynamic>? _queryParameter;
  Map<String, dynamic>? _bodyJson;
  Map<String, dynamic>? _header;
  FormData? _formData;
  RequestMethodEnum? _requestMethodEnum;
  String? _path;
  String? _setUrlPath;
  String? _functionName;
  final ConnectivityController _connectivityController =
      ConnectivityController();
  @override
  NetworkManager setPath({required String path}) {
    _path = path;
    return this;
  }

  @override
  NetworkManager setRequestMethod({
    required RequestMethodEnum requestMethodEnum,
  }) {
    _requestMethodEnum = requestMethodEnum;
    return this;
  }

  @override
  NetworkManager setQueryParameters({
    required Map<String, dynamic> queryParameters,
  }) {
    _queryParameter = queryParameters;
    return this;
  }

  @override
  NetworkManager setBody({required Map<String, dynamic>? bodyJson}) {
    _bodyJson = bodyJson;
    return this;
  }

  @override
  NetworkManager setBodyFormData({FormData? formData}) {
    _formData = formData;
    return this;
  }

  @override
  NetworkManager setHeaders({Map<String, dynamic>? header}) {
    _dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
    ]);
    _header = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    _header = header;
    return this;
  }

  @override
  NetworkManager setSignInHeader() {
    _dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
    ]);
    _header = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

    return this;
  }

  @override
  NetworkManager setInterceptor() {
    _dio.interceptors.addAll([
      AuthorizationInterceptor(
        iLocalSigninService: getIt.get<ILocalSigninService>(),
        dio: _dio,
        headers: _header,
      ),

      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
    ]);

    return this;
  }

  void _clearInterceptorAndHeader() {
    _dio.interceptors.clear();
    _header = null;
  }

  @override
  NetworkManager setFunctionName({required String? functionName}) {
    _functionName = functionName;
    return this;
  }

  // Helper method to perform the actual network request and handle common errors
  Future<Result<K, BaseNetworkErrorType>>
  _performRequestInternal<T extends BaseNetworkModel, K>(
    String? path,
    RequestMethodEnum? requestMethod,
    dynamic formDataOrBody,
    Map<String, dynamic>? headers,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    T responseModel,
    String? functionNameForLogging,
  ) async {
    try {
      final response = await _dio.fetch(
        RequestOptions(
          path: path ?? '',
          connectTimeout: const Duration(seconds: 300),
          receiveTimeout: const Duration(seconds: 300),
          method: requestMethod?.rawValue,
          data: formDataOrBody,
          headers: headers,
          baseUrl: baseUrl,
          queryParameters: queryParams,
          validateStatus:
              (statusCode) =>
                  statusCode! >= HttpStatus.ok &&
                  statusCode <= HttpStatus.multipleChoices,
        ),
      );

      final decodeResponse = NetworkDecoding.decode<T, K>(
        response: response,
        responseType: responseModel,
      );
      log(' Method Name $_functionName');
      return Result.success(decodeResponse);
    } on DioException catch (dioError) {
      await CrashlyticsManager.instance.sendACrash(
        error: dioError.response?.data ?? dioError.message ?? 'DioException',
        stackTrace: dioError.stackTrace, // MODIFIED
        reason: "Reason $functionNameForLogging (DioException)",
        isFatal: true,
      );
      return Result.failure(BaseNetworkErrorType.request(error: dioError));
    } on TypeError catch (typeError) {
      await CrashlyticsManager.instance.sendACrash(
        error: typeError.toString(),
        stackTrace: typeError.stackTrace ?? StackTrace.current, // MODIFIED
        reason: "Reason $functionNameForLogging (TypeError)",
        isFatal: true,
      );
      return Result.failure(
        BaseNetworkErrorType.type(error: typeError.toString()),
      );
    } catch (e, s) {
      await CrashlyticsManager.instance.sendACrash(
        error: e.toString(),
        stackTrace: s, // s is StackTrace, should not be null here
        reason:
            "Reason $functionNameForLogging (Unknown Error in _performRequestInternal)",
        isFatal: true,
      );
      return Result.failure(
        BaseNetworkErrorType.type(error: e.toString()),
      ); // MODIFIED
    }
  }

  // Helper for raw response
  Future<Result<Response, BaseNetworkErrorType>> _performRawRequestInternal(
    String? path,
    RequestMethodEnum? requestMethod,
    dynamic formDataOrBody,
    Map<String, dynamic>? headers,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    String? functionNameForLogging,
  ) async {
    try {
      final response = await _dio.fetch(
        RequestOptions(
          path: path ?? '',
          connectTimeout: const Duration(seconds: 300),
          receiveTimeout: const Duration(seconds: 300),
          method: requestMethod?.rawValue,
          data: formDataOrBody,
          headers: headers,
          baseUrl: baseUrl,
          queryParameters: queryParams,
          validateStatus:
              (statusCode) =>
                  statusCode! >= HttpStatus.ok &&
                  statusCode <= HttpStatus.multipleChoices,
        ),
      );
      return Result.success(response);
    } on DioException catch (dioError) {
      await CrashlyticsManager.instance.sendACrash(
        error: dioError.response?.data ?? dioError.message ?? 'DioException',
        stackTrace: dioError.stackTrace, // MODIFIED
        reason: "Reason $functionNameForLogging (DioException - Raw)",
        isFatal: true,
      );
      return Result.failure(BaseNetworkErrorType.request(error: dioError));
    } on TypeError catch (typeError) {
      await CrashlyticsManager.instance.sendACrash(
        error: typeError.toString(),
        stackTrace: typeError.stackTrace ?? StackTrace.current, // MODIFIED
        reason: "Reason $functionNameForLogging (TypeError - Raw)",
        isFatal: true,
      );
      return Result.failure(
        BaseNetworkErrorType.type(error: typeError.toString()),
      );
    } catch (e, s) {
      await CrashlyticsManager.instance.sendACrash(
        error: e.toString(),
        stackTrace: s, // s is StackTrace, should not be null here
        reason:
            "Reason $functionNameForLogging (Unknown Error in _performRawRequestInternal)",
        isFatal: true,
      );
      return Result.failure(
        BaseNetworkErrorType.type(error: e.toString()),
      ); // MODIFIED
    }
  }

  // Helper for string response
  Future<Result<String, BaseNetworkErrorType>> _performStringRequestInternal(
    String? path,
    RequestMethodEnum? requestMethod,
    dynamic formDataOrBody,
    Map<String, dynamic>? headers,
    String? baseUrl,
    Map<String, dynamic>? queryParams,
    String? functionNameForLogging,
  ) async {
    try {
      final response = await _dio.fetch(
        RequestOptions(
          path: path ?? '',
          connectTimeout: const Duration(seconds: 300),
          receiveTimeout: const Duration(seconds: 300),
          method: requestMethod?.rawValue,
          data: formDataOrBody,
          headers: headers,
          baseUrl: baseUrl,
          queryParameters: queryParams,
          validateStatus:
              (statusCode) =>
                  statusCode! >= HttpStatus.ok &&
                  statusCode <= HttpStatus.multipleChoices,
        ),
      );

      final decodeResponse = NetworkDecoding.decodeString(response: response);
      return Result.success(decodeResponse);
    } on DioException catch (dioError) {
      await CrashlyticsManager.instance.sendACrash(
        error: dioError.response?.data ?? dioError.message ?? 'DioException',
        stackTrace: dioError.stackTrace,
        reason: "Reason $functionNameForLogging (DioException - String)",
        isFatal: true,
      );
      return Result.failure(BaseNetworkErrorType.request(error: dioError));
    } on TypeError catch (typeError) {
      await CrashlyticsManager.instance.sendACrash(
        error: typeError.toString(),
        stackTrace: typeError.stackTrace ?? StackTrace.current,
        reason: "Reason $functionNameForLogging (TypeError - String)",
        isFatal: true,
      );
      return Result.failure(
        BaseNetworkErrorType.type(error: typeError.toString()),
      );
    } catch (e, s) {
      await CrashlyticsManager.instance.sendACrash(
        error: e.toString(),
        stackTrace: s,
        reason:
            "Reason $functionNameForLogging (Unknown Error in _performStringRequestInternal)",
        isFatal: true,
      );
      return Result.failure(BaseNetworkErrorType.type(error: e.toString()));
    }
  }

  @override
  ResultDecode<K, BaseNetworkErrorType> execute<T extends BaseNetworkModel, K>(
    T responseModel,
  ) async {
    // Added async here as ResultDecode is a Future
    final capturedPath = _path;
    final capturedRequestMethod = _requestMethodEnum;
    final capturedFormData = _formData;
    final capturedBodyJson = _bodyJson;
    final capturedHeader = _header;
    final capturedSetUrlPath = _setUrlPath;
    final capturedQueryParameter = _queryParameter;
    final capturedFunctionName = _functionName;
    final dynamic dataPayload = capturedFormData ?? capturedBodyJson;

    // Local copy of headers to avoid modification issues if retried
    final Map<String, dynamic> requestHeaders = Map<String, dynamic>.from(
      capturedHeader ?? {},
    );

    if (await NetworkConnectivity.status) {
      final result = await _performRequestInternal<T, K>(
        capturedPath,
        capturedRequestMethod,
        dataPayload,
        requestHeaders,
        capturedSetUrlPath,
        capturedQueryParameter,
        responseModel,
        capturedFunctionName,
      );
      _clearInterceptorAndHeader();
      clearFormData();
      return result; // ResultDecode is Future<Result<K, BaseNetworkErrorType>>
    } else {
      log('No internet connection. Queuing request: $capturedFunctionName');
      final Completer<Result<K, BaseNetworkErrorType>> completer = Completer();
      StreamSubscription? subscription;

      CrashlyticsManager.instance.sendACrash(
        error: 'No Internet Connection - Request will be retried',
        stackTrace: StackTrace.current,
        reason: "Reason $capturedFunctionName (Initial)",
        isFatal: false,
      );

      subscription = _connectivityController.getConnectivityStream.listen((
        connectivityResultList,
      ) async {
        final bool isConnected =
            !(connectivityResultList.contains(ConnectivityResult.none));
        if (isConnected) {
          await subscription?.cancel();
          log(
            'Internet connection restored. Retrying request: $capturedFunctionName',
          );

          final retryResult = await _performRequestInternal<T, K>(
            capturedPath,
            capturedRequestMethod,
            dataPayload,
            requestHeaders, // Use the copied headers
            capturedSetUrlPath,
            capturedQueryParameter,
            responseModel,
            "$capturedFunctionName (Retry)",
          );
          if (!completer.isCompleted) {
            completer.complete(retryResult);
          }
        }
      });

      const connectionRetryTimeout = Duration(minutes: 1);
      Future.delayed(connectionRetryTimeout).then((_) {
        if (!completer.isCompleted) {
          subscription?.cancel();
          log(
            'Timeout waiting for internet connection to retry request: $capturedFunctionName',
          );
          CrashlyticsManager.instance.sendACrash(
            error: 'Timeout waiting for internet to retry request',
            stackTrace: StackTrace.current,
            reason: "Reason $capturedFunctionName (Retry Timeout)",
            isFatal: false,
          );
          completer.complete(
            Result.failure(
              BaseNetworkErrorType.connectivity(
                error: 'No Internet Connection (timeout waiting for retry)',
              ),
            ),
          );
        }
      });

      // whenComplete is for side effects, the future itself is what we return.
      return completer.future.whenComplete(() {
        _clearInterceptorAndHeader();
        clearFormData();
      });
    }
  }

  @override
  ResultDecode<Response, BaseNetworkErrorType> executeResponse() async {
    // Added async
    final capturedPath = _path;
    final capturedRequestMethod = _requestMethodEnum;
    final capturedFormData = _formData;
    final capturedBodyJson = _bodyJson;
    final capturedHeader = _header;
    final capturedSetUrlPath = _setUrlPath;
    final capturedQueryParameter = _queryParameter;
    final capturedFunctionName = _functionName;
    final dynamic dataPayload = capturedFormData ?? capturedBodyJson;
    final Map<String, dynamic> requestHeaders = Map<String, dynamic>.from(
      capturedHeader ?? {},
    );

    if (await NetworkConnectivity.status) {
      final result = await _performRawRequestInternal(
        capturedPath,
        capturedRequestMethod,
        dataPayload,
        requestHeaders,
        capturedSetUrlPath,
        capturedQueryParameter,
        capturedFunctionName,
      );
      _clearInterceptorAndHeader();
      clearFormData();
      return result;
    } else {
      log(
        'No internet connection. Queuing request (executeResponse): $capturedFunctionName',
      );
      final Completer<Result<Response, BaseNetworkErrorType>> completer =
          Completer();
      StreamSubscription? subscription;

      CrashlyticsManager.instance.sendACrash(
        error: 'No Internet Connection - Raw request will be retried',
        stackTrace: StackTrace.current,
        reason: "Reason $capturedFunctionName (Initial - Raw)",
        isFatal: false,
      );

      subscription = _connectivityController.getConnectivityStream.listen((
        connectivityResultList,
      ) async {
        final bool isConnected =
            !(connectivityResultList.contains(ConnectivityResult.none));
        if (isConnected) {
          await subscription?.cancel();
          log(
            'Internet connection restored. Retrying request (executeResponse): $capturedFunctionName',
          );

          final retryResult = await _performRawRequestInternal(
            capturedPath,
            capturedRequestMethod,
            dataPayload,
            requestHeaders,
            capturedSetUrlPath,
            capturedQueryParameter,
            "$capturedFunctionName (Retry - Raw)",
          );
          if (!completer.isCompleted) {
            completer.complete(retryResult);
          }
        }
      });

      const connectionRetryTimeout = Duration(minutes: 1);
      Future.delayed(connectionRetryTimeout).then((_) {
        if (!completer.isCompleted) {
          subscription?.cancel();
          log(
            'Timeout waiting for internet to retry request (executeResponse): $capturedFunctionName',
          );
          CrashlyticsManager.instance.sendACrash(
            error: 'Timeout waiting for internet to retry raw request',
            stackTrace: StackTrace.current,
            reason: "Reason $capturedFunctionName (Retry Timeout - Raw)",
            isFatal: false,
          );
          completer.complete(
            Result.failure(
              BaseNetworkErrorType.connectivity(
                error: 'No Internet Connection (timeout waiting for raw retry)',
              ),
            ),
          );
        }
      });

      return completer.future.whenComplete(() {
        _clearInterceptorAndHeader();
        clearFormData();
      });
    }
  }

  @override
  ResultDecode<String, BaseNetworkErrorType> executeString() async {
    final capturedPath = _path;
    final capturedRequestMethod = _requestMethodEnum;
    final capturedFormData = _formData;
    final capturedBodyJson = _bodyJson;
    final capturedHeader = _header;
    final capturedSetUrlPath = _setUrlPath;
    final capturedQueryParameter = _queryParameter;
    final capturedFunctionName = _functionName;
    final dynamic dataPayload = capturedFormData ?? capturedBodyJson;
    final Map<String, dynamic> requestHeaders = Map<String, dynamic>.from(
      capturedHeader ?? {},
    );

    if (await NetworkConnectivity.status) {
      final result = await _performStringRequestInternal(
        capturedPath,
        capturedRequestMethod,
        dataPayload,
        requestHeaders,
        capturedSetUrlPath,
        capturedQueryParameter,
        capturedFunctionName,
      );
      _clearInterceptorAndHeader();
      clearFormData();
      return result;
    } else {
      log(
        'No internet connection. Queuing request (executeString): $capturedFunctionName',
      );
      final Completer<Result<String, BaseNetworkErrorType>> completer =
          Completer();
      StreamSubscription? subscription;

      CrashlyticsManager.instance.sendACrash(
        error: 'No Internet Connection - String request will be retried',
        stackTrace: StackTrace.current,
        reason: "Reason $capturedFunctionName (Initial - String)",
        isFatal: false,
      );

      subscription = _connectivityController.getConnectivityStream.listen((
        connectivityResultList,
      ) async {
        final bool isConnected =
            !(connectivityResultList.contains(ConnectivityResult.none));
        if (isConnected) {
          await subscription?.cancel();
          log(
            'Internet connection restored. Retrying request (executeString): $capturedFunctionName',
          );

          final retryResult = await _performStringRequestInternal(
            capturedPath,
            capturedRequestMethod,
            dataPayload,
            requestHeaders,
            capturedSetUrlPath,
            capturedQueryParameter,
            "$capturedFunctionName (Retry - String)",
          );
          if (!completer.isCompleted) {
            completer.complete(retryResult);
          }
        }
      });

      const connectionRetryTimeout = Duration(minutes: 1);
      Future.delayed(connectionRetryTimeout).then((_) {
        if (!completer.isCompleted) {
          subscription?.cancel();
          log(
            'Timeout waiting for internet to retry request (executeString): $capturedFunctionName',
          );
          CrashlyticsManager.instance.sendACrash(
            error: 'Timeout waiting for internet to retry string request',
            stackTrace: StackTrace.current,
            reason: "Reason $capturedFunctionName (Retry Timeout - String)",
            isFatal: false,
          );
          completer.complete(
            Result.failure(
              BaseNetworkErrorType.connectivity(
                error:
                    'No Internet Connection (timeout waiting for string retry)',
              ),
            ),
          );
        }
      });

      return completer.future.whenComplete(() {
        _clearInterceptorAndHeader();
        clearFormData();
      });
    }
  }

  @override
  NetworkManager clearFormData() {
    _formData = null;
    _queryParameter = null;
    _dio.options.queryParameters.clear();
    return this;
  }

  @override
  NetworkManager setBaseUrl({required String path}) {
    _setUrlPath = path;
    return this;
  }
}
