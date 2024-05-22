import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/data.dart';

class AddVehicleController extends GetxController {
  var title = 'Select Vehicle'.obs;
  var file = File('').obs;
  var pageIndex = 0.obs;
  var progress = 0.3.obs;
  var brandResult = BrandResult(brandList: [Brand()]).obs;
  var carModelResult = CarModelResult().obs;
  var carVariantResult = VariantResult().obs;
  var vehicleList = <Vehicle>[].obs;
  // var colorList = <VehicleColor>[].obs;
  // var yearList = <VehicleYear>[].obs;

  var filterBrands = <Brand>[].obs;
  var carModelList = <CarModel>[].obs;
  var variantList = <Variant>[].obs;

  var selectedColor = const Color(0xff443a49).obs;
  var selectedCarModel = CarModel().obs;
  var selectedVariant = Variant().obs;
  var selectedVehicle = Vehicle().obs;
  TextEditingController carModelController = TextEditingController();
  TextEditingController variantController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController plateCodeController = TextEditingController();
  TextEditingController plateNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    getDetails();
  }

  getDetails() {
    getbrands();
    // getColors();
    // getYears();
  }

  void search({required String key}) {
    filterBrands.value = brandResult.value.brandList
        .where((element) =>
            element.title.toLowerCase().contains(key.toLowerCase()))
        .toList();
    filterBrands.refresh();
  }

  getbrands() async {
    brandResult.value = await BrandProvider().getBrands();
    filterBrands.value = brandResult.value.brandList;
    
    brandResult.refresh();
    filterBrands.refresh();
  }

  getModels({String? brandId}) async {
    carModelResult.value =
        await CarModelProvider().getCarModels(brandId: brandId);
    carModelList.value = carModelResult.value.modelList;
    carModelResult.refresh();
    carModelList.refresh();
  }

  getVariants({String? modelId}) async {
    carVariantResult.value =
        await VariantProvider().getCarVariants(modelId: modelId);
    variantList.value = carVariantResult.value.variantList;
    carVariantResult.refresh();
    variantList.refresh();
  }

  pickImage(ImageSource sourse) async {
    file.value = (await FileProvider().pickImage(imageSource: sourse))!;

    print('file picked ${file.value.path.split('/').last}');

    // file.value = (await FileProvider().cropImage(image))!;
  }

  Future<String> imageUpload() async {
    if (file.value.path.isNotEmpty) {
      var result = await FileProvider().uploadSingleFile(file: file.value);
      if (result['status'] == 'success') {
        return result['data'][0];
      }
    }
    return selectedVehicle.value.image ?? '';
  }

  void addVehicle() async {
    String imagePath = await imageUpload();
    selectedVehicle.value.image = imagePath;
    selectedVehicle.value.plateCode = plateCodeController.text;
    selectedVehicle.value.plateNumber = plateNumberController.text;
    selectedVehicle.value.city = cityController.text;
    var result =
        await VehicleProvider().addVehicle(vehicle: selectedVehicle.value);
    if (result.status == 'success') {
      Get.back(result: true);
    } else {
      Get.snackbar('Error', result.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: textDark20,
          colorText: textDark80);
    }
  }

  // getColors() async {
  //   colorList.value = (await ColorProvider().getDummyData()).colorList!;
  //   colorList.refresh();
  // }

  // getYears() async {
  //   yearList.value = (await YearProvider().getDummyData()).yearList!;
  //   yearList.refresh();
  // }
}
