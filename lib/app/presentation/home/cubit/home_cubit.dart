import 'dart:developer';

import 'package:dating_app/app/data/datasource/remote/movie/i_movie_service.dart';
import 'package:dating_app/app/presentation/home/state/home_state.dart';
import 'package:dating_app/app/presentation/home/widgets/empty_movies_widget.dart';
import 'package:dating_app/core/error/view_error.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/results/view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  final IMovieService movieService = getIt.get<IMovieService>();

  Future<void> getMovieList({bool isRefresh = false}) async {
    // Refresh durumunda sayfa 1'den başla
    final currentPage = isRefresh ? 1 : state.currentPage;

    log(
      'getMovieList called - isRefresh: $isRefresh, currentPage: $currentPage',
    );

    // İlk yükleme değilse (yani zaten veri varsa) kontrolleri yap
    if (!isRefresh &&
        state.movieList.maybeWhen(
          completed: (_) => true,
          orElse: () => false,
        )) {
      if (state.hasReachedMax) {
        log('Max page reached, skipping request');
        return;
      } else if (state.movieList.maybeWhen(
        pending: (_) => true,
        orElse: () => false,
      )) {
        log('Request already pending, skipping');
        return;
      }
    }

    // İlk yükleme veya refresh ise pending state'e geç
    if (isRefresh ||
        state.movieList.maybeWhen(pending: (_) => true, orElse: () => false)) {
      log('Setting pending state and making network request');
      emit(
        state.copyWith(
          movieList: ViewState.pending(),
          currentPage: currentPage,
          hasReachedMax: false,
        ),
      );
    } else {
      log('Making network request without changing state');
      emit(state.copyWith(currentPage: currentPage, hasReachedMax: false));
    }

    final response = await movieService.getMovieList(page: currentPage);
    log('Network response received: ${response.toString()}');

    response.when(
      success: (data) {
        log(
          'Success response - data: ${data?.data?.movies?.length ?? 0} movies',
        );
        final newMovies = data?.data?.movies ?? [];
        final pagination = data?.data?.pagination;

        // Mevcut film listesini al
        final currentMovies = state.movieList.data ?? [];

        // Eğer currentPage 1 ise ve gelen data boş ise empty state göster
        if (currentPage == 1 && newMovies.isEmpty) {
          log('Empty data received for page 1, showing empty state');
          emit(
            state.copyWith(
              movieList: ViewState.empty(
                widget: EmptyMoviesWidget(onRefresh: refreshMovies),
              ),
              pagination: pagination,
              currentPage: 1,
              hasReachedMax: true,
            ),
          );
          return;
        }

        // Refresh durumunda sadece yeni verileri kullan, değilse mevcut listeye ekle
        final updatedMovies =
            isRefresh ? newMovies : [...currentMovies, ...newMovies];

        // Maksimum sayfaya ulaşılıp ulaşılmadığını kontrol et
        final hasReachedMax = pagination?.currentPage == pagination?.maxPage;
        final nextPage = currentPage + 1;

        log(
          'Emitting completed state - total movies: ${updatedMovies.length}, hasReachedMax: $hasReachedMax',
        );

        emit(
          state.copyWith(
            movieList: ViewState.completed(updatedMovies),
            pagination: pagination,
            currentPage: nextPage,
            hasReachedMax: hasReachedMax,
          ),
        );
      },
      failure: (error) {
        log('Failure response - error: ${error.handleError.response?.message}');
        emit(
          state.copyWith(
            movieList: ViewState.failed(error.handleError.response?.message),
          ),
        );
      },
    );
  }

  Future<void> loadMoreMovies() async {
    if (!state.hasReachedMax &&
        !state.movieList.maybeWhen(pending: (_) => true, orElse: () => false)) {
      log('Loading more movies...');
      await getMovieList();
    } else {
      log(
        'Skipping loadMoreMovies - hasReachedMax: ${state.hasReachedMax}, isPending: ${state.movieList.maybeWhen(pending: (_) => true, orElse: () => false)}',
      );
    }
  }

  Future<void> refreshMovies() async {
    log('Refresh movies called');
    // Refresh durumunda mevcut verileri temizleyerek yeni verileri yükle
    await getMovieList(isRefresh: true);
  }
}
