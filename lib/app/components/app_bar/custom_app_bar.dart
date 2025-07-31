import 'package:dating_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showLimitedOffer = false,
    this.limitedOfferText = 'Sınırlı Teklif',
    this.onBackPressed,
    this.onLimitedOfferPressed,
    this.backgroundColor,
    this.titleColor,
    this.backButtonColor,
    this.limitedOfferColor,
  });

  final String title;
  final bool showBackButton;
  final bool showLimitedOffer;
  final String limitedOfferText;
  final VoidCallback? onBackPressed;
  final VoidCallback? onLimitedOfferPressed;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? backButtonColor;
  final Color? limitedOfferColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? ColorName.appBlack,
      elevation: 0,
      leading:
          showBackButton
              ? IconButton(
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: backButtonColor ?? ColorName.appBlack,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 20),
                ),
              )
              : null,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: [
        if (showLimitedOffer)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: onLimitedOfferPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: limitedOfferColor ?? const Color(0xFFE53E3E),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.diamond, size: 16, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    limitedOfferText,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
