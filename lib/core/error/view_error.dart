// ignore_for_file: non_constant_identifier_names

import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/network/interfaces/base_network_model.dart';

class ViewError implements BaseNetworkModel<ViewError>, Exception {
  Response? response;

  ViewError({this.response});

  ViewError.fromJson(Map<String, dynamic> json) {
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }

  @override
  ViewError fromJson(Map<String, dynamic> json) => ViewError.fromJson(json);
}

class Response {
  int? code;
  String? message;

  Response({this.code, this.message});

  Response.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }

  @override
  ViewError fromJson(Map<String, dynamic> json) => ViewError.fromJson(json);
}

extension ViewErrorExtension on BaseNetworkErrorType {
  ViewError get handleError => when(
    request: (error) {
      if (error.response?.data == null) {
        final decode = ViewError(
          response: Response(
            code: 500,
            message: "Sunucudan kaynaklı beklenmedik bir hata olustu.",
          ),
        );
        return decode;
      } else {
        if (error.response?.statusCode == 503 ||
            error.response?.statusCode == 502) {
          return ViewError(
            response: Response(
              code: error.response?.statusCode,
              message: error.response?.statusMessage,
            ),
          );
        } else if (error.response?.statusCode == -1) {
          return ViewError(
            response: Response(
              code: error.response?.statusCode,
              message: "Status Kodu Hatalı ${error.response?.statusCode}",
            ),
          );
        } else {
          final decode = ViewError.fromJson(error.response?.data);
          return decode;
        }
      }
    },
    type: (error) => ViewError(response: Response(code: 500, message: error)),
    connectivity:
        (error) => ViewError(response: Response(code: 500, message: error)),
  );
}
