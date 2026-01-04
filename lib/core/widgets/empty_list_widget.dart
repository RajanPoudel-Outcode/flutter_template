import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_template/core/app_theme/app_text_styles.dart';
import 'package:flutter_template/core/utils/extensions/ui_extension.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({this.buttonWidget, this.gap, this.message, super.key});

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
            style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
          ),
          gap ?? 10.verticalBox,
          if (buttonWidget != null) buttonWidget!,
        ],
      ),
    );
  }
}

@Preview()
Widget emptyListWidgetPreview() {
  return const MaterialApp(home: Scaffold(body: EmptyListWidget()));
}
