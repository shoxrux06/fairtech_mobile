import 'package:fairtech_mobile/src/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.errorText,
    this.showError = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines,
    this.onChanged,
    this.inputFormatters,
    this.obscureText,
    this.suffixIcon,
    this.titleText,
    this.enabled,
    this.onTap,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.fillColor,
    this.minLines,
    this.onComplete,
    this.validator,
    this.autofocus,
    this.prefixIcon,
    this.suffixText,
    this.prefixText,
    this.hintStyle,
    this.prefixStyle,
    this.contentPadding,
    this.style,
    this.filled,
  });

  final String? hintText;
  final String? errorText;
  final bool showError;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final int? maxLines;
  final int? minLines;
  final String? titleText;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final bool readOnly;
  final Color? fillColor;
  final bool? autofocus;
  final bool? enabled;
  final void Function()? onTap;
  final void Function(String value)? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onComplete;
  final String Function(String?)? validator;
  final String? prefixText;
  final String? suffixText;
  final TextStyle? hintStyle;
  final TextStyle? prefixStyle;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final bool? filled;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.min,
    children: [
      if (titleText != null)
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            '$titleText',
            style: const TextStyle(
              fontSize: 12,
              height: 14 / 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      TextFormField(
        validator: (value) => validator!(value),
        textCapitalization: TextCapitalization.sentences,
        readOnly: readOnly,
        enabled: enabled ?? true,
        autofocus: autofocus ?? false,
        obscureText: obscureText ?? false,
        controller: controller,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        style: style ??
            const TextStyle(
              color: Colors.black54,
              fontSize: 14,
              height: 16 / 14,
              fontWeight: FontWeight.w400,
            ),
        textInputAction: inputAction,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: fillColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.black45,
                width: 1,
              )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black45,
              width: 1,
            )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: context.theme.primaryColor,
                width: 1,
              )
          ),
          filled: filled,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          errorText: showError ? errorText : null,
          errorStyle: const TextStyle(fontSize: 13),
          hintText: hintText,
          hintStyle: hintStyle,
          contentPadding: contentPadding,
          prefixText: prefixText,
          suffixText: suffixText,
          prefixStyle: prefixStyle,
        ),
        // cursorColor: context.theme.colorScheme.primary,
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        inputFormatters: inputFormatters,
        onEditingComplete: onComplete,
      ),
    ],
  );
}
