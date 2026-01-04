// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_template/core/app_theme/app_text_styles.dart';
import 'package:flutter_template/core/utils/extensions/ui_extension.dart';
import 'package:flutter_template/core/widgets/custom_button.dart';

@immutable
class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.color,
    double strokeWidth = 2.0,
    double size = 25.0,
    this.isCentered = true,
  }) : _strokeWidth = strokeWidth,
       _size = size;
  final Color? color;
  final double _size;
  final double _strokeWidth;

  final bool isCentered;
  @override
  Widget build(BuildContext context) {
    if (isCentered) {
      return Center(
        child: Padding(
          padding: const .symmetric(horizontal: 20, vertical: 10),
          child: SizedBox(
            width: _size,
            height: _size,
            child: CircularProgressIndicator.adaptive(
              backgroundColor: color,
              strokeWidth: _strokeWidth,
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const .symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          width: _size,
          height: _size,
          child: CircularProgressIndicator.adaptive(
            backgroundColor: color,
            strokeWidth: _strokeWidth,
          ),
        ),
      );
    }
  }
}

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    required this.message,
    super.key,
    this.padding,
    this.isCentered = true,
    this.onRetry,
  });
  final String message;
  final EdgeInsetsGeometry? padding;

  final bool isCentered;

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const .symmetric(horizontal: 20, vertical: 10),
      child: isCentered
          ? Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    message,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (onRetry != null) ...[
                    40.verticalBox,
                    CustomButton.primary(text: 'Retry', isLoading: false, onPressed: () {}),
                  ],
                ],
              ),
            )
          : Text(
              message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}

class SimpleErrorText extends StatelessWidget {
  const SimpleErrorText({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: AppTextStyles.bodyMedium.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
    );
  }
}

class EmptyListDataWidget extends StatelessWidget {
  const EmptyListDataWidget({this.buttonWidget, this.gap, this.message, super.key});

  final String? message;

  final Widget? buttonWidget;

  final Widget? gap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            message ?? 'No data found',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
          ),
          gap ?? 10.verticalBox,
          if (buttonWidget != null) buttonWidget!,
        ],
      ),
    );
  }
}

class SimpleLoginUserMessageWidget extends StatelessWidget {
  const SimpleLoginUserMessageWidget({this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16, vertical: 10),
      child: Center(
        child: Text(
          message ?? 'Please login to access this feature',
          style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
