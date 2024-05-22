import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/api_routes.dart';
import '../data.dart';
import '../models/service_mode_model.dart';

class ServiceModeProvider extends GetConnect {
  Future<ServiceModeResult> getDummyData() async {
    final file = await rootBundle.loadString('assets/json/service_mode.json');
    final data = await jsonDecode(file);
    ServiceModeResult result = ServiceModeResult.fromJson(data);
    return result;
  }

  Future<ServiceModeResult> getModes() async {
    ServiceModeResult result;
    Map<String, dynamic> qParams = {'filter[status]': 'true'};
    final response = await get(apiListServiceMode,
        query: qParams, headers: Auth().requestHeaders,);
    print('qparams $qParams');
    print('path $apiListServiceMode');
    print('response ${response.body}');
    if (response.statusCode == 200) {
      result = ServiceModeResult.fromJson(response.body);
    } else {
      result = ServiceModeResult.fromJson(
          {"status": "error", "message": "Server error !", "data": []});
    }

    return result;
  }
}
