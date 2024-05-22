class ColorResult {
  String? status;
  String? message;
  List<VehicleColor>? colorList;

  ColorResult({this.status, this.message, this.colorList});

  ColorResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      colorList = <VehicleColor>[];
      json['data'].forEach((v) {
        colorList?.add(VehicleColor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = colorList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class VehicleColor {
  String? id;
  String? name,code;

  VehicleColor({this.id, this.name, this.code});

  VehicleColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}
