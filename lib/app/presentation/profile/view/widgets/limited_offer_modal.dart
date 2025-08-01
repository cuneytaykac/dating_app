import 'package:dating_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:moon_extension/moon_extension.dart';

class LimitedOfferModal extends StatelessWidget {
  const LimitedOfferModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
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
                    ColorName.appKUCrimson.withOpacity(0.6),
                    ColorName.appVampireBlack.withOpacity(0.1),
                  ],
                  stops: [0.0, 1],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
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
                          Center(
                            child: Text(
                              "Jeton paketin’ni seçerek bonus kazanın ve yeni bölümlerin kilidini açın!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: ColorName.appWhite.withValues(alpha: 0.03),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white10, width: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container(color: Colors.red)),
          Expanded(flex: 5, child: Container(color: Colors.blue)),
        ],
      ),
    );
  }
}
