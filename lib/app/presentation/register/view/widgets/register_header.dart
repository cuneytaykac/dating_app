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
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'register.description'.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 16,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
