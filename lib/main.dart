import 'dart:developer';
import 'dart:io';

import 'package:dating_app/core/navigation/app_navigation.dart';
import 'package:dating_app/core/theme/core/theme_manager.dart';
import 'package:dating_app/core/utility/easy_localization/easy_localization_manager.dart';
import 'package:dating_app/core/utility/initialize/project_initialize.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  await ProjectInitialize.shared.initialize();
  runApp(
    EasyLocalization(
      path: EasyLocalizationManager.path,
      supportedLocales: EasyLocalizationManager.supportedLocales,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeManager(),
      child: Builder(
        builder: (context) {
          final themeManager = context.watch<ThemeManager>();
          log(themeManager.state.currentTheme.toString());

          return MaterialApp.router(
            routerConfig: AppNavigation.router,
            debugShowCheckedModeBanner: false,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            theme: themeManager.state.currentTheme.theme,
            locale: context.locale,
          );
        },
      ),
    );
  }
}
