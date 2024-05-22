import '../data.dart';

class CategoryResult {
  late String status;
  late String message;
  late List<Category> categoryList;
  Category? category;

  CategoryResult(
      {this.status = '', this.message = '', this.categoryList = const []});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    category = json['data'];
  }

  CategoryResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      categoryList = <Category>[];
      json['data'].forEach((v) {
        categoryList.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = categoryList.map((v) => v.toJson()).toList();
    return data;
  }
}

class Category {
  late String id;
  late String title, desc, image, bgCardColor;
  // late List<ServiceMode> modeList;

  Category({
    this.id = '',
    this.title = '',
    this.desc = '',
    this.image = '',
    this.bgCardColor = '',
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    title = json['title'] ?? '';
    desc = json['description'] ?? '';
    image = json['image'] ?? '';
    bgCardColor = json['bg_card_color'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['description'] = desc;
    data['image'] = image;
    data['bg_card_color'] = bgCardColor;
    return data;
  }
}
