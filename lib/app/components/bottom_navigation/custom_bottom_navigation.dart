import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:dating_app/core/navigation/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: context.theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavButton(
              context: context,
              icon: Icons.home,
              label: 'navigation.home'.tr(),
              index: 0,
              currentIndex: currentIndex,
              routeName: AppRoutes.homeView.name,
            ),
            _buildNavButton(
              context: context,
              icon: Icons.person,
              label: 'navigation.profile'.tr(),
              index: 1,
              currentIndex: currentIndex,
              routeName: AppRoutes.profileView.name,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required int index,
    required int currentIndex,
    required String routeName,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          context.pushNamed(AppRoutes.discoverView.name);
          context.pushNamed(routeName);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected
                    ? context.theme.colorScheme.onSurface
                    : context.theme.colorScheme.onSurface.withValues(
                      alpha: 0.5,
                    ),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  isSelected
                      ? context.theme.colorScheme.onSurface
                      : context.theme.colorScheme.onSurface.withValues(
                        alpha: 0.7,
                      ),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: context.theme.textTheme.titleMedium?.copyWith(
                color:
                    isSelected
                        ? context.theme.colorScheme.onSurface
                        : context.theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
