import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 60,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 16,
    this.elevation = 0,
  });

  final Widget icon;
  final VoidCallback onPressed;
  final double size;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? context.theme.colorScheme.surface,
          elevation: elevation,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.zero,
          side:
              borderColor != null
                  ? BorderSide(width: 2, color: borderColor!)
                  : BorderSide(
                    width: 2,
                    color: context.theme.colorScheme.onSurface.withValues(
                      alpha: 0.2,
                    ),
                  ),
        ),
        child: icon,
      ),
    );
  }
}
