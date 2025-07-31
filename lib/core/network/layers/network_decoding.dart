import 'dart:convert';

import 'package:dio/dio.dart';

import '../interfaces/base_network_model.dart';

class NetworkDecoding {
  static K decode<T extends BaseNetworkModel, K>(
      {required Response<dynamic> response, required T responseType}) {
    try {
      if (response.data is List) {
        var list = response.data as List;
        var dataList = List<T>.from(
            list.map((item) => responseType.fromJson(item)).toList()) as K;
        return dataList;
      } else if (response.data is String && response.data != "") {
        var data = responseType.fromJson(jsonDecode(response.data)) as K;
        return data;
      } else {
        var data = responseType.fromJson(response.data) as K;
        return data;
      }
    } on TypeError {
      rethrow;
    }
  }

  static String decodeString({required Response<dynamic> response}) {
    try {
      if (response.data is String) {
        return response.data as String;
      } else if (response.data is Map<String, dynamic>) {
        // JSON objesi içinde string arama
        final data = response.data as Map<String, dynamic>;
        if (data.containsKey('message')) {
          return data['message'] as String;
        }
        if (data.containsKey('data')) {
          return data['data'] as String;
        }
        if (data.containsKey('result')) {
          return data['result'] as String;
        }
        // JSON'ı string'e çevir
        return jsonEncode(data);
      } else {
        // Diğer tipleri string'e çevir
        return response.data.toString();
      }
    } catch (e) {
      throw TypeError();
    }
  }
}
