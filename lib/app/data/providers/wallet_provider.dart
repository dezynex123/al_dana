import 'dart:convert';
import 'dart:developer';

import 'package:al_dana/app/data/constants/api_routes.dart';
import 'package:get/get.dart';

import '../data.dart';
import '../models/wallet_model.dart';

class WalletProvider extends GetConnect {
  Future<WalletResult> getWallet() async {
    final response = await get(
      '$apiGetWallet/${Common().currentUser.id}',
      headers: Auth().requestHeaders,
    );

    print('auth ${Auth().requestHeaders}');
    print('path $apiGetWallet/${Common().currentUser.id}');
    print('responseCode ${response.statusCode}');
    log('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    return WalletResult.fromJson(response.body);
  }

  Future<WalletResult> redeemWallet(
      {required int point, required double totalAmount}) async {
    var body = {
      "customerId": Common().currentUser.id,
      "totalAmount": totalAmount,
      "redeemPoint": point
    };
    final response = await post(
      apiRedeemWallet,body,
      headers: Auth().requestHeaders,
    );

    print('auth ${Auth().requestHeaders}');
    print('path $apiRedeemWallet');
    print('body ${jsonEncode(body)}');
    print('responseCode ${response.statusCode}');
    log('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    return WalletResult.redeemFromJson(response.body);
  }
}
