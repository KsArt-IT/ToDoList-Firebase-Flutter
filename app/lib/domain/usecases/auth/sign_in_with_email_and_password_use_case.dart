import 'package:todo_list/domain/repositories/auth/auth_repository.dart';

class SignInWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;

  SignInWithEmailAndPasswordUseCase(this._authRepository);

  Future<void> call({required String email, required String password}) async {
    await _authRepository.signInWithEmailAndPassword(email, password);
  }
}
