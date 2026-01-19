import 'package:flutter/material.dart';
import 'data/models/house_model.dart';
import 'data/services/home_api_service.dart';

class HomeController extends ChangeNotifier {
  final HomeApiService _service = HomeApiService();

  List<House> houses = [];
  bool isLoading = false;
  String? error;

  Future<void> loadHouses({String? search}) async {
    isLoading = true;
    notifyListeners();

    try {
      houses = await _service.fetchHouses(search: search);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
