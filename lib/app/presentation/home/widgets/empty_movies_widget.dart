import 'package:dating_app/gen/colors.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmptyMoviesWidget extends StatelessWidget {
  final VoidCallback? onRefresh;

  const EmptyMoviesWidget({super.key, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ana ikon container'ı
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorName.appKUCrimson.withValues(alpha: 0.2),
                    ColorName.appMajorelleBlue.withValues(alpha: 0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: ColorName.appKUCrimson.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.movie_creation,
                size: 48.0,
                color: ColorName.appKUCrimson,
              ),
            ),
            const SizedBox(height: 32.0),

            // Başlık
            Text(
              'home.empty_title'.tr(),
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: ColorName.appWhite,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),

            // Açıklama
            Text(
              'home.empty_description'.tr(),
              style: const TextStyle(
                fontSize: 16.0,
                color: ColorName.appWhite,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),

            // Aksiyon butonu
            if (onRefresh != null)
              GestureDetector(
                onTap: onRefresh,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        ColorName.appKUCrimson,
                        ColorName.appMajorelleBlue,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: ColorName.appKUCrimson.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.refresh,
                        color: ColorName.appWhite,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'home.refresh'.tr(),
                        style: const TextStyle(
                          color: ColorName.appWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
