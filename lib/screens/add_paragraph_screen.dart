import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_softbd/utility/assets_path.dart';
import 'package:flutter_task_softbd/widgets/custom_button.dart';
import 'package:flutter_task_softbd/widgets/titled_text_field.dart';
import 'package:get/get.dart';

import '../utility/app_text_styles.dart';

class AddParagraphScreen extends StatelessWidget {
  const AddParagraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TitledTextField(
                showHelperText: true, title: "অনুচ্ছেদ", helperText: "৪৫ শব্দ", hintText: "অনুচ্ছেদ লিখুন"),
            const SizedBox(height: 10),
            const TitledTextField(
                enabled: false,
                showHelperText: true,
                title: "অনুচ্ছেদের বিভাগ",
                hintText: "অনুচ্ছেদের বিভাগ নির্বাচন করুন",
                suffixIcon: Icon(Icons.arrow_forward_ios, size: 15)),
            const SizedBox(height: 10),
            TitledTextField(
                enabled: false,
                showHelperText: true,
                title: "তারিখ ও সময়",
                hintText: "নির্বাচন করুন",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: SvgPicture.asset(calendar),
                ),
                suffixIcon: const Icon(Icons.arrow_forward_ios, size: 15)),
            const SizedBox(height: 10),
            TitledTextField(
                enabled: false,
                showHelperText: true,
                title: "স্থান",
                hintText: "নির্বাচন করুন",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: SvgPicture.asset(location),
                ),
                suffixIcon: const Icon(Icons.arrow_forward_ios, size: 15)),
            const SizedBox(height: 10),
            const TitledTextField(
                maxLines: 8,
                constraints: BoxConstraints(maxHeight: 150),
                textInputType: TextInputType.multiline,
                title: "অনুচ্ছেদের বিবরন",
                showHelperText: true,
                helperText: "১২০ শব্দ",
                hintText: "কার্যক্রমের বিবরন লিখুন"),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(
          text: "সংরক্ষন করুন",
          onTap: () {
            showSuccessDialog(context);
          },
        ),
      ),
    );
  }

  Future<dynamic> showSuccessDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          surfaceTintColor: Colors.transparent,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(check),
              const SizedBox(height: 20),
              const Text("নতুন অনুচ্ছেদ সংরক্ষন", style: bodyTitleStyle),
              const SizedBox(height: 5),
              const Text("আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে ",
                  style: bodyTextStyle, textAlign: TextAlign.center),
              const SizedBox(height: 10),
              CustomButton(
                  width: MediaQuery.sizeOf(context).width / 2, text: "আরও যোগ করুন", onTap: () => Get.back()),
            ],
          ),
        );
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(icon: const Icon(Icons.arrow_back_sharp), onPressed: () => Get.back()),
      title: const Text("নতুন যোগ করুন", style: appBarTextStyle),
    );
  }
}
