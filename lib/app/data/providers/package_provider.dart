import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../models/package_model.dart';

class PackageProvider extends GetConnect {
  Future<PackageResult> getDummyData() async {
    final file = await rootBundle.loadString('assets/json/package.json');
    final data = await jsonDecode(file);
    PackageResult result = PackageResult.fromJson(data);
    return result;
  }

  Future<PackageResult> getPackageList({required String branchId}) async {
    final response = await get(
        '$apiListActivePackage?filter[branchId]=$branchId',
        headers: Auth().requestHeaders);
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    print('path $apiListActivePackage');
    print('auth ${Auth().requestHeaders}');
    print('response ${response.body}');
    return PackageResult.fromJson(response.body);
  }
}
