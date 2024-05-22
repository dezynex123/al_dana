import 'package:get/get.dart';

import '../data.dart';
import '../models/car_model_model.dart';

class CarModelProvider extends GetConnect {
  Future<CarModelResult> getCarModels({String? brandId}) async {
    CarModelResult result;
    Map<String, dynamic> qParams = {};
    if (brandId != null) {  
      qParams['filter[carBrandId]'] = brandId;
    }
    final response = await get(apiListCarModel,
        query: qParams, headers: Auth().requestHeaders);
    print('auth ${Auth().requestHeaders}');
    print('qparams $qParams');
    print('path $apiListCarModel');
    print('response ${response.body}');
    if (response.statusCode == 200) {
      result = CarModelResult.listFromJson(response.body);
    } else {
      result = CarModelResult.listFromJson(
          {"status": "error", "message": "Server error !", "data": []});
    }

    return result;
  }
}
