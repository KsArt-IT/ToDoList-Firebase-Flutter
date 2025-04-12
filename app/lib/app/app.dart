import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/app/app_page.dart';
import 'package:todo_list/app/bloc/auth/auth_bloc.dart';
import 'package:todo_list/core/router/app_router.dart';
import 'package:todo_list/data/repositories/auth/firebase_auth_repository.dart';
import 'package:todo_list/domain/usecases/auth_use_cases.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => AppRouter()),
        RepositoryProvider(create: (_) => FirebaseAuthRepository()),
      ],
      child: BlocProvider(
        lazy: false,
        create: (context) {
          final authRepository = context.read<FirebaseAuthRepository>();
          return AuthBloc(
            signInWithEmailAndPasswordUseCase:
                SignInWithEmailAndPasswordUseCase(authRepository),
            signUpWithEmailAndPasswordUseCase:
                SignUpWithEmailAndPasswordUseCase(authRepository),
            signInWithGoogleUseCase: SignInWithGoogleUseCase(authRepository),
            signOutUseCase: SignOutUseCase(authRepository),
            sendPasswordResetEmailUseCase: SendPasswordResetEmailUseCase(
              authRepository,
            ),
            getCurrentUserUseCase: GetCurrentUserUseCase(authRepository),
            checkIsSignInUseCase: CheckIsSignInUseCase(authRepository),
          )..add(CheckIsSignInEvent());
        },
        child: const AppPage(),
      ),
    );
  }
}
