class BannerResult {
  String? status;
  String? message;
  List<Banner>? bannerList;

  BannerResult({this.status, this.message, this.bannerList});

  BannerResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      bannerList = <Banner>[];
      json['data'].forEach((v) {
        bannerList?.add(Banner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.bannerList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Banner {
  String? sId;
  String? image;
  String? branchId;
  bool? deletable;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Banner(
      {this.sId,
      this.image,
      this.branchId,
      this.deletable,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Banner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    branchId = json['branchId'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['image'] = image;
    data['branchId'] = branchId;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
