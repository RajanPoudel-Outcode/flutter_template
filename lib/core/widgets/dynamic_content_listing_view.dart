import 'package:flutter/material.dart';
import 'package:flutter_template/core/app_theme/colors.dart';
import 'package:flutter_template/core/app_theme/theme_context_extensions.dart';
import 'package:flutter_template/core/utils/extensions/ui_extension.dart';

class DynamicContentListingView extends StatelessWidget {
  const DynamicContentListingView({
    required this.title,
    required this.child,
    this.viewMore,
    this.isLoading = false,
    this.trailingWidget,
    this.onTapHeader,
    this.onViewMoreClick,
    this.headerTitleWidget,
    this.titleStyle,
    this.rowPadding,
    super.key,
  });

  final String title;
  final String? viewMore;
  final bool isLoading;
  final Widget child;
  final Function()? onViewMoreClick;
  final Function()? onTapHeader;
  final Widget? headerTitleWidget;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? rowPadding;

  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: rowPadding ?? const .symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onTapHeader,
                  child:
                      headerTitleWidget ??
                      Text(
                        title,
                        style:
                            titleStyle ??
                            context.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                              fontSize: 20,
                            ),
                      ),
                ),
              ),
              if (trailingWidget != null) ...[
                trailingWidget!,
              ] else if (viewMore != null)
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    onViewMoreClick?.call();
                  },
                  child: Text(
                    viewMore!,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
        8.verticalBox,
        Stack(children: [child, if (isLoading) const CircularProgressIndicator.adaptive()]),
      ],
    );
  }
}
