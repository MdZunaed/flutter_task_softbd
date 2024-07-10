import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/app_text_styles.dart';

class MiniDateCard extends StatelessWidget {
  final String text;
  const MiniDateCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: redColor),
      ),
      child: Text(text, style: bodySmallTextStyle.copyWith(fontWeight: FontWeight.w600)),
    );
  }
}
