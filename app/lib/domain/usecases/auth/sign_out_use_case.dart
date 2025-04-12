import 'package:todo_list/domain/repositories/auth/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _authRepository;

  SignOutUseCase(this._authRepository);

  Future<void> call() {
    return _authRepository.signOut();
  }
}
