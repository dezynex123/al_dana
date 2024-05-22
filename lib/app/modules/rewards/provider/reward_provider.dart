import 'dart:convert';
import 'dart:developer';
import 'package:al_dana/app/data/constants/api_routes.dart';
import 'package:al_dana/app/data/models/reward.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../data/constants/common.dart';
import '../../../data/constants/keys.dart';

class RewardProvider extends ChangeNotifier {
  Reward? _reward;
  bool _isLoading = true;
  bool _hasError = false;

  Reward? get reward => _reward;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> fetchReward(String customerId) async {
    try {
      _isLoading = true;
      final response = await http.get(
        Uri.parse('$apiGetRewards/$customerId'),
        headers: <String, String>{
          'Authorization': 'Bearer ${storage.read(auth)}',
        },
      );
      if (response.statusCode == 200) {
        _reward = Reward.fromJson(
          jsonDecode(response.body),
        );
        _hasError = false;
      }
    } catch (error) {
      log(error.toString());
      _reward = null;
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
