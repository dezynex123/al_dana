import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data.dart';

class CategoryProvider extends GetConnect {
  Future<CategoryResult> getDummyData() async {
    final file = await rootBundle.loadString('assets/json/category.json');
    final data = await jsonDecode(file);
    CategoryResult result = CategoryResult.fromJson(data);
    return result;
  }

  Future<CategoryResult> getCategories() async {
    CategoryResult result;
    Map<String, dynamic> qParams = {};
    final response = await get(
      apiListCategory,
      query: qParams,
      headers: Auth().requestHeaders,
    );
    print('qparams $qParams');
    print('path $apiListCategory');
    print('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    result = CategoryResult.listFromJson(response.body);
    return result;
  }
}
