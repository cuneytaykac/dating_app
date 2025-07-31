import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(false) bool isLoading,
    @Default(false) bool isFormValid,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isConfirmPasswordVisible,
    @Default(false) bool isTermsAccepted,
    @Default(null) String? fullNameError,
    @Default(null) String? emailError,
    @Default(null) String? passwordError,
    @Default(null) String? confirmPasswordError,
    @Default(null) String? generalError,
  }) = _RegisterState;
}
