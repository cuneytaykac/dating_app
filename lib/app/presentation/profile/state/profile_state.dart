import 'package:dating_app/app/data/model/movie/movie.dart';

class ProfileState {
  final List<Movie> likedMovies;
  final bool isLoading;
  final String? error;

  const ProfileState({
    this.likedMovies = const [],
    this.isLoading = false,
    this.error,
  });

  ProfileState copyWith({
    List<Movie>? likedMovies,
    bool? isLoading,
    String? error,
  }) {
    return ProfileState(
      likedMovies: likedMovies ?? this.likedMovies,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
