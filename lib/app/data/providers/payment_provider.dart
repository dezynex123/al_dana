import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect.dart';

import '../data.dart';

class PaymentProvider extends GetConnect {
  Future<String> generateOrderIdWithRazorPay(
      String key, String secret, int amount) async {
    var authn = 'Basic ${base64Encode(utf8.encode('$key:$secret'))}';

    var headers = {
      'content-type': 'application/json',
      'Authorization': authn,
    };

    var data =
        '{ "amount": $amount, "currency": "INR", "receipt": "receipt#R1", "payment_capture": 1 }'; // as per my experience the receipt doesn't play any role in helping you generate a certain pattern in your Order ID!!

    var res = await post(
      'https://api.razorpay.com/v1/orders',
      data,
      headers: headers,
    );
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
    print('ORDER ID response => ${res.body}');

    return res.body['id'].toString();
  }

  Future<PaymentResult> generateOrderId(String bookingId, double amount) async {
    PaymentResult result;
    Auth auth = Auth();
    var body = {"totalAmount": amount, "bookingId": bookingId};

    var response =
        await post(apiPaymentCheckout, body, headers: auth.requestHeaders);

    log('path: $apiPaymentCheckout');
    log('booking id: $bookingId');
    log('body: ${jsonEncode(body)}');
    log('response: ${jsonEncode(response.body)}');
    log('header: ${jsonEncode(auth.requestHeaders)}');

    return PaymentResult.fromJson(response.body);
  }
}
