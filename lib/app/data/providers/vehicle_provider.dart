import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../data.dart';

class VehicleProvider extends GetConnect {
  // Future<VehicleResult> getDummyData() async {
  //   final file = await rootBundle.loadString('assets/json/vehicle.json');
  //   final data = await jsonDecode(file);
  //   VehicleResult result = VehicleResult.fromJson(data);
  //   return result;
  // }

  Future<VehicleResult> addVehicle({required Vehicle vehicle}) async {
    final response = await post(apiAddVehicle, vehicle.toPost(),
        headers: Auth().requestHeaders);
    log(vehicle.toPost().toString());
    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    print('response ${jsonEncode(response.body)}');
    return VehicleResult.fromJson(response.body);
  }

  Future<VehicleResult> getVehicles() async {
    Common common = Common();
    final response = await get('$apiListActiveVehicle/${common.currentUser.id}',
        headers: Auth().requestHeaders);

    if (response.statusCode == 401) {
      Auth().authFailed(response.body['message']);
    }
    print('auth ${Auth().requestHeaders}');
    print('path $apiListActiveVehicle/${common.currentUser.id}');
    print('response ${jsonEncode(response.body)}');

    return VehicleResult.listFromJson(response.body);
  }
}
