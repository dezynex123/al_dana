import 'dart:async';
import 'package:al_dana/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import '../../../data/data.dart';

class MapPageController extends GetxController {
  var isLoading = false.obs;
  Completer<GoogleMapController> mapController = Completer();
  var camPosition = const CameraPosition(
    target: LatLng(25.1972, 55.2744),
    zoom: 14.4746,
  ).obs;
  // var originLocation = const LatLng(9.8959, 76.7184);
  // var destinationLocation = const LatLng(9.9075, 76.7303);
  var polylineCoordinates = <LatLng>[].obs;
  // late LocationData currentLocation;
  var branchResult = BranchResult().obs;
  var markers = <Marker>{}.obs;
  late BitmapDescriptor customIconSelected,
      customIconUnSelected,
      currentLocIcon;
  var selectedBranch = Branch().obs;
  var booking = Booking().obs;
  @override
  void onInit() {
    super.onInit();
    booking.value = Get.arguments;
    print('booking ${booking.value.toJson()}');
    getDetails();
  }

  // getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();

  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       googleApiKey,
  //       PointLatLng(originLocation.latitude, originLocation.longitude),
  //       PointLatLng(
  //           destinationLocation.latitude, destinationLocation.longitude));

  //   if (result.points.isNotEmpty) {
  //     for (var point in result.points) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     }
  //   } else {
  //     print('poliline points are empty');
  //   }
  // }

  // getCurrentLocation() async {
  //   Location location = Location();
  //   currentLocation = await location.getLocation();
  //   addCurrentLocMarker(currentLocation);
  //   moveCamera(currentLocation.latitude!, currentLocation.longitude!);
  //   location.onLocationChanged.listen((loc) {
  //     currentLocation = loc;
  //     addCurrentLocMarker(loc);
  //   });
  // }

  // addCurrentLocMarker(LocationData loc) {
  //   markers.removeWhere((element) => element.markerId == 'currentloc');
  //   Marker resultMarker = Marker(
  //     markerId: const MarkerId('currentloc'),
  //     infoWindow: const InfoWindow(title: "your location"),
  //     position: LatLng(loc.latitude!, loc.longitude!),
  //     icon: currentLocIcon,
  //   );
  //   markers.add(resultMarker);
  // }

  addMarkerIcons() async {
// make sure to initialize before map loading
    customIconSelected = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(12, 12)),
        'assets/images/img_marker_selected.png');
    customIconUnSelected = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(12, 12)),
        'assets/images/img_marker_unselected.png');
    currentLocIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(12, 12)),
        'assets/images/img_current_loc.png');
  }

  getDetails() async {
    isLoading(true);
    await addMarkerIcons();
    await getBranches();
    // await getCurrentLocation();
    // await getPolyPoints();
    isLoading(false);
  }

  getBranches() async {
    branchResult.value = await BranchProvider().getBranches();
    branchResult.refresh();
    selectBranch(booking.value.branch!);
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
  }

  Future<void> moveCamera(double latitude, double longitude) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14.4746,
    )));
  }

  void onConfirmPressed() {
    Get.toNamed(Routes.ADD_BOOKING, arguments: booking.value);
  }

  void search({required String key}) {}
}
