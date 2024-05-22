import 'package:al_dana/app/data/models/service_mode_model.dart';

import 'service_model.dart';

class PackageResult {
  String? status;
  String? message;
  List<PackageModel>? packageList;

  PackageResult({this.status, this.message, this.packageList});

  PackageResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      packageList = <PackageModel>[];
      json['data'].forEach((v) {
        packageList?.add(PackageModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = packageList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class PackageModel {
  String? id;
  String? title, description,image, bgCardColor;
  double? price;
  List<Service>? services;
  List<ServiceMode>? serviceModeList;

  PackageModel({
    this.id,
    this.title,
    this.services = const [],
    this.image,
    this.bgCardColor,
    this.price,
    this.serviceModeList,
  });

  PackageModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price =
        double.parse(json['price'] != null ? json['price'].toString() : '0');
    bgCardColor = json['bg_card_color'];
    services = <Service>[];
    
    if (json['services'] != null) {
      json['services'].forEach((v) {
        services?.add(Service.fromJson(v));
      });
    }
    if (json['packageDetails'] != null) {
      serviceModeList = <ServiceMode>[];
      json['packageDetails'].forEach((v) {
        serviceModeList!.add(ServiceMode.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['bg_card_color'] = bgCardColor;
    if (services != null) {
      data['services'] = services?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toPost() {
    final data = <String, dynamic>{};
    data['packageId'] = id;
    data['packageAmount'] = price;
    return data;
  }
}
