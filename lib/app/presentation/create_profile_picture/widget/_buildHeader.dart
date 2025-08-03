part of '../view/create_profile_picture.dart';

Widget _buildHeader(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    spacing: 8,
    children: [
      Center(
        child: Text(
          LocaleKeys.profile_picture_upload_photos.tr(),
          style: context.theme.textTheme.titleLarge,
        ),
      ),
      Center(
        child: Text(
          LocaleKeys.profile_picture_description.tr(),
          style: context.theme.textTheme.titleMedium?.copyWith(fontSize: 13),
        ),
      ),
    ],
  );
}
