import 'package:dating_app/app/data/datasource/remote/movie/i_movie_service.dart';
import 'package:dating_app/app/presentation/movie_detail/state/movie_detail_state.dart';
import 'package:dating_app/core/error/view_error.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/results/view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailState.initial());
  final IMovieService movieService = getIt.get<IMovieService>();

  Future<void> getMovieDetail(String movieId) async {
    emit(state.copyWith(movieDetail: ViewState.pending()));

    final response = await movieService.getFavoriteDetail(id: movieId);

    response.when(
      success: (data) {
        emit(
          state.copyWith(movieDetail: ViewState.completed(data?.data?.movie)),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            movieDetail: ViewState.failed(error.handleError.response?.message),
          ),
        );
      },
    );
  }
}
