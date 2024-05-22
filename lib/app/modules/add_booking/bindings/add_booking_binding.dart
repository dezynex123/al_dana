import 'package:get/get.dart';

import '../controllers/add_booking_controller.dart';

class AddBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBookingController>(
      () => AddBookingController(),
    );
  }
}
