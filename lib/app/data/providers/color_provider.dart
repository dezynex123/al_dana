import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/color_model.dart';

class ColorProvider extends GetConnect {
 Future<ColorResult> getDummyData() async {
    final file = await rootBundle.loadString('assets/json/color.json');
    final data = await jsonDecode(file);
    ColorResult result = ColorResult.fromJson(data);
    return result;
  }
}
