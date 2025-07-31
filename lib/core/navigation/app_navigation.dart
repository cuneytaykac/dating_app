import 'package:dating_app/app/presentation/register/view/register_view.dart';
import 'package:dating_app/app/presentation/sign_in/view/sign_in_view.dart';
import 'package:dating_app/app/presentation/splash/view/splash_view.dart';
import 'package:dating_app/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class AppNavigation {
  static final String _initRoute = AppRoutes.signInView.path;

  //Navigator Key
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static final GoRouter router = GoRouter(
    navigatorKey: _navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: _initRoute,
    errorBuilder: (context, state) {
      return SplashView();
    },
    routes: [
      GoRoute(
        path: AppRoutes.splashView.path,
        name: AppRoutes.splashView.name,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.signInView.path,
        name: AppRoutes.signInView.name,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: AppRoutes.registerView.path,
        name: AppRoutes.registerView.name,
        builder: (context, state) => const RegisterView(),
      ),
    ],
  );
}
