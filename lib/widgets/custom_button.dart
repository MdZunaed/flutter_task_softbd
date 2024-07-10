import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width ?? double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          gradient: appGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: bodyTitleStyle.copyWith(color: whiteColor, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
