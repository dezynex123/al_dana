import 'dart:developer';

import 'package:get/get.dart';

import '../data.dart';

class BranchProvider extends GetConnect {
  // Future<BranchResult> getDummyData() async {
  //   final file = await rootBundle.loadString('assets/json/branch.json');
  //   final data = await jsonDecode(file);
  //   BranchResult result = BranchResult.fromJson(data);
  //   return result;
  // }

  Future<BranchResult> getBranches() async {
    Auth auth = Auth();
    final response = await get(
      apiListBranch,
      headers: auth.requestHeaders,
    );
    print('path $apiListBranch');
    print('response ${response.body}');
    log('headers: ${auth.requestHeaders}');
    if (response.statusCode == 401) {
      auth.authFailed(response.body['message']);
    }

    return BranchResult.fromJson(response.body);
  }
}
