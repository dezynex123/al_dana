class CarModelResult {
  late String status, message;
  late List<CarModel> modelList;
  CarModel? carModel;

  CarModelResult(
      {this.status = '',
      this.message = '',
      this.modelList = const [],
      this.carModel});

  CarModelResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    carModel =
        json['data'] != null ? CarModel.fromJson(json['data']) : CarModel();
  }
  CarModelResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      modelList = <CarModel>[];
      json['data'].forEach((v) {
        modelList.add(CarModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = modelList.map((v) => v.toJson()).toList();
    return data;
  }
}

class CarModel {
  late String id, name,desc,image;

  CarModel({this.id = '', this.name = ''});
  
  CarModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['title'];
    desc = json['description']??'';
    image = json['image']??'';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = name;
    data['description'] = desc;
    data['image'] = image;
    return data;
  }
}
