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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
          style: TextStyle(color: Colors.white, fontSize: 16, height: 1.4),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
