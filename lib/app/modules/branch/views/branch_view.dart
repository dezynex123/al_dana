import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/branch_controller.dart';

class BranchView extends GetView<BranchController> {
  const BranchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBack(),
        title: Text(
          'Select Branch',
          style:
              tsPoppins(color: textDark80, size: 18, weight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Obx(
              () => (controller.isLoading.value)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: greenAppTheme,
                      ),
                    )
                  : GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: controller.camPosition.value,
                      onMapCreated: (GoogleMapController gmController) {
                        controller.mapController.complete(gmController);
                      },
                      markers: controller.markers,
                    ),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: SizedBox(
                height: Get.height * .2,
                child: Obx(
                  () => controller.isLoading.value
                      ? const SizedBox()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          itemCount:
                              controller.branchResult.value.branchList?.length,
                          itemBuilder: (con, i) {
                            return SizedBox(
                              width: Get.width * .8,
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                child: Obx(
                                  () => BranchTile(
                                    onTap: () {
                                      controller.selectBranch(controller
                                              .branchResult
                                              .value
                                              .branchList?[i] ??
                                          Branch());
                                    },
                                    branch: controller.branchResult.value
                                            .branchList?[i] ??
                                        Branch(),
                                    isSelected:
                                        controller.selectedBranch.value.name ==
                                            controller.branchResult.value
                                                .branchList?[i].name,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 70,
              right: 70,
              child: Obx(
                () => controller.isLoading.value
                    ? const SizedBox()
                    : ElevatedButton(
                        onPressed: () {
                          controller.onConfirmPressed();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: greenAppTheme,
                            minimumSize: Size(Get.width * 0.6, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Text(
                          'Confirm',
                          style: tsPoppins(
                              color: white, size: 16, weight: FontWeight.w600),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
