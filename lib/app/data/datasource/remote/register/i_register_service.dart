import 'package:dating_app/app/data/model/sign_in_response/sign_in_response.dart';
import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';

abstract class IRegisterService {
  ResultDecode<SignInResponse?, BaseNetworkErrorType> postRegister({
    required String? email,
    required String? name,
    required String? password,
  });
}
