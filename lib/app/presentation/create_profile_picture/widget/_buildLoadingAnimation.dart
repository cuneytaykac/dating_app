part of '../view/create_profile_picture.dart';

Widget _buildLoadingAnimation() {
  return Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
      color: ColorName.appKUCrimson.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: ColorName.appKUCrimson.withValues(alpha: 0.3),
        width: 2,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorName.appKUCrimson),
          strokeWidth: 3,
        ),
        const SizedBox(height: 16),
        Text(
          LocaleKeys.photo_picker_loading.tr(),
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
