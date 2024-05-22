import 'dart:developer';

import 'package:get/get.dart';

import '../data.dart';
import '../models/address_model.dart';

class AddressProvider extends GetConnect {
  Future<AddressResult> getAddresses() async {
    AddressResult result;
    Map<String, dynamic> qParams = {
      'filter[relationId]': Common().currentUser.id
    };
    final response = await get(
      apiListActiveAddress,
      query: qParams,
      headers: Auth().requestHeaders,
    );
    print('qparams $qParams');
    print('path $apiListCategory');
    print('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    result = AddressResult.listFromJson(response.body);
    return result;
  }

  Future<AddressResult> postAddress({required Address address}) async {
    AddressResult result;
    Map<String, dynamic> qParams = {};
    final response = await post(
      apiAddAddress,
      address.toPost(),
      query: qParams,
      headers: Auth().requestHeaders,
    );
    print('qparams $qParams');
    log('body ${address.toPost()}');
    print('path $apiAddAddress');
    print('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    result = AddressResult.fromJson(response.body);
    return result;
  }

  Future<AddressResult> putAddress({required Address address}) async {
    AddressResult result;
    final response = await put(
      '$apiEditAddress/${address.sId}',
      address.toPost(),
      headers: Auth().requestHeaders,
    );
    print('body ${address.toPost()}');
    print('path $apiEditAddress/${address.sId}');
    print('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    result = AddressResult.fromJson(response.body);
    return result;
  }

  Future<AddressResult> deleteAddress({required String addressId}) async {
    AddressResult result;
    final response = await delete(
      '$apiDeleteAddress/$addressId',
      headers: Auth().requestHeaders,
    );

    print('path $apiDeleteAddress/$addressId');
    print('response ${response.body}');
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    result = AddressResult.fromJson(response.body);
    return result;
  }
}
