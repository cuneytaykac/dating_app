import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../themes/dark_theme.dart';
import '../themes/light_theme.dart';
import 'theme_contracts.dart';

enum ThemeType { light, dark }

class ThemeState extends Equatable {
  final ThemeType themeType;
  final ThemeContracts currentTheme;
  final bool isLoading;
  final String? error;

  const ThemeState({
    this.themeType = ThemeType.dark,
    required this.currentTheme,
    this.isLoading = false,
    this.error,
  });

  ThemeState copyWith({
    ThemeType? themeType,
    ThemeContracts? currentTheme,
    bool? isLoading,
    String? error,
  }) {
    return ThemeState(
      themeType: themeType ?? this.themeType,
      currentTheme: currentTheme ?? this.currentTheme,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [themeType, currentTheme, isLoading, error];
}

class ThemeManager extends Cubit<ThemeState> {
  final GetStorage _box = GetStorage();

  ThemeManager() : super(ThemeState(currentTheme: DarkTheme())) {
    loadTheme();
  }

  void loadTheme() {
    emit(state.copyWith(isLoading: true));

    try {
      final themeName = _box.read<String>("theme");
      if (themeName != null) {
        final themeType = ThemeType.values.firstWhere(
          (element) => element.name == themeName,
          orElse: () => ThemeType.light,
        );
        _switchTheme(to: themeType);
      } else {
        emit(
          state.copyWith(
            themeType: ThemeType.light,
            currentTheme: LightTheme(),
            isLoading: false,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> changeTheme({required ThemeType to}) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _box.write("theme", to.name);
      _switchTheme(to: to);
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  void _switchTheme({required ThemeType to}) {
    ThemeContracts newTheme;
    switch (to) {
      case ThemeType.light:
        newTheme = LightTheme();
        break;
      case ThemeType.dark:
        newTheme = DarkTheme();
        break;
    }

    emit(
      state.copyWith(
        themeType: to,
        currentTheme: newTheme,
        isLoading: false,
        error: null,
      ),
    );
  }
}
