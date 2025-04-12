import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/domain/repositories/auth/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository _authRepository;

  GetCurrentUserUseCase(this._authRepository);

  Future<User?> call() {
    return _authRepository.getCurrentUser();
  }
}
