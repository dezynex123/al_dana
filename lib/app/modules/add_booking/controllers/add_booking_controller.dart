import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/data.dart';

class AddBookingController extends GetxController {
  TextEditingController dateController =
      TextEditingController(text: outputDateFormat2.format(DateTime.now()));
  var selectedDate = DateTime.now().obs;
  var isLoading = false.obs;
  var timeSlotResult = TimeSlotResult().obs;
  // var availableTimeSlots = <String>[].obs;
  var selectedTimeSlot = TimeSlotId();
  var booking = Booking().obs;

  @override
  void onInit() {
    super.onInit();
    booking.value = Get.arguments;
    log('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    log('ADDRESS');
    log("Branch latitude ${booking.value.branch?.latitude}");
    log("Branch longitude ${booking.value.branch?.longitude}");
    log("Address latitude ${booking.value.address?.latitude}");
    log("Address longitude ${booking.value.address?.longitude}");
    log('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    // log("booking controller ${jsonEncode(Get.arguments)}");
    getDetails();
  }

  chooseDate() async {
    selectedDate.value = await pickDate(firstDate: DateTime.now());
    dateController.text = outputDateFormat.format(selectedDate.value);

    getTimeSlots(dateController.text);
    // log('date');
    // log(selectedDate.value.toString());
  }

  void getDetails() {
    calculateSparePrice();
    getTimeSlots(dateController.text);
  }

  void getTimeSlots(String date) async {
    isLoading(true);
    timeSlotResult.value = await TimeSlotProvider().getTimeSlots(date);
    timeSlotResult.refresh();
    isLoading(false);
    // if (timeSlotResult.value.timeSlotList.isNotEmpty) {
    //   setAvailableTimeSlots();
    // }
  }

  // setAvailableTimeSlots() {
  //   TimeSlot slot = timeSlotResult.value.timeSlotList.firstWhere(
  //       (element) =>
  //           element.day.toLowerCase() ==
  //           dayFormat.format(selectedDate.value).toLowerCase(),
  //       orElse: () => TimeSlot());

  //   availableTimeSlots.value = slot.slotes;
  //   availableTimeSlots.refresh();
  // }
  calculateSparePrice() {
    double spareTotal = 0.0;
    for (Spare spare in booking.value.spares!) {
      spareTotal += spare.price!;
    }
    booking.value.spareAmount = spareTotal;
  }

  onNextClick(String route) {
    if (selectedTimeSlot.sId?.isNotEmpty ?? false) {
      booking.value.date = outputDateFormat.format(selectedDate.value);
      booking.value.slot = selectedTimeSlot.sId;

      // log('Next click');
      // log(selectedTimeSlot.sId.toString());
      Get.toNamed(route, arguments: booking.value);
    } else {
      Get.snackbar('Error', 'Please choose a time slot to continue.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: textDark20,
          colorText: textDark80,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          margin: const EdgeInsets.only(bottom: 8));
    }
  }
}
