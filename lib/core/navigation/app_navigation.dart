import 'package:dating_app/app/data/datasource/local/local_signin/i_local_signin_service.dart';
import 'package:dating_app/app/presentation/create_profile_picture/view/create_profile_picture.dart';
import 'package:dating_app/app/presentation/discover/view/discover_view.dart';
import 'package:dating_app/app/presentation/home/view/home_view.dart';
import 'package:dating_app/app/presentation/profile/view/profile_view.dart';
import 'package:dating_app/app/presentation/register/view/register_view.dart';
import 'package:dating_app/app/presentation/sign_in/view/sign_in_view.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class AppNavigation {
  //Navigator Key
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  // Token kontrolü için redirect fonksiyonu
  static Future<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    try {
      final localSigninService = getIt<ILocalSigninService>();
      final token = await localSigninService.getToken();

      final bool hasValidToken = token.isNotEmpty;

      final bool isOnSignInPage =
          state.matchedLocation == AppRoutes.signInView.path;
      final bool isOnRegisterPage =
          state.matchedLocation == AppRoutes.registerView.path;

      if ((isOnSignInPage || isOnRegisterPage) && hasValidToken) {
        return AppRoutes.discoverView.path;
      }

      if (state.matchedLocation == AppRoutes.discoverView.path &&
          !hasValidToken) {
        return AppRoutes.signInView.path;
      }
    } catch (e) {
      if (state.matchedLocation != AppRoutes.signInView.path) {
        return AppRoutes.signInView.path;
      }
    }

    return null;
  }

  static final GoRouter router = GoRouter(
    navigatorKey: _navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.discoverView.path,
    redirect: _redirect,
    errorBuilder: (context, state) {
      return const SignInView();
    },
    routes: [
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
      GoRoute(
        path: AppRoutes.discoverView.path,
        name: AppRoutes.discoverView.name,
        builder: (context, state) => const DiscoverView(),
      ),
      GoRoute(
        path: AppRoutes.homeView.path,
        name: AppRoutes.homeView.name,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.profileView.path,
        name: AppRoutes.profileView.name,
        builder: (context, state) => const ProfileView(),
        routes: [
          GoRoute(
            path: AppRoutes.createProfilePictureView.path,
            name: AppRoutes.createProfilePictureView.name,
            builder: (context, state) => const CreateProfilePictureView(),
          ),
        ],
      ),
    ],
  );
}
