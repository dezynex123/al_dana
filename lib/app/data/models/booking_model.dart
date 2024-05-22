import 'dart:developer';

import '../data.dart';

class BookingResult {
  String? status;
  String? message;
  List<Booking>? bookingList;
  Booking? booking;

  BookingResult({this.status, this.message, this.bookingList = const []});

  BookingResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    booking = json['data'] != null ? Booking.fromJson(json['data']) : Booking();
  }
  BookingResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    bookingList = <Booking>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        bookingList?.add(Booking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = bookingList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Booking {
  String? id;
  String? bookingId;
  String? date;
  String? slot;
  String? approvalStatus;
  List<PackageModel>? packageList;
  List<Service>? services;
  List<Spare>? spares;
  Vehicle? vehicle;
  Branch? branch;
  ServiceMode? mode;
  Address? address;
  late bool autoSpareSelect;
  late String couponCode;
  late String couponId;
  late double price, subscribedPrice, discountPrice, spareAmount, extraCharge;

  Booking({
    this.id,
    this.bookingId,
    this.date,
    this.slot,
    this.approvalStatus,
    this.packageList,
    this.services,
    this.spares,
    this.vehicle,
    this.branch,
    this.mode,
    this.address,
    this.autoSpareSelect = true,
    this.couponCode = '',
    this.couponId = '',
    this.price = 0.0,
    this.spareAmount = 0.0,
    this.extraCharge = 0.0,
    this.subscribedPrice = 0.0,
    this.discountPrice = 0.0,
  });

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    bookingId = json['bookingId'];
    print(id);
    print('model id');
    date = json['date'];
    slot = json['timeSlotId'];
    approvalStatus = json['approval_status'];
    autoSpareSelect = json['auto_spare_select'] ?? true;
    price = double.parse(json['totalAmount'].toString());
    subscribedPrice = json['subscribed_price'] ?? 0.0;
    if (json['package'] != null) {
      packageList = <PackageModel>[];
      json['package'].forEach((v) {
        packageList?.add(PackageModel.fromJson(v["packageId"]));
      });
    }
    if (json['service'] != null) {
      services = <Service>[];
      json['service'].forEach((v) {
        services?.add(Service.fromJson(v["serviceId"]));
      });
    }
    if (json['spares'] != null) {
      spares = <Spare>[];
      json['spares'].forEach((v) {
        spares?.add(Spare.fromJson(v));
      });
    }
    vehicle =
        json['vehicleId'] != null ? Vehicle?.fromJson(json['vehicleId']) : null;
    log("Vehicle respnse ${vehicle.toString()}");
    branch = json['branch'] != null ? Branch?.fromJson(json['branch']) : null;
    mode = json['mode'] != null ? ServiceMode?.fromJson(json['mode']) : null;
    address =
        json['address'] != null ? Address?.fromJson(json['address']) : null;
    couponCode = '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['bookingId'] = bookingId;
    data['date'] = date;
    data['slot'] = slot;
    data['auto_spare_select'] = autoSpareSelect;
    data['totalAmount'] = subscribedPrice > 0 ? subscribedPrice : price;
    data['approval_status'] = approvalStatus;
    if (packageList != null) {
      data['package'] = packageList?.map((v) => v.toJson()).toList();
    }
    if (services != null) {
      data['service'] = services?.map((v) => v.toJson()).toList();
    }
    if (spares != null) {
      data['spares'] = spares?.map((v) => v.toJson()).toList();
    }
    if (vehicle != null) {
      data['vehicle'] = vehicle?.toJson();
    }

    if (branch != null) {
      data['branch'] = branch?.toJson();
    }

    if (mode != null) {
      data['mode'] = mode?.toJson();
    }
    if (address != null) {
      data['address'] = address?.toJson();
    }

    return data;
  }

  Map<String, dynamic> toPost() {
    Common common = Common();
    final data = <String, dynamic>{};
    data['branchId'] = common.selectedBranch.id;
    data['customerId'] = common.currentUser.id;
    data['vehicleId'] = vehicle?.id;
    data['categoryId'] = common.selectedCategory.id;
    if (services != null && services!.isNotEmpty) {
      data['service'] = services?.map((v) => v.toPost()).toList();
    }
    if (packageList != null && packageList!.isNotEmpty) {
      data['package'] = packageList?.map((v) => v.toPost()).toList();
      log('Package body');
      log(data['package'].toString());
    }
    if (spares != null && spares!.isNotEmpty) {
      data['spare'] = spares?.map((v) => v.toPost()).toList();
      log('Spare id');
      log(data['spare'].toString());
    }
    if (mode != null) {
      data['serviceModeId'] = mode?.id;
    }
    data['totalAmount'] = double.parse((price + spareAmount + extraCharge).toStringAsFixed(2));
    if (couponCode.isNotEmpty) {
      data['couponId'] = couponId;
    }

    data['discountAmount'] = discountPrice;
    data['date'] = date;
    data['timeSlotId'] = slot;
    log('address id');

    if (address?.sId != "") {
      data['addressId'] = address?.sId;
    }
    return data;
  }
}
