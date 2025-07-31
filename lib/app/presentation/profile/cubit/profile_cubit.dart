import 'package:bloc/bloc.dart';
import 'package:dating_app/app/data/model/movie/movie.dart';
import 'package:dating_app/app/presentation/profile/state/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  void loadLikedMovies() {
    emit(state.copyWith(isLoading: true));

    // Simulated API call
    Future.delayed(const Duration(seconds: 1), () {
      final movies = [
        const Movie(
          id: '1',
          title: 'Aşk, Ekmek, Hayaller',
          productionCompany: 'Adam Yapım',
          imageUrl:
              'https://images.unsplash.com/photo-1542856391-010fb87dcfed?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbHBhcGVycyUyMGhkfGVufDB8fDB8fHww',
        ),
        const Movie(
          id: '2',
          title: 'Gece Karanlık',
          productionCompany: 'Fox Studios',
          imageUrl:
              'https://images.unsplash.com/photo-1542856391-010fb87dcfed?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbHBhcGVycyUyMGhkfGVufDB8fDB8fHww',
        ),
        const Movie(
          id: '3',
          title: 'Aşk, Ekmek, Hayaller',
          productionCompany: 'Adam Yapım',
          imageUrl:
              'https://images.unsplash.com/photo-1542856391-010fb87dcfed?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbHBhcGVycyUyMGhkfGVufDB8fDB8fHww',
        ),
        const Movie(
          id: '4',
          title: 'Gece Karanlık',
          productionCompany: 'Fox Studios',
          imageUrl:
              'https://images.unsplash.com/photo-1542856391-010fb87dcfed?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbHBhcGVycyUyMGhkfGVufDB8fDB8fHww',
        ),
        const Movie(
          id: '5',
          title: 'Gece Karanlık',
          productionCompany: 'Fox Studios',
          imageUrl:
              'https://images.unsplash.com/photo-1542856391-010fb87dcfed?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbHBhcGVycyUyMGhkfGVufDB8fDB8fHww',
        ),
        const Movie(
          id: '6',
          title: 'Gece Karanlık',
          productionCompany: 'Fox Studios',
          imageUrl:
              'https://images.unsplash.com/photo-1542856391-010fb87dcfed?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbHBhcGVycyUyMGhkfGVufDB8fDB8fHww',
        ),
      ];

      emit(state.copyWith(likedMovies: movies, isLoading: false));
    });
  }

  void addLikedMovie(Movie movie) {
    final updatedMovies = [...state.likedMovies, movie];
    emit(state.copyWith(likedMovies: updatedMovies));
  }

  void removeLikedMovie(String movieId) {
    final updatedMovies =
        state.likedMovies.where((movie) => movie.id != movieId).toList();
    emit(state.copyWith(likedMovies: updatedMovies));
  }
}
