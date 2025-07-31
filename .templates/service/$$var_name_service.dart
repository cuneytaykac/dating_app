import 'package:duzeyb2b/app/data/datasource/remote/__templateName__/i___templateName___service.dart';
import 'package:duzeyb2b/core/base/base_network_error_type.dart';
import 'package:duzeyb2b/core/base/base_network_type_def.dart';
import 'package:duzeyb2b/core/getIt/injection.dart';
import 'package:duzeyb2b/core/network/builder/network_manager.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: I__templateNameToPascalCase__Service)
final class __templateNameToPascalCase__Service
    extends I__templateNameToPascalCase__Service {
  final client = getIt.get<NetworkManager>();

  ResultDecode<dynamic, BaseNetworkErrorType> fetchData() async {
    throw UnimplementedError();
  }
}
