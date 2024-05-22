import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../data/data.dart';
import '../../../data/providers/vat_provider.dart';
import '../controllers/subscription_page_controller.dart';

class SubscriptionPageView extends GetView<SubscriptionPageController> {
  const SubscriptionPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String vatPercentage =
        Provider.of<VATProvider>(context).vat?.data?[0].percentage.toString() ??
            '';
    return DefaultTabController(
      length: controller.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Subscribe',
            style: tsPoppins(color: primary, size: 17, weight: FontWeight.w600),
          ),
          leading: const GoBack(),
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
                    color: textDark20,
                    borderRadius: BorderRadius.circular(100)),
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
                        Obx(
                          () => Text(controller.booking.value.mode!.title,
                              style: tsPoppins(color: textDark40)),
                        ),
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
                                  controller.totalAmount.value
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15.0, right: 15.0, top: 20.0, bottom: 14.0),
                //   child: Row(
                //     children: [
                //       const Icon(
                //         Icons.date_range_outlined,
                //         color: textDark40,
                //         size: 20,
                //       ),
                //       const SizedBox(
                //         width: 9.0,
                //       ),
                //       Text(
                //         'Select your date range',
                //         style: tsPoppins(color: textDark80),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 15.0, right: 15.0, top: 14.0, bottom: 50.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'Start Date',
                //             style: tsPoppins(color: textDark40),
                //           ),
                //           SizedBox(
                //             width: Get.width * .4,
                //             child: TextFormField(
                //                 controller: controller.startDateController,
                //                 readOnly: true,
                //                 onTap: () async {
                //                   final DateTime? picked = await showDatePicker(
                //                       context: context,
                //                       initialDate: controller.startDate.value,
                //                       firstDate: DateTime.now(),
                //                       lastDate:
                //                           DateTime(DateTime.now().year + 10));
                //                   if (picked != null &&
                //                       picked != controller.startDate.value &&
                //                       picked
                //                           .isBefore(controller.endDate.value)) {
                //                     controller.startDate.value = picked;
                //                     controller.setDateRange();
                //                     controller.setDateList();
                //                     controller.startDateController.text =
                //                         outputDateFormat
                //                             .format(controller.startDate.value);
                //                   }
                //                 },
                //                 decoration: InputFormDecoration
                //                     .outLinedInputTextDecoration(
                //                   prefixIcon: const Icon(
                //                     Icons.date_range_rounded,
                //                     color: textDark40,
                //                   ),
                //                   hintStyle: tsPoppins(color: textDark80),
                //                 )),
                //           ),
                //         ],
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'End Date',
                //             style: tsPoppins(color: textDark40),
                //           ),
                //           SizedBox(
                //             width: Get.width * .4,
                //             child: TextFormField(
                //                 controller: controller.endDateController,
                //                 onTap: () async {
                //                   final DateTime? picked = await showDatePicker(
                //                       context: context,
                //                       initialDate: controller.endDate.value,
                //                       firstDate: DateTime.now(),
                //                       lastDate:
                //                           DateTime(DateTime.now().year + 10));
                //                   if (picked != null &&
                //                       picked != controller.endDate.value &&
                //                       picked.isAfter(
                //                           controller.startDate.value)) {
                //                     controller.endDate.value = picked;
                //                     controller.setDateRange();
                //                     controller.setDateList();
                //                     controller.endDateController.text =
                //                         outputDateFormat
                //                             .format(controller.endDate.value);
                //                   }
                //                 },
                //                 readOnly: true,
                //                 decoration: InputFormDecoration
                //                     .outLinedInputTextDecoration(
                //                   prefixIcon: const Icon(
                //                     Icons.date_range_rounded,
                //                     color: textDark40,
                //                   ),
                //                   hintText: outputDateFormat
                //                       .format(controller.endDate.value),
                //                   hintStyle: tsPoppins(color: textDark80),
                //                 )),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),

                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, bottom: 17.0, top: 15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.date_range_outlined,
                        color: textDark40,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 9.0,
                      ),
                      Text(
                        'Select your period',
                        style: tsPoppins(color: textDark80),
                      ),
                    ],
                  ),
                ),
                DecoratedTabBar(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: textDark40.withOpacity(.5),
                        width: 1.0,
                      ),
                    ),
                  ),
                  tabBar: TabBar(
                      labelStyle: tsPoppins(
                          color: textDark80, size: 14, weight: FontWeight.w400),
                      unselectedLabelStyle: tsPoppins(
                          color: textDark80, size: 14, weight: FontWeight.w400),
                      labelColor: primary,
                      unselectedLabelColor: textDark40,
                      indicatorColor: primary,
                      indicatorSize: TabBarIndicatorSize.tab,
                      isScrollable: false,
                      onTap: (index) {
                        controller.selectedTab.value = index;
                        controller.setTotalAmount();
                      },
                      tabs: List.generate(
                          controller.tabs.length,
                          (index) => Tab(
                                text: controller.tabs[index],
                              ))),
                ),
                SizedBox(
                  height: Get.height * .4,
                  child: TabBarView(
                    children: [
                      
                      SfDateRangePicker(
                        controller: controller.dateRangeController2,
                        view: DateRangePickerView.month,
                        headerStyle: const DateRangePickerHeaderStyle(
                            textAlign: TextAlign.center),
                        initialSelectedRange: controller.pickDateRange.value,
                        initialSelectedDates: controller.monthlyDateList,
                        monthViewSettings:
                            const DateRangePickerMonthViewSettings(
                                firstDayOfWeek: 1),
                        selectionMode: DateRangePickerSelectionMode.multiple,
                        startRangeSelectionColor: primary,
                        endRangeSelectionColor: primary,
                        selectionColor: primary,
                        enablePastDates: false,
                        onSelectionChanged: (args) {
                          print(args);
                          if (args.value is List<DateTime>) {
                            controller.setMonthlyDateList(args.value);
                          }
                        },
                      ),
                      SfDateRangePicker(
                        controller: controller.dateRangeController3,
                        view: DateRangePickerView.month,
                        headerStyle: const DateRangePickerHeaderStyle(
                            textAlign: TextAlign.center),
                        initialSelectedRange: controller.pickDateRange.value,
                        initialSelectedDates: controller.weeklyDateList,
                        monthViewSettings:
                            const DateRangePickerMonthViewSettings(
                                firstDayOfWeek: 1),
                        selectionMode: DateRangePickerSelectionMode.multiple,
                        startRangeSelectionColor: primary,
                        endRangeSelectionColor: primary,
                        selectionColor: primary,
                        enablePastDates: false,
                        onSelectionChanged: (args) {
                          print(args);
                          if (args.value is List<DateTime>) {
                            controller.setWeeklyDateList(args.value);
                          }
                        },
                      ),
                      SfDateRangePicker(
                        controller: controller.dateRangeController4,
                        view: DateRangePickerView.month,
                        headerStyle: const DateRangePickerHeaderStyle(
                            textAlign: TextAlign.center),
                        initialSelectedRange: controller.pickDateRange.value,
                        initialSelectedDates: controller.multiDateList,
                        enableMultiView: false,
                        showNavigationArrow: false,
                        minDate: controller.startDate.value,
                        maxDate: controller.endDate.value,
                        monthViewSettings:
                            const DateRangePickerMonthViewSettings(
                                firstDayOfWeek: 1),
                        selectionMode: DateRangePickerSelectionMode.multiple,
                        startRangeSelectionColor: primary,
                        endRangeSelectionColor: primary,
                        selectionColor: primary,
                        enablePastDates: false,
                        onSelectionChanged: (args) {
                          if (args.value is List<DateTime>) {
                            controller.setMultipleDateList(args.value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * .3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
