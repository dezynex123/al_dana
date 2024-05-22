import 'dart:developer';

import 'package:al_dana/app/modules/payment_page/views/payment_success.dart';
import 'package:al_dana/app/modules/subscription_page/controllers/subscription_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart';
import '../../../data/providers/vat_provider.dart';
import '../controllers/payment_page_controller.dart';

class PaymentPageView extends GetView<PaymentPageController> {
  const PaymentPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final subscriptionController = Get.put(SubscriptionPageController());
    String vatPercentage =
        Provider.of<VATProvider>(context).vat?.data?[0].percentage.toString() ??
            '';
    return Obx(
      () => controller.isPaymentSuccess.value
          ? const PaymentSuccessView()
          : Scaffold(
              backgroundColor: bgColor1,
              appBar: AppBar(
                backgroundColor: primary,
                centerTitle: true,
                leading: const GoBack(),
                title: Text(
                  'Payment Details',
                  style: tsPoppins(
                      size: 18, weight: FontWeight.w600, color: white),
                ),
              ),
              bottomSheet: Obx(
                () => controller.isLoading.value
                    ? Container()
                    : Container(
                        decoration: const BoxDecoration(
                            color: tileColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
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
                                  color: textDark20,
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Branch',
                                          style: tsPoppins(
                                              size: 10,
                                              weight: FontWeight.w400,
                                              color: textDark40)),
                                      Text(
                                          controller.booking.value.branch!.name,
                                          style: tsPoppins(color: textDark40)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Obx(
                                            () => Text(
                                                controller.booking.value
                                                            .subscribedPrice >
                                                        0
                                                    ? controller.booking.value
                                                        .subscribedPrice
                                                        .toStringAsFixed(2)
                                                    : (controller.booking.value
                                                                .price +
                                                            controller
                                                                .booking
                                                                .value
                                                                .extraCharge +
                                                            controller
                                                                .booking
                                                                .value
                                                                .spareAmount)
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
                                              weight: FontWeight.w400,
                                              color: textColor08)),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (controller
                                            .selectedPaymentOption.isNotEmpty) {
                                          log(controller
                                              .booking.value.subscribedPrice
                                              .toString());
                                          log('----------------');
                                          log(subscriptionController.totalAmount
                                              .toString());
                                          log('----------------');
                                          if (controller.booking.value
                                                  .subscribedPrice >
                                              0) {
                                            controller.booking.value.price =
                                                controller.booking.value
                                                    .subscribedPrice;
                                          }

                                          controller.postBooking();
                                        } else {
                                          Get.snackbar('Error',
                                              'Please select a payment mode',
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor: textDark20,
                                              colorText: textDark80);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: greenAppTheme,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6))),
                                      child: Text(
                                        '   Payment  ',
                                        style: tsPoppins(
                                            color: white,
                                            size: 14,
                                            weight: FontWeight.w400),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
              ),
              body: Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : SafeArea(
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 15),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    VehicleTile(
                                        vehicle:
                                            controller.booking.value.vehicle!),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    if (controller.booking.value
                                                .subscribedPrice <=
                                            0 &&
                                        controller
                                            .booking.value.couponCode.isEmpty)
                                      TextFormField(
                                          controller:
                                              controller.promoCodeController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Invalid Promo code";
                                            } else {
                                              return null;
                                            }
                                          },
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          style: tsPoppins(
                                              size: 14,
                                              weight: FontWeight.w400,
                                              color: textDark80),
                                          decoration: InputFormDecoration
                                              .outLinedInputTextDecoration(
                                            borderSide: const BorderSide(
                                                color: textDark20, width: 1),
                                            filled: true,
                                            fillColor: tileColor,
                                            contentPadding:
                                                const EdgeInsets.only(left: 20),
                                            suffixIcon: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  5, 5, 10, 5),
                                              child: TextButton(
                                                  onPressed: () {
                                                    controller.applyCoupon();
                                                  },
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          greenAppTheme,
                                                      maximumSize:
                                                          const Size(77, 36),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6))),
                                                  child: Text(
                                                    'Apply',
                                                    style: tsPoppins(
                                                        color: white,
                                                        size: 14,
                                                        weight:
                                                            FontWeight.w400),
                                                  )),
                                            ),
                                            labelText: "Enter promo code",
                                            labelStyle: tsPoppins(
                                                size: 14,
                                                weight: FontWeight.w400,
                                                color: textColor02),
                                          )),
                                    if (controller
                                            .booking.value.subscribedPrice <=
                                        0)
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    if (controller.booking.value
                                                .subscribedPrice <=
                                            0 &&
                                        !controller.isLoading.value &&
                                        controller.walletResult.value.wallet!
                                                .rewardPoint! >
                                            0)
                                      Container(
                                        decoration: BoxDecoration(
                                            color: tileColor,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 21, vertical: 16),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/icons/ic_redeem_point.svg'),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('Points',
                                                            style: tsPoppins(
                                                                weight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    bgColor25)),
                                                        Text(
                                                            '${controller.selectedRedeemPoints.value}',
                                                            style: tsPoppins(
                                                                weight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    bgColor27,
                                                                size: 20))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      controller.redeemPoints();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            greenAppTheme,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6))),
                                                    child: Text(
                                                      '    Redeem   ',
                                                      style: tsPoppins(
                                                          color: white,
                                                          size: 14,
                                                          weight:
                                                              FontWeight.w400),
                                                    )),
                                              ],
                                            ),
                                            Slider(
                                              activeColor: greenAppTheme,
                                              inactiveColor: greenAppTheme
                                                  .withOpacity(0.3),
                                              value: double.parse(controller
                                                  .selectedRedeemPoints.value
                                                  .toString()),
                                              max: double.parse(controller
                                                  .walletResult
                                                  .value
                                                  .wallet!
                                                  .rewardPoint
                                                  .toString()),
                                              divisions: controller.walletResult
                                                  .value.wallet!.rewardPoint,
                                              onChanged: (double value) {
                                                controller.selectedRedeemPoints
                                                    .value = value.round();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    Obx(
                                      () => Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        child: InkWell(
                                          onTap: () {
                                            controller.selectedPaymentOption
                                                    .value =
                                                controller.paymentOptions[1];
                                            controller.paymentOptions.refresh();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: tileColor,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              children: [
                                                Radio(
                                                  fillColor: MaterialStateColor
                                                      .resolveWith((states) =>
                                                          greenAppTheme),
                                                  value: controller
                                                          .selectedPaymentOption
                                                          .value ==
                                                      controller
                                                          .paymentOptions[1],
                                                  groupValue: true,
                                                  onChanged: (value) {
                                                    controller
                                                            .selectedPaymentOption
                                                            .value =
                                                        controller
                                                            .paymentOptions[1];
                                                    controller.paymentOptions
                                                        .refresh();
                                                  },
                                                ),
                                                Text(
                                                  controller.paymentOptions[1],
                                                  style: tsPoppins(
                                                      size: 14,
                                                      color: textDark80),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Obx(() => ListView.builder(
                                    //     shrinkWrap: true,
                                    //     physics:
                                    //         const NeverScrollableScrollPhysics(),
                                    //     padding: const EdgeInsets.symmetric(
                                    //         vertical: 15),
                                    //     itemCount:
                                    //         controller.paymentOptions.length,
                                    //     itemBuilder: (con, i) {
                                    //       return Container(
                                    //         margin: const EdgeInsets.only(
                                    //             bottom: 10),
                                    //         child: InkWell(
                                    //           onTap: () {
                                    //             controller.selectedPaymentOption
                                    //                     .value =
                                    //                 controller
                                    //                     .paymentOptions[i];
                                    //             controller.paymentOptions
                                    //                 .refresh();
                                    //           },
                                    //           child: Container(
                                    //             decoration: BoxDecoration(
                                    //                 color: tileColor,
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(
                                    //                         8)),
                                    //             child: Row(
                                    //               children: [
                                    //                 Radio(
                                    //                   fillColor: MaterialStateColor
                                    //                       .resolveWith(
                                    //                           (states) =>
                                    //                               greenAppTheme),
                                    //                   value: controller
                                    //                           .selectedPaymentOption
                                    //                           .value ==
                                    //                       controller
                                    //                           .paymentOptions[i],
                                    //                   groupValue: true,
                                    //                   onChanged: (value) {
                                    //                     controller
                                    //                             .selectedPaymentOption
                                    //                             .value =
                                    //                         controller
                                    //                             .paymentOptions[i];
                                    //                     controller
                                    //                         .paymentOptions
                                    //                         .refresh();
                                    //                   },
                                    //                 ),
                                    //                 Text(
                                    //                   controller
                                    //                       .paymentOptions[i],
                                    //                   style: tsPoppins(
                                    //                       size: 14,
                                    //                       color: textDark80),
                                    //                 )
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       );
                                    //     })),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('Order Summary',
                                        style: tsPoppins(
                                            color: textDark80,
                                            weight: FontWeight.w600)),
                                    Container(
                                      height: 2,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: accent60,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Obx(() => ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.only(top: 15),
                                        itemCount: controller
                                            .booking.value.packageList!.length,
                                        itemBuilder: (con, i) {
                                          return Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    controller.booking.value
                                                        .packageList![i].title!,
                                                    style: tsPoppins(
                                                        weight: FontWeight.w400,
                                                        size: 14,
                                                        color: textDark80)),
                                                Text(
                                                    'AED: ${controller.booking.value.packageList![i].price!.toStringAsFixed(2)}',
                                                    style: tsPoppins(
                                                        size: 14,
                                                        color: textDark80)),
                                              ],
                                            ),
                                            const Divider(
                                              color: textDark20,
                                              thickness: 1,
                                              height: 20,
                                            ),
                                          ]);
                                        })),
                                    Obx(() => ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        itemCount: controller
                                            .booking.value.services!.length,
                                        itemBuilder: (con, i) {
                                          return Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    controller
                                                            .booking
                                                            .value
                                                            .services?[i]
                                                            .title ??
                                                        '',
                                                    style: tsPoppins(
                                                        weight: FontWeight.w400,
                                                        size: 14,
                                                        color: textDark80)),
                                                Text(
                                                    'AED: ${controller.booking.value.services![i].price.toStringAsFixed(2)}',
                                                    style: tsPoppins(
                                                        size: 14,
                                                        color: textDark80)),
                                              ],
                                            ),
                                            const Divider(
                                              color: textDark20,
                                              thickness: 1,
                                              height: 20,
                                            ),
                                          ]);
                                        })),
                                    Obx(() => ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        itemCount: controller
                                            .booking.value.spares!.length,
                                        itemBuilder: (con, i) {
                                          return Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    controller.booking.value
                                                            .spares?[i].name ??
                                                        '',
                                                    style: tsPoppins(
                                                        weight: FontWeight.w400,
                                                        size: 14,
                                                        color: textDark80)),
                                                Text(
                                                    'AED: ${controller.booking.value.spares![i].price!.toStringAsFixed(2)}',
                                                    style: tsPoppins(
                                                        size: 14,
                                                        color: textDark80)),
                                              ],
                                            ),
                                            const Divider(
                                              color: textDark20,
                                              thickness: 1,
                                              height: 20,
                                            ),
                                          ]);
                                        })),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Delivery Charge',
                                          style: tsPoppins(
                                              weight: FontWeight.w400,
                                              size: 14,
                                              color: textDark80),
                                        ),
                                        Text(
                                          "AED: ${controller.deliveryCharge.value}",
                                          style: tsPoppins(
                                              weight: FontWeight.w400,
                                              size: 14,
                                              color: textDark80),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            controller.booking.value
                                                        .subscribedPrice >
                                                    0
                                                ? 'Total'
                                                : 'Grand Total',
                                            style: tsPoppins(
                                                weight: FontWeight.w600,
                                                size: 14,
                                                color: textDark80)),
                                        Text(
                                            'AED: ${(controller.booking.value.price + controller.booking.value.extraCharge + controller.booking.value.spareAmount).toStringAsFixed(2)}',
                                            style: tsPoppins(
                                                weight: FontWeight.w600,
                                                size: 14,
                                                color: textDark80)),
                                      ],
                                    ),
                                    if (controller
                                            .booking.value.subscribedPrice >
                                        0)
                                      const Divider(
                                        color: textDark20,
                                        thickness: 1,
                                        height: 20,
                                      ),
                                    if (controller
                                            .booking.value.subscribedPrice >
                                        0)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Grand Total',
                                              style: tsPoppins(
                                                  weight: FontWeight.w600,
                                                  size: 14,
                                                  color: textDark80)),
                                          Text(
                                              'AED: ${controller.booking.value.subscribedPrice.toStringAsFixed(2)}',
                                              style: tsPoppins(
                                                  weight: FontWeight.w600,
                                                  size: 14,
                                                  color: textDark80)),
                                        ],
                                      ),
                                    if (controller
                                            .booking.value.subscribedPrice >
                                        0)
                                      const Divider(
                                        color: textDark20,
                                        thickness: 1,
                                        height: 20,
                                      ),
                                    SizedBox(height: Get.height * .3),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
    );
  }
}
