import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/core/theme_manager.dart';

extension ThemeContextExtension on BuildContext {
  ThemeManager get themeManager => watch<ThemeManager>();

  ThemeData get theme => themeManager.state.currentTheme.theme;

  // Event handler'lar için güvenli tema erişimi
  ThemeData get themeRead => read<ThemeManager>().state.currentTheme.theme;
}
