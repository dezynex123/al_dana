import 'dart:developer';

import 'package:al_dana/app/data/constants/api_routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/constants/common.dart';

class ResetPasswordProvider {
  Future<void> resetPassword(
    String password,
    String newPassword,
    String confirmPassword,
  ) async {
    final body = {
      "currentPassword": password,
      "newPassword": newPassword,
      "confirmPassword": confirmPassword,
    };

    final response = await http.put(Uri.parse(apiChangePasswordUser),
        body: body, headers: Auth().requestHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log(response.body);
      Get.snackbar(
        'Sucess',
        'Password has been sucessfully changed',
      );
    } else {
      Get.snackbar('Failed', 'Failed to Reset Password');
    }
  }
}
