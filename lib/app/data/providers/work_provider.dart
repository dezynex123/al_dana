import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/work_model.dart';

class WorkProvider extends GetConnect {
  Future<WorkResult> getDummyData() async {
    final file = await rootBundle.loadString('assets/json/work.json');
    final data = await jsonDecode(file);
    WorkResult result = WorkResult.fromJson(data);
    return result;
  }
}
