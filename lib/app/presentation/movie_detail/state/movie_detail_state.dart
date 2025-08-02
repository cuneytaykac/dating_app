import 'package:dating_app/app/data/model/favorite_movie_data/favorite_movie_data.dart';
import 'package:dating_app/core/error/view_error.dart';
import 'package:dating_app/core/results/view_state.dart';

class MovieDetailState {
  final ViewState<FavoriteMovieData?, ViewError> movieDetail;

  const MovieDetailState({required this.movieDetail});

  factory MovieDetailState.initial() {
    return MovieDetailState(movieDetail: ViewState.idle());
  }

  MovieDetailState copyWith({
    ViewState<FavoriteMovieData?, ViewError>? movieDetail,
  }) {
    return MovieDetailState(movieDetail: movieDetail ?? this.movieDetail);
  }
}
