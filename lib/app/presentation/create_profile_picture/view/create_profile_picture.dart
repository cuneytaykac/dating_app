import 'dart:io';

import 'package:dating_app/app/components/app_bar/custom_app_bar.dart';
import 'package:dating_app/app/components/buttons/custom_button.dart';
import 'package:dating_app/app/components/photo_picker/photo_picker_widget.dart';
import 'package:dating_app/app/presentation/create_profile_picture/cubit/create_profile_picture_cubit.dart';
import 'package:dating_app/app/presentation/create_profile_picture/state/create_profile_picture_state.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:dating_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProfilePictureView extends StatelessWidget {
  const CreateProfilePictureView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateProfilePictureCubit(),
      child: const _CreateProfilePictureViewBody(),
    );
  }
}

class _CreateProfilePictureViewBody extends StatelessWidget {
  const _CreateProfilePictureViewBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorName.appBlack,
        appBar: CustomAppBar(title: LocaleKeys.profile_picture_title.tr()),
        bottomNavigationBar: _buildContinueButton(context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(),
                BlocBuilder<
                  CreateProfilePictureCubit,
                  CreateProfilePictureState
                >(
                  builder: (context, state) {
                    return PhotoPickerWidget(
                      onPhotoSelected: (File? photo) {
                        context.read<CreateProfilePictureCubit>().selectPhoto(
                          photo,
                        );
                      },
                      size: 200,
                    );
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  Widget _buildContinueButton(BuildContext context) {
    return BlocBuilder<CreateProfilePictureCubit, CreateProfilePictureState>(
      builder: (context, state) {
        final isPhotoSelected = state.selectedPhoto != null;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
          child: CustomButton(
            text: LocaleKeys.profile_picture_continue.tr(),
            onPressed:
                isPhotoSelected
                    ? () {
                      context
                          .read<CreateProfilePictureCubit>()
                          .uploadProfilePicture();
                      // TODO: Implement photo upload logic
                      // log('Selected photo path: ${state.selectedPhoto!.path}');
                    }
                    : null,
            backgroundColor:
                isPhotoSelected
                    ? ColorName.appKUCrimson
                    : ColorName.appKUCrimson.withValues(alpha: 0.5),
            height: 56,
            borderRadius: 12,
          ),
        );
      },
    );
  }
}
