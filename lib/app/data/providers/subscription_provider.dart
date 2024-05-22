import 'dart:convert';
import 'dart:developer';
import 'package:al_dana/app/data/constants/api_routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/common.dart';
import '../constants/keys.dart';

class SubscriptionProvider {
  Future<void> postSubscription(
    String bookingId,
    List<String> dates,
  ) async {
    final body = <String, dynamic>{"bookingId": bookingId, "date": dates};
    final bodyJson = jsonEncode(body);
    log(bodyJson);
    final response = await http.post(
      Uri.parse(apiPostSubscription),
      headers: <String, String>{
        'Authorization': 'Bearer ${storage.read(auth)}',
        "Content-Type": "application/json",
      },
      encoding: Encoding.getByName('utf-8'),
      body: bodyJson,
    );
    if (response.statusCode == 200) {
      log(response.body);
      Get.snackbar('Success', 'Subscibed.');
    } else {
      log(response.body);
      Get.snackbar('Failed', 'Faield to Subscibe.');
    }
  }
}
