import 'package:dating_app/app/components/buttons/custom_button.dart';
import 'package:dating_app/app/components/form_fields/custom_text_form_field.dart';
import 'package:dating_app/app/presentation/register/cubit/register_cubit.dart';
import 'package:dating_app/app/presentation/register/state/register_state.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Column(
          children: [
            // Full Name Field
            CustomTextFormField(
              labelText: 'register.full_name'.tr(),
              prefixIcon: Icons.person,
              onChanged: context.read<RegisterCubit>().onFullNameChanged,
              errorText: state.fullNameError,
            ),
            const SizedBox(height: 20),

            // Email Field
            CustomTextFormField(
              labelText: 'register.email'.tr(),
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              onChanged: context.read<RegisterCubit>().onEmailChanged,
              errorText: state.emailError,
            ),
            const SizedBox(height: 20),

            // Password Field
            CustomTextFormField(
              labelText: 'register.password'.tr(),
              prefixIcon: Icons.lock,
              obscureText: !state.isPasswordVisible,
              suffixIcon:
                  state.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
              onSuffixIconPressed:
                  context.read<RegisterCubit>().togglePasswordVisibility,
              onChanged: context.read<RegisterCubit>().onPasswordChanged,
              errorText: state.passwordError,
            ),
            const SizedBox(height: 20),

            // Confirm Password Field
            CustomTextFormField(
              labelText: 'register.confirm_password'.tr(),
              prefixIcon: Icons.lock,
              obscureText: !state.isConfirmPasswordVisible,
              suffixIcon:
                  state.isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
              onSuffixIconPressed:
                  context.read<RegisterCubit>().toggleConfirmPasswordVisibility,
              onChanged: context.read<RegisterCubit>().onConfirmPasswordChanged,
              errorText: state.confirmPasswordError,
            ),
            const SizedBox(height: 28),

            // Terms and Conditions
            _TermsAndConditions(state: state),
            const SizedBox(height: 28),

            // Register Button
            _RegisterButton(state: state),
          ],
        );
      },
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions({required this.state});

  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.read<RegisterCubit>().toggleTermsAccepted(),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: state.isTermsAccepted ? Colors.red : Colors.transparent,
              border: Border.all(
                color:
                    state.isTermsAccepted
                        ? Colors.red
                        : Colors.white.withValues(alpha: 0.3),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child:
                state.isTermsAccepted
                    ? const Icon(Icons.check, color: Colors.white, size: 14)
                    : null,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 14,
              ),
              children: [
                TextSpan(text: 'register.terms_title'.tr()),
                TextSpan(
                  text: 'register.terms_accepted'.tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap =
                            () =>
                                context
                                    .read<RegisterCubit>()
                                    .onTermsAndConditions(),
                ),
                TextSpan(text: 'register.terms_description'.tr()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({required this.state});

  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'register.register_button'.tr(),
      onPressed: () => context.read<RegisterCubit>().register(context),
      isLoading: state.isLoading,
      backgroundColor: ColorName.appKUCrimson,
      height: 60,
      borderRadius: 16,
    );
  }
}
