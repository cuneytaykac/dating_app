import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: I__templateNameToPascalCase__Service)
final class __templateNameToPascalCase__Service
    extends I__templateNameToPascalCase__Service {
  final client = getIt.get<NetworkManager>();

  ResultDecode<dynamic, BaseNetworkErrorType> fetchData() async {
    throw UnimplementedError();
  }
}
