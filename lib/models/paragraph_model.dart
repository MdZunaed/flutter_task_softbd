class ParagraphListModel {
  List<ParagraphModel>? paragraphs;

  ParagraphListModel({this.paragraphs});

  ParagraphListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      paragraphs = <ParagraphModel>[];
      json['data'].forEach((v) {
        paragraphs!.add(ParagraphModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (paragraphs != null) {
      data['data'] = paragraphs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParagraphModel {
  String? date;
  String? name;
  String? category;
  String? location;

  ParagraphModel({this.date, this.name, this.category, this.location});

  ParagraphModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    name = json['name'];
    category = json['category'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['name'] = name;
    data['category'] = category;
    data['location'] = location;
    return data;
  }
}
