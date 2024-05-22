import '../data.dart';

class SpareCategoryResult {
  String? status;
  String? message;
  List<SpareCategory>? spareCategoryList;
  SpareCategory? spareCategory;

  SpareCategoryResult(
      {this.status, this.message, this.spareCategoryList, this.spareCategory});

  SpareCategoryResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    spareCategory = json['data'] != null
        ? SpareCategory.fromJson(json['data'])
        : SpareCategory();

  }

  SpareCategoryResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      spareCategoryList = <SpareCategory>[];
      json['data'].forEach((v) {
        spareCategoryList?.add(SpareCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = spareCategoryList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class SpareCategory {
  String? id;
  String? name, image;
  List<Spare>? spareList;

  SpareCategory({this.id, this.name, this.image, this.spareList});

  SpareCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['spare'] != null) {
      spareList = <Spare>[];
      json['spare'].forEach((v) {
        spareList?.add(Spare.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (spareList != null) {
      data['spare'] = spareList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
