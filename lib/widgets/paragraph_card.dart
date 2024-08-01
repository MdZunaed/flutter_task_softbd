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
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;
  const ParagraphCard({
    super.key,
    required this.even,
    required this.time,
    required this.text,
    required this.category,
    required this.location,
    required this.onTapEdit,
    required this.onTapDelete,
  });

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
              const Spacer(),
              Row(
                children: [
                  InkWell(
                    onTap: onTapDelete,
                    child: const Icon(Icons.delete, size: 20, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: onTapEdit,
                    child: const Icon(Icons.edit, size: 20, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
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
