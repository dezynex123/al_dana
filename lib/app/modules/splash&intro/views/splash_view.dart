import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({Key? key}) : super(key: key);

  @override
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/img_bg_splash.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: width * 0.2),
              child: Image.asset('assets/images/img_logo.png'),
            ),
          ),
        ],
      ),
    );
  }
}
