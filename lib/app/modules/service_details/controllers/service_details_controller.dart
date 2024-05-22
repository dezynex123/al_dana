import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data.dart';
import '../../../routes/app_pages.dart';

class ServiceDetailsController extends GetxController {
  var isLoading = false.obs;
  var extraServiceResult = ServiceResult().obs;
  var booking = Booking().obs;
  var selectedCategory = Category().obs;
  var isSpareInclude = false.obs;
  RxList<SpareCategory> spareCategoryList = <SpareCategory>[].obs;
  Rx<Spare> selectedSpare = Spare().obs;
  @override
  void onInit() {
    super.onInit();
    booking.value = Get.arguments;
    deduplicateServices();
    getDetails();
  }

  void getDetails() async {
    isLoading(true);
    selectedCategory.value = Common().selectedCategory;
    await getExtraServices();
    await checkSpare();
    isLoading(false);
  }

  getExtraServices() async {
    extraServiceResult.value = await ServiceProvider().getExtraServices();
    extraServiceResult.refresh();
  }

  checkSpare() async {
    print('booking service${booking.value.services!.length}');
    for (int i = 0; i < booking.value.services!.length; i++) {
      if (booking.value.services![i].spareCategoryId.isNotEmpty) {
        booking.value.services![i].spareCategory =
            await getSpareCategory(booking.value.services![i].spareCategoryId);
        spareCategoryList.add(booking.value.services![i].spareCategory);
        isSpareInclude(true);
      }
    }
  }

  checkSpareExtraService(Service service) async {
    isLoading(true);
    if (service.spareCategoryId.isNotEmpty) {
      log('if con');

      spareCategoryList.clear();
      service.spareCategory = await getSpareCategory(service.spareCategoryId);
      spareCategoryList.add(service.spareCategory);
      isSpareInclude(true);
      // for (int i = 0; i <= spareCategoryList.length - 1; i++) {
      //   for (int j = 0; j <= spareCategoryList[i].spareList!.length - 1; j++) {
      //     booking.value.price = booking.value.price +
      //         spareCategoryList[i].spareList![j].price!.toDouble();
      //   }
      // }
    } else {
      log('else cond');
    }
    isLoading(false);
  }

  Future<SpareCategory> getSpareCategory(String spareCategoryId) async {
    var spareResult = await SpareCategoryProvider()
        .getSpareCategory(spareCategoryId: spareCategoryId);
    return spareResult.spareCategory ?? SpareCategory();
  }

  void deduplicateServices() {
    Set<String> uniqueServiceIds = <String>{};
    List<Service> deduplicatedServices = [];

    for (Service service in booking.value.services!) {
      if (uniqueServiceIds.add(service.id)) {
        deduplicatedServices.add(service);
      }
    }

    booking.value.services = deduplicatedServices;
  }

  addExtraService(Service service) {
    if (booking.value.services!.contains(service)) {
      booking.value.services!.removeWhere((e) => e.id == service.id);
      booking.value.price = booking.value.price - service.price;
      spareCategoryList.value = <SpareCategory>[];
      isSpareInclude.value = false;
      log('remove called');
    } else {
      booking.value.services!.add(service);
      booking.value.price = booking.value.price + service.price;
      checkSpareExtraService(service);
    }

    booking.refresh();
    extraServiceResult.refresh();
  }

  void onNextClick(BuildContext context) async {
    log('Called');
    if (isSpareInclude.value) {
      log('Spare incl');
      spareSelectionBottomSheet(
          context: context,
          spareCategoryList: spareCategoryList,
          selectedSpare: selectedSpare,
          onAutoSelectChange: (bool) {
            booking.value.autoSpareSelect = true;
          },
          onSpareSelected: (Spare? spare) {
            List<Spare> sparesToRemove = [];
            for (Spare inSpare in booking.value.spares!) {
              if (inSpare.categoryId == spare!.categoryId) {
                // booking.value.spares!.remove(inSpare);
                sparesToRemove.add(inSpare);
              }
            }
            booking.value.autoSpareSelect = false;
            // booking.value.spares!.add(spare!);
            for (Spare spareToRemove in sparesToRemove) {
              booking.value.spares!.remove(spareToRemove);
            }
            if (spare != null) {
              booking.value.spares!.add(spare);
            }
          },
          isAutoSelect: true.obs,
          onSubmit: () {
            if (selectedSpare.value.name != '' ||
                selectedSpare.value.name!.isNotEmpty) {
              log('1');
              log(selectedSpare.value.name ?? '');
              log('1');
              nextPage();
            }
          });
    } else {
      if (selectedSpare.value.name != '' ||
          selectedSpare.value.name!.isNotEmpty) {
        log('2');
        log(selectedSpare.value.name ?? '');
        log('2');
        nextPage();
      }
    }
  }

  nextPage() {
    var selectedMode = Common().selectedMode;
    if (selectedMode.isNeedAddress) {
      Get.toNamed(Routes.ADDRESS_MAP,
          arguments: [AddressPageMode.addAndContinue, false, booking.value]);
    } else {
      Get.toNamed(Routes.ADD_BOOKING, arguments: booking.value);
    }
  }
}
