import 'package:get/get.dart';

import '../data.dart';

class CouponProvider extends GetConnect {
  Future<CouponResult> redeemCoupon(
      {required String couponCode, required double totalAmount}) async {
    Common common = Common();
    Auth auth = Auth();
    var body = {
      "couponCode": couponCode,
      "customerId": common.currentUser.id,
      "totalAmount": totalAmount
    };
    final response =
        await post(apiRedeemCoupon, body, headers: auth.requestHeaders);
    print(response.body);
    if (response.statusCode == 401) {
      auth.authFailed(response.body['message']);
    }
    return CouponResult.fromJson(response.body);
  }
}
