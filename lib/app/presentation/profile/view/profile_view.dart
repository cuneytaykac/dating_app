import 'package:dating_app/app/components/app_bar/custom_app_bar.dart';
import 'package:dating_app/app/components/bottom_navigation/custom_bottom_navigation.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profil Detayı',
        showBackButton: true,
        showLimitedOffer: true,
        limitedOfferText: 'Sınırlı Teklif',
        onBackPressed: () => Navigator.of(context).pop(),
        onLimitedOfferPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sınırlı teklif tıklandı!'),
              backgroundColor: Color(0xFFE53E3E),
            ),
          );
        },
      ),
      backgroundColor: ColorName.appBlack,
      body: Stack(
        children: [
          const Center(
            child: Text(
              'Profile Content',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigation(currentIndex: 1), // Profil seçili
          ),
        ],
      ),
    );
  }
}
