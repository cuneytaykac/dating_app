// ignore_for_file: non_constant_identifier_names

import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/network/interfaces/base_network_model.dart';

class ViewError implements BaseNetworkModel<ViewError>, Exception {
  bool? success;
  String? message;
  ViewError({required this.message, this.success});

  ViewError.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['message'] = message;
    data['success'] = success;

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
          message: "Sunucudan kaynaklı beklenmedik bir hata olustu.",
          success: false,
        );
        return decode;
      } else {
        if (error.response?.statusCode == 503 ||
            error.response?.statusCode == 502) {
          return ViewError(
            message: error.response?.statusMessage,
            success: false,
          );
        } else if (error.response?.statusCode == -1) {
          return ViewError(
            message: "Status Kodu Hatalı ${error.response?.statusCode}",
            success: false,
          );
        } else {
          final decode = ViewError.fromJson(error.response?.data);
          return decode;
        }
      }
    },
    type: (error) => ViewError(message: error, success: false),
    connectivity: (error) => ViewError(message: error, success: false),
  );
}
