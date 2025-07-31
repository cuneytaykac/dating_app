import 'package:dating_app/app/components/app_bar/custom_app_bar.dart';
import 'package:dating_app/app/components/bottom_navigation/custom_bottom_navigation.dart';
import 'package:dating_app/app/components/cache_image/cached_network_image.dart';
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildProfileCard(),
                const SizedBox(height: 20),
                // Diğer profil içerikleri buraya eklenebilir
              ],
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

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(
            40,
          ), // Adjust the radius as needed
          child: cachedNetworkImage(
            "https://images.unsplash.com/photo-1542856391-010fb87dcfed?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbHBhcGVycyUyMGhkfGVufDB8fDB8fHww",
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'Ayça Aydoğan',
          style: TextStyle(color: ColorName.appWhite),
        ),
        subtitle: Text(
          'ID: 245677',
          style: TextStyle(color: ColorName.appWhite.withValues(alpha: 0.5)),
        ),
        trailing: // Fotoğraf Ekle butonu
            ElevatedButton(
          onPressed: () {
            // TODO: Implement photo upload
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorName.appKUCrimson,
            foregroundColor: ColorName.appWhite,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: const Text(
            'Fotoğraf Ekle',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
