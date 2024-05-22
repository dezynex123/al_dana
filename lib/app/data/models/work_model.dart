class WorkResult {
  late String status;
  late String message;
  late List<Work> workList;

  WorkResult({this.status = '', this.message = '', this.workList = const []});

  WorkResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      workList = <Work>[];
      json['data'].forEach((v) {
        workList.add(Work.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = workList.map((v) => v.toJson()).toList();
    return data;
  }
}

class Work {
  late String id;
  late String title;
  late String subTitle;
  late String desc;
  late double price;
  late bool isItemChange;
  late String categoyId;

  Work(
      {this.id = '',
      this.title = '',
      this.subTitle = '',
      this.desc = '',
      this.price = 0,
      this.isItemChange = false,
      this.categoyId = ''});

  Work.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['sub_title'];
    desc = json['description'];
    price = json['price'];
    isItemChange = json['is_item_change'];
    categoyId = json['categoy_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['sub_title'] = subTitle;
    data['description'] = desc;
    data['price'] = price;
    data['is_item_change'] = isItemChange;
    data['categoy_id'] = categoyId;
    return data;
  }
}
