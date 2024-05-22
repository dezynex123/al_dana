import 'package:get/get.dart';

import '../data.dart';
import '../models/variant_model.dart';

class VariantProvider extends GetConnect {

    Future<VariantResult> getCarVariants({String? modelId}) async {
    VariantResult result;
    Map<String, dynamic> qParams = {};
    if (modelId != null) {  
      qParams['filter[carModelId]'] = modelId;
    }
    final response = await get(apiListCarVariant,
        query: qParams, headers: Auth().requestHeaders);
    print('auth ${Auth().requestHeaders}');
    print('qparams $qParams');
    print('path $apiListCarVariant');
    print('response ${response.body}');
    if (response.statusCode == 200) {
      result = VariantResult.listFromJson(response.body);
    } else {
      result = VariantResult.listFromJson(
          {"status": "error", "message": "Server error !", "data": []});
    }

    return result;
  }
 }
