import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthViewModel extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _otp;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get otp => _otp;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    // Simulate login
    await Future.delayed(const Duration(seconds: 1));
    _user = UserModel(id: '1', name: 'Test User', email: email);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();
    // Simulate registration
    await Future.delayed(const Duration(seconds: 1));
    _user = UserModel(id: '2', name: name, email: email);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> sendOtp(String phone) async {
    _isLoading = true;
    notifyListeners();
    // Simulate sending OTP
    await Future.delayed(const Duration(seconds: 1));
    _otp = '123456';
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> verifyOtp(String inputOtp) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    _isLoading = false;
    notifyListeners();
    return inputOtp == _otp;
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
