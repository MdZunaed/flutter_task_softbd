import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_softbd/utility/app_colors.dart';
import 'package:flutter_task_softbd/utility/app_strings.dart';
import 'package:flutter_task_softbd/utility/app_text_styles.dart';
import 'package:flutter_task_softbd/utility/assets_path.dart';
import 'package:flutter_task_softbd/widgets/custom_container.dart';
import 'package:flutter_task_softbd/widgets/mini_time_card.dart';
import 'package:get/get.dart';

import '../widgets/gradiant_percent_indicator.dart';

class NavHomeScreen extends StatelessWidget {
  const NavHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeMenuItem> menuItems = [
      HomeMenuItem(name: "০০০১", image: menuOne),
      HomeMenuItem(name: "০০০২", image: menuTwo),
      HomeMenuItem(name: "০০০৩", image: menuThree),
      HomeMenuItem(name: "০০০৪", image: menuFour),
      HomeMenuItem(name: "০০০৫", image: menuFive),
      HomeMenuItem(name: "০০০৬", image: menuSix),
    ];
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 10),
            profileCard(),
            const SizedBox(height: 20),
            timeCountSection(),
            const SizedBox(height: 20),
            GridView.builder(
              itemCount: menuItems.length,
              primary: false,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1 / 1.4),
              itemBuilder: (context, index) {
                return menuItemCard(
                  name: menuItems[index].name,
                  image: menuItems[index].image,
                  onTap: () {
                    Get.snackbar(menuItems[index].name, '',
                        duration: const Duration(milliseconds: 900),
                        backgroundColor: primaryColor);
                  },
                );
              },
            )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     menuItemCard(name: "০০০১", image: menuOne,onTap:(){}),
            //     menuItemCard(name: "০০০২", image: menuTwo),
            //     menuItemCard(name: "০০০৩", image: menuThree),
            //   ],
            // ),
            // const SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     menuItemCard(name: "০০০৪", image: menuFour),
            //     menuItemCard(name: "০০০৫", image: menuFive),
            //     menuItemCard(name: "০০০৬", image: menuSix),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Widget menuItemCard({required name, required image, onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: Get.width * 0.22,
            height: Get.height * 0.11,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: SvgPicture.asset(image, fit: BoxFit.contain),
          ),
          const SizedBox(height: 6),
          const Text("মেনু নং", style: bodyTitleStyle),
          const SizedBox(height: 5),
          Text(name, style: bodyTitleStyle),
        ],
      ),
    );
  }

  Row timeCountSection() {
    return Row(
      children: [
        const Expanded(
          flex: 2,
          child: Column(
            children: [
              GradientCircularProgressIndicator(
                size: 100,
                strokeWidth: 8,
                value: 0.18,
                text: '৬ মাস ৬ দিন',
              ),
              SizedBox(height: 8),
              Text("সময় অতিবাহিত", style: bodyTitleStyle),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("মেয়াদকাল", style: bodyTitleStyle),
              Row(
                children: [
                  SvgPicture.asset(calendar, height: 15),
                  const SizedBox(width: 5),
                  const Text("১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০",
                      style: bodySmallTextStyle),
                ],
              ),
              const SizedBox(height: 8),
              Text("আরও বাকি", style: bodyTitleStyle.copyWith(color: redColor)),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dateCount(name: "বছর", cellOne: "০", cellTwo: "৫"),
                  dateCount(name: "মাস", cellOne: "০", cellTwo: "৬"),
                  dateCount(name: "দিন", cellOne: "১", cellTwo: "২"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column dateCount({required name, required cellOne, required cellTwo}) {
    return Column(
      children: [
        Row(
          children: [
            MiniDateCard(text: cellOne),
            const SizedBox(width: 5),
            MiniDateCard(text: cellTwo)
          ],
        ),
        const SizedBox(height: 5),
        Text(name, style: bodySmallTextStyle.copyWith(fontSize: 14)),
      ],
    );
  }

  CustomContainer profileCard() {
    return CustomContainer(
      child: Row(
        children: [
          Expanded(flex: 2, child: Image.asset(personImage, height: 60)),
          const SizedBox(width: 5),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("মোঃ মোহাইমেনুল রেজা", style: headlineTextStyle),
                const SizedBox(height: 6),
                const Text("সফটবিডি লিমিটেড", style: bodyTextStyle),
                Row(
                  children: [
                    SvgPicture.asset(location),
                    const SizedBox(width: 5),
                    const Text("ঢাকা", style: bodyTextStyle)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
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
        )
      ],
      title: Row(
        children: [
          Image.asset(logoPng, height: 40),
          const SizedBox(width: 10),
          const Text(flutterTask, style: appBarTextStyle)
        ],
      ),
    );
  }
}

class HomeMenuItem {
  String name;
  String image;
  HomeMenuItem({required this.name, required this.image});
}
