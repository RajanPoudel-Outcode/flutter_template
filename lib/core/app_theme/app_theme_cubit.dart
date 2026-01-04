import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme_type.dart';

@injectable
class AppThemeCubit extends Cubit<AppThemeType> {
  AppThemeCubit() : super(AppThemeType.defaultTheme) {
    setInitialTheme();
  }

  static const appThemeKey = 'app_theme';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setInitialTheme() async {
    final prefs = await _prefs;
    final savedThemeInt = prefs.getInt(appThemeKey) ?? 0;

    final theme = switch (savedThemeInt) {
      0 => AppThemeType.defaultTheme,
      1 => AppThemeType.light,
      2 => AppThemeType.dark,
      _ => AppThemeType.defaultTheme,
    };
    emit(theme);
  }

  Future<void> changeTheme(AppThemeType theme) async {
    final prefs = await _prefs;
    await prefs.setInt(appThemeKey, theme.key);

    if (theme != state) {
      emit(theme); // Emit the new theme if it is different from the current one.
    }
  }
}
