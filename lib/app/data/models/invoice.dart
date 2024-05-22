import 'package:al_dana/app/data/data.dart';

class Invoice {
  String? status;
  String? message;
  Data? data;

  Invoice({this.status, this.message, this.data});

  Invoice.fromJson(Map<String, dynamic> json) {
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
  List<InvoiceDetails>? invoiceDetails;
  BranchAddress? branchAddress;

  Data({this.invoiceDetails, this.branchAddress});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['invoiceDetails'] != null) {
      invoiceDetails = <InvoiceDetails>[];
      json['invoiceDetails'].forEach((v) {
        invoiceDetails!.add(InvoiceDetails.fromJson(v));
      });
    }
    branchAddress = json['branchAddress'] != null
        ? BranchAddress.fromJson(json['branchAddress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (invoiceDetails != null) {
      data['invoiceDetails'] = invoiceDetails!.map((v) => v.toJson()).toList();
    }
    if (branchAddress != null) {
      data['branchAddress'] = branchAddress!.toJson();
    }
    return data;
  }
}

class InvoiceDetails {
  String? sId;
  String? invoiceNumber;
  BookingId? bookingId;
  String? paymentStatus;
  bool? deletable;
  String? createdAt;
  String? updatedAt;

  InvoiceDetails({
    this.sId,
    this.invoiceNumber,
    this.bookingId,
    this.paymentStatus,
    this.deletable,
    this.createdAt,
    this.updatedAt,
  });

  InvoiceDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    invoiceNumber = json['invoiceNumber'];
    bookingId = json['bookingId'] != null
        ? BookingId.fromJson(json['bookingId'])
        : null;
    paymentStatus = json['paymentStatus'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['invoiceNumber'] = invoiceNumber;
    if (bookingId != null) {
      data['bookingId'] = bookingId!.toJson();
    }
    data['paymentStatus'] = paymentStatus;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class BookingId {
  String? sId;
  BranchId? branchId;
  String? customerId;
  String? addressId;
  VehicleId? vehicleId;
  String? categoryId;
  List<Service>? service;
  List<Package>? package;
  String? serviceModeId;
  int? totalAmount;
  int? discountAmount;
  String? approvalStatus;
  String? timeSlotId;
  String? bookingType;
  String? date;
  bool? deletable;
  List<Spare>? spare;
  String? createdAt;
  String? updatedAt;

  BookingId({
    this.sId,
    this.branchId,
    this.customerId,
    this.addressId,
    this.vehicleId,
    this.categoryId,
    this.service,
    this.package,
    this.serviceModeId,
    this.totalAmount,
    this.discountAmount,
    this.approvalStatus,
    this.timeSlotId,
    this.bookingType,
    this.date,
    this.deletable,
    this.spare,
    this.createdAt,
    this.updatedAt,
  });

  BookingId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    branchId =
        json['branchId'] != null ? BranchId.fromJson(json['branchId']) : null;
    customerId = json['customerId'];
    addressId = json['addressId'];
    vehicleId = json['vehicleId'] != null
        ? VehicleId.fromJson(json['vehicleId'])
        : null;
    categoryId = json['categoryId'];
    if (json['service'] != null) {
      service = <Service>[];
      json['service'].forEach((v) {
        service!.add(Service.fromJson(v));
      });
    }
    if (json['package'] != null) {
      package = <Package>[];
      json['package'].forEach((v) {
        package!.add(Package.fromJson(v));
      });
    }
    serviceModeId = json['serviceModeId'];
    totalAmount = json['totalAmount'];
    discountAmount = json['discountAmount'];
    approvalStatus = json['approvalStatus'];
    timeSlotId = json['timeSlotId'];
    bookingType = json['bookingType'];
    date = json['date'];
    deletable = json['deletable'];
    if (json['spare'] != null) {
      spare = <Spare>[];
      json['spare'].forEach((v) {
        spare!.add(Spare.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (branchId != null) {
      data['branchId'] = branchId!.toJson();
    }
    data['customerId'] = customerId;
    data['addressId'] = addressId;
    if (vehicleId != null) {
      data['vehicleId'] = vehicleId!.toJson();
    }
    data['categoryId'] = categoryId;
    if (service != null) {
      data['service'] = service!.map((v) => v.toJson()).toList();
    }
    if (package != null) {
      data['package'] = package!.map((v) => v.toJson()).toList();
    }
    data['serviceModeId'] = serviceModeId;
    data['totalAmount'] = totalAmount;
    data['discountAmount'] = discountAmount;
    data['approvalStatus'] = approvalStatus;
    data['timeSlotId'] = timeSlotId;
    data['bookingType'] = bookingType;
    data['date'] = date;
    data['deletable'] = deletable;
    if (spare != null) {
      data['spare'] = spare!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class BranchId {
  String? sId;
  String? name;
  int? rating;
  String? image;
  bool? deletable;
  String? createdAt;
  String? updatedAt;

  BranchId({
    this.sId,
    this.name,
    this.rating,
    this.image,
    this.deletable,
    this.createdAt,
    this.updatedAt,
  });

  BranchId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    rating = json['rating'];
    image = json['image'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['rating'] = rating;
    data['image'] = image;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class VehicleId {
  Color? color;
  String? sId;
  String? customerId;
  CarBrandId? carBrandId;
  CarModelId? carModelId;
  CarVariantId? carVariantId;
  String? plateCode;
  String? plateNumber;
  String? image;
  bool? deletable;
  String? createdAt;
  String? updatedAt;

  VehicleId({
    this.color,
    this.sId,
    this.customerId,
    this.carBrandId,
    this.carModelId,
    this.carVariantId,
    this.plateCode,
    this.plateNumber,
    this.image,
    this.deletable,
    this.createdAt,
    this.updatedAt,
  });

  VehicleId.fromJson(Map<String, dynamic> json) {
    color = json['color'] != null ? Color.fromJson(json['color']) : null;
    sId = json['_id'];
    customerId = json['customerId'];
    carBrandId = json['carBrandId'] != null
        ? CarBrandId.fromJson(json['carBrandId'])
        : null;
    carModelId = json['carModelId'] != null
        ? CarModelId.fromJson(json['carModelId'])
        : null;
    carVariantId = json['carVariantId'] != null
        ? CarVariantId.fromJson(json['carVariantId'])
        : null;
    plateCode = json['plateCode'];
    plateNumber = json['plateNumber'];
    image = json['image'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (color != null) {
      data['color'] = color!.toJson();
    }
    data['_id'] = sId;
    data['customerId'] = customerId;
    if (carBrandId != null) {
      data['carBrandId'] = carBrandId!.toJson();
    }
    if (carModelId != null) {
      data['carModelId'] = carModelId!.toJson();
    }
    if (carVariantId != null) {
      data['carVariantId'] = carVariantId!.toJson();
    }
    data['plateCode'] = plateCode;
    data['plateNumber'] = plateNumber;
    data['image'] = image;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Color {
  String? name;
  String? code;

  Color({this.name, this.code});

  Color.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}

class CarBrandId {
  String? sId;
  String? title;
  String? description;
  String? image;
  bool? deletable;
  String? createdAt;
  String? updatedAt;

  CarBrandId({
    this.sId,
    this.title,
    this.description,
    this.image,
    this.deletable,
    this.createdAt,
    this.updatedAt,
  });

  CarBrandId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class CarModelId {
  String? sId;
  String? title;
  String? description;
  String? image;
  String? carBrandId;
  bool? deletable;
  String? createdAt;
  String? updatedAt;

  CarModelId({
    this.sId,
    this.title,
    this.description,
    this.image,
    this.carBrandId,
    this.deletable,
    this.createdAt,
    this.updatedAt,
  });

  CarModelId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    carBrandId = json['carBrandId'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['carBrandId'] = carBrandId;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class CarVariantId {
  String? sId;
  String? title;
  String? description;
  int? engineCapacity;
  int? engineOilCapacity;
  int? gearOilCapacity;
  int? tyreSize;
  String? image;
  String? carModelId;
  bool? deletable;
  String? createdAt;
  String? updatedAt;

  CarVariantId({
    this.sId,
    this.title,
    this.description,
    this.engineCapacity,
    this.engineOilCapacity,
    this.gearOilCapacity,
    this.tyreSize,
    this.image,
    this.carModelId,
    this.deletable,
    this.createdAt,
    this.updatedAt,
  });

  CarVariantId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    engineCapacity = json['engineCapacity'];
    engineOilCapacity = json['engineOilCapacity'];
    gearOilCapacity = json['gearOilCapacity'];
    tyreSize = json['tyreSize'];
    image = json['image'];
    carModelId = json['carModelId'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['engineCapacity'] = engineCapacity;
    data['engineOilCapacity'] = engineOilCapacity;
    data['gearOilCapacity'] = gearOilCapacity;
    data['tyreSize'] = tyreSize;
    data['image'] = image;
    data['carModelId'] = carModelId;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Service {
  ServiceId? serviceId;
  int? serviceAmount;
  String? sId;

  Service({this.serviceId, this.serviceAmount, this.sId});

  Service.fromJson(Map<String, dynamic> json) {
    serviceId = json['serviceId'] != null
        ? ServiceId.fromJson(json['serviceId'])
        : null;
    serviceAmount = json['serviceAmount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (serviceId != null) {
      data['serviceId'] = serviceId!.toJson();
    }
    data['serviceAmount'] = serviceAmount;
    data['_id'] = sId;
    return data;
  }
}

class ServiceId {
  String? sId;
  String? title;
  String? description;
  String? bgCardColor;
  String? image;
  String? duration;
  String? categoryId;
  int? servicePeriod;
  int? price;
  List<Service>? serviceDetails;
  bool? deletable;
  String? createdAt;
  String? updatedAt;

  ServiceId({
    this.sId,
    this.title,
    this.description,
    this.bgCardColor,
    this.image,
    this.duration,
    this.categoryId,
    this.servicePeriod,
    this.price,
    this.serviceDetails,
    this.deletable,
    this.createdAt,
    this.updatedAt,
  });

  ServiceId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    bgCardColor = json['bg_card_color'];
    image = json['image'];
    duration = json['duration'];
    categoryId = json['categoryId'];
    servicePeriod = json['servicePeriod'];
    price = json['price'];
    if (json['serviceDetails'] != null) {
      serviceDetails = <Service>[];
      json['serviceDetails'].forEach((v) {
        serviceDetails!.add(Service.fromJson(v));
      });
    }
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['bg_card_color'] = bgCardColor;
    data['image'] = image;
    data['duration'] = duration;
    data['categoryId'] = categoryId;
    data['servicePeriod'] = servicePeriod;
    data['price'] = price;
    if (serviceDetails != null) {
      data['serviceDetails'] = serviceDetails!.map((v) => v.toJson()).toList();
    }
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Package {
  PackageId? packageId;
  int? packageAmount;
  String? sId;

  Package({this.packageId, this.packageAmount, this.sId});

  Package.fromJson(Map<String, dynamic> json) {
    packageId = json['packageId'] != null
        ? PackageId.fromJson(json['packageId'])
        : null;
    packageAmount = json['packageAmount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (packageId != null) {
      data['packageId'] = packageId!.toJson();
    }
    data['packageAmount'] = packageAmount;
    data['_id'] = sId;
    return data;
  }
}

class PackageId {
  String? sId;
  String? title;
  String? description;
  String? image;
  int? price;
  String? bgCardColor;
  List<PackageModel>? packageDetails;
  List<Service>? services;
  bool? deletable;
  String? createdAt;
  String? updatedAt;
  int? iV;

  PackageId({
    this.sId,
    this.title,
    this.description,
    this.image,
    this.price,
    this.bgCardColor,
    this.packageDetails,
    this.services,
    this.deletable,
    this.createdAt,
    this.updatedAt,
  });

  PackageId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    bgCardColor = json['bg_card_color'];
    if (json['packageDetails'] != null) {
      packageDetails = <PackageModel>[];
      json['packageDetails'].forEach((v) {
        packageDetails!.add(PackageModel.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Service>[];
      json['services'].forEach((v) {
        services!.add(Service.fromJson(v));
      });
    }
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['bg_card_color'] = bgCardColor;
    if (packageDetails != null) {
      data['packageDetails'] = packageDetails!.map((v) => v.toJson()).toList();
    }
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class BranchAddress {
  String? sId;
  String? addressType;
  String? location;
  String? tel;
  String? mob;
  String? po;
  String? trn;
  String? landMark;
  double? latitude;
  double? longitude;
  List<String>? relationId;
  bool? deletable;
  String? createdAt;
  String? updatedAt;

  BranchAddress({
    this.sId,
    this.addressType,
    this.location,
    this.tel,
    this.mob,
    this.po,
    this.trn,
    this.landMark,
    this.latitude,
    this.longitude,
    this.relationId,
    this.deletable,
    this.createdAt,
    this.updatedAt,
  });

  BranchAddress.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    addressType = json['addressType'];
    location = json['location'];
    tel = json['tel'];
    mob = json['mob'];
    po = json['po'];
    trn = json['trn'];
    landMark = json['landMark'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    relationId = json['relationId'].cast<String>();
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['addressType'] = addressType;
    data['location'] = location;
    data['tel'] = tel;
    data['mob'] = mob;
    data['po'] = po;
    data['trn'] = trn;
    data['landMark'] = landMark;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['relationId'] = relationId;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class InvoiceSpare {
  List<Spare>? spare;

  InvoiceSpare({this.spare});

  InvoiceSpare.fromJson(Map<String, dynamic> json) {
    if (json['spare'] != null) {
      spare = <Spare>[];
      json['spare'].forEach((v) {
        spare!.add(Spare.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (spare != null) {
      data['spare'] = spare!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Spare {
  SpareId? spareId;
  int? spareAmount;
  String? sId;

  Spare({this.spareId, this.spareAmount, this.sId});

  Spare.fromJson(Map<String, dynamic> json) {
    spareId =
        json['spareId'] != null ? SpareId.fromJson(json['spareId']) : null;
    spareAmount = json['spareAmount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (spareId != null) {
      data['spareId'] = spareId!.toJson();
    }
    data['spareAmount'] = spareAmount;
    data['_id'] = sId;
    return data;
  }
}

class SpareId {
  String? sId;
  String? spareCategoryId;
  String? title;
  int? price;
  int? quantity;
  String? branchId;
  String? image;
  String? description;
  bool? deletable;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SpareId(
      {this.sId,
      this.spareCategoryId,
      this.title,
      this.price,
      this.quantity,
      this.branchId,
      this.image,
      this.description,
      this.deletable,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SpareId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    spareCategoryId = json['spareCategoryId'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    branchId = json['branchId'];
    image = json['image'];
    description = json['description'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['spareCategoryId'] = spareCategoryId;
    data['title'] = title;
    data['price'] = price;
    data['quantity'] = quantity;
    data['branchId'] = branchId;
    data['image'] = image;
    data['description'] = description;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
