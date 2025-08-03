import 'package:dating_app/app/components/bottom_navigation/custom_bottom_navigation.dart';
import 'package:dating_app/app/components/cache_image/cached_network_image.dart';
import 'package:dating_app/app/data/model/favorite_movie_data/favorite_movie_data.dart';
import 'package:dating_app/app/presentation/home/cubit/home_cubit.dart';
import 'package:dating_app/app/presentation/home/state/home_state.dart';
import 'package:dating_app/core/mixins/theme_mixin.dart';
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
      child: Stack(
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    context.read<HomeCubit>().loadMoreMovies();
                  }
                  return true;
                },
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 120,
                      pinned: true,
                      leading: IconButton(
                        onPressed:
                            () =>
                                context.pushNamed(AppRoutes.discoverView.name),
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: ColorName.appWhite.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color:
                                  context.theme.brightness == Brightness.dark
                                      ? Colors.white.withValues(alpha: 0.5)
                                      : Colors.black.withValues(alpha: 0.5),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color:
                                context.theme.brightness == Brightness.dark
                                    ? ColorName.appWhite
                                    : ColorName.appBlack,
                            size: 20,
                          ),
                        ),
                      ),
                      automaticallyImplyLeading: false,
                      backgroundColor: context.theme.scaffoldBackgroundColor,
                      elevation: 0,
                      shadowColor: context.theme.colorScheme.primary.withValues(
                        alpha: 0.3,
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          'home.title'.tr(),
                          style: context.theme.textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        centerTitle: true,
                        background: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                context.theme.colorScheme.primary.withValues(
                                  alpha: 0.1,
                                ),
                                context.theme.scaffoldBackgroundColor,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    _buildSliverContent(context, state),
                  ],
                ),
              );
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
    );
  }

  Widget _buildSliverContent(BuildContext context, HomeState state) {
    return SliverToBoxAdapter(
      child: ResultStateBuilder(
        resultState: state.movieList,
        completed: (movies) => _buildMovieList(context, movies),
      ),
    );
  }

  Widget _buildMovieList(BuildContext context, List<FavoriteMovieData> movies) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 100, left: 20, right: 20),
      child: Column(
        children: [
          ...movies.map((movie) => MovieCardWidget(movie: movie)),
          const LoadMoreIndicatorWidget(),
        ],
      ),
    );
  }
}
