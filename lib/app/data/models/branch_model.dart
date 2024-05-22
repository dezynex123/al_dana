class BranchResult {
  String? status;
  String? message;
  List<Branch>? branchList;

  BranchResult({this.status, this.message, this.branchList});

  BranchResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      branchList = <Branch>[];
      json['data'].forEach((v) {
        branchList?.add(Branch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = branchList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Branch {
  late String id, name, location, image;
  late double latitude, longitude, distance;
  late int rating;
  Branch(
      {this.id = '',
      this.name = '',
      this.location = '',
      this.latitude = 0.0,
      this.longitude = 0.0,
      this.image = '',
      this.rating = 0,
      this.distance = 0.0});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    name = json['name'] ?? "";
    location = json['location'] ?? "";
    latitude = json['latitude'] ?? 0.0;
    longitude = json['longitude'] ?? 0.0;
    image = json['image'] ?? "";
    rating = json['rating'] ?? 0;
    distance = json['distance'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['location'] = location;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['image'] = image;
    data['rating'] = rating;
    return data;
  }
}
