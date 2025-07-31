import 'package:dating_app/core/theme/core/theme_contracts.dart';
import 'package:flutter/material.dart';

class LightTheme extends ThemeContracts {
  @override
  ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
  );
}
