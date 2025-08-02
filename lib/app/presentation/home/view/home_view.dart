import 'dart:developer';

import 'package:dating_app/app/components/app_bar/custom_app_bar.dart';
import 'package:dating_app/app/components/bottom_navigation/custom_bottom_navigation.dart';
import 'package:dating_app/app/components/cache_image/cached_network_image.dart';
import 'package:dating_app/app/data/model/favorite_movie_data/favorite_movie_data.dart';
import 'package:dating_app/app/presentation/home/cubit/home_cubit.dart';
import 'package:dating_app/app/presentation/home/state/home_state.dart';
import 'package:dating_app/core/result_state_builder/result_state_builder.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getMovieList(),
      child: Scaffold(
        appBar: CustomAppBar(
          showBackButton: false,
          title: 'Anasayfa',
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
      completed: (movies) => _buildMovieList(context, movies),
    );
  }

  Widget _buildMovieList(BuildContext context, List<FavoriteMovieData> movies) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          context.read<HomeCubit>().loadMoreMovies();
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          log("2222");
          await context.read<HomeCubit>().refreshMovies();
        },
        color: ColorName.appKUCrimson,
        backgroundColor: ColorName.appBlack,
        child: ListView.builder(
          padding: const EdgeInsets.only(
            top: 60,
            bottom: 100,
            left: 20,
            right: 20,
          ),
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            if (index == movies.length) {
              // Son öğe - load more indicator
              return _buildLoadMoreIndicator(context);
            }
            return _buildMovieCard(context, movies[index]);
          },
        ),
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, FavoriteMovieData movie) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: ColorName.appVampireBlack,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorName.appKUCrimson.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Film poster resmi
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: cachedNetworkImage(movie.poster ?? '', fit: BoxFit.cover),
            ),
          ),
          // Film bilgileri
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Film başlığı
                Text(
                  movie.title ?? 'Film Başlığı',
                  style: const TextStyle(
                    color: ColorName.appWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Film yılı ve süresi
                Row(
                  children: [
                    if (movie.year != null) ...[
                      Text(
                        movie.year!,
                        style: TextStyle(
                          color: ColorName.appWhite.withValues(alpha: 0.7),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 3,
                        height: 3,
                        decoration: const BoxDecoration(
                          color: ColorName.appKUCrimson,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    if (movie.runtime != null)
                      Text(
                        movie.runtime!,
                        style: TextStyle(
                          color: ColorName.appWhite.withValues(alpha: 0.7),
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                // IMDB puanı
                if (movie.imdbRating != null)
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: ColorName.appKUCrimson,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.imdbRating!,
                        style: const TextStyle(
                          color: ColorName.appWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 12),
                // Detay butonu
                GestureDetector(
                  onTap: () {
                    context.push('/movie-detail/${movie.id}');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: ColorName.appKUCrimson,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Detayları Gör',
                      style: TextStyle(
                        color: ColorName.appWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadMoreIndicator(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.hasReachedMax) {
          return const Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Tüm filmler yüklendi',
                style: TextStyle(color: ColorName.appWhite, fontSize: 16),
              ),
            ),
          );
        }

        // Sadece gerçekten loading olduğunda göster
        if (state.movieList.maybeWhen(
          pending: (_) => true,
          orElse: () => false,
        )) {
          return const Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: CircularProgressIndicator(color: ColorName.appKUCrimson),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
