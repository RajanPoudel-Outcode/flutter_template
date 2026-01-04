import 'package:flutter/material.dart';
import 'package:flutter_template/core/app_theme/colors.dart';
import 'package:flutter_template/core/app_theme/theme_context_extensions.dart';
import 'package:flutter_template/core/utils/extensions/ui_extension.dart';

class _ButtonContent extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Widget? icon;
  final Color textColor;
  final TextDecoration? textDecoration;
  final Color? decorationColor;

  const _ButtonContent({
    required this.text,
    required this.isLoading,
    this.icon,
    required this.textColor,
    this.textDecoration,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(textColor),
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Text(
            text,
            style: context.textTheme.bodyMedium?.copyWith(fontWeight: .w500, color: textColor),
          ),
          8.horizontalBox,
          icon!,
        ],
      );
    }

    return Text(
      text,

      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: .w500,
        color: textColor,
        decoration: textDecoration ?? .none,
        decorationColor: decorationColor,
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final Widget? icon;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  const PrimaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.width,
    this.height = 30,
    this.icon,
    this.borderRadius = 5,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;
    final Color bgColor = color ?? AppColors.secondary;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? bgColor : bgColor.withValues(alpha: 0.5),
          foregroundColor: AppColors.white,
          disabledBackgroundColor: bgColor.withValues(alpha: 0.5),
          disabledForegroundColor: AppColors.white.withValues(alpha: 0.7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        ),
        child: _ButtonContent(
          text: text,
          isLoading: isLoading,
          icon: icon,
          textColor: AppColors.white,
        ),
      ),
    );
  }
}

// ----------------------
// Secondary Button
// ----------------------
class SecondaryButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final Widget? icon;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  const SecondaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.width,
    this.height = 39,
    this.icon,
    this.borderRadius = 27,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;
    final Color borderColor = color ?? AppColors.secondary;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed: isEnabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          foregroundColor: isEnabled ? borderColor : borderColor.withValues(alpha: 0.5),
          disabledForegroundColor: borderColor.withValues(alpha: 0.5),
          side: BorderSide(
            color: isEnabled ? borderColor : borderColor.withValues(alpha: 0.5),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(borderRadius: .circular(borderRadius)),
          padding: padding ?? const .symmetric(horizontal: 24, vertical: 5),
          backgroundColor: AppColors.transparent,
        ),
        child: _ButtonContent(
          text: text,
          isLoading: isLoading,
          icon: icon,
          textColor: isEnabled ? borderColor : borderColor.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}

class TextButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final Widget? icon;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final TextDecoration? textDecoration;
  final Color? decorationColor;

  const TextButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.width,
    this.height = 48,
    this.icon,
    this.borderRadius = 8,
    this.padding,
    this.color,
    this.textDecoration,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;
    final Color txtColor = color ?? AppColors.secondary;

    return SizedBox(
      width: width ?? .infinity,
      height: height,
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          borderRadius: .circular(borderRadius),
          child: Container(
            padding: padding ?? const .symmetric(horizontal: 16, vertical: 8),
            child: Center(
              child: _ButtonContent(
                text: text,
                isLoading: isLoading,
                icon: icon,
                textColor: isEnabled ? txtColor : txtColor.withValues(alpha: 0.5),
                textDecoration: textDecoration,
                decorationColor: decorationColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Widget child;

  const CustomButton._({required this.child});

  factory CustomButton.primary({
    Key? key,
    required String text,
    bool isLoading = false,
    VoidCallback? onPressed,
    double? width,
    double height = 30,
    Widget? icon,
    double borderRadius = 5,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
  }) {
    return CustomButton._(
      child: PrimaryButton(
        key: key,
        text: text,
        isLoading: isLoading,
        onPressed: onPressed,
        width: width,
        height: height,
        icon: icon,
        borderRadius: borderRadius,
        padding: padding,
        color: backgroundColor,
      ),
    );
  }

  factory CustomButton.secondary({
    Key? key,
    required String text,
    bool isLoading = false,
    VoidCallback? onPressed,
    double? width,
    double height = 39,
    Widget? icon,
    double borderRadius = 5,
    EdgeInsetsGeometry? padding,
    Color? color,
  }) {
    return CustomButton._(
      child: SecondaryButton(
        key: key,
        text: text,
        isLoading: isLoading,
        onPressed: onPressed,
        width: width,
        height: height,
        icon: icon,
        borderRadius: borderRadius,
        padding: padding,
        color: color,
      ),
    );
  }

  factory CustomButton.text({
    Key? key,
    required String text,
    bool isLoading = false,
    VoidCallback? onPressed,
    double? width,
    double height = 32,
    Widget? icon,
    double borderRadius = 8,
    EdgeInsetsGeometry? padding,
    Color? color,
    TextDecoration? textDecoration,
    Color? decorationColor,
  }) {
    return CustomButton._(
      child: TextButton(
        key: key,
        text: text,
        isLoading: isLoading,
        onPressed: onPressed,
        width: width,
        height: height,
        icon: icon,
        borderRadius: borderRadius,
        padding: padding,
        color: color,
        textDecoration: textDecoration,
        decorationColor: decorationColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
