import 'dart:convert';
import 'package:al_dana/app/data/constants/api_routes.dart';
import 'package:al_dana/app/data/models/vat_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/common.dart';
import '../constants/keys.dart';

class VATProvider extends ChangeNotifier {
  Vat? _vat;
  bool _isLoading = true;
  bool _hasError = false;

  Vat? get vat => _vat;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> fetchVAT() async {
    try {
      _isLoading = true;
      final response = await http.get(
        Uri.parse(apiGetVat),
        headers: <String, String>{
          'Authorization': 'Bearer ${storage.read(auth)}',
        },
      );
      if (response.statusCode == 200) {
        _vat = Vat.fromJson(jsonDecode(response.body));
        _hasError = false;
      } else {
        _vat = null;
        _hasError = true;
      }
    } catch (_) {
      _vat = null;
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
