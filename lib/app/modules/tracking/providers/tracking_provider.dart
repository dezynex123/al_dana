import 'dart:convert';
import 'package:al_dana/app/data/constants/api_routes.dart';
import 'package:al_dana/app/data/models/tracking_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../data/constants/common.dart';
import '../../../data/constants/keys.dart';

class TrackingProvider extends ChangeNotifier {
  Tracking? _tracking;
  bool _isLoading = true;
  bool _hasError = false;

  Tracking? get tracking => _tracking;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> fetchTracking(
    String bookingId,
  ) async {
    try {
      _isLoading = true;
      final response = await http.get(
        Uri.parse("$apiGetTracking/$bookingId"),
        headers: <String, String>{
          'Authorization': 'Bearer ${storage.read(auth)}',
        },
      );
      if (response.statusCode == 200) {
        _tracking = Tracking.fromJson(
          jsonDecode(response.body),
        );
        _hasError = false;
      } else {
        _tracking = null;
        _hasError = true;
      }
    } catch (_) {
      _tracking = null;
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
