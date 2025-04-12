part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class SignUpWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class SignInWithGoogleEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class SendPasswordResetEmailEvent extends AuthEvent {
  final String email;

  SendPasswordResetEmailEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class CheckIsSignInEvent extends AuthEvent {}

class GetCurrentUserEvent extends AuthEvent {}
