import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart';
import '../../../data/providers/vat_provider.dart';
import '../controllers/service_details_controller.dart';

class ServiceDetailsView extends GetView<ServiceDetailsController> {
  const ServiceDetailsView({Key? key}) : super(key: key);
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
        title: Text(
          controller.selectedCategory.value.title,
          style: tsPoppins(
            size: 18,
            weight: FontWeight.w600,
            color: white,
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
                      Text(controller.booking.value.branch!.name,
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
                      Text(controller.booking.value.mode!.title,
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
                                controller.booking.value.price
                                    .toStringAsFixed(2),
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
                        controller.onNextClick(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: greenAppTheme,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                      child: Text(
                        '    Next   ',
                        style: tsPoppins(
                            color: white, size: 14, weight: FontWeight.w400),
                      )),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        VehicleTile(vehicle: controller.booking.value.vehicle!),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Add Extra Services',
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
                    () => controller
                            .extraServiceResult.value.serviceList.isEmpty
                        ? const Center(
                            child: Text(
                              'Sorry, No extra services available.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  MediaQuery.of(context).size.width > 600
                                      ? 3
                                      : 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 1 / 1,
                            ),
                            itemCount: controller
                                .extraServiceResult.value.serviceList.length,
                            itemBuilder: (con, i) {
                              return ServiceTile2(
                                onTap: () {
                                  controller.addExtraService(controller
                                      .extraServiceResult.value.serviceList[i]);
                                },
                                service: controller
                                    .extraServiceResult.value.serviceList[i],
                                isSelected: (controller.booking.value.services!
                                    .contains(controller.extraServiceResult
                                        .value.serviceList[i])),
                                onChanged: (bool? c) {
                                  controller.addExtraService(controller
                                      .extraServiceResult.value.serviceList[i]);
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
