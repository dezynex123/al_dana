class TimeSlotResult {
  String? status;
  String? message;
  Data? data;

  TimeSlotResult({this.status, this.message, this.data});

  TimeSlotResult.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? branchId;
  String? categoryId;
  String? dayId;
  List<TimeSlotId>? timeSlotId;
  bool? deletable;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
      this.branchId,
      this.categoryId,
      this.dayId,
      this.timeSlotId,
      this.deletable,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    branchId = json['branchId'];
    categoryId = json['categoryId'];
    dayId = json['dayId'];
    if (json['timeSlotId'] != null) {
      timeSlotId = <TimeSlotId>[];
      json['timeSlotId'].forEach((v) {
        timeSlotId!.add(TimeSlotId.fromJson(v));
      });
    }
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['branchId'] = branchId;
    data['categoryId'] = categoryId;
    data['dayId'] = dayId;
    if (timeSlotId != null) {
      data['timeSlotId'] = timeSlotId!.map((v) => v.toJson()).toList();
    }
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class TimeSlotId {
  String? sId;
  String? startTime;
  String? endTime;
  int? maxBooking;
  bool? status;
  bool? deletable;
  String? createdAt;
  String? updatedAt;
  int? iV;

  TimeSlotId(
      {this.sId,
      this.startTime,
      this.endTime,
      this.maxBooking,
      this.status,
      this.deletable,
      this.createdAt,
      this.updatedAt,
      this.iV});

  TimeSlotId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    maxBooking = json['maxBooking'];
    status = json['status'];
    deletable = json['deletable'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['maxBooking'] = maxBooking;
    data['status'] = status;
    data['deletable'] = deletable;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}






























































































































































































