import 'dart:io';

import 'package:dating_app/app/data/datasource/remote/profile/i_profile_service.dart';
import 'package:dating_app/app/data/model/sign_in_response/sign_in_response.dart';
import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/network/builder/network_manager.dart';
import 'package:dating_app/core/network/enum/request_method_enum.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProfileService)
final class ProfileService extends IProfileService {
  final client = getIt.get<NetworkManager>();

  @override
  ResultDecode<SignInResponse?, BaseNetworkErrorType> getProfile() async {
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setBaseUrl(path: "https://caseapi.servicelabs.tech/")
        .setPath(path: "user/profile")
        .setFunctionName(functionName: "user/profile")
        .execute<SignInResponse, SignInResponse>(SignInResponse());
    return response;
  }

  @override
  ResultDecode<Response?, BaseNetworkErrorType> uploadProfilePicture({
    File? file,
    String? token,
  }) async {
    if (file == null) {
      throw Exception('File is required');
    }

    final response =
        await client
            .setRequestMethod(requestMethodEnum: RequestMethodEnum.POST)
            .setBaseUrl(path: "https://caseapi.servicelabs.tech/")
            .setPath(path: "user/upload_photo")
            .setBodyFormData(
              formData: FormData.fromMap({
                "file": await MultipartFile.fromFile(
                  file.path,
                  filename: file.path.split('/').last,
                  contentType: DioMediaType('image', 'png'),
                ),
              }),
            )
            .setInterceptor()
            .setFunctionName(functionName: "user/upload_photo")
            .executeResponse();
    return response;
  }
}
