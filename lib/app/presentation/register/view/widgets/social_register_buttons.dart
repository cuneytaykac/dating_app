import 'package:dating_app/app/components/buttons/social_button.dart';
import 'package:dating_app/app/presentation/register/cubit/register_cubit.dart';
import 'package:dating_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterButtons extends StatelessWidget {
  const SocialRegisterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SocialButton(
          icon: Assets.icons.google.image(),
          onPressed: () => context.read<RegisterCubit>().onGoogleSignIn(),
        ),
        const SizedBox(width: 16),
        SocialButton(
          icon: Assets.icons.apple.image(),
          onPressed: () => context.read<RegisterCubit>().onAppleSignIn(),
        ),
        const SizedBox(width: 16),
        SocialButton(
          icon: Assets.icons.facebook.image(),
          onPressed: () => context.read<RegisterCubit>().onFacebookSignIn(),
        ),
        const Spacer(),
      ],
    );
  }
}
