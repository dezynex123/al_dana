import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../models/service_model.dart';

class ServiceProvider extends GetConnect {
  Future<ServiceResult> getDummyData() async {
    final file = await rootBundle.loadString('assets/json/service.json');
    final data = await jsonDecode(file);
    ServiceResult result = ServiceResult.fromJson(data);
    return result;
  }

  Future<ServiceResult> getExtraDummyData() async {
    final file = await rootBundle.loadString('assets/json/extra_service.json');
    final data = await jsonDecode(file);
    ServiceResult result = ServiceResult.fromJson(data);
    return result;
  }

  Future<ServiceResult> getServices() async {
    ServiceResult result;
    var common = Common();
    Map<String, dynamic> params = {
      'filter[branchId]': common.selectedBranch.id,
      'filter[variantId]': common.selectedVehicle.variant!.id,
      'filter[categoryId]': common.selectedCategory.id,
    };
    log('list service');
    log(common.selectedBranch.id);
    log(common.selectedVehicle.variant!.id);
    log(common.selectedCategory.id);
    final response = await get(
      apiListService,
      headers: Auth().requestHeaders,
      query: params,
    ).timeout(const Duration(minutes: 1));

    print('auth ${Auth().requestHeaders}');
    print('path $apiListService');
    print('params ${jsonEncode(params)}');
    print('responseCode ${response.statusCode}');
    print('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    result = ServiceResult.fromJson(response.body);
    return result;
  }

  Future<ServiceResult> getExtraServices() async {
    ServiceResult result;
    var common = Common();
    Map<String, dynamic> params = {
      'filter[branchId]': common.selectedBranch.id,
      'filter[variantId]': common.selectedVehicle.variant!.id,
      'filter[categoryId]': common.selectedCategory.id,
    };
    final response = await get(
      apiListExtraService,
      headers: Auth().requestHeaders,
      query: params,
    ).timeout(const Duration(minutes: 1));

    print('auth ${Auth().requestHeaders}');
    print('path $apiListExtraService');
    print('params ${jsonEncode(params)}');
    print('responseCode ${response.statusCode}');
    print('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    result = ServiceResult.fromJson(response.body);
    return result;
  }
}
