import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    this.height = 56,
    this.borderRadius = 12,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.isFullWidth = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 4,
          shadowColor: backgroundColor,
        ),
        child:
            isLoading
                ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: textColor,
                    strokeWidth: 2,
                  ),
                )
                : Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: textColor,
                  ),
                ),
      ),
    );
  }
}
