import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/data.dart';
import '../../../routes/app_pages.dart';
import '../controllers/work_controller.dart';

class WorkView extends GetView<WorkController> {
  const WorkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          title: Text(
            'Works',
            style:
                tsPoppins(size: 18, weight: FontWeight.w600, color: textDark80),
          ),
          centerTitle: true,
          leading: const GoBack(),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_WORK);
        },
        backgroundColor: primary,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Obx(
        () => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            itemCount: controller.workResult.value.workList.length,
            itemBuilder: (con, i) {
              return WorkTile(
                  onEdit: () {
                    Get.toNamed(Routes.ADD_WORK,
                        arguments: controller.workResult.value.workList[i]);
                  },
                  work: controller.workResult.value.workList[i]);
            }),
      ),
    );
  }
}
