import 'package:dating_app/app/data/model/favorite_movie_data/favorite_movie_data.dart';
import 'package:dating_app/app/data/model/pagination/pagination.dart';
import 'package:dating_app/core/error/view_error.dart';
import 'package:dating_app/core/results/view_state.dart';

class HomeState {
  final ViewState<List<FavoriteMovieData>, ViewError> movieList;
  final Pagination? pagination;
  final int currentPage;
  final bool hasReachedMax;

  const HomeState({
    required this.movieList,
    this.pagination,
    required this.currentPage,
    required this.hasReachedMax,
  });

  factory HomeState.initial() {
    return HomeState(
      movieList: ViewState.pending(),
      pagination: null,
      currentPage: 1,
      hasReachedMax: false,
    );
  }

  HomeState copyWith({
    ViewState<List<FavoriteMovieData>, ViewError>? movieList,
    Pagination? pagination,
    int? currentPage,
    bool? hasReachedMax,
  }) {
    return HomeState(
      movieList: movieList ?? this.movieList,
      pagination: pagination ?? this.pagination,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
