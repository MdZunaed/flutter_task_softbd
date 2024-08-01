import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_softbd/controllers/paragraph_controller.dart';
import 'package:flutter_task_softbd/models/paragraph_model.dart';
import 'package:flutter_task_softbd/utility/assets_path.dart';
import 'package:flutter_task_softbd/widgets/custom_button.dart';
import 'package:flutter_task_softbd/widgets/custom_dropdown.dart';
import 'package:flutter_task_softbd/widgets/titled_text_field.dart';
import 'package:get/get.dart';

import '../utility/app_text_styles.dart';

class AddParagraphScreen extends StatefulWidget {
  final ParagraphModel? paragraph;
  final bool isUpdating;
  final int? index;
  const AddParagraphScreen(
      {super.key, this.paragraph, this.isUpdating = false, this.index});

  @override
  State<AddParagraphScreen> createState() => _AddParagraphScreenState();
}

class _AddParagraphScreenState extends State<AddParagraphScreen> {
  final TextEditingController paragraphTEController = TextEditingController();
  final TextEditingController detailsTEController = TextEditingController();
  final TextEditingController datetimeTEController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  String? selectedCategory;
  String? selectedLocation;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTime? selectedDateTime;
  int? selectedDateTimeInMilliseconds;
  final List<String> categories = [
    "অনুচ্ছেদ",
    "বাক্য",
    "শব্দ",
  ];
  final List<String> locations = [
    "ঢাকা, বাংলাদেশ",
    "চট্টগ্রাম, বাংলাদেশ",
    "সিলেট, বাংলাদেশ",
  ];
  @override
  void initState() {
    super.initState();
    if (widget.isUpdating) {
      paragraphTEController.text = widget.paragraph?.name ?? '';
      selectedCategory = widget.paragraph?.category;
      selectedLocation = widget.paragraph?.location;
      selectedDateTime =
          DateTime.fromMillisecondsSinceEpoch(int.parse(widget.paragraph?.date ?? ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TitledTextField(
                  showHelperText: true,
                  controller: paragraphTEController,
                  validator: validator,
                  title: "অনুচ্ছেদ",
                  helperText: "৪৫ শব্দ",
                  hintText: "অনুচ্ছেদ লিখুন"),
              const SizedBox(height: 10),
              CustomDropdown(
                  prefixIcon: const SizedBox(),
                  title: "অনুচ্ছেদের বিভাগ",
                  hintText: "অনুচ্ছেদের বিভাগ নির্বাচন করুন",
                  value: selectedCategory,
                  items: categories,
                  onChanged: (value) {
                    selectedCategory = value;
                    setState(() {});
                  }),
              const SizedBox(height: 10),
              TitledTextField(
                  onTap: () => pickDateTime(),
                  //controller: datetimeTEController,
                  enabled: false,
                  showHelperText: true,
                  title: "তারিখ ও সময়",
                  hintText: "নির্বাচন করুন",
                  // hintText: selectedDateTime == null
                  //     ? "নির্বাচন করুন"
                  //     : BengaliDateFormatter.formatFullDate(selectedDateTime!),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    child: SvgPicture.asset(calendar),
                  ),
                  suffixIcon: const Icon(Icons.arrow_forward_ios, size: 15)),
              const SizedBox(height: 10),
              CustomDropdown(
                  hasPrefix: true,
                  prefixIcon: SvgPicture.asset(location),
                  title: "স্থান",
                  hintText: "স্থান নির্বাচন করুন",
                  value: selectedLocation,
                  items: locations,
                  onChanged: (value) {
                    selectedLocation = value;
                    setState(() {});
                  }),
              const SizedBox(height: 10),
              TitledTextField(
                  //validator: validator,
                  controller: detailsTEController,
                  maxLines: 8,
                  constraints: const BoxConstraints(maxHeight: 150),
                  textInputType: TextInputType.multiline,
                  title: "অনুচ্ছেদের বিবরন",
                  showHelperText: true,
                  helperText: "১২০ শব্দ",
                  hintText: "কার্যক্রমের বিবরন লিখুন"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(
          text: widget.isUpdating ? "পরিবর্তন করুন" : "সংরক্ষন করুন",
          onTap: () {
            widget.isUpdating ? updateParagraph() : addNewParagraph();
          },
        ),
      ),
    );
  }

  void addNewParagraph() {
    if (selectedDateTime == null) {
      Get.snackbar("এরর", "তারিখ ও সময় নির্বাচন করুন");
      return;
    }
    // final date = DateTime(selectedDate!.year, selectedDate!.month,
    //     selectedDate!.day, selectedDate!.hour, selectedDate!.minute);
    // final dateTime = date.millisecondsSinceEpoch;
    final dateTime = selectedDateTime?.millisecondsSinceEpoch;
    ParagraphModel paragraph = ParagraphModel(
      name: paragraphTEController.text.trim(),
      location: selectedLocation,
      category: selectedCategory,
      date: dateTime.toString(),
    );
    if (formKey.currentState!.validate()) {
      Get.find<ParagraphController>().addNewParagraph(paragraph);
      log(paragraph.date.toString());
      showSuccessDialog(context);
      paragraphTEController.clear();
      detailsTEController.clear();
      selectedCategory == null;
      selectedLocation == null;
      selectedDateTime == null;
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          if (mounted) {
            Get.back();
          }
        },
      );
    }
  }

  void updateParagraph() {
    if (selectedDateTime == null) {
      Get.snackbar("এরর", "তারিখ ও সময় নির্বাচন করুন");
      return;
    }
    // final date = DateTime(selectedDate!.year, selectedDate!.month,
    //     selectedDate!.day, selectedDate!.hour, selectedDate!.minute);
    // final dateTime = date.millisecondsSinceEpoch;
    final dateTime = selectedDateTime?.millisecondsSinceEpoch;
    ParagraphModel paragraph = ParagraphModel(
      name: paragraphTEController.text.trim(),
      location: selectedLocation,
      category: selectedCategory,
      date: dateTime.toString(),
    );
    if (formKey.currentState!.validate()) {
      //showSuccessDialog(context);

      Get.find<ParagraphController>().updateParagraph(
          index: widget.index ?? 0,
          name: paragraphTEController.text.trim(),
          category: selectedCategory,
          location: selectedLocation,
          date: dateTime.toString());
      log(paragraph.date.toString());
      showSuccessDialog(context);
      paragraphTEController.clear();
      detailsTEController.clear();
      selectedCategory == null;
      selectedLocation == null;
      selectedDateTime == null;
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          if (mounted) {
            Get.back();
          }
        },
      );
    }
  }

  Future<void> pickDateTime() async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate == null ? DateTime.now() : selectedDate!,
      firstDate: DateTime(1500),
      lastDate: DateTime(3000),
    ).then((value) async {
      selectedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime == null ? TimeOfDay.now() : selectedTime!);
      var dateTime = DateTime(selectedDate?.year ?? 0, selectedDate?.month ?? 0,
          selectedDate?.day ?? 0, selectedTime?.hour ?? 0, selectedTime?.minute ?? 0);
      // var dateTime = DateTime(selectedDate!.year, selectedDate!.month,
      //     selectedDate!.day, selectedTime!.hour, selectedTime!.minute);
      //selectedDateTimeInMilliseconds = dateTime.millisecondsSinceEpoch;
      selectedDateTime = dateTime;
      log(dateTime.toString());
      log(selectedDateTime.toString());
      setState(() {});
    });
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
              Text(widget.isUpdating ? "অনুচ্ছেদ পরিবর্তন" : "নতুন অনুচ্ছেদ সংরক্ষন",
                  style: bodyTitleStyle),
              const SizedBox(height: 5),
              Text(
                  widget.isUpdating
                      ? "আপনার সময়রেখাতে অনুচ্ছেদ পরিবর্তন সম্পুর্ন হয়েছে "
                      : "আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে ",
                  style: bodyTextStyle,
                  textAlign: TextAlign.center),
              const SizedBox(height: 10),
              CustomButton(
                  width: MediaQuery.sizeOf(context).width / 2,
                  text: widget.isUpdating ? "ওকে" : "আরও যোগ করুন",
                  onTap: () => Get.back()),
            ],
          ),
        );
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp), onPressed: () => Get.back()),
      title: Text(widget.isUpdating ? "পরিবর্তন করুন" : "নতুন যোগ করুন",
          style: appBarTextStyle),
    );
  }

  String? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'পুরন করুন';
    }
    return null;
  }
}
