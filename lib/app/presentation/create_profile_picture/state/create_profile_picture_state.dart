import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_profile_picture_state.freezed.dart';

@freezed
class CreateProfilePictureState with _$CreateProfilePictureState {
  const factory CreateProfilePictureState({
    File? selectedPhoto,
    @Default(false) bool isLoading,
  }) = _CreateProfilePictureState;
}
