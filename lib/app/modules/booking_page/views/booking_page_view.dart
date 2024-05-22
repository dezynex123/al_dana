import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/data.dart';
import '../controllers/booking_page_controller.dart';

class BookingPageView extends GetView<BookingPageController> {
  const BookingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        leading: const GoBack(),
        title: Text(
          'My Booking',
          style: tsPoppins(size: 18, weight: FontWeight.w600, color: white),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.bookingResult.value.bookingList!.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    itemCount:
                        controller.bookingResult.value.bookingList!.length,
                    itemBuilder: (con, i) {
                      return BookingTile(
                        booking: controller.bookingResult.value.bookingList![i],
                      );
                    })
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 250,
                          child: Image.asset('assets/images/no-data.jpg'),
                        ),
                        const Text('No Bookings Available')
                      ],
                    ),
                  ),
      ),
    );
  }
}
