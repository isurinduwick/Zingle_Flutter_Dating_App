import '../repositories/auth_repository.dart';

class CheckAuthUsecase {
  final AuthRepository repository;

  CheckAuthUsecase(this.repository);

  Future<bool> call() async {
    return await repository.isUserAuthenticated();
  }
}
