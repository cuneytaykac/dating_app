import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/core/theme_manager.dart';

extension ThemeContextExtension on BuildContext {
  ThemeManager get themeManager => watch<ThemeManager>();

  ThemeData get theme => themeManager.state.currentTheme.theme;
}
