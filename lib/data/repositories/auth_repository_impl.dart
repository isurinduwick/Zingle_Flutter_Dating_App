import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl(this.localDatasource);

  @override
  Future<bool> isUserAuthenticated() async {
    return await localDatasource.isUserAuthenticated();
  }

  @override
  Future<void> logout() async {
    await localDatasource.logout();
  }
}
