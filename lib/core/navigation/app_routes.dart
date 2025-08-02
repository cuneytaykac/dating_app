// ignore_for_file: unused_element

enum AppRoutes {
  signInView('/signInView', 'SignInView'),
  registerView('/registerView', 'RegisterView'),
  discoverView('/discoverView', 'DiscoverView'),
  profileView('/profileView', 'ProfileView'),
  homeView('/homeView', 'HomeView'),
  createProfilePictureView(
    '/createProfilePictureView',
    'CreateProfilePictureView',
  ),
  movieDetailView('/movieDetailView', 'MovieDetailView');

  final String path;
  final String name;

  const AppRoutes(this.path, this.name);
}
