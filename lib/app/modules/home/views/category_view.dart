import 'dart:developer';

import 'package:al_dana/app/data/data.dart';
import 'package:al_dana/app/routes/app_pages.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class CategoryView extends GetView<HomeController> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * .25,
                    child: Obx(
                      () => controller.isLoading.value
                          ? const SizedBox()
                          : Swiper(
                              itemWidth: Get.width,
                              containerWidth: Get.width,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 15.0),
                                  child: Card(
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      elevation: 0.0,
                                      child: controller
                                                      .bannerResult
                                                      .value
                                                      .bannerList?[index]
                                                      .image !=
                                                  null ||
                                              controller
                                                  .bannerResult
                                                  .value
                                                  .bannerList![index]
                                                  .image!
                                                  .isEmpty
                                          ? Image.network(
                                              '$domainName${controller.bannerResult.value.bannerList?[index].image}',
                                              fit: BoxFit.contain,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                      'assets/images/img_banner_1.png',
                                                      fit: BoxFit.contain),
                                            )
                                          : Image.asset(
                                              'assets/images/img_banner_1.png',
                                              fit: BoxFit.contain)),
                                );
                              },
                              onTap: (index) {
                                //Constants().showMessageInScaffold(context, banners[index]);
                              },
                              onIndexChanged: (index) {
                                controller.bannerIndex.value = index;
                              },
                              itemCount: controller
                                      .bannerResult.value.bannerList?.length ??
                                  0,
                              pagination: SwiperCustomPagination(
                                builder: (context, config) {
                                  return Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Obx(() => LinearIndicator(
                                            index: controller.bannerIndex.value,
                                            length: controller.bannerResult
                                                    .value.bannerList?.length ??
                                                0,
                                            activeColor: greenAppTheme,
                                            inactiveColor: textDark20,
                                          )));
                                },
                              ),
                              autoplay: true,
                              autoplayDelay: 4000,
                              duration: 800,
                              viewportFraction: 0.85,
                              scale: 1.0,
                            ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                        color: tileColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Book a Car Wash',
                          style: tsPoppins(
                              weight: FontWeight.w600, color: textDark80),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller.vehicleController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Select your vehicle";
                                  } else {
                                    return null;
                                  }
                                },
                                onTap: () {
                                  controller.chooseVehicle(context);
                                },
                                readOnly: true,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.none,
                                style: tsPoppins(
                                    size: 14,
                                    weight: FontWeight.w400,
                                    color: textDark80),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 0),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(
                                        15), // add padding to adjust icon
                                    child: SvgPicture.asset(
                                      "assets/icons/ic_down_arrow_regular.svg",
                                      color: borderColor,
                                    ),
                                  ),
                                  labelText: "Select your vehicle",
                                  labelStyle: tsPoppins(
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: textColor02),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: borderColor,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: borderColor),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10.0, left: 18),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(Routes.ADD_VEHICLE,
                                          preventDuplicates: false)!
                                      .then((value) {
                                    log("back refresh working");
                                    controller.getDetails();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: greenAppTheme),
                                child: Text(
                                  'Add Vehicle',
                                  style: tsPoppins(color: white),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select Category',
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
                    () => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 600 ? 3 : 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1 / 1.1,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        itemCount:
                            controller.categoryResult.value.categoryList.length,
                        itemBuilder: (con, i) {
                          return CategoryTile(
                              onTap: () {
                                if (controller.selectedVehicle.value.id !=
                                        null &&
                                    controller
                                        .selectedVehicle.value.id!.isNotEmpty) {
                                  storage.write(
                                      selected_category,
                                      controller
                                          .categoryResult.value.categoryList[i]
                                          .toJson());
                                  Get.toNamed(Routes.SERVICE);
                                } else {
                                  controller.chooseVehicle(context);
                                }
                              },
                              category: controller
                                  .categoryResult.value.categoryList[i]);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
