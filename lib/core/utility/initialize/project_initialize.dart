import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/utility/cache/cache_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:duzeyb2b/firebase_options.dart';

class ProjectInitialize {
  // Private constructor
  ProjectInitialize._();

  // Static instance
  static final ProjectInitialize _instance = ProjectInitialize._();

  // Factory constructor
  factory ProjectInitialize() => _instance;

  // Getter for shared instance (optional, mevcut kullanımı korumak için)
  static ProjectInitialize get shared => _instance;

  Future<void> initialize() async {
    configureDependencies();
    //Theme initialize
    await GetStorage.init();
    // MARK: - Localizable Init
    await EasyLocalization.ensureInitialized();
    // MARK: - Hive Init
    await HiveHelper.shared.setupHive();
  }
}
