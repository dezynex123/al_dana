import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/data.dart';

class ProfileController extends GetxController {
  var file = File('').obs;
  var currentUser = Common().currentUser.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController =
      TextEditingController(text: 'harpsjoseph@gmail.com');
  TextEditingController addressController =
      TextEditingController(text: 'Gold Palace, UAE, Baniyas Road Dubai,');
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController.text = currentUser.value.name;
    phoneController.text = currentUser.value.mobile;
    emailController.text = currentUser.value.email;
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.onClose();
  }

  pickImage(ImageSource sourse) async {
    var image = (await FileProvider().pickImage(imageSource: sourse))!;

    print('file picked ${file.value.path.split('/').last}');

    file.value = (await FileProvider().cropImage(image))!;
  }

  void updateProfile() {}
}
