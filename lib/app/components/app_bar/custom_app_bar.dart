import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:dating_app/gen/assets.gen.dart';
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
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      surfaceTintColor: context.theme.scaffoldBackgroundColor,
      leading:
          showBackButton
              ? IconButton(
                onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color:
                        backButtonColor ??
                        ColorName.appWhite.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color:
                          context.theme.brightness == Brightness.dark
                              ? Colors.white.withValues(alpha: 0.5)
                              : Colors.black.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color:
                        context.theme.brightness == Brightness.dark
                            ? ColorName.appWhite
                            : ColorName.appBlack,
                    size: 20,
                  ),
                ),
              )
              : null,
      title: Text(
        title,
        style: context.theme.textTheme.headlineSmall?.copyWith(),
        /*TextStyle(
          color: titleColor ?? ColorName.appWhite,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),*/
      ),
      centerTitle: true,
      actions: [
        if (showLimitedOffer)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: onLimitedOfferPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: limitedOfferColor ?? ColorName.appKUCrimson,
                foregroundColor: ColorName.appWhite,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  Assets.icons.diamond.image(),

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
