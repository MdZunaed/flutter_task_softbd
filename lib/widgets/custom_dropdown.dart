import 'package:flutter/material.dart';
import 'package:flutter_task_softbd/utility/app_colors.dart';

import '../utility/app_text_styles.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final List<String> items;
  final String? value;
  final void Function(String?) onChanged;
  final String hintText;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final bool hasPrefix;
  final int? maxLines;
  final BoxConstraints? constraints;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  const CustomDropdown(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller,
      this.suffixIcon,
      this.hasPrefix = false,
      required this.prefixIcon,
      this.maxLines,
      this.textInputType,
      this.constraints,
      required this.items,
      this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: bodyTitleStyle),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: greyBorderColor)),
          child: Row(
            children: [
              prefixIcon,
              if (hasPrefix) SizedBox(width: 5),
              Expanded(
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        icon: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                        isExpanded: true,
                        hint: Text(hintText),
                        value: value,
                        items: items
                            .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                            .toList(),
                        onChanged: (value) {
                          onChanged(value);
                        })),
              ),
            ],
          ),
        ),
        // TextField(
        //   controller: controller,
        //   enabled: enabled ?? true,
        //   maxLines: maxLines,
        //   keyboardType: textInputType,
        //   decoration: InputDecoration(
        //     hintText: hintText,
        //     suffixIcon: suffixIcon,
        //     prefixIcon: prefixIcon,
        //     constraints: constraints,
        //   ),
        // ),
      ],
    );
  }
}
