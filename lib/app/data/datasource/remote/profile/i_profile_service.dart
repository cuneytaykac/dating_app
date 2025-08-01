import 'dart:io';

import 'package:dating_app/app/data/model/sign_in_response/sign_in_response.dart';
import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';
import 'package:dio/dio.dart';

abstract class IProfileService {
  ResultDecode<SignInResponse?, BaseNetworkErrorType> getProfile();
  ResultDecode<Response?, BaseNetworkErrorType> uploadProfilePicture({
    File? file,
  });
}
