import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/core/app_theme/app_text_styles.dart';
import 'package:flutter_template/core/app_theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? titleLabel;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isReadOnly;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Color enableBorderColor;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    this.titleLabel,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType = .text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.onChanged,
    this.validator,
    this.isReadOnly = false,
    this.textInputAction = .done,
    this.inputFormatters,
    this.focusNode,
    this.enableBorderColor = AppColors.secondary,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        if (titleLabel != null)
          Padding(
            padding: const .only(bottom: 10.0),
            child: Text(
              titleLabel!,
              style: AppTextStyles.bodyMedium.copyWith(
                height: 30 / 26,
                color: AppColors.black,
                fontWeight: .w400,
              ),
            ),
          ),
        IgnorePointer(
          ignoring: isReadOnly,
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            textInputAction: textInputAction,
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            keyboardType: keyboardType,
            obscureText: obscureText,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            validator: validator,
            readOnly: isReadOnly,
            enableInteractiveSelection: !isReadOnly,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.black),
            decoration: InputDecoration(
              fillColor: fillColor ?? AppColors.tertiaryDark.withValues(alpha: 0.12),
              filled: true,
              labelText: labelText,
              hintText: hintText,
              labelStyle: AppTextStyles.labelLarge.copyWith(color: AppColors.black),
              hintStyle: AppTextStyles.labelSmall.copyWith(
                color: AppColors.primary.withValues(alpha: 0.5),
              ),
              prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppColors.primary) : null,
              suffixIcon: suffixIcon,
              isDense: true,
              contentPadding: const .symmetric(vertical: 10.0, horizontal: 16.0),
              errorStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.errorDark,
                fontWeight: .w400,
              ),
              border: OutlineInputBorder(
                borderRadius: .circular(5),
                borderSide: BorderSide(color: Colors.transparent), // fallback
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: .circular(5),
                borderSide: BorderSide(color: enableBorderColor, width: 0.25),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: .circular(5),
                borderSide: BorderSide(color: AppColors.secondary, width: 0.25),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: .circular(5),
                borderSide: BorderSide(color: AppColors.errorDark, width: 0.25),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: .circular(5),
                borderSide: BorderSide(color: AppColors.secondary, width: 0.25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
