class Reward {
  String? status;
  String? message;
  Data? data;

  Reward({this.status, this.message, this.data});

  Reward.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? customerId;
  int? rewardPoint;
  bool? deletable;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.customerId,
      this.rewardPoint,
      this.deletable,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customerId = json['customerId'];
    rewardPoint = json['rewardPoint'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['customerId'] = customerId;
    data['rewardPoint'] = rewardPoint;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
