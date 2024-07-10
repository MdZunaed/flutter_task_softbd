import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utility/app_colors.dart';
import '../utility/app_text_styles.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final double value;
  final String text;

  const GradientCircularProgressIndicator({
    super.key,
    required this.size,
    required this.strokeWidth,
    required this.value,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      reverse: true,
      radius: size / 2,
      lineWidth: strokeWidth,
      percent: value,
      backgroundColor: Colors.grey.shade300,
      rotateLinearGradient: true,
      center: Text(
        text,
        style: bodyTitleStyle.copyWith(fontSize: 14),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      linearGradient: appGradient,
    );
  }
}
