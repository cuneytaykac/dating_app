import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'sign_in.welcome'.tr(),
          style: context.theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
          style: context.theme.textTheme.bodyLarge?.copyWith(height: 1.4),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
