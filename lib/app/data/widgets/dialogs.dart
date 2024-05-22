import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../data.dart';

myAlertDialog({
  String? title,
  String? message,
  VoidCallback? onCancel,
  VoidCallback? onSubmit,
}) {
  return Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          '$title',
          style: tsPoppins(color: primary, weight: FontWeight.w600, size: 18),
        ),
        content: Text(
          '$message',
          style:
              tsPoppins(color: textDark80, weight: FontWeight.w400, size: 12),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onCancel,
            child: Text("Cancel",
                style: tsPoppins(
                    color: textDark60, weight: FontWeight.w400, size: 14)),
          ),
          TextButton(
            onPressed: onSubmit,
            child: Text("Confirm",
                style: tsPoppins(
                    color: textDark80, weight: FontWeight.w600, size: 14)),
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}



getColorPicker(
    {required BuildContext context,
    required Color pickerColor,
    required ValueChanged<Color> onColorChanged,
    bool enableAlpha2 = true,
    bool displayThumbColor2 = false}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? const BorderRadius.vertical(
                      top: Radius.circular(500),
                      bottom: Radius.circular(100),
                    )
                  : const BorderRadius.horizontal(right: Radius.circular(500)),
        ),
        content: SingleChildScrollView(
          child: HueRingPicker(
            pickerColor: pickerColor,
            onColorChanged: onColorChanged,
            enableAlpha: enableAlpha2,
            displayThumbColor: displayThumbColor2,
          ),
        ),
      );
    },
  );
}


getColorPickerWithName({
  required BuildContext context,
  required Color pickerColor,
  required ValueChanged<Color> onColorChanged,
  bool enableAlpha2 = true,
  bool displayThumbColor2 = false,
  required TextEditingController nameController,
  VoidCallback? onCancel,
  VoidCallback? onSubmit,
}) {
  final GlobalKey<FormState> formKey = GlobalKey();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? const BorderRadius.vertical(
                      top: Radius.circular(500),
                      bottom: Radius.circular(100),
                    )
                  : const BorderRadius.horizontal(right: Radius.circular(500)),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HueRingPicker(
                  pickerColor: pickerColor,
                  onColorChanged: onColorChanged,
                  enableAlpha: enableAlpha2,
                  displayThumbColor: displayThumbColor2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: nameController,
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
                        size: 14, weight: FontWeight.w400, color: textDark80),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 0),
                      labelText: "Enter color name",
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
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onCancel,
            child: Text("Cancel",
                style: tsPoppins(
                    color: textDark60, weight: FontWeight.w400, size: 14)),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                onSubmit!.call();
              }
            },
            child: Text("Confirm",
                style: tsPoppins(
                    color: textDark80, weight: FontWeight.w600, size: 14)),
          ),
        ],
      );
    },
  );
}
