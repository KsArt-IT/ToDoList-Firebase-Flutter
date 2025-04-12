import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/app/bloc/auth/auth_bloc.dart';
import 'package:todo_list/core/router/app_route.dart';
import 'package:todo_list/core/router/app_router.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = context.read<AppRouter>().router;
    return MaterialApp.router(
      title: 'Todo List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            switch (state) {
              case AuthLoading():
              case AuthSuccess():
                router.go(AppRoute.home.path);

              case AuthInitial() || AuthFailure():
                router.go(AppRoute.login.path);
            }
          },
          child: child,
        );
      },
    );
  }
}
