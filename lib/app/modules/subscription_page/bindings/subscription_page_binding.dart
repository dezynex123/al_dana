import 'package:get/get.dart';

import '../controllers/subscription_page_controller.dart';

class SubscriptionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionPageController>(
      () => SubscriptionPageController(),
    );
  }
}
