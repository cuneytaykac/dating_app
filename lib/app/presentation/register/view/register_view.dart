import 'package:dating_app/app/presentation/register/cubit/register_cubit.dart';
import 'package:dating_app/app/presentation/register/state/register_state.dart';
import 'package:dating_app/app/presentation/register/view/widgets/register_form.dart';
import 'package:dating_app/app/presentation/register/view/widgets/register_header.dart';
import 'package:dating_app/app/presentation/register/view/widgets/social_register_buttons.dart';
import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.generalError != null) {
            context.read<RegisterCubit>().showErrorSnackbar(
              context,
              state.generalError!,
            );
          }
        },
        child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: SafeArea(
            child: const SingleChildScrollView(
              padding: EdgeInsets.only(left: 24, right: 24, top: 40),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  RegisterHeader(),
                  SizedBox(height: 40),
                  RegisterForm(),
                  SizedBox(height: 60),
                  SocialRegisterButtons(),
                  SizedBox(height: 32),
                  _SignInLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInLink extends StatelessWidget {
  const _SignInLink();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'register.already_have_account'.tr(),
          style: context.theme.textTheme.bodySmall?.copyWith(
            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => context.read<RegisterCubit>().onSignIn(context),
          child: Text(
            'register.sign_in'.tr(),
            style: context.theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
