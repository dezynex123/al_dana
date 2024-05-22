import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart';
import '../../../data/providers/vat_provider.dart';
import '../controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  const ServiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String vatPercentage =
        Provider.of<VATProvider>(context).vat?.data?[0].percentage.toString() ??
            '';
    return Scaffold(
      backgroundColor: bgColor1,
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        leading: const GoBack(),
        title: Obx(
          () => Text(
            controller.selectedCategory.value.title,
            style: tsPoppins(size: 18, weight: FontWeight.w600, color: white),
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 100,
              decoration: BoxDecoration(
                  color: textDark20, borderRadius: BorderRadius.circular(100)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Branch',
                          style: tsPoppins(
                              size: 10,
                              weight: FontWeight.w400,
                              color: textDark40)),
                      Text(controller.common.selectedBranch.name,
                          style: tsPoppins(color: textDark40)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mode',
                          style: tsPoppins(
                              size: 10,
                              weight: FontWeight.w400,
                              color: textDark40)),
                      Text(controller.common.selectedMode.title,
                          style: tsPoppins(color: textDark40)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => Text(
                                controller.price.value.toStringAsFixed(2),
                                style: tsPoppins(
                                    size: 18,
                                    weight: FontWeight.w600,
                                    color: greenAppTheme)),
                          ),
                          Text('AED',
                              style: tsPoppins(
                                  size: 16,
                                  weight: FontWeight.w400,
                                  color: textDark40)),
                        ],
                      ),
                      Text('Incl. $vatPercentage% VAT',
                          style: tsPoppins(
                              weight: FontWeight.w400, color: textColor08)),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.chooseMode(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: greenAppTheme,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                      child: Text(
                        '    Next   ',
                        style: tsPoppins(
                            color: white, size: 14, weight: FontWeight.w400),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description',
                            style: tsPoppins(
                                color: textDark80, weight: FontWeight.w600)),
                        Container(
                          height: 2,
                          width: 20,
                          decoration: BoxDecoration(
                            color: accent60,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(controller.selectedCategory.value.desc),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        VehicleTile(vehicle: controller.selectedVehicle.value),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Services List',
                            style: tsPoppins(
                                color: textDark80, weight: FontWeight.w600)),
                        Container(
                          height: 2,
                          width: 20,
                          decoration: BoxDecoration(
                            color: accent60,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .26,
                    child: Obx(
                      () => controller.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: primary,
                              ),
                            )
                          : controller.serviceResult.value.serviceList.isEmpty
                              ? const Center(
                                  child: Text(
                                    'Sorry, Currently no services available.',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  itemCount: controller
                                      .serviceResult.value.serviceList.length,
                                  itemBuilder: (con, i) {
                                    return ServiceTile(
                                      onTap: () {
                                        if (controller
                                            .selectedServiceList.isEmpty) {
                                          controller.price.value = 0.0;
                                        }
                                        if (controller.selectedServiceList
                                            .contains(controller.serviceResult
                                                .value.serviceList[i])) {
                                          controller.selectedServiceList.remove(
                                              controller.serviceResult.value
                                                  .serviceList[i]);
                                          controller.price.value -= controller
                                              .serviceResult
                                              .value
                                              .serviceList[i]
                                              .price;
                                        } else {
                                          controller.selectedServiceList.add(
                                              controller.serviceResult.value
                                                  .serviceList[i]);
                                          controller.price.value += controller
                                              .serviceResult
                                              .value
                                              .serviceList[i]
                                              .price;
                                        }
                                        // controller.selectedService.value =
                                        //     controller
                                        //         .serviceResult.value.serviceList[i];
                                        controller.isServiceSelected.value =
                                            true;

                                        // controller.price.value = controller
                                        //     .serviceResult
                                        //     .value
                                        //     .serviceList[i]
                                        //     .price;
                                        controller.packageId.value = controller
                                            .serviceResult
                                            .value
                                            .serviceList[i]
                                            .id;
                                        controller.isSelected.value = true;
                                        controller.serviceResult.refresh();
                                        controller.packageResult.refresh();
                                      },
                                      service: controller
                                          .serviceResult.value.serviceList[i],
                                      // isSelected:
                                      //     (controller.isServiceSelected.value &&
                                      //         controller.selectedService.value ==
                                      //             controller.serviceResult.value
                                      //                 .serviceList[i]),
                                      isSelected: controller.selectedServiceList
                                          .contains(controller.serviceResult
                                              .value.serviceList[i]),
                                      onChanged: (bool? c) {
                                        // controller.selectedService.value =
                                        //     controller
                                        //         .serviceResult.value.serviceList[i];

                                        controller.isServiceSelected.value =
                                            true;
                                        controller.serviceResult.refresh();
                                        controller.packageResult.refresh();
                                      },
                                    );
                                  }),
                    ),
                  ),
                  Obx(() =>
                      controller.serviceResult.value.serviceList.length > 2
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  '<--- Swipe --->',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            )
                          : const SizedBox.shrink()),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Packages List',
                            style: tsPoppins(
                                color: textDark80, weight: FontWeight.w600)),
                        Container(
                          height: 2,
                          width: 20,
                          decoration: BoxDecoration(
                              color: accent60,
                              borderRadius: BorderRadius.circular(100)),
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: primary,
                            ),
                          )
                        : controller.packageResult.value.packageList!.isEmpty
                            ? const Text(
                                'Sorry, Currently no packages available.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                itemCount: controller.packageResult.value
                                        .packageList?.length ??
                                    0,
                                itemBuilder: (con, i) {
                                  return PackageTile(
                                    onTap: () {
                                      controller.selectedServiceList.value = [];
                                      controller.price.value = 0.0;
                                      controller.selectedPackage.value =
                                          controller.packageResult.value
                                              .packageList![i];
                                      controller.isServiceSelected.value =
                                          false;
                                      controller.price.value = controller
                                          .packageResult
                                          .value
                                          .packageList![i]
                                          .price!;
                                      log('package id');
                                      log(controller.packageResult.value
                                          .packageList![i].id
                                          .toString());

                                      controller.isSelected.value = true;
                                      controller.serviceResult.refresh();
                                      controller.packageResult.refresh();
                                    },
                                    package: controller
                                        .packageResult.value.packageList![i],
                                    isSelected:
                                        (!controller.isServiceSelected.value &&
                                            controller.selectedPackage.value ==
                                                controller.packageResult.value
                                                    .packageList![i]),
                                    onChanged: (bool? c) {
                                      controller.selectedPackage.value =
                                          controller.packageResult.value
                                              .packageList![i];
                                      controller.isServiceSelected.value =
                                          false;
                                      controller.serviceResult.refresh();
                                      controller.packageResult.refresh();
                                    },
                                  );
                                }),
                  ),
                  SizedBox(height: Get.height * .2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
