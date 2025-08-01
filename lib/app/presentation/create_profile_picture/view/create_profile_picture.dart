import 'package:dating_app/app/components/app_bar/custom_app_bar.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CreateProfilePictureView extends StatelessWidget {
  const CreateProfilePictureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.appBlack,
      appBar: CustomAppBar(title: "Profil Detay"),
      body: Column(children: [Text('Create Profile Picture')]),
    );
  }
}
