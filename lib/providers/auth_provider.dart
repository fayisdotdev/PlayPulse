import 'package:flutter/material.dart';
import '../services/firebase_auth_service.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuthService _authService = FirebaseAuthService();
  UserModel? user;

  bool get isLoggedIn => user != null;

  // LOGIN
  Future<bool> signIn(String email, String password) async {
    user = await _authService.signIn(email, password);
    notifyListeners();
    return user != null;
  }

  // SIGNUP
  Future<bool> signUp(String name, String email, String password) async {
    user = await _authService.signUp(name, email, password);
    notifyListeners();
    return user != null;
  }

  void signOut() async {
    await _authService.signOut();
    user = null;
    notifyListeners();
  }
}
