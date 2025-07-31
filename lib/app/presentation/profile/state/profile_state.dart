import 'package:dating_app/app/data/model/favorite_movie_response/favorite_movie_response.dart';
import 'package:dating_app/core/error/view_error.dart';
import 'package:dating_app/core/results/view_state.dart';

class ProfileState {
  final ViewState<FavoriteMovieResponse?, ViewError> getFavorites;

  const ProfileState({required this.getFavorites});

  factory ProfileState.initial() {
    return ProfileState(getFavorites: ViewState.idle());
  }

  ProfileState copyWith({
    ViewState<FavoriteMovieResponse?, ViewError>? getFavorites,
  }) {
    return ProfileState(getFavorites: getFavorites ?? this.getFavorites);
  }
}
