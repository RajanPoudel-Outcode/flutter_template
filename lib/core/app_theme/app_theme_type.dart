enum AppThemeType {
  defaultTheme,
  light,
  dark;

  int get key => switch (this) {
    AppThemeType.defaultTheme => 0,
    AppThemeType.light => 1,
    AppThemeType.dark => 2,
  };
}
