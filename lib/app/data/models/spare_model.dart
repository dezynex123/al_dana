class SpareResult {
  String? status;
  String? message;
  List<Spare>? data;

  SpareResult({this.status, this.message, this.data});

  SpareResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Spare>[];
      json['data'].forEach((v) {
        data?.add(Spare.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Spare {
  String? id;
  String? categoryId, branchId;
  String? name, desc;
  double? price;
  String? image;
  int? qty;

  Spare(
      {this.id,
      this.categoryId,
      this.branchId,
      this.name,
      this.desc,
      this.price,
      this.image,
      this.qty});

  Spare.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    categoryId = json['spareCategoryId'];
    branchId = json['branchId'];
    name = json['title'];
    desc = json['description'];
    price = double.parse(json['price'].toString());
    image = json['image'];
    qty = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['spareCategoryId'] = categoryId;
    data['title'] = name;
    data['description'] = desc;
    data['price'] = price;
    data['image'] = image;
    data['quantity'] = qty;
    return data;
  }

  Map<String, dynamic> toPost() {
    final data = <String, dynamic>{};
    data['spareId'] = id;
    data['spareAmount'] = price;
    return data;
  }
}
