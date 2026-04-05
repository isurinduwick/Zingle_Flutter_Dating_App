import 'package:flutter/material.dart';
import '../../domain/usecases/check_auth_usecase.dart';

class SplashViewModel extends ChangeNotifier {
  final CheckAuthUsecase _checkAuthUsecase;

  bool _isLoading = true;
  String? _errorMessage;
  String? _navigationRoute;

  SplashViewModel(this._checkAuthUsecase);

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get navigationRoute => _navigationRoute;

  Future<void> checkAuthStatus() async {
    _isLoading = true;
    _errorMessage = null;
    _navigationRoute = null;
    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 3));
      final isAuthenticated = await _checkAuthUsecase.call();

      _isLoading = false;

      if (isAuthenticated) {
        _navigationRoute = 'home';
      } else {
        _navigationRoute = 'onboarding';
      }
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Failed to load. Please try again.';
      notifyListeners();
    }
  }
}
