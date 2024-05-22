import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../routes/app_pages.dart';

class SubscriptionPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // var startDateController =
  //     TextEditingController(text: outputDateFormat.format(DateTime.now()));
  // var endDateController = TextEditingController(
  //     text: outputDateFormat
  //         .format(DateTime.now().add(const Duration(days: 15))));
  late TabController tabController;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().add(const Duration(days: 15)).obs;
  var selectedTab = 0.obs;
  var totalAmount = 0.0.obs;
  var tabs = ['Monthly', 'Weekly', 'Custom'].obs;
  var subscribed = false.obs;
  var dateRangeController1 = DateRangePickerController();
  var dateRangeController2 = DateRangePickerController();
  var dateRangeController3 = DateRangePickerController();
  var dateRangeController4 = DateRangePickerController();
  var pickDateRange = PickerDateRange(
          DateTime.now(), DateTime.now().add(const Duration(days: 15)))
      .obs;
  RxList<DateTime> monthlyDateList = <DateTime>[].obs;
  RxList<DateTime> weeklyDateList = <DateTime>[].obs;
  RxList<DateTime> multiDateList = <DateTime>[].obs;
  var booking = Booking().obs;
  @override
  void onInit() {
    super.onInit();
    booking.value = Get.arguments;
    tabController = TabController(vsync: this, length: tabs.length);
    setDateRange();
    initDateList();
  }

  // void setDateRange() {}

  // void setDateList() {
  //   alternateDateList.clear();
  //   multiDateList.clear();
  //   for (DateTime i = DateTime.now();
  //       i.isBefore(endDate.value);
  //       i.add(const Duration(days: 1))) {
  //     alternateDateList.add(i);
  //   }
  // }

  void onNextClick(BuildContext context) {
    switch (selectedTab.value) {
      case 0:
        //please add minimum bookings in subscription here
        if (monthlyDateList.length < 5) {
          Get.snackbar('Error', 'Please choose a minimum of 5 days',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: textDark20,
              colorText: textDark80);
        } else {
          booking.value.subscribedPrice = totalAmount.value;
          Get.toNamed(Routes.PAYMENT_PAGE, arguments: booking.value);
          subscribed.value = true;
        }
        break;
      case 1:
        //please add minimum bookings in subscription here
        if (weeklyDateList.length < 5) {
          Get.snackbar('Error', 'Please choose a minimum of 5 days',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: textDark20,
              colorText: textDark80);
        } else {
          booking.value.subscribedPrice = totalAmount.value;
          Get.toNamed(Routes.PAYMENT_PAGE, arguments: booking.value);
          subscribed.value = true;
        }
        break;
      case 2:
        if (multiDateList.length < 5) {
          Get.snackbar('Error', 'Please choose a minimum of 5 days',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: textDark20,
              colorText: textDark80);
        } else {
          booking.value.subscribedPrice = totalAmount.value;
          Get.toNamed(Routes.PAYMENT_PAGE, arguments: booking.value);
          subscribed.value = true;
        }
    }
  }

  setTotalAmount() {
    totalAmount.value = 0.0;
    switch (selectedTab.value) {
      case 0:
        for (DateTime date in monthlyDateList) {
          totalAmount.value += booking.value.price;
        }
        break;
      case 1:
        for (DateTime date in weeklyDateList) {
          totalAmount.value += booking.value.price;
        }
        break;
      case 2:
        for (DateTime date in multiDateList) {
          totalAmount.value += booking.value.price;
        }
        break;
    }
  }

  initDateList() {
    monthlyDateList.clear();
    weeklyDateList.clear();
    multiDateList.clear();
    int n = 0;
    for (DateTime i = startDate.value;
        (i.year == endDate.value.year);
        i = DateTime(i.year, i.month + 1, i.day)) {
      monthlyDateList.add(i);
    }
    for (DateTime i = startDate.value;
        (i.isBefore(endDate.value) || i.day == endDate.value.day);
        i = i.add(const Duration(days: 7))) {
      weeklyDateList.add(i);
    }

    setTotalAmount();
  }

  setWeeklyDateList(List<DateTime> dateList) {
    weeklyDateList.clear();
    weeklyDateList.addAll(dateList);
    print(weeklyDateList);
    setTotalAmount();
  }

  setMonthlyDateList(List<DateTime> dateList) {
    monthlyDateList.clear();
    monthlyDateList.addAll(dateList);
    print(monthlyDateList);
    setTotalAmount();
  }

  setMultipleDateList(List<DateTime> dateList) {
    multiDateList.clear();
    multiDateList.addAll(dateList);
    print(multiDateList);
    setTotalAmount();
  }

  void setDateRange() {
    pickDateRange.value = PickerDateRange(startDate.value, endDate.value);
    // dateRangeController1.refresh();
    // dateRangeController2.refresh();
    // dateRangeController3.refresh();
  }
}
