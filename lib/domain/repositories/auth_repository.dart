abstract class AuthRepository {
  Future<bool> isUserAuthenticated();
  Future<void> logout();
}
