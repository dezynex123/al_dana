class Vat {
  String? status;
  String? message;
  List<Data>? data;

  Vat({this.status, this.message, this.data});

  Vat.fromJson(Map<String, dynamic> json) {
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
  int? percentage;
  bool? deletable;
  int? iV;

  Data({this.sId, this.percentage, this.deletable, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    percentage = json['percentage'];
    deletable = json['deletable'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['percentage'] = percentage;
    data['deletable'] = deletable;
    data['__v'] = iV;
    return data;
  }
}
