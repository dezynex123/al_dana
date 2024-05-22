import 'dart:developer';

import 'package:al_dana/app/data/data.dart';
import 'package:al_dana/app/modules/auth/controllers/auth_controller.dart';
import 'package:al_dana/location_permission_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:location/location.dart';

import 'package:permission_handler/permission_handler.dart';

class LoginView extends GetView<AuthController> {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKeyLogIn = GlobalKey<FormState>();
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
                height: Get.height * .03,
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
              SizedBox(height: Get.height * .05),
              Form(
                key: formKeyLogIn,
                child: SizedBox(
                  width: Get.width * 0.7,
                  child: Column(
                    children: [
                      IntlPhoneField(
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter Phone number';
                          }
                          return null;
                        },
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
                              color: textDark60,
                              size: 14,
                              weight: FontWeight.w400),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          hintText: 'Enter your number',
                          hintStyle: tsPoppins(
                              color: textDark40,
                              size: 14,
                              weight: FontWeight.w400),
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
                      Obx(
                        () => TextFormField(
                          keyboardType: TextInputType.number,
                          obscureText: controller.hideLoginPassword.value,
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            iconColor: textDark40,
                            counterStyle: tsPoppins(
                                color: textDark60,
                                size: 14,
                                weight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            hintText: 'Enter your password',
                            hintStyle: tsPoppins(
                                color: textDark40,
                                size: 14,
                                weight: FontWeight.w400),
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
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.hideLoginPassword.value =
                                    !controller.hideLoginPassword.value;
                              },
                              icon: controller.hideLoginPassword.value == false
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * .05),
              Obx(
                () => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : FractionallySizedBox(
                        widthFactor: 0.7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenAppTheme,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () async {
                            // Location location = Location();
                            // bool serviceEnabled;
                            // PermissionStatus permissionGranted;

                            // serviceEnabled = await location.serviceEnabled();
                            // if (!serviceEnabled) {
                            //   log('Service not enabled');
                            //   serviceEnabled = await location.requestService();
                            //   if (!serviceEnabled) {
                            //     return;
                            //   }
                            // }

                            // permissionGranted = await location.hasPermission();
                            // if (permissionGranted == PermissionStatus.denied) {
                            //   log('Permission denied');
                            //   permissionGranted =
                            //       await location.requestPermission();
                            //   if (permissionGranted !=
                            //       PermissionStatus.granted) {
                            //     log('Permission not granted');
                            //     return;
                            //   }
                            // }
                            // log('Login Sucess');
                            if (formKeyLogIn.currentState!.validate()) {
                              // var status = await Permission.location.status;
                              // if (PermissionStatus.granted == status) {
                                controller.login();
                              // } else {
                              //   Get.to(const LocationPermissionScreen());
                              // }
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
              TextButton(
                style: TextButton.styleFrom(foregroundColor: greenAppTheme),
                onPressed: () {
                  controller.authView.value = AuthStatus.signup;
                },
                child: const Text('New user? Create one'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
