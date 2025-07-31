import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/core/theme_manager.dart';

mixin ThemeMixin<T extends StatefulWidget> on State<T> {
  ThemeManager get currentTheme => context.watch<ThemeManager>();
}

mixin ThemeMixinStateless<T extends StatelessWidget> {
  ThemeManager currentTheme(BuildContext context) =>
      context.watch<ThemeManager>();
}
