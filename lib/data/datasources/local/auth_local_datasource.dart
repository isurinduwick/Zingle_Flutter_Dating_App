import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatasource {
  Future<bool> isUserAuthenticated();
  Future<void> logout();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferences sharedPreferences;

  AuthLocalDatasourceImpl(this.sharedPreferences);

  @override
  Future<bool> isUserAuthenticated() async {
    final token = sharedPreferences.getString('auth_token');
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> logout() async {
    await sharedPreferences.remove('auth_token');
  }
}
