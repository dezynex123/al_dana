import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data.dart';
import '../models/brand_model.dart';

class BrandProvider extends GetConnect {
  Future<BrandResult> getDummyData() async {
    final file = await rootBundle.loadString('assets/json/brand.json');
    final data = await jsonDecode(file);
    
    BrandResult result = BrandResult.fromJson(data);
    return result;
  }


  Future<BrandResult> getBrands() async {
    BrandResult result;
    Map<String, dynamic> qParams = {'filter[status]': 'true'};
    final response =
        await get(apiListCarBrand, query: qParams, headers: Auth().requestHeaders);
    print('auth ${Auth().requestHeaders}');
    print('qparams $qParams');
    print('path $apiListCarBrand');
    print('response ${response.body}');
    if (response.statusCode == 200) {
      result = BrandResult.listFromJson(response.body);
    } else {
      result = BrandResult.listFromJson(
          {"status": "error", "message": "Server error !", "data": []});
    }

    return result;
  }

}
