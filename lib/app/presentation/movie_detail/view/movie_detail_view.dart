import 'package:dating_app/app/components/cache_image/cached_network_image.dart';
import 'package:dating_app/app/data/model/favorite_movie_data/favorite_movie_data.dart';
import 'package:dating_app/app/presentation/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:dating_app/app/presentation/movie_detail/state/movie_detail_state.dart';
import 'package:dating_app/core/result_state_builder/result_state_builder.dart';
import 'package:dating_app/gen/colors.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_extension/moon_extension.dart';

class MovieDetailView extends StatelessWidget {
  final String movieId;

  const MovieDetailView({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailCubit()..getMovieDetail(movieId),
      child: Scaffold(
        backgroundColor: ColorName.appBlack,
        body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            return ResultStateBuilder(
              resultState: state.movieDetail,
              completed: (movie) => _buildMovieDetail(context, movie!),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMovieDetail(BuildContext context, FavoriteMovieData movie) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(context, movie),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMovieHeader(movie),
                const SizedBox(height: 24),
                _buildMovieInfo(movie),
                const SizedBox(height: 24),
                _buildMovieDescription(movie),
                const SizedBox(height: 24),
                _buildCastInfo(movie),
                const SizedBox(height: 24),
                _buildActionButtons(context),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSliverAppBar(BuildContext context, FavoriteMovieData movie) {
    return SliverAppBar(
      expandedHeight: context.screenHeight(.5),
      pinned: true,
      backgroundColor: ColorName.appBlack,
      elevation: 0,
      shadowColor: ColorName.appKUCrimson.withValues(alpha: 0.3),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Film poster resmi
            Hero(
              tag: 'movie_poster_${movie.id}',
              child: cachedNetworkImage(
                movie.images?.first ?? movie.poster ?? '',
                fit: BoxFit.cover,
              ),
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    ColorName.appBlack.withValues(alpha: 0.7),
                    ColorName.appBlack,
                  ],
                ),
              ),
            ),
            // Back button
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorName.appBlack.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back, color: ColorName.appWhite),
                ),
              ),
            ),
            // Favorite button
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorName.appBlack.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    movie.isFavorite == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color:
                        movie.isFavorite == true
                            ? ColorName.appKUCrimson
                            : ColorName.appWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieHeader(FavoriteMovieData movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: 'movie_title_${movie.id}',
          child: Material(
            color: Colors.transparent,
            child: Text(
              movie.title ?? 'movie_detail.movie_title'.tr(),
              style: const TextStyle(
                color: ColorName.appWhite,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            if (movie.year != null) ...[
              Text(
                movie.year!,
                style: TextStyle(
                  color: ColorName.appWhite.withValues(alpha: 0.7),
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 4,
                height: 4,
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
                  fontSize: 16,
                ),
              ),
          ],
        ),
        if (movie.imdbRating != null) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.star, color: ColorName.appKUCrimson, size: 20),
              const SizedBox(width: 4),
              Text(
                movie.imdbRating!,
                style: const TextStyle(
                  color: ColorName.appWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'movie_detail.rating_out_of'.tr(),
                style: TextStyle(
                  color: ColorName.appWhite.withValues(alpha: 0.7),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildMovieInfo(FavoriteMovieData movie) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorName.appVampireBlack,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          if (movie.genre != null)
            _buildInfoRow('movie_detail.genre'.tr(), movie.genre!),
          if (movie.director != null)
            _buildInfoRow('movie_detail.director'.tr(), movie.director!),
          if (movie.writer != null)
            _buildInfoRow('movie_detail.writer'.tr(), movie.writer!),
          if (movie.actors != null)
            _buildInfoRow('movie_detail.actors'.tr(), movie.actors!),
          if (movie.country != null)
            _buildInfoRow('movie_detail.country'.tr(), movie.country!),
          if (movie.language != null)
            _buildInfoRow('movie_detail.language'.tr(), movie.language!),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                color: ColorName.appWhite.withValues(alpha: 0.7),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: ColorName.appWhite, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieDescription(FavoriteMovieData movie) {
    return (movie.plot == null || movie.plot!.isEmpty)
        ? const SizedBox.shrink()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie_detail.summary'.tr(),
              style: const TextStyle(
                color: ColorName.appWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              movie.plot!,
              style: TextStyle(
                color: ColorName.appWhite.withValues(alpha: 0.9),
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        );
  }

  Widget _buildCastInfo(FavoriteMovieData movie) {
    return (movie.actors == null || movie.actors!.isEmpty)
        ? const SizedBox.shrink()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie_detail.cast'.tr(),
              style: const TextStyle(
                color: ColorName.appWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              movie.actors!,
              style: TextStyle(
                color: ColorName.appWhite.withValues(alpha: 0.9),
                fontSize: 16,
              ),
            ),
          ],
        );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorName.appKUCrimson,
              foregroundColor: ColorName.appWhite,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.play_arrow),
                const SizedBox(width: 8),
                Text(
                  'movie_detail.watch'.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorName.appWhite.withValues(alpha: 0.3),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, color: ColorName.appWhite),
          ),
        ),
      ],
    );
  }
}
