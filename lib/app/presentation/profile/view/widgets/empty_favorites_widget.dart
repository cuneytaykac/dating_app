import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmptyFavoritesWidget extends StatelessWidget {
  const EmptyFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border,
                size: 64.0,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'favorites.empty_title'.tr(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            Text(
              'favorites.empty_description'.tr(),
              style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
