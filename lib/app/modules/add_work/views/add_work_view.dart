import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/data.dart';
import '../controllers/add_work_controller.dart';

class AddWorkView extends GetView<AddWorkController> {
  AddWorkView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKeyAddPdf = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
          title: Text(
            'Add Work',
            style:
                tsPoppins(size: 18, weight: FontWeight.w600, color: textDark80),
          ),
          centerTitle: true,
          leading: const GoBack(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(15)),
                  child: Form(
                    key: formKeyAddPdf,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Obx(
                      () => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: controller.titleController,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Required Title";
                              } else {
                                return null;
                              }
                            },
                            style: tsPoppins(
                                size: 14,
                                weight: FontWeight.w400,
                                color: textDark80),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 0),
                              labelText: "Enter Title",
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
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: controller.subTitleController,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Required Sub Title";
                              } else {
                                return null;
                              }
                            },
                            style: tsPoppins(
                                size: 14,
                                weight: FontWeight.w400,
                                color: textDark80),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 0),
                              labelText: "Enter Sub Title",
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
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: controller.descController,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.text,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Required Description";
                              } else {
                                return null;
                              }
                            },
                            style: tsPoppins(
                                size: 14,
                                weight: FontWeight.w400,
                                color: textDark80),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 0),
                              labelText: "Enter Description",
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
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          if (controller.isLoading.value)
                            const CircularProgressIndicator(color: primary),
                          if (!controller.isLoading.value &&
                              !controller.isUpdate.value)
                            ElevatedButton(
                                onPressed: () {
                                  if (formKeyAddPdf.currentState!.validate()) {
                                    controller.createWork();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primary,
                                    minimumSize: Size(Get.width, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                                child: Text('Create Work',
                                    style: tsPoppins(
                                        color: white,
                                        weight: FontWeight.w600,
                                        size: 15))),
                          if (!controller.isLoading.value &&
                              controller.isUpdate.value)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      myAlertDialog(
                                          title: 'Confirm',
                                          message:
                                              'Do you want to delete this work ?',
                                          onCancel: () {
                                            Get.back();
                                          },
                                          onSubmit: () {
                                            controller.deleteWork();
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: white,
                                        minimumSize: Size(Get.width * .4, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                                color: primary, width: 2))),
                                    child: Text('Delete',
                                        style: tsPoppins(
                                            color: primary,
                                            weight: FontWeight.w600,
                                            size: 15))),
                                ElevatedButton(
                                    onPressed: () {
                                      if (formKeyAddPdf.currentState!
                                          .validate()) {
                                        controller.createWork();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: primary,
                                        minimumSize: Size(Get.width * .4, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    child: Text('Update',
                                        style: tsPoppins(
                                            color: white,
                                            weight: FontWeight.w600,
                                            size: 15))),
                              ],
                            ),
                          const SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
