import 'package:flutter/material.dart';
import 'package:flutter_task_softbd/controllers/nav_bar_controller.dart';
import 'package:flutter_task_softbd/controllers/paragraph_controller.dart';
import 'package:flutter_task_softbd/screens/nav_bar_screen.dart';
import 'package:flutter_task_softbd/utility/app_colors.dart';
import 'package:get/get.dart';

import 'controllers/date_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Task',
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBindings(),
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: "NotoSansBengali",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: greyFillColor,
            constraints: const BoxConstraints(maxHeight: 50),
            contentPadding: const EdgeInsets.only(top: 2, left: 16, right: 16),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: greyBorderColor, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: greyBorderColor, width: 1)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: greyBorderColor, width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: redColor, width: 1)),
          )),
      home: const NavBarScreen(),
    );
  }
}

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NavBarController());
    Get.put(DateController());
    Get.put(ParagraphController());
  }
}
