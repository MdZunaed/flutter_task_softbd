import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_softbd/screens/add_paragraph_screen.dart';
import 'package:flutter_task_softbd/utility/app_colors.dart';
import 'package:flutter_task_softbd/utility/app_strings.dart';
import 'package:flutter_task_softbd/utility/app_text_styles.dart';
import 'package:flutter_task_softbd/utility/assets_path.dart';
import 'package:flutter_task_softbd/utility/datetime_formatter.dart';
import 'package:flutter_task_softbd/widgets/rounded_button.dart';
import 'package:get/get.dart';

class NavCalendarScreen extends StatelessWidget {
  const NavCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todayDate = BengaliDateFormatter.format(DateTime.now());
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("আজ, $todayDate", style: bodyTitleStyle),
                RoundedButton(text: "নতুন যোগ করুন", onTap: () => Get.to(const AddParagraphScreen())),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton.filled(
            style: IconButton.styleFrom(backgroundColor: greyLightColor),
            color: Colors.grey,
            onPressed: () {},
            icon: SvgPicture.asset(bellIcon),
          ),
        ),
      ],
      title: const Text(somoyRekha, style: appBarTextStyle),
    );
  }
}
