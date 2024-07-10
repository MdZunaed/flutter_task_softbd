import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/app_text_styles.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const RoundedButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          gradient: appGradient,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(text, style: bodyTextStyle.copyWith(color: whiteColor, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
