import 'package:flutter/material.dart';
import '../../domain/usecases/check_auth_usecase.dart';

class SplashViewModel extends ChangeNotifier {
  final CheckAuthUsecase _checkAuthUsecase;

  bool _isLoading = true;
  String? _errorMessage;

  SplashViewModel(this._checkAuthUsecase);

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> checkAuthStatus() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 3));
      final isAuthenticated = await _checkAuthUsecase.call();

      _isLoading = false;

      if (isAuthenticated) {
        // Navigate to Home
        _navigateTo('home');
      } else {
        // Navigate to Login
        _navigateTo('login');
      }
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to load. Please try again.';
      notifyListeners();
    }
  }

  void _navigateTo(String route) {
    // Navigation will be handled by the page itself
    notifyListeners();
  }
}
