import 'package:flutter/material.dart';
import 'package:flutter_template/core/app_theme/colors.dart';
import 'package:flutter_template/core/utils/extensions/ui_extension.dart';
import 'package:flutter_template/l10n/app_localizations.dart';

extension ContextX on BuildContext {
  //width & height
  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  double w(double width) {
    const kReferenceWidth = 428.0;
    return width * (MediaQuery.sizeOf(this).width / kReferenceWidth);
  }

  double h(double height) {
    const kReferenceHeight = 882.0;
    return height * (MediaQuery.sizeOf(this).height / kReferenceHeight);
  }

  double sp(double fontSize) {
    return MediaQuery.of(this).textScaler.scale(fontSize);
  }

  void snack({
    required String message,
    Duration duration = const Duration(seconds: 1),
    Color backgroundColor = AppColors.secondaryDark,
    TextStyle? textStyle,
  }) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          content: Text(
            message,
            style: textStyle ?? TextStyle(fontSize: sp(14), color: AppColors.white),
          ),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: 4.rounded),
        ),
      );
  }

  AppLocalizations get l10n => AppLocalizations.of(this)!;

  double menuHeaderHeight() {
    return MediaQuery.paddingOf(this).top + 40.0 + (3 * kToolbarHeight) + 100;
  }
}
