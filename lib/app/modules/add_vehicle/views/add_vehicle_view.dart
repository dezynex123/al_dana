import 'package:al_dana/app/data/data.dart';
import 'package:al_dana/app/modules/add_vehicle/views/select_brand.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_vehicle_controller.dart';
import 'add_details.dart';

class AddVehicleView extends GetView<AddVehicleController> {
  const AddVehicleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgColor1,
        appBar: AppBar(
          leading: const GoBack(),
          title: Obx(() => Text(
                controller.title.value,
                style: tsPoppins(
                    color: textDark80, size: 18, weight: FontWeight.w600),
              )),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(Get.width, 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Obx(
                () => LinearProgressIndicator(
                  backgroundColor: bgColor26,
                  minHeight: 5,
                  color: accent,
                  value: controller.progress.value,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Obx(
          () => controller.pageIndex.value > 0
              ?  AddVehicleDetails()
              : const BrandSelection(),
        )));
  }
}
