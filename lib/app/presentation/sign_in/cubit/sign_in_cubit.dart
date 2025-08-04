import 'package:dating_app/app/data/datasource/local/local_signin/i_local_signin_service.dart';
import 'package:dating_app/app/data/datasource/remote/sign_in/i_sign_in_service.dart';
import 'package:dating_app/app/data/model/sign_in/sign_in.dart';
import 'package:dating_app/core/error/view_error.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/navigation/app_routes.dart';
import 'package:dating_app/core/utility/snackbar/snackbar_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_extension/moon_extension.dart';

import '../state/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());
  final signInService = getIt.get<ISignInService>();
  final _localSignInService = getIt.get<ILocalSigninService>();

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email, emailError: null));
    _validateForm();
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password, passwordError: null));
    _validateForm();
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _validateForm() {
    final emailError = _validateEmail(state.email);
    final passwordError = _validatePassword(state.password);

    emit(
      state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
        isFormValid: emailError == null && passwordError == null,
      ),
    );
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return 'sign_in.email_required'.tr();
    }
    if (!email.isValidEmail()) {
      return 'sign_in.email_invalid'.tr();
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'sign_in.password_required'.tr();
    }
    if (password.length < 6) {
      return 'sign_in.password_min_length'.tr();
    }
    return null;
  }

  Future<void> signIn(BuildContext context) async {
    if (!state.isFormValid) {
      showErrorSnackbar(context, 'sign_in.form_validation_error'.tr());
      return;
    }

    emit(state.copyWith(isLoading: true, generalError: null));

    await _signIn(context);
  }

  Future<void> _signIn(BuildContext context) async {
    final response = await signInService.postLogin(
      email: state.email,
      password: state.password,
    );

    response.when(
      success: (data) async {
        await _saveLocalSignIn(data?.data);
        emit(state.copyWith(isLoading: false));
        context.pushNamed(AppRoutes.discoverView.name);
      },
      failure: (error) {
        emit(
          state.copyWith(
            isLoading: false,
            generalError: error.handleError.response?.message,
          ),
        );
        // Hata snackbar'ı göster
        _showErrorSnackbar(
          error.handleError.response?.message ?? 'An error occurred',
        );
      },
    );
  }

  Future<void> _saveLocalSignIn(SignIn? signIn) async {
    signIn?.username = state.email;
    signIn?.password = state.password;
    if (signIn != null) {
      await _localSignInService.saveSignIn(signIn);
    }
  }

  void _showErrorSnackbar(String message) {
    // Context'e erişmek için BlocListener kullanacağız
    // Bu method'u view'da çağıracağız
  }

  void showErrorSnackbar(BuildContext context, String message) {
    SnackbarManager.showError(context: context, message: message);
  }

  void onForgotPassword() {}

  void onSignUp(BuildContext context) {
    context.pushNamed(AppRoutes.registerView.name);
  }

  void onGoogleSignIn() {}

  void onAppleSignIn() {}

  void onFacebookSignIn() {}
}
