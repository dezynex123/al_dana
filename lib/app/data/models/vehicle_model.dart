import '../data.dart';

class VehicleResult {
  String? status;
  String? message;
  List<Vehicle>? vehicleList;

  VehicleResult({this.status, this.message, this.vehicleList});

  VehicleResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  VehicleResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      vehicleList = <Vehicle>[];
      json['data'].forEach((v) {
        vehicleList?.add(Vehicle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = vehicleList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Vehicle {
  String? id;
  Brand? brand;
  CarModel? carModel;
  Variant? variant;
  String? year;
  VehicleColor? colour;
  String? plateCode;
  String? plateNumber, city;
  String? image;

  Vehicle(
      {this.id,
      this.brand,
      this.carModel,
      this.variant,
      this.year,
      this.colour,
      this.plateCode,
      this.plateNumber,
      this.city,
      this.image});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    brand =
        json['carBrandId'] != null ? Brand?.fromJson(json['carBrandId']) : null;
    carModel = json['carModelId'] != null
        ? CarModel?.fromJson(json['carModelId'])
        : null;
    variant = json['carVariantId'] != null
        ? Variant?.fromJson(json['carVariantId'])
        : null;
    year = json['year'] ?? '';
    colour =
        json['color'] != null ? VehicleColor?.fromJson(json['color']) : null;
    plateCode = json['plateCode'];
    plateNumber = json['plateNumber'];
    city = json['city'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    if (brand != null) {
      data['carBrandId'] = brand?.toJson();
    }
    if (carModel != null) {
      data['carModelId'] = carModel?.toJson();
    }
    if (variant != null) {
      data['carVariantId'] = variant?.toJson();
    }
    if (year != null) {
      data['year'] = year;
    }
    if (colour != null) {
      data['color'] = colour?.toJson();
    }
    data['plateCode'] = plateCode;
    data['plateNumber'] = plateNumber;
    data['city'] = city;
    data['image'] = image;
    return data;
  }

  Map<String, dynamic> toPost() {
    final data = <String, dynamic>{};
    data['customerId'] = Common().currentUser.id;
    if (brand != null) {
      data['carBrandId'] = brand?.id;
    }
    if (carModel != null) {
      data['carModelId'] = carModel?.id;
    }
    if (variant != null) {
      data['carVariantId'] = variant?.id;
    }
    if (year != null) {
      data['year'] = year;
    }
    if (colour != null) {
      data['color'] = colour?.toJson();
    }
    data['plateCode'] = plateCode;
    data['plateNumber'] = plateNumber;
    data['city'] = city;
    data['image'] = image;
    return data;
  }
}
