import 'dart:developer';

import 'package:al_dana/app/modules/home/views/category_view.dart';
import 'package:al_dana/app/modules/reset_password/views/reset_pasasword_screen.dart';
import 'package:al_dana/app/modules/rewards/provider/reward_provider.dart';
import 'package:al_dana/app/modules/rewards/views/reward_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'profile_view.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: primary,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Get.offAllNamed(Routes.BRANCH);
          },
          child: Row(
            children: [
              const Icon(
                Icons.place,
                color: greenAppTheme,
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: w * 0.4,
                    child: Text(
                      Common().selectedBranch.name.capitalizeFirst.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.4,
                    child: Text(
                      Common()
                          .selectedBranch
                          .location
                          .capitalizeFirst
                          .toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        // title: Row(
        //   children: [
        //     const Icon(
        //       Icons.location_on_outlined,
        //       color: greenAppTheme,
        //     ),
        //     const SizedBox(
        //       width: 5,
        //     ),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           'Your Location',
        //           style: tsPoppins(
        //               size: 12, weight: FontWeight.w400, color: white),
        //         ),
        //         Text(
        //           'Dubai, Al Ain',
        //           style: tsPoppins(size: 10, color: white),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.notifications_none_outlined,
        //         color: white,
        //       ))
        // ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          const NavHeader(),
          // NavItem(
          //   title: "Work Manager",
          //   icon: "assets/icons/ic_nav_announcement.svg",
          //   onTap: () {
          //     Get.back();
          //     Get.toNamed(Routes.WORK);
          //   },
          // ),
          // NavItem(
          //   title: "Brand Manager",
          //   icon: "assets/icons/ic_nav_announcement.svg",
          //   onTap: () {
          //     Get.back();
          //     Get.toNamed(Routes.BRAND);
          //   },
          // ),
          // NavItem(
          //   title: "Vehicle Manager",
          //   icon: "assets/icons/ic_nav_announcement.svg",
          //   onTap: () {
          //     Get.back();
          //     Get.toNamed(Routes.VEHICLE);
          //   },
          // ),
          // NavItem(
          //   title: "Google map",
          //   icon: "assets/icons/ic_nav_announcement.svg",
          //   onTap: () {
          //     Get.back();
          //     //Get.toNamed(Routes.MAP_PAGE);
          //     openMapsSheet(context, 'Location');
          //   },
          // ),
          // NavItem(
          //   title: "My Profile",
          //   icon: "assets/icons/ic_nav_1.svg",
          //   onTap: () {
          //     Get.back();
          //     Get.toNamed(Routes.PROFILE);
          //   },
          // ),
          // NavItem(
          //   title: "Subscriptions",
          //   icon: "assets/icons/ic_nav_2.svg",
          //   onTap: () {
          //     Get.back();
          //   },
          // ),
          // NavItem(
          //   title: "My Rides",
          //   icon: "assets/icons/ic_nav_3.svg",
          //   onTap: () {
          //     Get.back();
          //   },
          // ),
          NavItem(
            title: "My Bookings",
            icon: "assets/icons/ic_nav_4.svg",
            onTap: () {
              Get.back();
              Get.toNamed(Routes.BOOKING_PAGE);
            },
          ),
          NavItem(
            title: "Change Branch",
            icon: "assets/icons/ic_nav_4.svg",
            onTap: () {
              Get.back();
              Get.offAllNamed(Routes.BRANCH);
            },
          ),
          // NavItem(
          //   title: "Manage Work",
          //   icon: "assets/icons/ic_nav_4.svg",
          //   onTap: () {
          //     Get.back();
          //     Get.toNamed(Routes.WORK);
          //   },
          // ),
          // NavItem(
          //   title: "Notifications",
          //   icon: "assets/icons/ic_nav_5.svg",
          //   onTap: () {
          //     Get.back();
          //   },
          // ),
          NavItem(
            title: 'Reset Password',
            icon: "assets/icons/ic_nav_5.svg",
            onTap: () {
              Get.back();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ResetPasswordScreen(),
              ));
            },
          ),
          NavItem(
            title: "Rewards",
            icon: "assets/icons/ic_nav_6.svg",
            onTap: () {
              Get.back();
              var common = Common();
              log(common.currentUser.id);
              Provider.of<RewardProvider>(context, listen: false)
                  .fetchReward(common.currentUser.id);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    RewaardView(customerId: common.currentUser.id),
              ));
            },
          ),
          // NavItem(
          //   title: "FAQ",
          //   icon: "assets/icons/ic_nav_7.svg",
          //   onTap: () {
          //     Get.back();
          //   },
          // ),
          // NavItem(
          //   title: "Help Center",
          //   icon: "assets/icons/ic_nav_8.svg",
          //   onTap: () {
          //     Get.back();
          //   },
          // ),
          NavItem(
            title: "Logout",
            icon: "assets/icons/ic_nav_9.svg",
            onTap: () {
              Get.back();
              controller.logout();
            },
          ),
        ],
      )),
      body: Obx(
        () => IndexedStack(
          index: controller.bottomBarIndex.value,
          children: _children,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: 'BOTTOMBAR_INDEX',
          onPressed: () {
            controller.bottomBarIndex.value = 1;
          },
          backgroundColor: primary,
          child: SvgPicture.asset('assets/icons/ic_home.svg')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: Obx(
      //   () => BottomNavigationBar(
      //     type: BottomNavigationBarType.fixed,
      //     selectedIconTheme: const IconThemeData(color: white),
      //     unselectedIconTheme: const IconThemeData(color: textDark40),
      //     selectedLabelStyle:
      //         tsPoppins(color: white, size: 10, weight: FontWeight.w600),
      //     unselectedLabelStyle: tsPoppins(color: textDark40, size: 10),
      //     selectedItemColor: white,
      //     unselectedItemColor: textDark40,
      //     elevation: 200.0,
      //     backgroundColor: primary,
      //     // this will be set when a new tab is tapped
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: SvgPicture.asset(
      //             "assets/icons/ic_bottom_bar_1.svg",
      //             color:
      //                 controller.bottomBarIndex.value == 0 ? white : textDark40,
      //           ),
      //           label: 'Students'),
      //       BottomNavigationBarItem(
      //           icon: SvgPicture.asset(
      //             "assets/icons/ic_bottom_bar_2.svg",
      //             color:
      //                 controller.bottomBarIndex.value == 1 ? white : textDark40,
      //           ),
      //           label: 'Teachers'),
      //       BottomNavigationBarItem(icon: Container(), label: ''),
      //       BottomNavigationBarItem(
      //           icon: SvgPicture.asset(
      //             "assets/icons/ic_bottom_bar_3.svg",
      //             color:
      //                 controller.bottomBarIndex.value == 3 ? white : textDark40,
      //           ),
      //           label: 'SME'),
      //       BottomNavigationBarItem(
      //           icon: SvgPicture.asset(
      //             "assets/icons/ic_bottom_bar_4.svg",
      //             color:
      //                 controller.bottomBarIndex.value == 4 ? white : textDark40,
      //           ),
      //           label: 'Search'),
      //     ],
      //     currentIndex: controller.bottomBarIndex.value,
      //     onTap: (int index) {
      //       controller.bottomBarIndex.value = index;
      //     },
      //   ),
      // ),

      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        notchMargin: 6,
        color: white,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                icon: SvgPicture.asset(
                  'assets/icons/ic_bottom_bar_6.svg',
                  height: 18,
                  width: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Text(
                  'Home',
                  style: tsPoppins(color: primary),
                ),
              ),
              IconButton(
                  onPressed: () {
                    var common = Common();
                    log(common.currentUser.id);
                    Provider.of<RewardProvider>(context, listen: false)
                        .fetchReward(common.currentUser.id);
                    controller.bottomBarIndex.value = 2;
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/ic_bottom_bar_5.svg',
                    height: 22,
                    width: 22,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  final List<Widget> _children = [
    Container(),
    const CategoryView(),
    ProfileView(),
  ];

  final iconList = <IconData>[
    Icons.brightness_5,
    // Icons.brightness_4,
    // Icons.brightness_6,
    Icons.brightness_7,
  ];
}
