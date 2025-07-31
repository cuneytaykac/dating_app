import 'package:dating_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sign_in_cubit.dart';

class SocialSignInButtons extends StatelessWidget {
  const SocialSignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          context,
          Assets.icons.google.image(),
          () => context.read<SignInCubit>().onGoogleSignIn(),
        ),
        _buildSocialButton(
          context,
          Assets.icons.apple.image(),
          () => context.read<SignInCubit>().onAppleSignIn(),
        ),
        _buildSocialButton(
          context,
          Assets.icons.facebook.image(),
          () => context.read<SignInCubit>().onFacebookSignIn(),
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    Widget icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[800],
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.zero,
          side: BorderSide(
            width: 2,
            color: Colors.white.withValues(alpha: 0.2),
          ),
        ),
        child: icon,
      ),
    );
  }
}
