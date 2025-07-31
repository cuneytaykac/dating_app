import 'package:dating_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Assets.images.discoveryBackground.image(fit: BoxFit.cover)],
      ),
    );
  }
}
