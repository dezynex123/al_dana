class CouponResult {
  String? status;
  String? message;
  List<Coupon>? couponList;
  Coupon? coupon;

  CouponResult({this.status, this.message, this.couponList, this.coupon});

  CouponResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    coupon = json['data'] != null ? Coupon.fromJson(json['data']) : Coupon();
  }

  CouponResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      couponList = <Coupon>[];
      json['data'].forEach((v) {
        couponList?.add(Coupon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = couponList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Coupon {
  String? sId;
  String? couponCode;
  double? discountAmount;
  String? couponType;
  int? amount;
  String? startDate;
  String? endDate;
  bool? deletable;
  String? createdAt;
  String? updatedAt;
  int? iV;
  double? totalAmount;
  String? couponId;

  Coupon({
    this.sId,
    this.couponCode,
    this.discountAmount,
    this.couponType,
    this.amount,
    this.startDate,
    this.endDate,
    this.deletable,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.totalAmount,
    this.couponId,
  });

  Coupon.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    couponCode = json['couponCode'];
    couponId = json['couponId'];
    discountAmount = double.parse(json['discountAmount'].toString());
    couponType = json['couponType'];
    amount = json['amount'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalAmount = double.parse(json['totalAmount'].toString());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['couponCode'] = couponCode;
    data['discountAmount'] = discountAmount;
    data['couponType'] = couponType;
    data['amount'] = amount;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['totalAmount'] = totalAmount;
    return data;
  }
}
