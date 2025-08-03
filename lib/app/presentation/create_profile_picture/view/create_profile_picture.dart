import 'dart:io';

import 'package:dating_app/app/components/app_bar/custom_app_bar.dart';
import 'package:dating_app/app/components/buttons/custom_button.dart';
import 'package:dating_app/app/components/photo_picker/photo_picker_widget.dart';
import 'package:dating_app/app/presentation/create_profile_picture/cubit/create_profile_picture_cubit.dart';
import 'package:dating_app/app/presentation/create_profile_picture/state/create_profile_picture_state.dart';
import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:dating_app/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widget/_body.dart';
part '../widget/_buildContinueButton.dart';
part '../widget/_buildHeader.dart';
part '../widget/_buildLoadingAnimation.dart';

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
        appBar: CustomAppBar(title: LocaleKeys.profile_picture_title.tr()),
        bottomNavigationBar: _buildContinueButton(context),
        body: _body(),
      ),
    );
  }
}
