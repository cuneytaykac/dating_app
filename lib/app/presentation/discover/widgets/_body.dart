part of '../view/discover_view.dart';

Stack _body() {
  return Stack(
    children: [
      Assets.images.discoveryBackground.image(
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _likeButton(),
            _userInfoCard(),
            const CustomBottomNavigation(
              currentIndex: -1,
            ), // Hiçbir tab seçili değil
          ],
        ),
      ),
    ],
  );
}
