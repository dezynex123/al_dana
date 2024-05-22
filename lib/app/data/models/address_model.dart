import 'dart:developer';

class AddressResult {
  String? status;
  String? message;
  List<Address>? addressList;
  Address? address;

  AddressResult({this.status, this.message, this.addressList, this.address});

  AddressResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    address = json['data'] != null ? Address.fromJson(json['data']) : Address();
  }

  AddressResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      addressList = <Address>[];
      json['data'].forEach((v) {
        addressList?.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = addressList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Address {
  late String sId, addressType, location, landmark;
  late double latitude, longitude;
  late List<String> relationId;

  Address({
    this.sId = '',
    this.relationId = const [],
    this.addressType = '',
    this.location = '',
    this.landmark = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
  });

  Address.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    addressType = json['addressType'];
    relationId =
        json['relationId'] != null ? json['relationId'].cast<String>() : [];
    location = json['location'] ?? '';
    log('location');
    log(location.toString());
    landmark = json['landMark'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['addressType'] = addressType;
    data['location'] = location;
    data['landMark'] = landmark;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  Map<String, dynamic> toPost() {
    final data = <String, dynamic>{};
    data['relationId'] = relationId[0];
    data['addressType'] = addressType;
    data['location'] = location;
    data['landMark'] = landmark;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  Address copyWith({
    String? sId,
    List<String>? relationId,
    String? addressType,
    String? location,
    String? landmark,
    double? latitude,
    double? longitude,
    bool? deletable,
    String? createdAt,
    String? updatedAt,
    int? iV,
  }) {
    return Address(
      sId: sId ?? this.sId,
      relationId: relationId ?? this.relationId,
      addressType: addressType ?? this.addressType,
      location: location ?? this.location,
      landmark: landmark ?? this.landmark,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
