import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (email != "eddy@gmail.com" || password != "TheVie@243") {
        errorMessage = "Email ou mot de passe incorrect";
        print("Login échoué");
        return false;
      } else {
        print("Login réussi");
        return true ;
      }
    } catch (error) {
      errorMessage = error.toString();
      return false ;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> singin(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      print("Inscription réussie");
      return true;

    } catch (error) {
      errorMessage = error.toString();
      return false ;

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
