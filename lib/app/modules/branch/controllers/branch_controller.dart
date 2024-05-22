import 'dart:async';
import 'dart:developer';
import 'dart:ui' as ui;
import 'package:al_dana/app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:al_dana/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

class BranchController extends GetxController {
  var isLoading = false.obs;
  Completer<GoogleMapController> mapController = Completer();
  var camPosition = const CameraPosition(
    target: LatLng(25.1972, 55.2744),
    zoom: 14.4746,
  ).obs;
  // var originLocation = const LatLng(8.5678277, 76.8929361);
  // var destinationLocation = const LatLng(8.5704811, 76.8752231);
  var polylineCoordinates = <LatLng>[].obs;
  // LocationData? currentLocation;
  var branchResult = BranchResult().obs;
  var markers = <Marker>{}.obs;
  late BitmapDescriptor customIconSelected, customIconUnSelected;
  var selectedBranch = Branch().obs;
  // var tileTapped = false.obs;
  @override
  void onInit() {
    super.onInit();
    getDetails();
  }

  addMarker() async {
// make sure to initialize before map loading
    customIconSelected = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(12, 12)),
        'assets/images/img_marker_selected.png');
    customIconUnSelected = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(12, 12)),
        'assets/images/img_marker_unselected.png');
  }

  getDetails() async {
    isLoading(true);
    // await getCurrentLocation();

    await addMarker();
    Future.delayed(const Duration(seconds: 2), () async {
      await getBranches();
    });

    isLoading(false);
  }

  // getCurrentLocation() async {
  //   try {
  //     Location location = Location();
  //     bool serviceEnabled;
  //     PermissionStatus permissionGranted;

  //     serviceEnabled = await location.serviceEnabled();
  //     if (!serviceEnabled) {
  //       serviceEnabled = await location.requestService();
  //       if (!serviceEnabled) {
  //         return;
  //       }
  //     }

  //     permissionGranted = await location.hasPermission();
  //     if (permissionGranted == PermissionStatus.denied) {
  //       permissionGranted = await location.requestPermission();
  //       if (permissionGranted != PermissionStatus.granted) {
  //         log('Location permission is not granted');
  //         return;
  //       }
  //     }
  //     currentLocation = await location.getLocation();
  //   } catch (e) {
  //     log("Error getting current location: $e");
  //   }
  // }

  getBranches() async {
    try {
      branchResult.value = await BranchProvider().getBranches();
      branchResult.refresh();

      // if (currentLocation != null) {
      //   for (Branch branch in branchResult.value.branchList!) {
      //     branch.distance = calculateDistance(branch.latitude, branch.longitude,
      //         currentLocation!.latitude, currentLocation!.longitude);
      //   }

      //   branchResult.value.branchList!.sort(
      //     (a, b) => a.distance.compareTo(b.distance),
      //   );
      // }

      selectBranch(branchResult.value.branchList![0]);
    } catch (e) {
      log("Error getting branches: $e");
    }
  }

  void setMarkers() {
    // Create a new marker
    print('adding markers ${markers.length}');
    markers.clear();
    for (int i = 0; i < branchResult.value.branchList!.length; i++) {
      Marker resultMarker = Marker(
        markerId: MarkerId(branchResult.value.branchList![i].id),
        infoWindow: InfoWindow(title: branchResult.value.branchList![i].name),
        position: LatLng(branchResult.value.branchList![i].latitude,
            branchResult.value.branchList![i].longitude),
        icon: selectedBranch.value.id == branchResult.value.branchList![i].id
            ? customIconSelected
            : customIconUnSelected,
      );

      // Add it to Set
      markers.add(resultMarker);
    }
    print('adding markers ${markers.length}');
    print('markers $markers');
    markers.refresh();
  }

  selectBranch(Branch branch) {
    selectedBranch.value = branch;
    setMarkers();
    moveCamera();
  }

  Future<void> moveCamera() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target:
          LatLng(selectedBranch.value.latitude, selectedBranch.value.longitude),
      zoom: 14.4746,
    )));
  }

  Future<BitmapDescriptor> _bitmapDescriptorFromSvgAsset(
      BuildContext context, String assetName) async {
    String svgString =
        await DefaultAssetBundle.of(context).loadString(assetName);
    //Draws string representation of svg to DrawableRoot
    DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, '');
    ui.Picture picture = svgDrawableRoot.toPicture();
    ui.Image image = await picture.toImage(26, 37);
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  void onConfirmPressed() {
    if (selectedBranch.value.id.isNotEmpty) {
      storage.write(selected_branch, selectedBranch.value.toJson());
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar('Error', 'Please select a branch for confirm.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: textDark20,
          colorText: textDark80);
    }
  }
}
