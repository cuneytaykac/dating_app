import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final bool isEnabled;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.isEnabled = true,
    this.enabledBorder,
    this.focusedBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: (_) => onSubmitted?.call(),
      obscureText: obscureText,
      enabled: isEnabled,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon:
            prefixIcon != null
                ? Icon(prefixIcon, color: context.theme.colorScheme.onSurface)
                : null,
        suffixIcon:
            suffixIcon != null
                ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: context.theme.colorScheme.onSurface,
                  ),
                  onPressed: onSuffixIconPressed,
                )
                : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: context.theme.colorScheme.outline),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: context.theme.colorScheme.primary),
            ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: context.theme.colorScheme.error),
        ),
        errorText: errorText,
        filled: true,
        fillColor: context.theme.colorScheme.surface,
        labelStyle: context.theme.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.onSurface,
        ),
        floatingLabelStyle: context.theme.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.primary,
        ),
      ),
      style: context.theme.textTheme.bodyMedium?.copyWith(
        color: context.theme.colorScheme.onSurface,
      ),
    );
  }
}
