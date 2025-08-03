import 'package:dating_app/app/components/app_bar/custom_app_bar.dart';
import 'package:dating_app/app/components/bottom_navigation/custom_bottom_navigation.dart';
import 'package:dating_app/app/components/cache_image/cached_network_image.dart';
import 'package:dating_app/app/data/model/favorite_movie_data/favorite_movie_data.dart';
import 'package:dating_app/app/presentation/home/cubit/home_cubit.dart';
import 'package:dating_app/app/presentation/home/state/home_state.dart';
import 'package:dating_app/core/navigation/app_routes.dart';
import 'package:dating_app/core/result_state_builder/result_state_builder.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part '../widgets/load_more_indicator_widget.dart';
part '../widgets/movie_card_widget.dart';
part '../widgets/movie_list_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getMovieList(),
      child: Scaffold(
        appBar: CustomAppBar(
          showBackButton: false,
          title: 'home.title'.tr(),
          backgroundColor: ColorName.appBlack,
        ),
        backgroundColor: ColorName.appBlack,
        body: Stack(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return _buildRefreshableContent(context, state);
              },
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavigation(currentIndex: 0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRefreshableContent(BuildContext context, HomeState state) {
    return ResultStateBuilder(
      resultState: state.movieList,
      completed: (movies) => MovieListWidget(movies: movies),
    );
  }
}
