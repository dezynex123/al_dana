import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class AdminHomeView extends GetView<HomeController> {
  const AdminHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor1,
        body: DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (con, innerscroll) {
                return <Widget>[
                  SliverAppBar(
                    titleSpacing: 0.0,
                    toolbarHeight: 0.0,
                    pinned: true,
                    snap: false,
                    floating: false,
                    expandedHeight: 170,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    bottom: PreferredSize(
                        preferredSize: Size(Get.width, 60),
                        child: SizedBox(
                          width: Get.width,
                          child: TabBar(
                            isScrollable: true,
                            indicatorColor: accent60,
                            onTap: (index) {
                              controller.adminTabIndex.value = index;
                            },
                            tabs: [
                              Tab(
                                child: Text(
                                  'New',
                                  style: tsPoppins(size: 14, color: textDark80),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Approved',
                                  style: tsPoppins(size: 14, color: textDark80),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'OnGoing',
                                  style: tsPoppins(size: 14, color: textDark80),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Completed',
                                  style: tsPoppins(size: 14, color: textDark80),
                                ),
                              ),
                            ],
                          ),
                        )),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        width: Get.width,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: Get.width * .45,
                                    padding: EdgeInsets.only(
                                      top: Get.height * .03,
                                      bottom: Get.height * .03,
                                    ),
                                    decoration: BoxDecoration(
                                        color: bgColor5,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Total Booking',
                                          style:
                                              tsPoppins(color: white, size: 14),
                                        ),
                                        SizedBox(
                                          height: Get.height * .01,
                                        ),
                                        Text(
                                          '15',
                                          style:
                                              tsPoppins(color: white, size: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: Get.width * .45,
                                    padding: EdgeInsets.only(
                                      top: Get.height * .03,
                                      bottom: Get.height * .03,
                                    ),
                                    decoration: BoxDecoration(
                                        color: bgColor11,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Total Completed',
                                          style:
                                              tsPoppins(color: white, size: 14),
                                        ),
                                        SizedBox(
                                          height: Get.height * .01,
                                        ),
                                        Text(
                                          '3',
                                          style:
                                              tsPoppins(color: white, size: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Get.height * .01 + 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                  children: List.generate(
                      4,
                      (index) => Obx(
                          () => viewTabs(index, controller.bookingResult)))),
            ),
          ),
        ));
  }

  viewTabs(int index, bookingResult) {
    List bookings = <Booking>[];
    if (controller.bookingResult.value.bookingList != null &&
        controller.bookingResult.value.bookingList!.isNotEmpty) {
      switch (index) {
        case 1:
          bookings = controller.bookingResult.value.bookingList!
              .where((element) =>
                  element.approvalStatus!.toLowerCase() == 'approved')
              .toList();
          break;
        case 2:
          bookings = controller.bookingResult.value.bookingList!
              .where((element) =>
                  element.approvalStatus!.toLowerCase() == 'ongoing')
              .toList();
          break;
        case 3:
          bookings = controller.bookingResult.value.bookingList!
              .where((element) =>
                  element.approvalStatus!.toLowerCase() == 'completed')
              .toList();
          break;
        default:
          bookings = controller.bookingResult.value.bookingList!
              .where((element) =>
                  element.approvalStatus!.toLowerCase() == 'pending')
              .toList();
          break;
      }
    }
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: Get.height * .02),
        itemCount: bookings.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (con, i) {
          return BookingTile2(booking: bookings[i]);
        });
  }
}
