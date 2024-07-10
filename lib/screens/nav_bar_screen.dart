import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_softbd/controllers/nav_bar_controller.dart';
import 'package:flutter_task_softbd/screens/nav_calendar_screen.dart';
import 'package:flutter_task_softbd/screens/nav_home_screen.dart';
import 'package:flutter_task_softbd/utility/app_colors.dart';
import 'package:flutter_task_softbd/utility/assets_path.dart';
import 'package:get/get.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  List screens = [
    const NavHomeScreen(),
    const NavCalendarScreen(),
    const NavHomeScreen(),
    const NavCalendarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
      builder: (controller) {
        return Scaffold(
          body: screens.elementAt(controller.currentIndex),
          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2, -4),
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        icon: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: SvgPicture.asset(controller.currentIndex == 0 ? homeFilled : home)),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: Padding(
                            padding: const EdgeInsets.only(right: 40, top: 8),
                            child:
                                SvgPicture.asset(controller.currentIndex == 1 ? calendarFilled : calendar)),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: Padding(
                            padding: const EdgeInsets.only(left: 40, top: 8),
                            child: SvgPicture.asset(timeline)),
                        label: ''),
                    BottomNavigationBarItem(
                        icon:
                            Padding(padding: const EdgeInsets.only(top: 8), child: SvgPicture.asset(person)),
                        label: ''),
                  ],
                  currentIndex: controller.currentIndex,
                  onTap: controller.changeScreen,
                ),
              ),
              Positioned(
                top: -30,
                left: MediaQuery.of(context).size.width / 2 - 30,
                child: floatingCameraButton(),
              ),
            ],
          ),
        );
      },
    );
  }

  GestureDetector floatingCameraButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          //border: Border.all(color: Colors.black.withOpacity(0.05), width: 5),
          gradient: appGradient,
          boxShadow: [
            BoxShadow(offset: const Offset(0, 4), color: Colors.black.withOpacity(0.3), blurRadius: 5)
          ],
        ),
        child: SvgPicture.asset(camera),
      ),
    );
  }
}
