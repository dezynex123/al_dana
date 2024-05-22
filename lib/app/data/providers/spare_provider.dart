import 'dart:convert';

import 'package:get/get.dart';

import '../data.dart';
import '../models/spare_model.dart';

class SpareProvider extends GetConnect {
  Future<SpareResult> getSpares({required String spareCategoryId}) async {
    SpareResult result;
    var common = Common();
    Map<String, dynamic> params = {
      'filter[branchId]': common.selectedBranch.id,
      'filter[spareCategoryId]': spareCategoryId,
    };
    final response = await get(
      apiListActiveSpare,
      headers: Auth().requestHeaders,
      query: params,
    ).timeout(Duration(minutes: 1));

    print('auth ${Auth().requestHeaders}');
    print('path $apiListActiveSpare');
    print('params ${jsonEncode(params)}');
    print('responseCode ${response.statusCode}');
    print('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    result = SpareResult.fromJson(response.body);
    return result;
  }
}
