part of '../view/create_profile_picture.dart';

SafeArea _body() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
      child: BlocBuilder<CreateProfilePictureCubit, CreateProfilePictureState>(
        builder: (context, state) {
          return Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(),
              if (state.isLoading)
                _buildLoadingAnimation()
              else
                PhotoPickerWidget(
                  onPhotoSelected: (File? photo) {
                    context.read<CreateProfilePictureCubit>().selectPhoto(
                      photo,
                    );
                  },
                  size: 200,
                ),
              const Spacer(),
            ],
          );
        },
      ),
    ),
  );
}
