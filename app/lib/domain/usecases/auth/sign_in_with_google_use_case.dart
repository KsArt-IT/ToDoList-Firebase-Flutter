import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/domain/repositories/auth/auth_repository.dart';

class SignInWithGoogleUseCase {
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase(this._authRepository);

  Future<User?> call() async {
    return await _authRepository.signInWithGoogle();
  }
}
