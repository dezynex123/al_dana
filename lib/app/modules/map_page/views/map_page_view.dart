import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/map_page_controller.dart';

class MapPageView extends GetView<MapPageController> {
  const MapPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Obx(
              () => (controller.isLoading.value)
                  ? const Center(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: greenAppTheme,
                        ),
                      ),
                    )
                  : GoogleMap(
                      mapType: MapType.normal,
                      zoomControlsEnabled: false,
                      initialCameraPosition: controller.camPosition.value,
                      onMapCreated: (GoogleMapController gmController) {
                        controller.mapController.complete(gmController);
                      },
                      markers: controller.markers,
                    ),
            ),

            // Positioned(
            //     bottom: 100,
            //     left: 0,
            //     right: 0,
            //     child: SizedBox(
            //       height: Get.height * .2,
            //       child: Obx(
            //         () => ListView.builder(
            //             scrollDirection: Axis.horizontal,
            //             padding: const EdgeInsets.only(right: 50),
            //             itemCount:
            //                 controller.branchResult.value.branchList!.length,
            //             itemBuilder: (con, i) {
            //               return BranchTile(
            //                 onTap: () {
            //                   controller.selectBranch(
            //                       controller.branchResult.value.branchList![i]);
            //                 },
            //                 branch:
            //                     controller.branchResult.value.branchList![i],
            //               );
            //             }),
            //       ),
            //     )),

            Positioned(
              top: Get.height * .02,
              left: Get.width * .01,
              right: Get.width * .01,
              child: Container(
                color: Colors.transparent,
                margin: EdgeInsets.fromLTRB(
                    Get.width * .05, 0, Get.width * .05, 15),
                child: TextFormField(
                  autofocus: false,
                  onChanged: (value) {
                    controller.search(key: value);
                  },
                  style: tsPoppins(color: primary, size: 14),
                  decoration: InputFormDecoration.outLinedInputTextDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: textDark40,
                      ),
                      radius: 100,
                      filled: true,
                      fillColor: white),
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    controller.onConfirmPressed();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: greenAppTheme,
                      minimumSize: Size(Get.width, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Text(
                    'Confirm Address',
                    style: tsPoppins(
                        color: white, size: 16, weight: FontWeight.w600),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}




// return Scaffold(
//       body: Obx(
//         () => (controller.isLoading.value && controller.currentLocation == null)
//             ? Center(
//                 child: Text(
//                   'Please wait...',
//                   style: tsPoppins(),
//                 ),
//               )
//             : GoogleMap(
//                 mapType: MapType.normal,
//                 initialCameraPosition: controller.camPosition.value,
//                 onMapCreated: (GoogleMapController gmController) {
//                   controller.mapController.complete(gmController);
//                 },
//                 polylines: {
//                   Polyline(
//                       polylineId: PolylineId('route'),
//                       points: controller.polylineCoordinates.value,
//                       color: Colors.blue,
//                       width: 6)
//                 },
//                 markers: {
//                   Marker(
//                       markerId: const MarkerId("origin"),
//                       position: controller.originLocation),
//                   Marker(
//                       markerId: const MarkerId("destination"),
//                       position: controller.destinationLocation),
//                 },
//               ),
//       ),

//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: _goToTheLake,
//       //   label: Text('To the lake!'),
//       //   icon: Icon(Icons.directions_boat),
//       // ),
//     );
  