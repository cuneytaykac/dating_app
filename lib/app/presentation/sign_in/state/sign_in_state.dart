import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
    @Default(false) bool isFormValid,
    @Default(false) bool isPasswordVisible,
    @Default(null) String? emailError,
    @Default(null) String? passwordError,
    @Default(null) String? generalError,
  }) = _SignInState;
}
