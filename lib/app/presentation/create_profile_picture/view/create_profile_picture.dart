import 'package:dating_app/app/components/app_bar/custom_app_bar.dart';
import 'package:dating_app/app/components/buttons/custom_button.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class CreateProfilePictureView extends StatelessWidget {
  const CreateProfilePictureView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorName.appBlack,
        appBar: CustomAppBar(title: "Profil Detay"),
        bottomNavigationBar: _buildContinueButton(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(),

                _buildPhotoUploadArea(),
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
        const Text(
          'Fotoğraflarınızı Yükleyin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          'Resources out incentivize relaxation floor loss cc.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 16,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoUploadArea() {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1.55,
          ),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white.withValues(alpha: 0.5),
          size: 30,
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
      child: CustomButton(
        text: 'Devam Et',
        onPressed: () {
          // TODO: Implement photo upload logic
        },
        backgroundColor: ColorName.appKUCrimson,
        height: 56,
        borderRadius: 12,
      ),
    );
  }
}
