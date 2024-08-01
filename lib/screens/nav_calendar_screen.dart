import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_softbd/controllers/paragraph_controller.dart';
import 'package:flutter_task_softbd/models/paragraph_model.dart';
import 'package:flutter_task_softbd/screens/add_paragraph_screen.dart';
import 'package:flutter_task_softbd/utility/app_colors.dart';
import 'package:flutter_task_softbd/utility/app_strings.dart';
import 'package:flutter_task_softbd/utility/app_text_styles.dart';
import 'package:flutter_task_softbd/utility/assets_path.dart';
import 'package:flutter_task_softbd/utility/datetime_formatter.dart';
import 'package:flutter_task_softbd/widgets/custom_container.dart';
import 'package:flutter_task_softbd/widgets/paragraph_card.dart';
import 'package:flutter_task_softbd/widgets/rounded_button.dart';
import 'package:get/get.dart';

import '../controllers/date_controller.dart';

class NavCalendarScreen extends StatelessWidget {
  const NavCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todayDate = BengaliDateFormatter.format(DateTime.now());
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("আজ, $todayDate", style: bodyTitleStyle),
                RoundedButton(
                    text: "নতুন যোগ করুন",
                    onTap: () => Get.to(() => const AddParagraphScreen())),
              ],
            ),
            const SizedBox(height: 20),
            GetBuilder<DateController>(builder: (controller) {
              return CustomContainer(
                height: 110,
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.dates.length,
                  itemBuilder: (context, index) {
                    DateTime date = controller.dates[index];
                    bool isSelected = date.day == controller.selectedDate.day &&
                        date.month == controller.selectedDate.month &&
                        date.year == controller.selectedDate.year;
                    return GestureDetector(
                      onTap: () {
                        controller.updateSelectedDate(date);
                      },
                      child: Container(
                        width: 42,
                        margin: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: isSelected
                              ? Border.all(color: primaryColor, width: 2)
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          BengaliDateFormatter.formatDay(date),
                          textAlign: TextAlign.center,
                          style: bodyTitleStyle.copyWith(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            //color: isSelected ? Colors.green : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 20),
            GetBuilder<ParagraphController>(builder: (controller) {
              if (controller.inProgress) {
                return const CircularProgressIndicator();
              }
              return CustomContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("আজকের কার্যক্রম", style: bodyTitleStyle),
                  const SizedBox(height: 20),
                  ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: controller.paragraphs?.length ?? 0,
                    separatorBuilder: (c, i) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      bool even = index % 2 == 0;
                      final paragraph = controller.paragraphs?[index];
                      var date = DateTime.fromMillisecondsSinceEpoch(
                          int.parse(paragraph?.date ?? '') * 1000);
                      //* 1000
                      var formattedDate = "${date.hour}:${date.minute} মি.";
                      var dateInBengali =
                          BengaliDateFormatter.convertToBengali(formattedDate);
                      String timeOfDay = BengaliDateFormatter.getBengaliTimeOfDay(date);
                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text("$timeOfDay\n$dateInBengali",
                                style: bodyTitleStyle, textAlign: TextAlign.center),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 5,
                            child: ParagraphCard(
                              even: even,
                              //time: "${date.hour}:${date.minute}মি.",
                              time: dateInBengali,
                              text: paragraph?.name ?? "text",
                              category: paragraph?.category ?? "বাক্য",
                              location: paragraph?.location ?? "ঢাকা, বাংলাদেশ",
                              onTapDelete: () => controller.deleteParagraph(index),
                              onTapEdit: () {
                                Get.to(AddParagraphScreen(
                                    isUpdating: true,
                                    paragraph: paragraph,
                                    index: index));
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ));
            }),
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
