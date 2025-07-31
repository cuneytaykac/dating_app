import 'package:dating_app/app/data/datasource/local/local_signin/i_local_signin_service.dart';
import 'package:dating_app/app/data/datasource/remote/sign_in/i_sign_in_service.dart';
import 'package:dating_app/app/data/model/sign_in/sign_in.dart';
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

  Future<void> signIn() async {
    if (!state.isFormValid) {
      emit(state.copyWith(generalError: 'sign_in.form_validation_error'.tr()));
      return;
    }

    emit(state.copyWith(isLoading: true, generalError: null));

    await _signIn();
  }

  Future<void> _signIn() async {
    final response = await signInService.postLogin(
      email: state.email,
      password: state.password,
    );

    response.when(
      success: (data) async {
        await _saveLocalSignIn(data?.data);
        emit(state.copyWith(isLoading: false));
      },
      failure: (error) {
        emit(
          state.copyWith(
            isLoading: false,
            generalError: error.localizedErrorMessage,
          ),
        );
        // Hata snackbar'ı göster
        _showErrorSnackbar(error.localizedErrorMessage ?? 'An error occurred');
      },
    );
  }

  Future<void> _saveLocalSignIn(SignIn? signIn) async {
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

  void onForgotPassword() {
    // TODO: Şifremi unuttum sayfasına yönlendirme
  }

  void onSignUp(BuildContext context) {
    context.pushNamed(AppRoutes.registerView.name);
  }

  void onGoogleSignIn() {
    // TODO: Google ile giriş
  }

  void onAppleSignIn() {
    // TODO: Apple ile giriş
  }

  void onFacebookSignIn() {
    // TODO: Facebook ile giriş
  }
}
