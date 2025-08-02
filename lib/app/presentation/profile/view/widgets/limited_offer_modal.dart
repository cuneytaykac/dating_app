import 'package:dating_app/app/components/buttons/custom_button.dart';
import 'package:dating_app/gen/assets.gen.dart';
import 'package:dating_app/gen/colors.gen.dart';
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
        /* gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 1.5,
          colors: [
            Color(0xFFE53E3E), // Ortada kırmızı
            Color(0xFFC53030), // Biraz daha koyu kırmızı
            Color(0xFF2D1B1B), // Kırmızı-siyah karışımı
            Color(0xFF1A1A1A), // Koyu siyah
          ],
          stops: [0.0, 0.3, 0.7, 1.0],
        ),*/
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      /**
     *   decoration: const BoxDecoration(
        color: ColorName.appVampireBlack,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorName.appRosewood, ColorName.appVampireBlack],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
     */
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
                  stops: [0.0, 1],
                ),
                borderRadius: BorderRadius.only(
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
                            "Sınırlı Teklif",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "Jeton paketin’ni seçerek bonus kazanın ve yeni bölümlerin kilidini açın!",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 14),
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
                          const Text(
                            'Alacağınız Bonuslar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              __buildBonusItem(
                                title: "1000 Jeton\n",
                                icon: Assets.icons.limitedDiamond,
                              ),
                              __buildBonusItem(
                                title: "Daha\nFazla Eşleşme",
                                icon: Assets.icons.limitedHearts,
                              ),
                              __buildBonusItem(
                                title: "Öne \n Çıkma",
                                icon: Assets.icons.limitedUnknow,
                              ),
                              __buildBonusItem(
                                title: "Daha\nFazla Begeni",
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
            child: const Text(
              'Kilidi açmak için bir jeton paketi seçin',
              style: TextStyle(color: Colors.white, fontSize: 15),
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
                  stops: [0.0, 1],
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
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: const [
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
                              stops: [0.0, 1],
                            ),
                          ),
                        ),
                        Expanded(
                          child: _buildPackageSelectionSection(
                            context,
                            originalAmount: "100",
                            newAmount: "1.350",
                            price: "₺399,99",
                            bonusPercentage: "+10%",
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: const [
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
                        text: "Tüm Jetonları Gör",
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
            border: Border.all(color: ColorName.appWhite, width: .4),
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
                    Spacer(flex: 2),
                    Flexible(
                      child: Text(
                        originalAmount,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.white,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        newAmount,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "Jeton",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Divider(color: ColorName.appWhite, thickness: .2),
              ),
              Expanded(
                child: Column(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        price,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Başına haftalık",
                        style: TextStyle(color: Colors.white, fontSize: 14),
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
            border: Border.all(color: ColorName.appWhite, width: .8),
          ),
          child: Center(
            child: Text(
              bonusPercentage,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Column __buildBonusItem({
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
            border: Border.all(color: ColorName.appWhite, width: .4),
          ),
          child: icon.image(width: 24, height: 24),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
