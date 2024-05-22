import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/data.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKeyProfile = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor1,
        appBar: AppBar(
          backgroundColor: primary,
          centerTitle: true,
          leading: const GoBack(),
          title: Text(
            'Profile',
            style: tsPoppins(size: 18, weight: FontWeight.w600, color: white),
          ),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Form(
            key: formKeyProfile,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    chooseImagePickerSource(
                        title: 'Profile photo',
                        onGalleryTap: () {
                          Get.back();
                          controller.pickImage(ImageSource.gallery);
                        },
                        onCameraTap: () {
                          Get.back();
                          controller.pickImage(ImageSource.camera);
                        });
                  },
                  child: Stack(
                    children: [
                      Obx(
                        () => ClipOval(
                          child: SizedBox.fromSize(
                              size: const Size.fromRadius(40.0),
                              child: controller.file.value.path.isNotEmpty
                                  ? Image.file(
                                      controller.file.value,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      controller.currentUser.value.image,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        "assets/images/img_avatar_1.png",
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: white),
                            child: SvgPicture.asset(
                              "assets/icons/ic_edit_pro.svg",
                              width: 10,
                              height: 10,
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  controller.currentUser.value.name,
                  style: tsPoppins(size: 14, color: textDark80),
                ),
                Text(
                  controller.currentUser.value.email,
                  style: tsPoppins(color: textDark40, weight: FontWeight.w400),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       constraints: BoxConstraints(maxWidth: Get.width * .3),
                //       padding: const EdgeInsets.symmetric(
                //           vertical: 20, horizontal: 15),
                //       decoration: BoxDecoration(
                //           color: bgColor29,
                //           borderRadius: BorderRadius.circular(8)),
                //       child: Column(
                //         children: [
                //           Text('2',
                //               maxLines: 1,
                //               overflow: TextOverflow.ellipsis,
                //               textAlign: TextAlign.center,
                //               style: tsPoppins(
                //                   size: 24,
                //                   weight: FontWeight.w600,
                //                   color: white)),
                //           Text('Total Cars',
                //               maxLines: 1,
                //               overflow: TextOverflow.ellipsis,
                //               textAlign: TextAlign.center,
                //               style: tsPoppins(
                //                   weight: FontWeight.w400, color: white)),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     Container(
                //       constraints: BoxConstraints(maxWidth: Get.width * .3),
                //       padding: const EdgeInsets.symmetric(
                //           vertical: 20, horizontal: 15),
                //       decoration: BoxDecoration(
                //           color: bgColor30,
                //           borderRadius: BorderRadius.circular(8)),
                //       child: Column(
                //         children: [
                //           Text('116',
                //               maxLines: 1,
                //               overflow: TextOverflow.ellipsis,
                //               textAlign: TextAlign.center,
                //               style: tsPoppins(
                //                   size: 24,
                //                   weight: FontWeight.w600,
                //                   color: white)),
                //           Text('Total Services',
                //               maxLines: 1,
                //               style: tsPoppins(
                //                   weight: FontWeight.w400, color: white)),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     Container(
                //       constraints: BoxConstraints(maxWidth: Get.width * .3),
                //       padding: const EdgeInsets.symmetric(
                //           vertical: 20, horizontal: 15),
                //       decoration: BoxDecoration(
                //           color: bgColor31,
                //           borderRadius: BorderRadius.circular(8)),
                //       child: Column(
                //         children: [
                //           Text('11618',
                //               maxLines: 1,
                //               overflow: TextOverflow.ellipsis,
                //               textAlign: TextAlign.center,
                //               style: tsPoppins(
                //                   size: 24,
                //                   weight: FontWeight.w600,
                //                   color: white)),
                //           Text('Total Points',
                //               maxLines: 1,
                //               style: tsPoppins(
                //                   weight: FontWeight.w400, color: white)),
                //         ],
                //       ),
                //     )
                //   ],
                // ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), color: white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.nameController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.name,
                        autocorrect: false,
                        style: tsPoppins(
                            size: 14,
                            weight: FontWeight.w500,
                            color: textDark80),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '*Required';
                          } else {
                            return null;
                          }
                        },
                        decoration:
                            InputFormDecoration.underLinedInputTextDecoration(
                                labelText: 'Name',
                                labelStyle: tsPoppins(
                                    weight: FontWeight.w400,
                                    height: 3,
                                    size: 11,
                                    color: textDark40),
                                borderSide:
                                    const BorderSide(color: textDark20)),
                      ),
                      SizedBox(
                        height: Get.height * .010,
                      ),
                      TextFormField(
                        controller: controller.phoneController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.name,
                        autocorrect: false,
                        enabled: false,
                        style: tsPoppins(
                            size: 14,
                            weight: FontWeight.w500,
                            color: textDark80),
                        decoration:
                            InputFormDecoration.underLinedInputTextDecoration(
                                labelText: 'Mobile Number',
                                labelStyle: tsPoppins(
                                    weight: FontWeight.w400,
                                    height: 3,
                                    size: 11,
                                    color: textDark40),
                                borderSide:
                                    const BorderSide(color: textDark20)),
                      ),
                      SizedBox(
                        height: Get.height * .015,
                      ),
                      SizedBox(
                        height: Get.height * .015,
                      ),
                      TextFormField(
                        controller: controller.emailController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        style: tsPoppins(
                            size: 14,
                            weight: FontWeight.w500,
                            color: textDark80),
                        decoration:
                            InputFormDecoration.underLinedInputTextDecoration(
                                labelText: 'Email id',
                                labelStyle: tsPoppins(
                                    weight: FontWeight.w400,
                                    height: 3,
                                    size: 11,
                                    color: textDark40),
                                borderSide:
                                    const BorderSide(color: textDark20)),
                      ),
                      SizedBox(
                        height: Get.height * .015,
                      ),

                      // TextFormField(
                      //   controller: controller.addressController,
                      //   textAlignVertical: TextAlignVertical.center,
                      //   keyboardType: TextInputType.name,
                      //   autocorrect: false,
                      //   style: tsPoppins(
                      //       size: 14,
                      //       weight: FontWeight.w500,
                      //       color: textDark80),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return '*Required';
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      //   decoration:
                      //       InputFormDecoration.underLinedInputTextDecoration(
                      //           labelText: 'Address',
                      //           labelStyle: tsPoppins(
                      //               weight: FontWeight.w400,
                      //               height: 3,
                      //               size: 11,
                      //               color: textDark40),
                      //           borderSide:
                      //               const BorderSide(color: textDark20)),
                      // ),
                      // SizedBox(
                      //   height: Get.height * .015,
                      // ),
                      // Container(
                      //   alignment: Alignment.center,
                      //   child: Obx(
                      //     () => controller.isLoading.value
                      //         ? const CircularProgressIndicator(
                      //             strokeWidth: 3,
                      //             color: white,
                      //             backgroundColor: primary,
                      //           )
                      //         : ElevatedButton(
                      //             onPressed: () {
                      //               if (formKeyProfile.currentState!
                      //                   .validate()) {
                      //                 controller.updateProfile();
                      //               }
                      //             },
                      //             style: ElevatedButton.styleFrom(
                      //                 primary: primary,
                      //                 shape: RoundedRectangleBorder(
                      //                     borderRadius:
                      //                         BorderRadius.circular(10)),
                      //                 minimumSize: Size(Get.width, 50)),
                      //             child: Text(
                      //               'Update',
                      //               style: tsPoppins(
                      //                   size: 16,
                      //                   weight: FontWeight.w600,
                      //                   color: white),
                      //             )),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
