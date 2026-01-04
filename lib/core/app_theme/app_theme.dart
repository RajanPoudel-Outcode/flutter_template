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
    textTheme: getTextTheme(AppColors.primaryTextLight),
    scaffoldBackgroundColor: AppColors.primaryBackgroundLight,
    // fontFamily: GoogleFonts.barlow().fontFamily,
    iconTheme: const IconThemeData(color: AppColors.primaryTextLight),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondaryTextLight.withOpacity(0.8),
      selectedIconTheme: const IconThemeData(color: AppColors.primaryTextLight),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryTextLight,
      secondary: AppColors.secondaryLight,
      onSecondary: AppColors.secondaryTextLight,
      error: AppColors.errorLight,
      onError: AppColors.white,
      surface: AppColors.secondaryBackgroundLight,
      onSurface: AppColors.secondaryTextLight,
      shadow: AppColors.accent2Light,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
  );

  ThemeData get darkTheme => ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.primaryLight,
    textTheme: getTextTheme(AppColors.primaryTextDark),
    scaffoldBackgroundColor: AppColors.primaryBackgroundDark,
    // fontFamily: GoogleFonts.barlow().fontFamily,
    iconTheme: const IconThemeData(color: AppColors.primaryTextDark),
    //to remove the ripple effect
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomBarColorDark,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.white,
      selectedIconTheme: IconThemeData(color: AppColors.primaryTextDark),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryTextDark,
      secondary: AppColors.secondaryDark,
      onSecondary: AppColors.secondaryTextDark,
      error: AppColors.errorDark,
      onError: AppColors.white,
      surface: AppColors.secondaryBackgroundDark,
      onSurface: AppColors.secondaryTextDark,
      shadow: AppColors.accent2Dark,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
  );

  ThemeData getCurrentThemeFromType(AppThemeType themeType) {
    //Default theme is darkTheme
    return darkTheme;
    // return themeType == AppThemeType.light ? lightTheme : darkTheme;
  }

  TextTheme getTextTheme(Color color) {
    return TextTheme(
      displayLarge: AppTextStyles.displayLarge.copyWith(color: color),
      displayMedium: AppTextStyles.displayMedium.copyWith(color: color),
      displaySmall: AppTextStyles.displaySmall.copyWith(color: color),
      headlineLarge: AppTextStyles.headlineLarge.copyWith(color: color),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(color: color),
      headlineSmall: AppTextStyles.headlineSmall.copyWith(color: color),
      titleLarge: AppTextStyles.titleLarge.copyWith(color: color),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: color),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: color),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: color),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: color),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: color),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: color),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: color),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: color),
    );
  }
}
