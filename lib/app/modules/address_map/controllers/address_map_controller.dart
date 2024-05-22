import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:al_dana/app/data/providers/address_provider.dart';
import 'package:al_dana/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

import '../../../data/data.dart';

class AddressMapController extends GetxController {
  var isLoading = false.obs;
  var isUpdate = false.obs;
  var currentUser = Common().currentUser;
  Completer<GoogleMapController> mapController = Completer();
  var camPosition = const CameraPosition(
    target: LatLng(25.1972, 55.2744),
    zoom: 14.4746,
  ).obs;
  var markers = <Marker>{}.obs;
  // late LocationData currentLocation;
  TextEditingController locationController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  var selectedAddress = Address().obs;
  var addressPageMode = AddressPageMode.addAndReturn;
  var booking = Booking().obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      addressPageMode = Get.arguments[0];
      if (addressPageMode == AddressPageMode.addAndReturn && Get.arguments[1]) {
        isUpdate(true);
        selectedAddress.value = Get.arguments[2];
        addCurrentLocMarker(LatLng(
            selectedAddress.value.latitude, selectedAddress.value.longitude));
        landMarkController.text = selectedAddress.value.landmark;
      } else if (addressPageMode == AddressPageMode.addAndContinue) {
        booking.value = Get.arguments[2];
        // getCurrentLocation();
      } else {
        // getCurrentLocation();
      }
    }
  }

  setAddressFromList(Address address) {
    selectedAddress.value = address;
    addCurrentLocMarker(LatLng(address.latitude, address.longitude));
    landMarkController.text = address.landmark;
  }

  // getCurrentLocation() async {
  //   print("@@@@@@@@@get current location@@@@@@@@");
  //   Location location = Location();
  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;

  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       return;
  //     }
  //   }

  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       log('Location permission is not granted');
  //       return;
  //     }
  //   }
  //   currentLocation = await location.getLocation();
  //   addCurrentLocMarker(
  //       LatLng(currentLocation.latitude!, currentLocation.longitude!));
  //   // location.onLocationChanged.listen((loc) {
  //   //   print("++++++++in location change listener++++++");
  //   //   if (currentLocation.latitude != loc.latitude &&
  //   //       currentLocation.longitude != loc.longitude) {
  //   //     currentLocation = loc;
  //   //     print("------------in location change listener--------");
  //   //     addCurrentLocMarker(LatLng(loc.latitude!, loc.longitude!));
  //   //   }
  //   // });
  // }

  addCurrentLocMarker(LatLng loc) {
    isLoading(true);
    markers.removeWhere((element) => element.markerId.value == 'currentloc');
    Marker resultMarker = Marker(
      markerId: const MarkerId('currentloc'),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: const InfoWindow(title: "your location"),
      position: LatLng(loc.latitude, loc.longitude),
    );
    markers.add(resultMarker);
    markers.refresh;
    moveCamera(loc.latitude, loc.longitude);

    getAddressFromLatLng(loc);
    isLoading(false);
  }

  getAddressFromLatLng(LatLng loc) async {
    List<geo.Placemark> placemarks =
        await geo.placemarkFromCoordinates(loc.latitude, loc.longitude);
    geo.Placemark placemark = placemarks[0];
    String street =
        placemark.street!.isNotEmpty ? '${placemark.street!}, ' : '';
    String subLocality =
        placemark.subLocality!.isNotEmpty ? '${placemark.subLocality!}, ' : '';
    String locality =
        placemark.locality!.isNotEmpty ? '${placemark.locality!}, ' : '';
    String country =
        placemark.country!.isNotEmpty ? '${placemark.country!}  ' : '';
    String address = '$street$subLocality$locality$country';

    locationController.text = address;
    selectedAddress.value = selectedAddress.value.copyWith(
        location: address,
        landmark: landMarkController.text,
        latitude: loc.latitude,
        longitude: loc.longitude);
    print('selectedAddress copywith ${jsonEncode(selectedAddress)}');
    print('selectedAddress ${jsonEncode(selectedAddress)}');
  }

  Future<void> moveCamera(double latitude, double longitude) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14.4746,
    )));
  }

  void search({required String key}) {}

  void onConfirmPressed() async {
    print('selectedAddress ${jsonEncode(selectedAddress)}');
    AddressResult result;
    if (selectedAddress.value.sId.isEmpty) {
      result = await AddressProvider().postAddress(
          address: selectedAddress.value.copyWith(
        landmark: landMarkController.text,
        relationId: [currentUser.id],
      ));
    } else {
      result = AddressResult(
          status: 'success', message: '', address: selectedAddress.value);
    }
    if (result.status == 'success') {
      if (addressPageMode == AddressPageMode.addAndContinue) {
        booking.value.address = result.address;
        Get.toNamed(Routes.ADD_BOOKING, arguments: booking.value);
      } else {
        Get.back(result: true);
      }
    } else {
      Get.snackbar('Error', result.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: textDark20,
          colorText: textDark80);
    }
  }

  void updateAddress() async {
    var result = await AddressProvider().putAddress(
        address: selectedAddress.value.copyWith(
      landmark: landMarkController.text,
      relationId: [Common().currentUser.id],
    ));
    if (result.status == 'success') {
      Get.back(result: true);
    } else {
      Get.snackbar('Error', result.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: textDark20,
          colorText: textDark80);
    }
  }

  void deleteAddress() async {
    var result = await AddressProvider()
        .deleteAddress(addressId: selectedAddress.value.sId);
    if (result.status == 'success') {
      Get.back();
      Get.back(result: true);
    } else {
      Get.snackbar('Error', result.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: textDark20,
          colorText: textDark80);
    }
  }
}
