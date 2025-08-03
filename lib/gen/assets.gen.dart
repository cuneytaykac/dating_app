/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Euclid Circular A Bold Italic.ttf
  String get euclidCircularABoldItalic =>
      'assets/fonts/Euclid Circular A Bold Italic.ttf';

  /// File path: assets/fonts/Euclid Circular A Bold.ttf
  String get euclidCircularABold => 'assets/fonts/Euclid Circular A Bold.ttf';

  /// File path: assets/fonts/Euclid Circular A Italic.ttf
  String get euclidCircularAItalic =>
      'assets/fonts/Euclid Circular A Italic.ttf';

  /// File path: assets/fonts/Euclid Circular A Light Italic.ttf
  String get euclidCircularALightItalic =>
      'assets/fonts/Euclid Circular A Light Italic.ttf';

  /// File path: assets/fonts/Euclid Circular A Light.ttf
  String get euclidCircularALight => 'assets/fonts/Euclid Circular A Light.ttf';

  /// File path: assets/fonts/Euclid Circular A Medium Italic.ttf
  String get euclidCircularAMediumItalic =>
      'assets/fonts/Euclid Circular A Medium Italic.ttf';

  /// File path: assets/fonts/Euclid Circular A Medium.ttf
  String get euclidCircularAMedium =>
      'assets/fonts/Euclid Circular A Medium.ttf';

  /// File path: assets/fonts/Euclid Circular A Regular.ttf
  String get euclidCircularARegular =>
      'assets/fonts/Euclid Circular A Regular.ttf';

  /// File path: assets/fonts/Euclid Circular A SemiBold Italic.ttf
  String get euclidCircularASemiBoldItalic =>
      'assets/fonts/Euclid Circular A SemiBold Italic.ttf';

  /// File path: assets/fonts/Euclid Circular A SemiBold.ttf
  String get euclidCircularASemiBold =>
      'assets/fonts/Euclid Circular A SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
        euclidCircularABoldItalic,
        euclidCircularABold,
        euclidCircularAItalic,
        euclidCircularALightItalic,
        euclidCircularALight,
        euclidCircularAMediumItalic,
        euclidCircularAMedium,
        euclidCircularARegular,
        euclidCircularASemiBoldItalic,
        euclidCircularASemiBold
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/apple.png
  AssetGenImage get apple => const AssetGenImage('assets/icons/apple.png');

  /// File path: assets/icons/diamond.png
  AssetGenImage get diamond => const AssetGenImage('assets/icons/diamond.png');

  /// File path: assets/icons/discovery.png
  AssetGenImage get discovery =>
      const AssetGenImage('assets/icons/discovery.png');

  /// File path: assets/icons/discovery_favorite.png
  AssetGenImage get discoveryFavorite =>
      const AssetGenImage('assets/icons/discovery_favorite.png');

  /// File path: assets/icons/facebook.png
  AssetGenImage get facebook =>
      const AssetGenImage('assets/icons/facebook.png');

  /// File path: assets/icons/google.png
  AssetGenImage get google => const AssetGenImage('assets/icons/google.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/limited_diamond.png
  AssetGenImage get limitedDiamond =>
      const AssetGenImage('assets/icons/limited_diamond.png');

  /// File path: assets/icons/limited_heart.png
  AssetGenImage get limitedHeart =>
      const AssetGenImage('assets/icons/limited_heart.png');

  /// File path: assets/icons/limited_hearts.png
  AssetGenImage get limitedHearts =>
      const AssetGenImage('assets/icons/limited_hearts.png');

  /// File path: assets/icons/limited_unknow.png
  AssetGenImage get limitedUnknow =>
      const AssetGenImage('assets/icons/limited_unknow.png');

  /// File path: assets/icons/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/icons/profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        apple,
        diamond,
        discovery,
        discoveryFavorite,
        facebook,
        google,
        home,
        limitedDiamond,
        limitedHeart,
        limitedHearts,
        limitedUnknow,
        profile
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/discovery_background.png
  AssetGenImage get discoveryBackground =>
      const AssetGenImage('assets/images/discovery_background.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [appLogo, discoveryBackground, splash];
}

class $AssetsLocalizableGen {
  const $AssetsLocalizableGen();

  /// File path: assets/localizable/en.json
  String get en => 'assets/localizable/en.json';

  /// File path: assets/localizable/tr.json
  String get tr => 'assets/localizable/tr.json';

  /// List of all assets
  List<String> get values => [en, tr];
}

class Assets {
  const Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalizableGen localizable = $AssetsLocalizableGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
