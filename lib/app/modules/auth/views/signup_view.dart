import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../data/data.dart';
import '../controllers/auth_controller.dart';

class SignUp extends GetView<AuthController> {
  final GlobalKey<FormState> formKeyOtp = GlobalKey<FormState>();

  SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white,
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * .1,
                ),
                SizedBox(
                  width: Get.width * .7,
                  child: Text(
                    'SIGN UP',
                    textAlign: TextAlign.center,
                    style: tsPoppins(
                        color: black, weight: FontWeight.w600, size: 18),
                  ),
                ),
                SizedBox(
                  width: Get.width * .7,
                  child: Text(
                    'Please enter your details to continue',
                    textAlign: TextAlign.center,
                    style: tsPoppins(
                        color: textColor02, weight: FontWeight.w600, size: 14),
                  ),
                ),
                SizedBox(height: Get.height * .05),
                Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * .14),
                        child: Form(
                            key: formKeyOtp,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.nameController,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.text,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Required Name";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: tsPoppins(
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: black),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 0),
                                    labelText: "Enter Name",
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
                                      borderSide:
                                          BorderSide(color: borderColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                //otp removed
                                IntlPhoneField(
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please enter Phone number';
                                    }
                                    return null;
                                  },
                                  controller: controller.signUpPhoneController,
                                  onTap: null,
                                  style: tsPoppins(
                                      color: black,
                                      size: 14,
                                      weight: FontWeight.w400),
                                  dropdownTextStyle: tsPoppins(
                                      color: black,
                                      size: 14,
                                      weight: FontWeight.w400),
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    hintText: 'Enter your number',
                                    hintStyle: tsPoppins(
                                        color: textDark40,
                                        size: 14,
                                        weight: FontWeight.w400),
                                    border: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: textDark20)),
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: textDark20)),
                                    errorBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    focusedErrorBorder:
                                        const UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: textDark20)),
                                    disabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: textDark20)),
                                  ),
                                  initialCountryCode: 'AE',
                                  onCountryChanged: (code) {
                                    controller.contryCode.value = code.dialCode;
                                  },
                                ),
                                TextFormField(
                                  controller: controller.emailController,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.text,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Required Email";
                                    } else if (!RegExp(
                                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                        .hasMatch(value)) {
                                      return "Please enter valid email";
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: tsPoppins(
                                      size: 14,
                                      weight: FontWeight.w400,
                                      color: black),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 0),
                                    labelText: "Enter Email",
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
                                      borderSide:
                                          BorderSide(color: borderColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Obx(
                                  () => TextFormField(
                                    obscureText:
                                        controller.hideSignUpPassword.value,
                                    controller:
                                        controller.signUpPasswordController,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.number,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Required password";
                                      } else if (value.length < 6) {
                                        return "Password should have atleast 6 digits";
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: tsPoppins(
                                        size: 14,
                                        weight: FontWeight.w400,
                                        color: black),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 0),
                                      labelText: "Enter Password",
                                      hintText: 'Min 6 digits',
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
                                        borderSide:
                                            BorderSide(color: borderColor),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.hideSignUpPassword.value =
                                              !controller
                                                  .hideSignUpPassword.value;
                                        },
                                        icon: controller
                                                    .hideSignUpPassword.value ==
                                                false
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
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Obx(
                                  () => TextFormField(
                                    obscureText:
                                        controller.hideConfirmPassword.value,
                                    controller:
                                        controller.confirmPasswordController,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.number,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Required confirm password";
                                      } else if (value.length < 6) {
                                        return "Password should have atleast 6 digits";
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: tsPoppins(
                                        size: 14,
                                        weight: FontWeight.w400,
                                        color: black),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(left: 0),
                                      labelText: "Confirm Password",
                                      hintText: 'Min 6 digits',
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
                                        borderSide:
                                            BorderSide(color: borderColor),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.hideConfirmPassword.value =
                                              !controller
                                                  .hideConfirmPassword.value;
                                        },
                                        icon: controller.hideConfirmPassword
                                                    .value ==
                                                false
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
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            )),
                      ),
                      SizedBox(height: Get.height * .02),
                    ],
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator(
                          color: white,
                        )
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
                              if (formKeyOtp.currentState!.validate()) {
                                controller.signup();
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
                      controller.authView.value = AuthStatus.login;
                    },
                    child: const Text('Back to login')),
                SizedBox(height: Get.height * .1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
