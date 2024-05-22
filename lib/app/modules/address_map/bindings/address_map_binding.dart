import 'package:get/get.dart';

import '../controllers/address_map_controller.dart';

class AddressMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressMapController>(
      () => AddressMapController(),
    );
  }
}
