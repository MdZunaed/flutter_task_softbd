class ParagraphModel {
  List<Paragraph>? paragraphs;

  ParagraphModel({this.paragraphs});

  ParagraphModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      paragraphs = <Paragraph>[];
      json['data'].forEach((v) {
        paragraphs!.add(Paragraph.fromJson(v));
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

class Paragraph {
  String? date;
  String? name;
  String? category;
  String? location;

  Paragraph({this.date, this.name, this.category, this.location});

  Paragraph.fromJson(Map<String, dynamic> json) {
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
