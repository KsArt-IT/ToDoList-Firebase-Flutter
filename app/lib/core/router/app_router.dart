import 'package:go_router/go_router.dart';
import 'package:todo_list/presentation/pages.dart';

import 'app_route.dart';

final class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: AppRoute.splash.path,
    routes: [
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoute.registration.path,
        name: AppRoute.registration.name,
        builder: (context, state) => const RegistrationPage(),
      ),
      GoRoute(
        path: AppRoute.resetPassword.path,
        name: AppRoute.resetPassword.name,
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: AppRoute.edit.path,
        name: AppRoute.edit.name,
        builder: (context, state) => const EditPage(),
      ),
      GoRoute(
        path: AppRoute.profile.path,
        name: AppRoute.profile.name,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: AppRoute.settings.path,
        name: AppRoute.settings.name,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );

  AppRouter();
}
