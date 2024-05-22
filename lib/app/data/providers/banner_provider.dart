import 'package:get/get.dart';

import '../data.dart';
import '../models/banner_model.dart';

class BannerProvider extends GetConnect {
  Future<BannerResult> getBanners() async {
    BannerResult result;
    Map<String, dynamic> qParams = {
      'filter[branchId]': Common().selectedBranch.id
    };
    final response = await get(
      apiListBanner,
      query: qParams,
      headers: Auth().requestHeaders,
    );
    print('qparams $qParams');
    print('path $apiListCategory');
    print('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    result = BannerResult.fromJson(response.body);
    return result;
  }
}
