import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'register.welcome'.tr(),
          style: context.theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'register.description'.tr(),
          textAlign: TextAlign.center,
          style: context.theme.textTheme.bodyLarge?.copyWith(
            color: context.theme.colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
