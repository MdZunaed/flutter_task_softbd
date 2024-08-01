import 'dart:convert';
import 'dart:developer';

import 'package:flutter_task_softbd/models/paragraph_model.dart';
import 'package:flutter_task_softbd/utility/urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ParagraphController extends GetxController {
  bool inProgress = false;
  ParagraphListModel _paragraphModel = ParagraphListModel();
  List<ParagraphModel>? get paragraphs => _paragraphModel.paragraphs;

  Future<void> getParagraph() async {
    inProgress = true;
    update();
    final response = await get(Uri.parse(Urls.baseUrl));
    if (response.statusCode == 200) {
      _paragraphModel = ParagraphListModel.fromJson(jsonDecode(response.body));
      log(paragraphs![0].date.toString());
    } else {}
    inProgress = false;
    update();
  }

  addNewParagraph(ParagraphModel paragraph) {
    paragraphs?.add(paragraph);
    update();
  }

  updateParagraph(
      {required int index,
      required name,
      required category,
      required location,
      required date}) {
    paragraphs?.elementAt(index).name = name;
    paragraphs?.elementAt(index).category = category;
    paragraphs?.elementAt(index).location = location;
    paragraphs?.elementAt(index).date = date;
    update();
  }

  deleteParagraph(index) {
    paragraphs?.removeAt(index);
    update();
  }
}
