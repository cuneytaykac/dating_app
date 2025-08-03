part of '../view/create_profile_picture.dart';

Widget _buildContinueButton(BuildContext context) {
  return BlocBuilder<CreateProfilePictureCubit, CreateProfilePictureState>(
    builder: (context, state) {
      final isPhotoSelected = state.selectedPhoto != null;
      final isLoading = state.isLoading;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
        child: CustomButton(
          text:
              isLoading
                  ? LocaleKeys.photo_picker_loading.tr()
                  : LocaleKeys.profile_picture_continue.tr(),
          onPressed:
              (isPhotoSelected && !isLoading)
                  ? () {
                    context
                        .read<CreateProfilePictureCubit>()
                        .uploadProfilePicture(context);
                  }
                  : null,
          backgroundColor:
              (isPhotoSelected && !isLoading)
                  ? ColorName.appKUCrimson
                  : ColorName.appKUCrimson.withValues(alpha: 0.5),
          height: 56,
          borderRadius: 12,
        ),
      );
    },
  );
}
