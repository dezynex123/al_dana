import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data.dart';

class UserProvider extends GetConnect {
  Future<UserResult> getUserList() async {
    final file = await rootBundle.loadString('assets/json/user_list.json');
    final data = await jsonDecode(file);
    UserResult result = UserResult.listFromJson(data);
    return result;
  }

  Future<UserResult> requestOTP({required String phoneNumber}) async {
    final UserResult result;
    var body = {"phoneNumber": phoneNumber};
    final response = await post(apiRequiestOtp, body);

    print('body $body');
    print('path $apiRequiestOtp');
    print('response ${response.body}');
    print('response code ${response.statusCode}');
    if (response.statusCode == 200) {
      result = UserResult.fromJson(
          {'status': response.body['status'], 'message': ''});
      var authValue = response.body['data'];
    } else {
      result = UserResult.fromJson(response.body);
    }

    return result;
  }

  Future<UserResult> login({
    required String phoneNumber,
    required String password,
  }) async {
    final UserResult result;
    var body = {
      "phoneNumber": phoneNumber,
      "password": password,
    };
    final response = await post(apiLogin, body);
    if (response.statusCode == 200) {
      result = UserResult.fromJson(
        {
          'status': response.body['status'],
          'message': '',
        },
      );
      var authValue = response.body['data'];
      await storage.write(auth, authValue);
    } else {
      result = UserResult.fromJson(response.body);
    }
    return result;
  }

  Future<UserResult> verifyOTP(
      {required String phoneNumber, required String otp}) async {
    final UserResult result;
    var body = {"phoneNumber": phoneNumber, "otp": otp};
    final response = await post(apiVarifyOtp, body);

    print('body $body');
    print('path $apiVarifyOtp');
    print('response ${response.body}');
    print('response code ${response.statusCode}');
    if (response.statusCode == 200) {
      result = UserResult.fromJson(
          {'status': response.body['status'], 'message': ''});
      var authValue = response.body['data'];

      await storage.write(auth, authValue);
    } else {
      result = UserResult.fromJson(response.body);
    }

    return result;
  }

  Future<UserResult> signUp({required User user}) async {
    final UserResult result;
    final Response<dynamic> response;
    response =
        await post(apiSignup, user.toPost(), headers: Auth().requestHeaders);
    print('path $apiSignup');
    print('body ${user.toPost()}');
    print('response ${response.body}');
    if (response.statusCode == 200) {
      result = UserResult.fromJson(
          {'status': response.body['status'], 'message': ''});
      var authValue = response.body['data'];

      await storage.write(auth, authValue);
    } else {
      result = UserResult.fromJson(response.body);
    }

    return result;
  }

  Future<UserResult> getProfile() async {
    final response = await get(apiReadUser, headers: Auth().requestHeaders);
    print('header ${Auth().requestHeaders}');
    print('path $apiReadUser');
    print('response ${response.body}');
    print('response code ${response.statusCode}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body["message"]);
    }

    return UserResult.fromJson(response.body);
  }

  Future<UserResult> updateProfile({required User userProfile}) async {
    final response = await put(
        '$apiUpdateUser/${userProfile.id}', userProfile.toPost(),
        headers: Auth().requestHeaders);
    print('header ${Auth().requestHeaders}');
    print('path $apiUpdateUser/${userProfile.id}');
    print('response ${response.body}');
    print('response code ${response.statusCode}');

    if (response.statusCode == 401) {
      Auth().authFailed(response.body["message"]);
    }

    return UserResult.fromJson(response.body);
  }

  
}
