import 'dart:developer';

import 'package:al_dana/app/routes/app_pages.dart';
import 'package:al_dana/location_permission_screen.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/data.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    chackInstalation();
  }

  @override
  void onClose() {}

  void initSplash() async {
    print('on init splash');
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setRoute();
      },
    );
  }

  void setRoute() async {
    bool isLoggedIn =
        await storage.read(is_login) != null && storage.read(is_login);

    // Get.offAndToNamed(isLoggedIn ? Routes.BRANCH : Routes.AUTH);
    Get.offAndToNamed(isLoggedIn ? Routes.BRANCH : Routes.INTRO);
  }

  void chackInstalation() async {
    try {
      await AppSetup.setup();
      // var status = await Permission.location.status;
      // if (PermissionStatus.granted == status) {
        initSplash();
      // } else {
      //   Get.to(const LocationPermissionScreen());
      // }
    } catch (e) {
      log('Permission set up error: $e');
    }
  }
}
