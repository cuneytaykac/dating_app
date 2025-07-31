import 'dart:io';

import 'package:dating_app/core/navigation/app_navigation.dart';
import 'package:dating_app/core/utility/easy_localization/easy_localization_manager.dart';
import 'package:dating_app/core/utility/initialize/project_initialize.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ProjectInitialize.shared
      .initialize(); // Firebase Initialize using the FirebaseInitializer
  runApp(
    EasyLocalization(
      path: EasyLocalizationManager.path,
      supportedLocales: EasyLocalizationManager.supportedLocales,

      child: const MyApp(),
    ),
  );
}

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppNavigation.router,
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
    );
  }
}
