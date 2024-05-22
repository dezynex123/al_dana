import 'package:al_dana/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../data/data.dart';

class PhoneView extends GetView<AuthController> {
  PhoneView({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white,
      body: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * .05,
              ),
              Image.asset(
                'assets/auth/auth.png',
                height: Get.height * .3,
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              SizedBox(
                width: Get.width * .7,
                child: Text(
                  'Welcome to Aldana Station',
                  textAlign: TextAlign.center,
                  style: tsPoppins(
                      color: black, weight: FontWeight.bold, size: 20),
                ),
              ),
              SizedBox(
                  width: Get.width * .7,
                  child: Text(
                    'Please enter your phone\nnumber to verify',
                    textAlign: TextAlign.center,
                    style: tsPoppins(
                        color: lightTextGrey,
                        weight: FontWeight.w600,
                        size: 14),
                  )),
              SizedBox(height: Get.height * .05),
              Form(
                key: formKeySignIn,
                child: SizedBox(
                  width: Get.width * .7,
                  child: IntlPhoneField(
                    controller: controller.phoneController,
                    onTap: null,
                    style: tsPoppins(
                        color: black, size: 14, weight: FontWeight.w400),
                    dropdownTextStyle: tsPoppins(
                        color: black, size: 14, weight: FontWeight.w400),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    dropdownIcon: const Icon(
                      Icons.arrow_drop_down,
                      color: black,
                    ),
                    showDropdownIcon: false,
                    decoration: InputDecoration(
                      iconColor: textDark40,
                      counterStyle: tsPoppins(
                          color: textDark60, size: 14, weight: FontWeight.w400),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      hintText: 'Enter your number',
                      hintStyle: tsPoppins(
                          color: textDark40, size: 14, weight: FontWeight.w400),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: textDark20)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: textDark20)),
                      errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: textDark20)),
                      disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: textDark20)),
                    ),
                    initialCountryCode: 'AE',
                    onCountryChanged: (code) {
                      controller.contryCode.value = code.dialCode;
                    },
                  ),
                ),
              ),
              Obx(
                () => controller.isLoading.value
                    ? const CircularProgressIndicator(color: greenAppTheme)
                    // : InkWell(
                    //     // customBorder: const CircleBorder(),
                    //     onTap: () {
                    //       if (formKeySignIn.currentState!.validate()) {
                    //         controller.requestOTP();
                    //       }
                    //     },
                    //     child: Ink(
                    //       padding: const EdgeInsets.all(18),
                    //       decoration: const BoxDecoration(
                    //           shape: BoxShape.circle, color: accent),
                    //       child: const Icon(
                    //         Icons.arrow_forward_rounded,
                    //         color: primary,
                    //         size: 24,
                    //       ),
                    //     ),
                    //   ),
                    : FractionallySizedBox(
                        widthFactor: 0.7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenAppTheme,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if (formKeySignIn.currentState!.validate()) {
                              controller.requestOTP();
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Continue'),
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.lightGreen,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
