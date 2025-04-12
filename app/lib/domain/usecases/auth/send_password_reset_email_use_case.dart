import 'package:todo_list/domain/repositories/auth/auth_repository.dart';

class SendPasswordResetEmailUseCase {
  final AuthRepository _authRepository;

  SendPasswordResetEmailUseCase(this._authRepository);

  Future<void> call({required String email}) {
    return _authRepository.sendPasswordResetEmail(email);
  }
}
