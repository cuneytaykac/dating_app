import 'dart:io';

import 'package:dating_app/app/data/datasource/remote/profile/i_profile_service.dart';
import 'package:dating_app/app/presentation/create_profile_picture/state/create_profile_picture_state.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateProfilePictureCubit extends Cubit<CreateProfilePictureState> {
  CreateProfilePictureCubit() : super(const CreateProfilePictureState());
  final IProfileService profileService = getIt.get<IProfileService>();

  void selectPhoto(File? photo) {
    emit(state.copyWith(selectedPhoto: photo));
  }

  void reset() {
    emit(const CreateProfilePictureState());
  }

  Future<void> uploadProfilePicture(BuildContext context) async {
    emit(state.copyWith(isLoading: true));

    final response = await profileService.uploadProfilePicture(
      file: state.selectedPhoto,
    );

    response.when(
      success: (data) {
        emit(state.copyWith(isLoading: false));
        if (context.mounted) {
          context.pop();
        }
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(LocaleKeys.photo_picker_error_occurred.tr()),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }
}
