import 'package:dating_app/core/theme/core/theme_contracts.dart';
import 'package:dating_app/gen/assets.gen.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class DarkTheme extends ThemeContracts {
  @override
  ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorName.appBlack,
    colorScheme: const ColorScheme.dark(
      primary: ColorName.appKUCrimson,
      secondary: ColorName.appMajorelleBlue,
      surface: ColorName.appVampireBlack,
      error: ColorName.appKUCrimson,
      onPrimary: ColorName.appWhite,
      onSecondary: ColorName.appWhite,
      onSurface: ColorName.appWhite,
      onError: ColorName.appWhite,
      outline: ColorName.appWhite,
      outlineVariant: ColorName.appWhite,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularARegular,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularARegular,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularARegular,
      ),
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularAMedium,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularAMedium,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularAMedium,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularASemiBold,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularAMedium,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularAMedium,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularARegular,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularARegular,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularARegular,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularAMedium,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularAMedium,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: ColorName.appWhite,
        fontFamily: Assets.fonts.euclidCircularAMedium,
      ),
    ),
  );
}
