import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

import '../data.dart';

openMapsSheet(context, String title) async {
  try {
    final coords = Coords(9.8959, 76.7184);
    final availableMaps = await MapLauncher.installedMaps;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Wrap(
              children: <Widget>[
                for (var map in availableMaps)
                  ListTile(
                    onTap: () => map.showDirections(
                      destination: coords,
                    ),
                    title: Text(map.mapName),
                    leading: SvgPicture.asset(
                      map.icon,
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  } catch (e) {
    print(e);
  }
}

//if isSingleSelection true must provide selectedVariant else must provide selectedVariantList otherwise it will crash
modelSelectionBottomSheet(
    {required BuildContext context,
    required RxList<CarModel> carModelList,
    RxList<CarModel>? selectedCarModelList,
    Rx<CarModel>? selectedCarModel,
    required Function(CarModel) onCarModelSelected,
    required bool isSingleSelection}) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0), topRight: Radius.circular(22.0))),
      context: context,
      builder: (builder) {
        return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select CarModel',
                        style: tsPoppins(
                            size: 14,
                            weight: FontWeight.w600,
                            color: textDark80),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/icons/ic_incorrect_ans.svg",
                            width: 10,
                            height: 10,
                            color: textDark80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: textDark20,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: carModelList.value.length,
                        itemBuilder: (con, i) {
                          return InkWell(
                            onTap: () {
                              onCarModelSelected.call(carModelList.value[i]);
                              if (isSingleSelection) {
                                Get.back();
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Obx(
                                      () => Theme(
                                        data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: textColor01,
                                        ),
                                        child: Radio(
                                            value: isSingleSelection
                                                ? selectedCarModel!.value ==
                                                    carModelList[i]
                                                : selectedCarModelList!.value
                                                    .contains(
                                                        carModelList.value[i]),
                                            groupValue: true,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => greenAppTheme),
                                            toggleable: true,
                                            onChanged: (v) {
                                              onCarModelSelected
                                                  .call(carModelList.value[i]);
                                              if (isSingleSelection) {
                                                Get.back();
                                              }
                                            }),
                                      ),
                                    ),
                                    Text(
                                      carModelList.value[i].name,
                                      style: tsPoppins(
                                          size: 14,
                                          weight: FontWeight.w400,
                                          color: primary),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: textDark20,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.020,
                )
              ],
            ));
      });
}

//if isSingleSelection true must provide selectedVariant else must provide selectedVariantList otherwise it will crash
variantSelectionBottomSheet(
    {required BuildContext context,
    required RxList<Variant> variantList,
    RxList<Variant>? selectedVariantList,
    Rx<Variant>? selectedVariant,
    required Function(Variant) onVariantSelected,
    required bool isSingleSelection}) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0), topRight: Radius.circular(22.0))),
      context: context,
      builder: (builder) {
        return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Variant',
                        style: tsPoppins(
                            size: 14,
                            weight: FontWeight.w600,
                            color: textDark80),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/icons/ic_incorrect_ans.svg",
                            width: 10,
                            height: 10,
                            color: textDark80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: textDark20,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: variantList.value.length,
                        itemBuilder: (con, i) {
                          return InkWell(
                            onTap: () {
                              onVariantSelected.call(variantList.value[i]);
                              if (isSingleSelection) {
                                Get.back();
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Obx(
                                      () => Theme(
                                        data: Theme.of(context).copyWith(
                                          unselectedWidgetColor: textColor01,
                                        ),
                                        child: Radio(
                                            value: isSingleSelection
                                                ? selectedVariant!.value ==
                                                    variantList[i]
                                                : selectedVariantList!.value
                                                    .contains(
                                                        variantList.value[i]),
                                            groupValue: true,
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => greenAppTheme),
                                            toggleable: true,
                                            onChanged: (v) {
                                              onVariantSelected
                                                  .call(variantList.value[i]);
                                              if (isSingleSelection) {
                                                Get.back();
                                              }
                                            }),
                                      ),
                                    ),
                                    Text(
                                      variantList.value[i].name,
                                      style: tsPoppins(
                                          size: 14,
                                          weight: FontWeight.w400,
                                          color: primary),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: textDark20,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.020,
                )
              ],
            ));
      });
}

modeSelectionBottomSheet(
    {required BuildContext context,
    required RxList<ServiceMode> modeList,
    Rx<ServiceMode>? selectedMode,
    RxList<ServiceMode>? selectedModeList,
    required Function(ServiceMode) onModeSelected,
    required VoidCallback? onSubmit,
    bool isMultiSelect = false}) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0), topRight: Radius.circular(22.0))),
      context: context,
      builder: (builder) {
        return Container(
            decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.0),
                    topRight: Radius.circular(22.0))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "What's your preferred mode?",
                        style: tsPoppins(
                            size: 14,
                            weight: FontWeight.w600,
                            color: textDark80),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/icons/ic_incorrect_ans.svg",
                            width: 10,
                            height: 10,
                            color: textDark80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: textDark20,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: modeList.length,
                        itemBuilder: (con, i) {
                          print('mode ${modeList[i].title}');
                          return ServiceModeTile(
                              onTap: () {
                                onModeSelected.call(modeList[i]);
                                modeList.refresh();
                              },
                              onChanged: (value) {
                                onModeSelected.call(modeList[i]);
                                modeList.refresh();
                              },
                              isSelect: isMultiSelect
                                  ? selectedModeList!.contains(modeList[i])
                                  : selectedMode!.value == modeList[i],
                              mode: modeList[i]);
                        }),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                      onPressed: onSubmit,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: greenAppTheme,
                          minimumSize: Size(Get.width, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        'Next',
                        style: tsPoppins(
                            weight: FontWeight.w600, size: 16, color: white),
                      )),
                ),
                SizedBox(
                  height: Get.height * 0.020,
                ),
              ],
            ));
      });
}

vehicleSelectionBottomSheet({
  required BuildContext context,
  required RxList<Vehicle> vehicleList,
  required Rx<Vehicle> selectedVehicle,
  required Function(Vehicle) onVehicleSelected,
}) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0), topRight: Radius.circular(22.0))),
      context: context,
      builder: (builder) {
        return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Which vechicle you want to service?",
                        style: tsPoppins(
                            size: 14,
                            weight: FontWeight.w600,
                            color: textDark80),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "assets/icons/ic_incorrect_ans.svg",
                            width: 10,
                            height: 10,
                            color: textDark80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: textDark20,
                ),
                vehicleList.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            'No Vehicles added\nPlease add your Vechicle',
                            style: tsPoppins(
                                size: 12,
                                weight: FontWeight.w600,
                                color: textDark80),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Expanded(
                        child: Obx(
                          () => ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: vehicleList.length,
                              itemBuilder: (con, i) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      onVehicleSelected.call(vehicleList[i]);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: white),
                                      child: Stack(
                                        children: [
                                          VehicleTile(vehicle: vehicleList[i]),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                unselectedWidgetColor:
                                                    textDark40,
                                              ),
                                              child: Obx(
                                                () => Radio(
                                                    value:
                                                        selectedVehicle.value ==
                                                            vehicleList[i],
                                                    groupValue: true,
                                                    fillColor: MaterialStateColor
                                                        .resolveWith((states) =>
                                                            greenAppTheme),
                                                    toggleable: true,
                                                    onChanged: (v) {
                                                      onVehicleSelected
                                                          .call(vehicleList[i]);
                                                    }),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                SizedBox(
                  height: Get.height * 0.020,
                ),
              ],
            ));
      });
}

spareSelectionBottomSheet({
  required BuildContext context,
  required RxList<SpareCategory> spareCategoryList,
  required Rx<Spare> selectedSpare,
  required Function(bool) onAutoSelectChange,
  required Function(Spare?) onSpareSelected,
  required RxBool isAutoSelect,
  required VoidCallback? onSubmit,
}) {
  final formKey = GlobalKey<FormState>();
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(22.0),
        topRight: Radius.circular(22.0),
      ),
    ),
    context: context,
    builder: (builder) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Spare",
                    style: tsPoppins(
                        size: 14, weight: FontWeight.w600, color: textDark80),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icons/ic_incorrect_ans.svg",
                        width: 10,
                        height: 10,
                        color: textDark80,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: textDark20,
            ),
            // Row(
            //   children: [
            //     Obx(
            //       () => Radio(
            //           value: isAutoSelect.value,
            //           groupValue: true,
            //           fillColor: MaterialStateColor.resolveWith(
            //               (states) => greenAppTheme),
            //           toggleable: true,
            //           onChanged: (v) {
            //             isAutoSelect.value = true;
            //             formKey.currentState?.reset();
            //             onAutoSelectChange.call(true);
            //           }),
            //     ),
            //     Text(
            //       'Auto Select',
            //       style: tsPoppins(
            //           weight: FontWeight.w600, size: 13, color: greenAppTheme),
            //     ),
            //   ],
            // ),
            if (spareCategoryList.isNotEmpty)
              Form(
                key: formKey,
                child: Expanded(
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 25),
                      itemCount: spareCategoryList.length,
                      itemBuilder: (context, i) {
                        var spareList = spareCategoryList[i].spareList.obs;
                        if (spareList.value == null ||
                            spareList.value!.isEmpty) {
                          return const Center(
                            child: Text('No spare available'),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: DropdownButtonFormField<Spare>(
                              isExpanded: true,
                              decoration: InputFormDecoration
                                  .outLinedInputTextDecoration(
                                      borderSide: BorderSide(
                                        color: isAutoSelect.value
                                            ? textDark40.withOpacity(.5)
                                            : primary,
                                      ),
                                      labelText:
                                          "Select ${spareCategoryList[i].name}",
                                      hintText:
                                          "Please Select ${spareCategoryList[i].name}",
                                      labelStyle: tsPoppins(
                                          color: isAutoSelect.value
                                              ? textDark40.withOpacity(.5)
                                              : primary,
                                          weight: FontWeight.w400)),
                              items: spareList.value?.map(
                                (value) {
                                  return DropdownMenuItem<Spare>(
                                    value: value,
                                    child: Text(
                                      value.name!,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: tsPoppins(
                                          color: textDark80, size: 14),
                                    ),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                isAutoSelect.value = false;
                                onSpareSelected.call(value);
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            SizedBox(height: Get.height * 0.020),
            Obx(
              () => Visibility(
                visible: isAutoSelect.value,
                child: TextButton(
                  onPressed: isAutoSelect.value ? onSubmit : null,
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: greenAppTheme, fontSize: 16),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Obx(
                () => ElevatedButton(
                  onPressed: isAutoSelect.value ? null : onSubmit,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: greenAppTheme,
                      minimumSize: Size(Get.width, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Text(
                    'OK',
                    style: tsPoppins(
                        weight: FontWeight.w600, size: 16, color: white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

chooseImagePickerSource(
    {String title = 'Choose Image',
    GestureTapCallback? onGalleryTap,
    GestureTapCallback? onCameraTap}) {
  Get.bottomSheet(
    Container(
      color: white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style:
                tsPoppins(color: textDark80, size: 18, weight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              InkWell(
                onTap: onCameraTap,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: textDark40),
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.camera,
                        color: primary,
                      ),
                    ),
                    Text(
                      'Camera',
                      style: tsPoppins(color: textDark80, size: 12),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: onGalleryTap,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: textDark40),
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.photo_library_outlined,
                        color: primary,
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: tsPoppins(color: textDark80, size: 12),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  );
}
