// ignore_for_file: unused_element

enum AppRoutes {
  splashView('/splashView', 'SplashView'),
  signInView('/signInView', 'SignInView'),
  registerView('/registerView', 'RegisterView');

  final String path;
  final String name;

  const AppRoutes(this.path, this.name);
}
