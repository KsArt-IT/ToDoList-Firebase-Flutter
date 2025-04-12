part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User? user;

  AuthSuccess({this.user});

  @override
  List<Object?> get props => [user];
}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
