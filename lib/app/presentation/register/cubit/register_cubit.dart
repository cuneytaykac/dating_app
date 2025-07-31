import 'package:dating_app/app/data/datasource/local/local_signin/i_local_signin_service.dart';
import 'package:dating_app/app/data/datasource/remote/register/i_register_service.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/navigation/app_routes.dart';
import 'package:dating_app/core/utility/snackbar/snackbar_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_extension/moon_extension.dart';

import '../state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());
  final registerService = getIt.get<IRegisterService>();
  final ILocalSigninService _localSigninService =
      getIt.get<ILocalSigninService>();
  void onFullNameChanged(String fullName) {
    emit(state.copyWith(fullName: fullName));
    _validateForm();
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
    _validateForm();
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
    _validateForm();
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
    _validateForm();
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void toggleConfirmPasswordVisibility() {
    emit(
      state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible),
    );
  }

  void toggleTermsAccepted() {
    emit(state.copyWith(isTermsAccepted: !state.isTermsAccepted));
    _validateForm();
  }

  void _validateForm() {
    final fullNameError = _validateFullName(state.fullName);
    final emailError = _validateEmail(state.email);
    final passwordError = _validatePassword(state.password);
    final confirmPasswordError = _validateConfirmPassword(
      state.confirmPassword,
      state.password,
    );

    emit(
      state.copyWith(
        fullNameError: fullNameError,
        emailError: emailError,
        passwordError: passwordError,
        confirmPasswordError: confirmPasswordError,
        isFormValid:
            fullNameError == null &&
            emailError == null &&
            passwordError == null &&
            confirmPasswordError == null,
      ),
    );
  }

  String? _validateFullName(String fullName) {
    if (fullName.isEmpty) {
      return 'register.full_name_required'.tr();
    }
    if (fullName.length < 2) {
      return 'register.full_name_min_length'.tr();
    }
    return null;
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return 'register.email_required'.tr();
    }
    if (!email.isValidEmail()) {
      return 'register.email_invalid'.tr();
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'register.password_required'.tr();
    }
    if (password.length < 6) {
      return 'register.password_min_length'.tr();
    }
    return null;
  }

  String? _validateConfirmPassword(String confirmPassword, String password) {
    if (confirmPassword.isEmpty) {
      return 'register.confirm_password_required'.tr();
    }
    if (confirmPassword != password) {
      return 'register.passwords_not_match'.tr();
    }
    return null;
  }

  Future<void> register(BuildContext context) async {
    if (!state.isFormValid) {
      showErrorSnackbar(context, 'register.form_validation_error'.tr());
      return;
    } else if (!state.isTermsAccepted) {
      showErrorSnackbar(context, 'register.terms_required'.tr());

      return;
    } else {
      emit(state.copyWith(isLoading: true, generalError: null));
      _registerAPI(context);
    }

    // TODO: Başarılı kayıt sonrası navigasyon
  }

  Future<void> _registerAPI(BuildContext context) async {
    final result = await registerService.postRegister(
      email: state.email,
      name: state.fullName,
      password: state.password,
    );

    result.when(
      success: (data) async {
        if (data != null) {
          if (data.data != null) {
            await _localSigninService.saveSignIn(data.data!);
            emit(state.copyWith(isLoading: false));
            context.pushNamed(AppRoutes.discoverView.name);
          } else {
            emit(state.copyWith(isLoading: false));
            showErrorSnackbar(context, 'register.unknown_error'.tr());
          }
        }
      },
      failure: (error) {
        emit(
          state.copyWith(
            isLoading: false,
            generalError: error.localizedErrorMessage,
          ),
        );
        showErrorSnackbar(
          context,
          error.localizedErrorMessage ?? 'register.unknown_error'.tr(),
        );
      },
    );
  }

  void showErrorSnackbar(BuildContext context, String message) {
    SnackbarManager.showError(context: context, message: message);
  }

  void onSignIn(BuildContext context) {
    context.pushNamed(AppRoutes.signInView.name);
  }

  void onGoogleSignIn() {
    // TODO: Google ile kayıt
  }

  void onAppleSignIn() {
    // TODO: Apple ile kayıt
  }

  void onFacebookSignIn() {
    // TODO: Facebook ile kayıt
  }

  void onTermsAndConditions() {
    // TODO: Kullanıcı sözleşmesi sayfasına yönlendirme
  }
}
