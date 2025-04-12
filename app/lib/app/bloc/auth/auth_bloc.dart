import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list/domain/usecases/auth_use_cases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase signUpWithEmailAndPasswordUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SignOutUseCase signOutUseCase;
  final SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final CheckIsSignInUseCase checkIsSignInUseCase;

  AuthBloc({
    required this.signInWithEmailAndPasswordUseCase,
    required this.signUpWithEmailAndPasswordUseCase,
    required this.signInWithGoogleUseCase,
    required this.signOutUseCase,
    required this.sendPasswordResetEmailUseCase,
    required this.getCurrentUserUseCase,
    required this.checkIsSignInUseCase,
  }) : super(AuthInitial()) {
    on<SignInWithEmailAndPasswordEvent>(_onSignInWithEmailAndPassword);
    on<SignUpWithEmailAndPasswordEvent>(_onSignUpWithEmailAndPassword);
    on<SignInWithGoogleEvent>(_onSignInWithGoogle);
    on<SignOutEvent>(_onSignOut);
    on<SendPasswordResetEmailEvent>(_onSendPasswordResetEmail);
    on<GetCurrentUserEvent>(_onGetCurrentUser);
    on<CheckIsSignInEvent>(_onCheckIsSignIn);
  }

  Future<void> _onSignInWithEmailAndPassword(
    SignInWithEmailAndPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await signInWithEmailAndPasswordUseCase(
        email: event.email,
        password: event.password,
      );
      final user = await getCurrentUserUseCase();
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onSignUpWithEmailAndPassword(
    SignUpWithEmailAndPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await signUpWithEmailAndPasswordUseCase(
        email: event.email,
        password: event.password,
      );
      final user = await getCurrentUserUseCase();
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onSignInWithGoogle(
    SignInWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await signInWithGoogleUseCase();
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onSignOut(
    SignOutEvent event,
    Emitter<AuthState> emit, //
  ) async {
    emit(AuthLoading());
    try {
      await signOutUseCase();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onSendPasswordResetEmail(
    SendPasswordResetEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await sendPasswordResetEmailUseCase(email: event.email);
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onGetCurrentUser(
    GetCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await getCurrentUserUseCase();
      if (user != null) {
        emit(AuthSuccess(user: user));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _onCheckIsSignIn(
    CheckIsSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final isSignIn = await checkIsSignInUseCase();
      if (isSignIn) {
        final user = await getCurrentUserUseCase();
        emit(AuthSuccess(user: user));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
