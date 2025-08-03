import 'package:dating_app/app/components/buttons/custom_button.dart';
import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:dating_app/gen/assets.gen.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:moon_extension/moon_extension.dart';

class LimitedOfferModal extends StatelessWidget {
  const LimitedOfferModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height * 0.80,
      width: context.screenWidth(1),
      decoration: const BoxDecoration(
        color: ColorName.appVampireBlack,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              width: context.screenWidth(1),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 0.9,
                  colors: [
                    ColorName.appKUCrimson.withValues(alpha: 0.6),
                    ColorName.appVampireBlack.withValues(alpha: 0.1),
                  ],
                  stops: const [0.0, 1],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 50.0,
                        right: 50.0,
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          Text(
                            "limited_offer.title".tr(),
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "limited_offer.description".tr(),
                            textAlign: TextAlign.center,
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: ColorName.appWhite.withValues(alpha: 0.03),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white10, width: 1),
                      ),
                      child: Column(
                        spacing: 40,
                        children: [
                          Text(
                            'limited_offer.bonuses_title'.tr(),
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              __buildBonusItem(
                                context,
                                title: "limited_offer.bonus_jeton".tr(),
                                icon: Assets.icons.limitedDiamond,
                              ),
                              __buildBonusItem(
                                context,
                                title: "limited_offer.bonus_matches".tr(),
                                icon: Assets.icons.limitedHearts,
                              ),
                              __buildBonusItem(
                                context,
                                title: "limited_offer.bonus_featured".tr(),
                                icon: Assets.icons.limitedUnknow,
                              ),
                              __buildBonusItem(
                                context,
                                title: "limited_offer.bonus_likes".tr(),
                                icon: Assets.icons.limitedHeart,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Text(
              'limited_offer.unlock_message'.tr(),
              style: context.theme.textTheme.bodyLarge?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomCenter,
                  radius: 0.7,
                  colors: [
                    ColorName.appKUCrimson.withValues(alpha: 0.4),
                    ColorName.appVampireBlack.withValues(alpha: 0.1),
                  ],
                  stops: const [0.0, 1],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: _buildPackageSelectionSection(
                            context,
                            originalAmount: "200",
                            newAmount: "330",
                            price: "₺99,99",
                            bonusPercentage: "+10%",
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ColorName.appRosewood,
                                ColorName.appKUCrimson,
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: _buildPackageSelectionSection(
                            context,
                            originalAmount: "2000",
                            newAmount: "3.375",
                            price: "₺799,99",
                            bonusPercentage: "+70%",
                            bonusPercentageColor: ColorName.appMajorelleBlue,
                            gradient: RadialGradient(
                              center: Alignment.topLeft,
                              radius: 1.8,
                              colors: [
                                ColorName.appMajorelleBlue,
                                ColorName.appKUCrimson,
                              ],
                              stops: const [0.0, 1],
                            ),
                          ),
                        ),
                        Expanded(
                          child: _buildPackageSelectionSection(
                            context,
                            originalAmount: "100",
                            newAmount: "1.350",
                            price: "₺399,99",
                            bonusPercentage: "+35%",
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ColorName.appRosewood,
                                ColorName.appKUCrimson,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12, top: 12),
                      child: CustomButton(
                        backgroundColor: ColorName.appKUCrimson,
                        borderRadius: 30,
                        text: "limited_offer.view_all_jetons".tr(),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack _buildPackageSelectionSection(
    BuildContext context, {
    required String originalAmount,
    required String newAmount,
    required String price,
    required String bonusPercentage,
    required Gradient? gradient,
    Color? bonusPercentageColor,
  }) {
    return Stack(
      children: [
        Container(
          width: context.screenWidth(1),
          margin: const EdgeInsets.only(top: 32),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ColorName.appWhite, width: 0.4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    Flexible(
                      child: Text(
                        originalAmount,
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.white,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        newAmount,
                        style: context.theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "limited_offer.jeton".tr(),
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Divider(color: ColorName.appWhite, thickness: 0.2),
              ),
              Expanded(
                child: Column(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        price,
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "limited_offer.per_week".tr(),
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16, left: 30, right: 30),
          height: 30,
          decoration: BoxDecoration(
            color: bonusPercentageColor ?? ColorName.appRosewood,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: ColorName.appWhite, width: 0.8),
          ),
          child: Center(
            child: Text(
              bonusPercentage,
              style: context.theme.textTheme.bodySmall?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column __buildBonusItem(
    BuildContext context, {
    required String title,
    required AssetGenImage icon,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: ColorName.appRosewood,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: ColorName.appWhite, width: 0.4),
          ),
          child: icon.image(width: 24, height: 24),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.bodySmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
