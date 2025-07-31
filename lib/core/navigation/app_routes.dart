// ignore_for_file: unused_element

enum AppRoutes {
  signInView('/signInView', 'SignInView'),
  registerView('/registerView', 'RegisterView'),
  discoverView('/discoverView', 'DiscoverView');

  final String path;
  final String name;

  const AppRoutes(this.path, this.name);
}
