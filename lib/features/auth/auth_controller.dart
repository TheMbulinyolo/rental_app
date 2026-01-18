import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<void> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (email != "eddy@gmail.com" || password != "TheVie@243") {
        errorMessage = "Email ou mot de passe incorrect";
        print("Login échoué");
      } else {
        print("Login réussi");
      }
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> singin(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      print("Inscription réussie");
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
