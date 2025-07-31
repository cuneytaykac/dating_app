import 'package:dating_app/app/data/model/sign_in_response/sign_in_response.dart';
import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';

abstract class ISignInService {
  ResultDecode<SignInResponse?, BaseNetworkErrorType> postLogin({
    required String? email,
    required String? password,
  });
}
