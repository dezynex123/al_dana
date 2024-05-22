import 'dart:convert';
import 'dart:developer';

import 'package:al_dana/app/data/constants/api_routes.dart';
import 'package:http/http.dart' as http;
import '../constants/common.dart';
import '../constants/keys.dart';

class AddRewardProvider {
  Future<void> addReward(
    String customerId,
    String totalAmount,
  ) async {
    log('Reward total amount - $totalAmount');
    final body = <String, dynamic>{
      "customerId": customerId,
      "totalAmount": totalAmount,
    };
    final response = await http.post(
      Uri.parse(apiPostReward),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${storage.read(auth)}',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final rewardPoint = jsonResponse["data"]["rewardPoint"];
      log("Reward points - $rewardPoint");
    } else {
      log('Failed to add reward');
    }
  }
}
