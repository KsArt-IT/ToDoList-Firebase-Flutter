enum AppRoute {
  splash,
  login,
  registration,
  resetPassword,
  home,
  edit,
  profile,
  settings, //
}

extension AppRoutePath on AppRoute {
  String get path => switch (this) {
    AppRoute.home => '/',
    AppRoute.splash => '/splash',
    AppRoute.login => '/login',
    AppRoute.registration => '/registration',
    AppRoute.resetPassword => '/reset_password',
    AppRoute.edit => '/edit',
    AppRoute.profile => '/profile',
    AppRoute.settings => '/settings',
  };
}
