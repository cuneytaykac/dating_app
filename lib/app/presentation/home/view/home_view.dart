import 'package:dating_app/app/components/bottom_navigation/custom_bottom_navigation.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.appBlack,
      body: Stack(
        children: [
          const Center(
            child: Text(
              'Ana Sayfa',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigation(currentIndex: 0), // Ana Sayfa seçili
          ),
        ],
      ),
    );
  }
}
