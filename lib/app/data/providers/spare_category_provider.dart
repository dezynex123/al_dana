import 'dart:convert';

import 'package:get/get.dart';

import '../data.dart';

class SpareCategoryProvider extends GetConnect {
  Future<SpareCategoryResult> getSpareCategory(
      {required String spareCategoryId}) async {
    SpareCategoryResult result;
    var common = Common();
    Map<String, dynamic> params = {
      'filter[branchId]': common.selectedBranch.id,
    };
    final response = await get(
      '$apiSpareCategory/$spareCategoryId',
      headers: Auth().requestHeaders,
      query: params,
    );
    print('Branch id  - ${common.selectedBranch.id}');
    print('Spare category id - $spareCategoryId');
    print('auth ${Auth().requestHeaders}');
    print('path $apiSpareCategory/$spareCategoryId');
    print('params ${jsonEncode(params)}');
    print('responseCode ${response.statusCode}');
    print('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    result = SpareCategoryResult.fromJson(response.body);
    return result;
  }
}
