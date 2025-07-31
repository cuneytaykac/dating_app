import 'package:dating_app/app/data/datasource/remote/register/i_register_service.dart';
import 'package:dating_app/app/data/model/sign_in_response/sign_in_response.dart';
import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/network/builder/network_manager.dart';
import 'package:dating_app/core/network/enum/request_method_enum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IRegisterService)
final class RegisterService extends IRegisterService {
  final client = getIt.get<NetworkManager>();

  @override
  ResultDecode<SignInResponse?, BaseNetworkErrorType> postRegister({
    required String? email,
    required String? name,
    required String? password,
  }) async {
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.POST)
        .setBaseUrl(path: "https://caseapi.servicelabs.tech/")
        .setPath(path: "user/register")
        .setBody(bodyJson: {"email": email, "password": password, "name": name})
        .setFunctionName(functionName: "user/register")
        .execute<SignInResponse, SignInResponse>(SignInResponse());
    return response;
  }
}
