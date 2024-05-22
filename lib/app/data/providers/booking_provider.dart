import 'dart:convert';
import 'dart:developer';

import 'package:al_dana/app/data/models/extra_charge_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../data.dart';

class BookingProvider extends GetConnect {
  Future<BookingResult> getDummyBookingHistory() async {
    final file =
        await rootBundle.loadString('assets/json/booking_history.json');
    final data = await jsonDecode(file);
    BookingResult result = BookingResult.listFromJson(data);
    return result;
  }

  Future<BookingResult> getBookingHistory() async {
    Auth auth = Auth();
    final response = await get(apiGetBooking, headers: auth.requestHeaders);

    if (response.statusCode == 401) {
      auth.authFailed(response.body['message']);
    }
    log('Vehicle response hklhlkhk');
    // log(response.body["data"][0]["vehicleId"]["image"].toString());
    return BookingResult.listFromJson(response.body);
  }

  Future<ExtraCharge> getExtraCharge(String modeId) async {
    Auth auth = Auth();
    Map<String, String> qParam = {
      "filter[serviceModeId]": modeId,
    };
    final response = await get(
      apiGetExtraCharge,
      headers: auth.requestHeaders,
      query: qParam,
    );
    log('--------------------------------------------------Extra charge--------------------------------------------------');
    // log(response.statusCode.toString());
    // log(Booking().mode?.id ?? '');
    // log(response.body);
    log('--------------------------------------------------Extra charge--------------------------------------------------');
    if (response.statusCode == 401) {
      auth.authFailed(response.body['message']);
    }
    return ExtraCharge.fromJson(response.body);
  }

  Future<BookingResult> postBooking({required Booking booking}) async {
    Auth auth = Auth();
    final response = await post(apiAddBooking, booking.toPost(),
        headers: auth.requestHeaders);
    if (response.statusCode == 401) {
      auth.authFailed(response.body['message']);
    }
    // log("response.body id");

    // log('post booking');
    // print('path $apiAddBooking');
    // print('headers ${jsonEncode(auth.requestHeaders)}');
    // log('body ${jsonEncode(booking.toPost())}');

    log(apiAddBooking);
    log('booking body ${booking.toPost()}');
    log('response ${jsonEncode(response.body)}');

    return BookingResult.fromJson(response.body);
  }

  Future<BookingResult> verifyPayment(
      {required Map<String, dynamic> body}) async {
    Auth auth = Auth();
    final response =
        await post(apiPaymentVerify, body, headers: auth.requestHeaders);
    if (response.statusCode == 401) {
      auth.authFailed(response.body['message']);
    }

    log('verifyPayment');
    print('path $apiPaymentVerify');
    print('headers ${jsonEncode(auth.requestHeaders)}');
    log('body ${jsonEncode(body)}');
    log('response ${jsonEncode(response.body)}');

    return BookingResult.fromJson(response.body);
  }
}
