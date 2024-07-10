import 'package:flutter/material.dart';

import '../utility/app_text_styles.dart';

class TitledTextField extends StatelessWidget {
  final String title;
  final String? helperText;
  final bool showHelperText;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final int? maxLines;
  final BoxConstraints? constraints;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  const TitledTextField(
      {super.key,
      required this.title,
      this.helperText,
      this.showHelperText = false,
      required this.hintText,
      this.controller,
      this.suffixIcon,
      this.enabled,
      this.prefixIcon,
      this.maxLines,
      this.textInputType,
      this.constraints});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: bodyTitleStyle),
            if (showHelperText) Text(helperText ?? '', style: bodyTextStyle),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          enabled: enabled ?? true,
          maxLines: maxLines,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            constraints: constraints,
          ),
        ),
      ],
    );
  }
}
