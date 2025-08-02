import 'package:dating_app/app/data/datasource/remote/movie/i_movie_service.dart';
import 'package:dating_app/app/presentation/profile/state/profile_state.dart';
import 'package:dating_app/app/presentation/profile/view/widgets/empty_favorites_widget.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/results/view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.initial());
  final IMovieService movieService = getIt.get<IMovieService>();

  Future<void> getfavoriteMovies() async {
    emit(state.copyWith(getFavorites: ViewState.pending()));

    final response = await movieService.getFavorites();

    response.when(
      success: (data) {
        if (data?.data?.isNotEmpty ?? false) {
          emit(state.copyWith(getFavorites: ViewState.completed(data)));
        } else {
          emit(
            state.copyWith(
              getFavorites: ViewState.empty(
                widget: const EmptyFavoritesWidget(),
              ),
            ),
          );
        }
      },
      failure: (error) {
        emit(
          state.copyWith(
            getFavorites: ViewState.failed(error.localizedErrorMessage),
          ),
        );
      },
    );
  }
}
