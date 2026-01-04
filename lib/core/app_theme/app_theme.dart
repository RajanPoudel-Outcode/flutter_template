import 'package:flutter/material.dart';
import 'package:flutter_template/core/app_theme/app_text_styles.dart';
import 'package:flutter_template/core/app_theme/colors.dart';

import 'app_theme_type.dart';

class AppTheme {
  final accentColor1 = AppColors.accent1Light;

  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.primaryLight,
    textTheme: getTextTheme(AppColors.textPrimaryColor),
    scaffoldBackgroundColor: AppColors.background,

    // fontFamily: AppFonts.roboto,
    iconTheme: const IconThemeData(color: AppColors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.textSecondaryColor,
      unselectedItemColor: AppColors.white,
      selectedIconTheme: const IconThemeData(color: AppColors.textSecondaryColor),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.background,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.secondaryTextLight,
      error: AppColors.errorLight,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.white,
      shadow: AppColors.accent2Light,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.white),

      titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20, fontWeight: .w500),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.textSecondaryColor;
        }
        return Colors.white;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondary;
        }
        return AppColors.white;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
        return AppColors.secondary;
      }),
      trackOutlineWidth: const WidgetStatePropertyAll(1),
    ),
  );

  ThemeData get darkTheme => ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.primaryLight,
    textTheme: getTextTheme(AppColors.textPrimaryColor),
    scaffoldBackgroundColor: AppColors.background,
    iconTheme: const IconThemeData(color: AppColors.white),
    //to remove the ripple effect
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomBarColorDark,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.white,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.background,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondaryTextDark,
      error: AppColors.errorDark,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.secondaryTextDark,
      shadow: AppColors.accent2Dark,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
  );

  ThemeData getCurrentThemeFromType(AppThemeType themeType) {
    //Default theme is darkTheme
    return lightTheme;
    // return themeType == AppThemeType.light ? lightTheme : darkTheme;
  }

  TextTheme getTextTheme(Color color) {
    return TextTheme(
      displayLarge: AppTextStyles.displayLarge.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 32.0,
        height: 1.2,
      ),
      displayMedium: AppTextStyles.displayMedium.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 28.0,
        height: 1.2,
      ),
      displaySmall: AppTextStyles.displaySmall.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 24.0,
        height: 1.2,
      ),
      headlineLarge: AppTextStyles.headlineLarge.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 22.0,
        height: 1.2,
      ),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 20.0,
        height: 1.2,
      ),
      headlineSmall: AppTextStyles.headlineSmall.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 18.0,
        height: 1.2,
      ),
      titleLarge: AppTextStyles.titleLarge.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 16.0,
        height: 1.2,
      ),
      titleMedium: AppTextStyles.titleMedium.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 14.0,
        height: 1.2,
      ),
      titleSmall: AppTextStyles.titleSmall.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 12.0,
        height: 1.2,
      ),
      labelLarge: AppTextStyles.labelLarge.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 14.0,
        height: 1.2,
      ),
      labelMedium: AppTextStyles.labelMedium.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 12.0,
        height: 1.2,
      ),
      labelSmall: AppTextStyles.labelSmall.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 10.0,
        height: 1.2,
      ),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 16.0,
        height: 1.2,
      ),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 14.0,
        height: 1.2,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: color,
        fontWeight: .w400,
        fontSize: 12.0,
        height: 1.2,
      ),
    );
  }
}
