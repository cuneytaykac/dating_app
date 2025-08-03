part of '../view/create_profile_picture.dart';

Widget _buildHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: 8,
    children: [
      Text(
        LocaleKeys.profile_picture_upload_photos.tr(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        LocaleKeys.profile_picture_description.tr(),
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.7),
          fontSize: 16,
          height: 1.4,
        ),
      ),
    ],
  );
}
