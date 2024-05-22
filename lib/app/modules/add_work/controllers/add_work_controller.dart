import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/data.dart';

class AddWorkController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var isUpdate = false.obs;
  var isLoading = false.obs;
  var thumbFile = File('').obs;

  var selectedWork = Work().obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      isUpdate.value = true;
      selectedWork.value = Get.arguments;
      setFields();
    }
  }



  void createWork() {}

  void deleteWork() {}

  void setFields() {
    titleController.text = selectedWork.value.title;
    subTitleController.text = selectedWork.value.subTitle;
    descController.text = selectedWork.value.desc;
    priceController.text = selectedWork.value.price.toString();
  }
}
