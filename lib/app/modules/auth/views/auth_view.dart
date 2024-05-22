import 'package:al_dana/app/data/data.dart';
import 'package:al_dana/app/modules/auth/views/login_view.dart';
import 'package:al_dana/app/modules/auth/views/signup_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.authView.value) {
        case AuthStatus.signup:
          return  SignUp();
        
        default:
          return LoginView();
      }
    });
    // return LoginView();
  }
}
