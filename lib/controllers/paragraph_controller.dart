import 'dart:convert';
import 'dart:developer';

import 'package:flutter_task_softbd/models/paragraph_model.dart';
import 'package:flutter_task_softbd/utility/urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ParagraphController extends GetxController {
  bool inProgress = false;
  ParagraphModel _paragraphModel = ParagraphModel();
  List<Paragraph>? get paragraphs => _paragraphModel.paragraphs;

  Future<void> getParagraph() async {
    inProgress = true;
    update();
    final response = await get(Uri.parse(Urls.baseUrl));
    if (response.statusCode == 200) {
      _paragraphModel = ParagraphModel.fromJson(jsonDecode(response.body));
      log(paragraphs![0].date.toString());
    } else {}
    inProgress = false;
    update();
  }
}
