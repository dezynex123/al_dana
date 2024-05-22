import 'package:al_dana/app/modules/rewards/provider/reward_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../data/data.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class ProfileView extends GetView<HomeController> {
  ProfileView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKeyProfile = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final rewardProvider = Provider.of<RewardProvider>(context);
    return SingleChildScrollView(
      child: Form(
        key: formKeyProfile,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Obx(
          () => Column(
            children: [
              InkWell(
                customBorder: const CircleBorder(),
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
                    ClipOval(
                      child: SizedBox.fromSize(
                          size: const Size.fromRadius(40.0),
                          child: controller.file.value.path.isNotEmpty
                              ? Image.file(
                                  controller.file.value,
                                  fit: BoxFit.cover,
                                )
                              : controller.currentUser.value.image.isNotEmpty
                                  ? Image.network(
                                      '$domainName${controller.currentUser.value.image}',
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        "assets/images/img_avatar_1.png",
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Image.asset(
                                      "assets/images/img_avatar_1.png",
                                      fit: BoxFit.cover,
                                    )),
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: Get.width * .3),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                        color: bgColor29,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Text('${controller.vehicleList.length}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: tsPoppins(
                                size: 24,
                                weight: FontWeight.w600,
                                color: white)),
                        Text('Total Cars',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: tsPoppins(
                                weight: FontWeight.w400, color: white)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: Get.width * .3),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                        color: bgColor30,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Text(
                            '${controller.bookingResult.value.bookingList!.length}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: tsPoppins(
                                size: 24,
                                weight: FontWeight.w600,
                                color: white)),
                        Text('Total Booking',
                            maxLines: 1,
                            style: tsPoppins(
                                weight: FontWeight.w400, color: white)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: Get.width * .3),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                        color: bgColor31,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        // Text('11618',
                        //     maxLines: 1,
                        //     overflow: TextOverflow.ellipsis,
                        //     textAlign: TextAlign.center,
                        //     style: tsPoppins(
                        //         size: 24,
                        //         weight: FontWeight.w600,
                        //         color: white)),
                        if (rewardProvider.isLoading)
                          const CircularProgressIndicator(
                            color: white,
                          ),
                        if (rewardProvider.hasError)
                          Text('0',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: tsPoppins(
                                  size: 24,
                                  weight: FontWeight.w600,
                                  color: white)),
                        if (!rewardProvider.isLoading &&
                            !rewardProvider.hasError)
                          Text(
                              rewardProvider.reward?.data?.rewardPoint
                                      .toString() ??
                                  '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: tsPoppins(
                                  size: 24,
                                  weight: FontWeight.w600,
                                  color: white)),
                        Text('Total Points',
                            maxLines: 1,
                            style: tsPoppins(
                                weight: FontWeight.w400, color: white)),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
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
                          size: 14, weight: FontWeight.w500, color: textDark80),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '*Required';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        controller.isProfileEdited.value = true;
                      },
                      decoration:
                          InputFormDecoration.underLinedInputTextDecoration(
                              labelText: 'Name',
                              labelStyle: tsPoppins(
                                  weight: FontWeight.w400,
                                  height: 3,
                                  size: 11,
                                  color: textDark40),
                              borderSide: const BorderSide(color: textDark20)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.phoneController,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.name,
                      autocorrect: false,
                      enabled: false,
                      onChanged: (value) {
                        controller.isProfileEdited.value = true;
                      },
                      style: tsPoppins(
                          size: 14, weight: FontWeight.w500, color: textDark80),
                      decoration:
                          InputFormDecoration.underLinedInputTextDecoration(
                              labelText: 'Mobile Number',
                              labelStyle: tsPoppins(
                                  weight: FontWeight.w400,
                                  height: 3,
                                  size: 11,
                                  color: textDark40),
                              borderSide: const BorderSide(color: textDark20)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      onChanged: (value) {
                        controller.isProfileEdited.value = true;
                      },
                      style: tsPoppins(
                          size: 14, weight: FontWeight.w500, color: textDark80),
                      decoration:
                          InputFormDecoration.underLinedInputTextDecoration(
                              labelText: 'Email id',
                              labelStyle: tsPoppins(
                                  weight: FontWeight.w400,
                                  height: 3,
                                  size: 11,
                                  color: textDark40),
                              borderSide: const BorderSide(color: textDark20)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Address   ',
                              textAlign: TextAlign.center,
                              style: tsPoppins(
                                  weight: FontWeight.w400,
                                  height: 3,
                                  size: 11,
                                  color: textDark40)),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.ADDRESS_MAP, arguments: [
                                AddressPageMode.addAndReturn,
                                false
                              ])!
                                  .then((value) => value
                                      ? controller.getUserProfile()
                                      : null);
                            },
                            child: const Icon(
                              Icons.add_circle_outline_sharp,
                              color: primary,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              controller.currentUser.value.addressList.length,
                              (i) => Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(right: 15),
                                    constraints: BoxConstraints(
                                        maxWidth: Get.width * .5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 1, color: textDark10)),
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                controller.currentUser.value
                                                    .addressList[i].addressType,
                                                style: tsPoppins(
                                                    color: textDark80,
                                                    weight: FontWeight.w600)),
                                            Text(
                                                controller.currentUser.value
                                                    .addressList[i].location,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: tsPoppins(
                                                    color: textDark40)),
                                          ],
                                        ),
                                        Positioned(
                                            right: 0,
                                            top: 0,
                                            child: InkWell(
                                              onTap: () {
                                                Get.toNamed(Routes.ADDRESS_MAP,
                                                        arguments: [
                                                      AddressPageMode
                                                          .addAndReturn,
                                                      true,
                                                      controller.currentUser
                                                          .value.addressList[i]
                                                    ])!
                                                    .then((value) => value
                                                        ? controller
                                                            .getUserProfile()
                                                        : null);
                                              },
                                              child: const Icon(
                                                Icons.edit,
                                                color: textDark80,
                                                size: 15,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ))),
                    ),
                    // ListView.builder(
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 5,
                    //     itemBuilder: (con, i) {
                    //       return Container(
                    //         padding: const EdgeInsets.all(10),
                    //         margin: const EdgeInsets.only(right: 15),
                    //         constraints: BoxConstraints(maxWidth: Get.width * .5),
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(5),
                    //             border: Border.all(width: 1, color: textDark10)),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             Text("Home", style: tsPoppins()),
                    //             Text(
                    //                 'controller.currentUser.value.addressList[i].location fdfdfdfdfdfdfdfdfdfdfdfdfdf',
                    //                 style: tsPoppins()),
                    //           ],
                    //         ),
                    //       );
                    //     }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              if (controller.isProfileEdited.value)
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator(
                            strokeWidth: 3,
                            color: white,
                            backgroundColor: primary,
                          )
                        : ElevatedButton(
                            onPressed: () {
                              if (formKeyProfile.currentState!.validate()) {
                                controller.updateProfile();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                minimumSize: Size(Get.width, 50)),
                            child: Text(
                              'Update',
                              style: tsPoppins(
                                  size: 16,
                                  weight: FontWeight.w600,
                                  color: white),
                            ),
                          ),
                  ),
                ),
              SizedBox(
                height: Get.height * .15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
