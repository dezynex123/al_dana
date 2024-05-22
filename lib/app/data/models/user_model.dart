// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../data.dart';

class UserResult {
  late String status, message;
  late User user;
  late List<User> userList;

  UserResult({
    this.status = '',
    this.message = '',
    required this.user,
  });

  UserResult.list({
    this.status = '',
    this.message = '',
    this.userList = const [],
  });

  UserResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['data'] != null ? User?.fromJson(json['data']) : User();
  }
  UserResult.listFromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      userList = <User>[];
      json['data'].forEach((v) {
        userList.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = user.toJson();
    return data;
  }

  Map<String, dynamic> listToJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = userList.map((e) => e.toJson()).toList();
    return data;
  }
}

class User {
  late String id, name, email, image, scope;
  late String mobile;
  late String password;
  late String confirmPassword;
  late bool status;
  late List<Address> addressList;

  User({
    this.id = '',
    this.name = '',
    this.mobile = '',
    this.email = '',
    this.image = '',
    this.scope = '',
    this.addressList = const [],
    this.password = '',
    this.confirmPassword = '',
    this.status = false,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    name = json['name'] ?? '';
    mobile = json['phoneNumber'] ?? '';
    email = json['email'] ?? '';
    image = json['image'] ?? '';
    scope = json['role'] ?? '';
    status = json['status'] ?? false;
    addressList = <Address>[];
    if (json['address'] != null) {
      json['address'].forEach((v) {
        addressList.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['phoneNumber'] = mobile;
    data['email'] = email;
    data['image'] = image;
    data['role'] = scope;
    data['status'] = status;
    data['address'] = addressList.map((e) => e.toJson()).toList();
    return data;
  }

  Map<String, dynamic> toPost() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNumber'] = mobile;
    data['email'] = email;
    data['image'] = image;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    return data;
  }

  User copyWith({
    String? id,
    name,
    email,
    image,
    scope,
    String? mobile,
    bool? status,
    List<Address>? addressList,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      scope: scope ?? this.scope,
      mobile: mobile ?? this.mobile,
      status: status ?? this.status,
      addressList: addressList ?? this.addressList,
    );
  }
}
