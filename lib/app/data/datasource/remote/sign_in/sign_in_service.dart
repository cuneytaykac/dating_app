import 'package:dating_app/app/data/datasource/remote/sign_in/i_sign_in_service.dart';
import 'package:dating_app/app/data/model/sign_in_response/sign_in_response.dart';
import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/network/builder/network_manager.dart';
import 'package:dating_app/core/network/enum/request_method_enum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ISignInService)
final class SignInService extends ISignInService {
  final client = getIt.get<NetworkManager>();
  @override
  ResultDecode<SignInResponse?, BaseNetworkErrorType> postLogin({
    required String? email,
    required String? password,
  }) {
    final response = client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.POST)
        .setBaseUrl(path: "https://caseapi.servicelabs.tech/")
        .setPath(path: "user/login")
        .setBody(bodyJson: {"email": email, "password": password})
        .setFunctionName(functionName: "user/login")
        .execute<SignInResponse, SignInResponse>(SignInResponse());
    return response;
  }
}
