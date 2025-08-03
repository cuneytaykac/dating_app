import 'package:dating_app/app/components/buttons/custom_button.dart';
import 'package:dating_app/app/components/form_fields/custom_text_form_field.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sign_in_cubit.dart';
import '../../state/sign_in_state.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Column(
          children: [
            _buildEmailField(context, state),
            const SizedBox(height: 16),
            _buildPasswordField(context, state),
            const SizedBox(height: 16),
            _buildForgotPassword(context),
            const SizedBox(height: 32),
            _buildSignInButton(context, state),
          ],
        );
      },
    );
  }

  Widget _buildEmailField(BuildContext context, SignInState state) {
    return CustomTextFormField(
      labelText: 'sign_in.email'.tr(),
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: context.read<SignInCubit>().onEmailChanged,
      errorText: state.emailError,
    );
  }

  Widget _buildPasswordField(BuildContext context, SignInState state) {
    return CustomTextFormField(
      labelText: 'sign_in.password'.tr(),
      prefixIcon: Icons.lock_outline,
      suffixIcon:
          state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
      onSuffixIconPressed: context.read<SignInCubit>().togglePasswordVisibility,
      obscureText: !state.isPasswordVisible,
      textInputAction: TextInputAction.done,
      onChanged: context.read<SignInCubit>().onPasswordChanged,
      onSubmitted: () => context.read<SignInCubit>().signIn(context),
      errorText: state.passwordError,
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () => context.read<SignInCubit>().onForgotPassword(),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.white, width: 1.0)),
          ),
          child: Text(
            'sign_in.forgot_password'.tr(),
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context, SignInState state) {
    return CustomButton(
      text: 'sign_in.sign_in_button'.tr(),
      onPressed: () => context.read<SignInCubit>().signIn(context),
      isLoading: state.isLoading,
      backgroundColor: ColorName.appKUCrimson,
      height: 60,
      borderRadius: 16,
    );
  }
}
