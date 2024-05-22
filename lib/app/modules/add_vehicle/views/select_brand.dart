import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data.dart';
import '../controllers/add_vehicle_controller.dart';

class BrandSelection extends GetView<AddVehicleController> {
  const BrandSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin:
                  EdgeInsets.fromLTRB(Get.width * .05, 0, Get.width * .05, 15),
              child: TextFormField(
                autofocus: false,
                onChanged: (value) {
                  controller.search(key: value);
                },
                style: tsPoppins(color: textDark80, size: 14),
                decoration: InputFormDecoration.outLinedInputTextDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: textDark40,
                    ),
                    hintText: 'Search Vehicle',
                    hintStyle: tsPoppins(size: 14, color: textDark20),
                    radius: 100,
                    filled: true,
                    fillColor: white),
              ),
            ),
            Obx(
              () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  itemCount: controller.filterBrands.length,
                  itemBuilder: (con, i) {
                    return BrandTile(
                      onTap: () {
                        // controller.selectedBrand.value =
                        //     controller.filterBrands[i];
                        // controller.variantList.value =
                        //     controller.filterBrands[i].variantList!;
                        // controller.selectedVehicle.value.brand =
                        //     controller.filterBrands[i];
                        // controller.selectedVehicle.value.image =
                        //     controller.filterBrands[i].image;

                        controller.selectedVehicle.value.brand =
                            controller.filterBrands[i];
                       
                        controller.getModels(brandId:   controller.filterBrands[i].id);
                        controller.title.value = 'Car Details';
                        controller.progress.value = .6;
                        controller.pageIndex.value = 1;
                      },
                      brand: controller.filterBrands[i],
                    );
                  }),
            ),
            SizedBox(
              height: Get.height * .1,
            )
          ],
        ),
      ),
    );
  }
}
