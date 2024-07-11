import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utility/app_colors.dart';
import '../utility/app_text_styles.dart';
import '../utility/assets_path.dart';

class ParagraphCard extends StatelessWidget {
  final bool even;
  final String time;
  final String text;
  final String category;
  final String location;
  const ParagraphCard(
      {super.key,
      required this.even,
      required this.time,
      required this.text,
      required this.category,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: even ? whiteColor : blackColor,
        gradient: even ? appGradient : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(clock),
              const SizedBox(width: 5),
              Text(time, style: bodyTextStyle.copyWith(color: whiteColor)),
            ],
          ),
          const SizedBox(height: 3),
          Text(text, style: bodyTitleStyle.copyWith(color: whiteColor)),
          const SizedBox(height: 3),
          Text(category, style: bodyTextStyle.copyWith(color: whiteColor)),
          const SizedBox(height: 3),
          Row(
            children: [
              SvgPicture.asset(locationWhite),
              const SizedBox(width: 5),
              Text(location, style: bodyTextStyle.copyWith(color: whiteColor)),
            ],
          ),
        ],
      ),
    );
  }
}
