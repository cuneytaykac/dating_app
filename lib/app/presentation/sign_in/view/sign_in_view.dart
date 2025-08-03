import 'package:dating_app/app/presentation/sign_in/view/widgets/sign_in_form.dart';
import 'package:dating_app/app/presentation/sign_in/view/widgets/social_sign_in_buttons.dart';
import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/sign_in_cubit.dart';
import '../state/sign_in_state.dart';
import 'widgets/sign_in_header.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          // Hata durumunda snackbar göster
          if (state.generalError != null) {
            context.read<SignInCubit>().showErrorSnackbar(
              context,
              state.generalError!,
            );
          }

          // Başarılı giriş durumunda snackbar göster
          if (!state.isLoading &&
              state.isFormValid &&
              state.email.isNotEmpty &&
              state.password.isNotEmpty) {
            // API başarılı olduğunda bu kısım çalışacak
            // Şimdilik sadece hata durumunu handle ediyoruz
          }
        },
        child: const _SignInViewBody(),
      ),
    );
  }
}

class _SignInViewBody extends StatelessWidget {
  const _SignInViewBody();

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = keyboardHeight > 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              if (!isKeyboardVisible) const Spacer(flex: 2),
              // Header bölümü
              const SignInHeader(),
              const SizedBox(height: 40),
              // Form bölümü
              const SignInForm(),
              const SizedBox(height: 32),
              // Sosyal giriş butonları
              const SocialSignInButtons(),
              const SizedBox(height: 32),
              // Kayıt ol bölümü
              const SignUpSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpSection extends StatelessWidget {
  const SignUpSection({super.key});

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
          onTap: () => context.read<SignInCubit>().onSignUp(context),
          child: Text(
            'sign_in.sign_up'.tr(),
            style: context.theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
