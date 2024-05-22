import 'package:get/get.dart';

import '../controllers/add_work_controller.dart';

class AddWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddWorkController>(
      () => AddWorkController(),
    );
  }
}
