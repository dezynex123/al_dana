import 'package:al_dana/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/data.dart';

class OTPView extends GetView<AuthController> {
  OTPView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKeyOtp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * .05,
                ),
                // SvgPicture.asset(
                //   "assets/icons/ic_auth.svg",
                //   width: Get.width * .3,
                //   height: Get.height * .15,
                // ),
                Image.asset(
                  'assets/auth/otp.png',
                  height: Get.height * .3,
                ),
                SizedBox(
                  height: Get.height * .05,
                ),
                SizedBox(
                  width: Get.width * .7,
                  child: Text(
                    'OTP Verification',
                    textAlign: TextAlign.center,
                    style: tsPoppins(
                      color: black,
                      weight: FontWeight.bold,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * .7,
                  child: Text(
                    'Please enter the code that was sent to +${controller.contryCode} ${controller.phoneController.text}',
                    textAlign: TextAlign.center,
                    style: tsPoppins(color: textColor02, size: 14),
                  ),
                ),
                SizedBox(height: Get.height * .05),
                Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Form(
                        key: formKeyOtp,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              height:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              child: TextFormField(
                                focusNode: controller.otpFocus1,
                                style: tsPoppins(
                                    color: const Color(0xff133B87),
                                    size: 14,
                                    weight: FontWeight.w400),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    controller.isOTPEmpty.value = true;
                                  } else {
                                    controller.isOTPEmpty.value = false;
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.center,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true),
                                decoration: InputFormDecoration
                                    .outLinedInputTextDecoration(
                                  radius: 5,
                                  filled: true,
                                  fillColor: bgColor3,
                                  hintText: '*',
                                  hintStyle: tsPoppins(
                                      color: const Color(0xff133B87),
                                      size: 14,
                                      weight: FontWeight.w400),
                                ),
                                onChanged: (value) {
                                  controller.changeOTP(value, 0);
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context)
                                        .requestFocus(controller.otpFocus2);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                                width: Get.width * .03 > 21
                                    ? 21
                                    : Get.width * .03),
                            Container(
                              color: Colors.transparent,
                              width:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              height:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              child: TextFormField(
                                focusNode: controller.otpFocus2,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    controller.isOTPEmpty.value = true;
                                  } else {
                                    controller.isOTPEmpty.value = false;
                                  }
                                  return null;
                                },
                                decoration: InputFormDecoration
                                    .outLinedInputTextDecoration(
                                  filled: true,
                                  fillColor: bgColor3,
                                  hintText: '*',
                                  hintStyle: tsPoppins(
                                      color: const Color(0xff133B87),
                                      size: 14,
                                      weight: FontWeight.w400),
                                ),
                                style: tsPoppins(
                                    color: const Color(0xff133B87),
                                    size: 14,
                                    weight: FontWeight.w400),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true),
                                onChanged: (value) {
                                  controller.changeOTP(value, 1);
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context)
                                        .requestFocus(controller.otpFocus3);
                                  } else {
                                    FocusScope.of(context)
                                        .requestFocus(controller.otpFocus1);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                                width: Get.width * .03 > 21
                                    ? 21
                                    : Get.width * .03),
                            Container(
                              color: Colors.transparent,
                              width:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              height:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              child: TextFormField(
                                focusNode: controller.otpFocus3,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    controller.isOTPEmpty.value = true;
                                  } else {
                                    controller.isOTPEmpty.value = false;
                                  }
                                  return null;
                                },
                                decoration: InputFormDecoration
                                    .outLinedInputTextDecoration(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  filled: true,
                                  fillColor: bgColor3,
                                  hintText: '*',
                                  hintStyle: tsPoppins(
                                      color: const Color(0xff133B87),
                                      size: 14,
                                      weight: FontWeight.w400),
                                ),
                                style: tsPoppins(
                                    color: const Color(0xff133B87),
                                    size: 14,
                                    weight: FontWeight.w400),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true),
                                onChanged: (value) {
                                  controller.changeOTP(value, 2);
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context)
                                        .requestFocus(controller.otpFocus4);
                                  } else {
                                    FocusScope.of(context)
                                        .requestFocus(controller.otpFocus2);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                                width: Get.width * .03 > 21
                                    ? 21
                                    : Get.width * .03),
                            Container(
                              color: Colors.transparent,
                              width:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              height:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              child: TextFormField(
                                focusNode: controller.otpFocus4,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    controller.isOTPEmpty.value = true;
                                  } else {
                                    controller.isOTPEmpty.value = false;
                                  }
                                  return null;
                                },
                                style: tsPoppins(
                                    color: const Color(0xff133B87),
                                    size: 14,
                                    weight: FontWeight.w400),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true),
                                decoration: InputFormDecoration
                                    .outLinedInputTextDecoration(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  filled: true,
                                  fillColor: bgColor3,
                                  hintText: '*',
                                  hintStyle: tsPoppins(
                                      color: const Color(0xff133B87),
                                      size: 14,
                                      weight: FontWeight.w400),
                                ),
                                onChanged: (value) {
                                  controller.changeOTP(value, 3);
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context)
                                        .requestFocus(controller.otpFocus5);
                                  } else {
                                    FocusScope.of(context)
                                        .requestFocus(controller.otpFocus3);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                                width: Get.width * .03 > 21
                                    ? 21
                                    : Get.width * .03),
                            Container(
                              color: Colors.transparent,
                              width:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              height:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              child: TextFormField(
                                focusNode: controller.otpFocus5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    controller.isOTPEmpty.value = true;
                                  } else {
                                    controller.isOTPEmpty.value = false;
                                  }
                                  return null;
                                },
                                style: tsPoppins(
                                    color: const Color(0xff133B87),
                                    size: 14,
                                    weight: FontWeight.w400),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true),
                                decoration: InputFormDecoration
                                    .outLinedInputTextDecoration(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  filled: true,
                                  fillColor: bgColor3,
                                  hintText: '*',
                                  hintStyle: tsPoppins(
                                      color: const Color(0xff133B87),
                                      size: 14,
                                      weight: FontWeight.w400),
                                ),
                                onChanged: (value) {
                                  controller.changeOTP(value, 4);
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context)
                                        .requestFocus(controller.otpFocus6);
                                  } else {
                                    FocusScope.of(context)
                                        .requestFocus(controller.otpFocus4);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                                width: Get.width * .03 > 21
                                    ? 21
                                    : Get.width * .03),
                            Container(
                              color: Colors.transparent,
                              width:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              height:
                                  Get.width * .115 > 46 ? 46 : Get.width * .115,
                              child: TextFormField(
                                focusNode: controller.otpFocus6,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    controller.isOTPEmpty.value = true;
                                  } else {
                                    controller.isOTPEmpty.value = false;
                                  }
                                  return null;
                                },
                                style: tsPoppins(
                                    color: const Color(0xff133B87),
                                    size: 14,
                                    weight: FontWeight.w400),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                textAlign: TextAlign.center,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true),
                                decoration: InputFormDecoration
                                    .outLinedInputTextDecoration(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  filled: true,
                                  fillColor: bgColor3,
                                  hintText: '*',
                                  hintStyle: tsPoppins(
                                      color: const Color(0xff133B87),
                                      size: 14,
                                      weight: FontWeight.w400),
                                ),
                                onChanged: (value) {
                                  controller.changeOTP(value, 5);
                                  if (value.isNotEmpty) {
                                    FocusScope.of(context).unfocus();
                                  } else {
                                    FocusScope.of(context)
                                        .requestFocus(controller.otpFocus5);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height * .02),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: " Didn't get an otp",
                                      style: tsPoppins(
                                        color: textDark40,
                                        size: 14,
                                      )),
                                  if (controller.isTimerEnd.value)
                                    TextSpan(
                                        text: ' Resend it ?',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap =
                                              () => controller.requestOTP(),
                                        style: tsPoppins(
                                            color: const Color(0xff133B87),
                                            size: 14,
                                            weight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            if (!controller.isTimerEnd.value)
                              TweenAnimationBuilder<Duration>(
                                  duration: const Duration(seconds: 30),
                                  tween: Tween(
                                      begin: const Duration(seconds: 30),
                                      end: Duration.zero),
                                  onEnd: () {
                                    print('Timer ended');
                                    controller.isTimerEnd.value = true;
                                  },
                                  builder: (BuildContext context,
                                      Duration value, Widget? child) {
                                    final minutes = value.inMinutes;
                                    final seconds = value.inSeconds % 60;
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text('$minutes:$seconds',
                                            textAlign: TextAlign.center,
                                            style: tsPoppins(
                                                color: black,
                                                size: 14,
                                                weight: FontWeight.w600)));
                                  }),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height * .01),
                      Obx(
                        () => Visibility(
                            visible: controller.isOTPEmpty.value,
                            child: ShakeWidget(
                              // 4. pass the GlobalKey as an argument
                              key: controller.shakeKey,
                              // 5. configure the animation parameters
                              shakeCount: 3,
                              shakeOffset: 10,
                              shakeDuration: const Duration(milliseconds: 400),
                              // 6. Add the child widget that will be animated
                              child: Text(
                                "Invalid OTP",
                                style: tsPoppins(color: Colors.red),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator(
                          color: white,
                        )
                      // : InkWell(
                      //     customBorder: const CircleBorder(),
                      //     onTap: () {
                      //       if (formKeyOtp.currentState!.validate()) {
                      //         if (!controller.isOTPEmpty.value) {
                      //           controller.verifyOTP();
                      //         } else {
                      //           controller.shakeKey.currentState?.shake();
                      //         }
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
                              if (formKeyOtp.currentState!.validate()) {
                                if (!controller.isOTPEmpty.value) {
                                  controller.verifyOTP();
                                } else {
                                  controller.shakeKey.currentState?.shake();
                                }
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
                SizedBox(height: Get.height * .2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
