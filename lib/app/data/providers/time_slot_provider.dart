import 'dart:developer';

import 'package:get/get.dart';

import '../data.dart';

class TimeSlotProvider extends GetConnect {
  // Future<TimeSlotResult> getDummyData() async {
  //   final file = await rootBundle.loadString('assets/json/time_slot.json');
  //   final data = await jsonDecode(file);
  //   TimeSlotResult result = TimeSlotResult.fromJson(data);
  //   return result;
  // }

  Future<TimeSlotResult> getTimeSlots(String date) async {
    Auth auth = Auth();
    var common = Common();
    log(common.selectedBranch.id);
    log(common.selectedCategory.id);
    log(date);

    final response = await get(
      '$apiGetTimeSlot?filter[branchId]=${common.selectedBranch.id}&filter[categoryId]=${common.selectedCategory.id}&filter[date]=$date',
      headers: auth.requestHeaders,
    );
    log('Time Slots');
    log(response.statusCode.toString());

    if (response.statusCode == 401) {
      auth.authFailed(response.body['message']);
    }
    log('-----------------------------------------------------------------------------');
    log(response.body.toString());
    log('-----------------------------------------------------------------------------');
    return TimeSlotResult.fromJson(response.body);
  }
}
