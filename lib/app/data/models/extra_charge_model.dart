class ExtraCharge {
  String? status;
  String? message;
  List<Data>? data;

  ExtraCharge({this.status, this.message, this.data});

  ExtraCharge.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? minimumDistance;
  String? amount;
  ServiceModeId? serviceModeId;
  bool? deletable;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? range;

  Data(
      {this.sId,
      this.minimumDistance,
      this.amount,
      this.serviceModeId,
      this.deletable,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.range});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    minimumDistance = json['minimumDistance'];
    amount = json['amount'];
    serviceModeId = json['serviceModeId'] != null
        ? ServiceModeId.fromJson(json['serviceModeId'])
        : null;
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    range = json['range'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['minimumDistance'] = minimumDistance;
    data['amount'] = amount;
    if (serviceModeId != null) {
      data['serviceModeId'] = serviceModeId!.toJson();
    }
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['range'] = range;
    return data;
  }
}

class ServiceModeId {
  String? sId;
  String? title;
  String? description;
  String? bgCardColor;
  bool? status;
  bool? needAddress;
  int? price;
  bool? deletable;
  int? iV;

  ServiceModeId(
      {this.sId,
      this.title,
      this.description,
      this.bgCardColor,
      this.status,
      this.needAddress,
      this.price,
      this.deletable,
      this.iV});

  ServiceModeId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    bgCardColor = json['bg_card_color'];
    status = json['status'];
    needAddress = json['needAddress'];
    price = json['price'];
    deletable = json['deletable'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['bg_card_color'] = bgCardColor;
    data['status'] = status;
    data['needAddress'] = needAddress;
    data['price'] = price;
    data['deletable'] = deletable;
    data['__v'] = iV;
    return data;
  }
}
