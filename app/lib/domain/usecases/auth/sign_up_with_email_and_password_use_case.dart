import 'package:todo_list/domain/repositories/auth/auth_repository.dart';

class SignUpWithEmailAndPasswordUseCase {
  final AuthRepository _authRepository;

  SignUpWithEmailAndPasswordUseCase(this._authRepository);

  Future<void> call({required String email, required String password}) async {
    await _authRepository.signUpWithEmailAndPassword(email, password);
  }
}
