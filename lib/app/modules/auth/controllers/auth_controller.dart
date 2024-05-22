import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var contryCode = '971'.obs;
  var hideLoginPassword = true.obs;
  var hideSignUpPassword = true.obs;
  var hideConfirmPassword = true.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final shakeKey = GlobalKey<ShakeWidgetState>();
  final otpFocus1 = FocusNode(),
      otpFocus2 = FocusNode(),
      otpFocus3 = FocusNode(),
      otpFocus4 = FocusNode(),
      otpFocus5 = FocusNode(),
      otpFocus6 = FocusNode();
  var isOTPEmpty = false.obs;
  var isTimerEnd = false.obs;
  final otp = '******'.obs;

  // var authView = AuthStatus.phone.obs;
  var authView = AuthStatus.login.obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      authView.value = Get.arguments;
    }
  }

  @override
  void onClose() {}

  void requestOTP() async {
    isLoading(true);
    final result = await UserProvider()
        .requestOTP(phoneNumber: '+$contryCode${phoneController.text}');
    if (result.status == 'success') {
      // authView.value = AuthStatus.otp;
    } else {
      showError(result.message);
    }
    isLoading(false);
  }

  changeOTP(String digit, int index) {
    print('before otp $otp');
    if (digit.isEmpty) {
      otp.value = '${otp.substring(0, index)}*${otp.substring(index + 1)}';
    } else {
      otp.value = otp.substring(0, index) + digit + otp.substring(index + 1);
    }
    print('after otp $otp');
  }

  void login() async {
    isLoading(true);
    var result = await UserProvider().login(
      phoneNumber: '+${contryCode.value}${phoneController.text}',
      password: passwordController.text,
    );
    log('+${contryCode.value}${phoneController.text}');

    if (result.status == 'success') {
      var result = await UserProvider().getProfile();
      if (result.status == 'success') {
        storage.write(user_details, result.user.toJson());
        storage.write(is_login, true);
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.offAllNamed(Routes.BRANCH);
        });
      } else {
        showError(result.message);
      }
    } else if (result.message.toLowerCase() == 'new user') {
      authView.value = AuthStatus.signup;
    } else {
      showError(result.message);
    }
    isLoading(false);
  }

  void verifyOTP() async {
    isLoading(true);
    var result = await UserProvider().verifyOTP(
        phoneNumber: '+$contryCode${phoneController.text}', otp: otp.value);

    if (result.status == 'success') {
      var result = await UserProvider().getProfile();
      if (result.status == 'success') {
        storage.write(user_details, result.user.toJson());
        storage.write(is_login, true);
        Get.offAllNamed(Routes.BRANCH);
      } else {
        showError(result.message);
      }
    } else if (result.message.toLowerCase() == 'new user') {
      authView.value = AuthStatus.signup;
    } else {
      showError(result.message);
    }

    isLoading(false);
  }

  void signup() async {
    isLoading(true);
    var result = await UserProvider().signUp(
      user: User(
        name: nameController.text,
        mobile: '+${contryCode.value}${signUpPhoneController.text}',
        email: emailController.text,
        password: signUpPasswordController.text,
        confirmPassword: confirmPasswordController.text,
      ),
    );

    if (result.status == 'success') {
      var result = await UserProvider().getProfile();
      if (result.status == 'success') {
        storage.write(user_details, result.user.toJson());
        storage.write(is_login, true);
        Get.offAllNamed(Routes.BRANCH);
      } else {
        showError(result.message);
      }
    } else {
      showError(result.message);
    }
    isLoading(false);
  }
}
