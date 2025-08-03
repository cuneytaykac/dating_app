import 'package:dating_app/app/components/cache_image/cached_network_image.dart';
import 'package:dating_app/app/data/model/favorite_movie_data/favorite_movie_data.dart';
import 'package:dating_app/app/presentation/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:dating_app/app/presentation/movie_detail/state/movie_detail_state.dart';
import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:dating_app/core/result_state_builder/result_state_builder.dart';
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
                _buildMovieHeader(context, movie),
                const SizedBox(height: 24),
                _buildMovieInfo(context, movie),
                const SizedBox(height: 24),
                _buildMovieDescription(context, movie),
                const SizedBox(height: 24),
                _buildCastInfo(context, movie),
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
      automaticallyImplyLeading: false,
      elevation: 0,
      shadowColor: context.theme.colorScheme.primary.withValues(alpha: 0.3),
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
                    context.theme.scaffoldBackgroundColor.withValues(
                      alpha: 0.7,
                    ),
                    context.theme.scaffoldBackgroundColor,
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
                  color: context.theme.scaffoldBackgroundColor.withValues(
                    alpha: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            // Favorite button
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor.withValues(
                    alpha: 0.5,
                  ),
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
                            ? context.theme.colorScheme.primary
                            : context.theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieHeader(BuildContext context, FavoriteMovieData movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: 'movie_title_${movie.id}',
          child: Material(
            color: Colors.transparent,
            child: Text(
              movie.title ?? 'movie_detail.movie_title'.tr(),
              style: context.theme.textTheme.headlineLarge?.copyWith(
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
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  color: context.theme.colorScheme.onSurface.withValues(
                    alpha: 0.7,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
            ],
            if (movie.runtime != null)
              Text(
                movie.runtime!,
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  color: context.theme.colorScheme.onSurface.withValues(
                    alpha: 0.7,
                  ),
                ),
              ),
          ],
        ),
        if (movie.imdbRating != null) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.star,
                color: context.theme.colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                movie.imdbRating!,
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'movie_detail.rating_out_of'.tr(),
                style: context.theme.textTheme.bodyLarge?.copyWith(
                  color: context.theme.colorScheme.onSurface.withValues(
                    alpha: 0.7,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildMovieInfo(BuildContext context, FavoriteMovieData movie) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          if (movie.genre != null)
            _buildInfoRow(context, 'movie_detail.genre'.tr(), movie.genre!),
          if (movie.director != null)
            _buildInfoRow(
              context,
              'movie_detail.director'.tr(),
              movie.director!,
            ),
          if (movie.writer != null)
            _buildInfoRow(context, 'movie_detail.writer'.tr(), movie.writer!),
          if (movie.actors != null)
            _buildInfoRow(context, 'movie_detail.actors'.tr(), movie.actors!),
          if (movie.country != null)
            _buildInfoRow(context, 'movie_detail.country'.tr(), movie.country!),
          if (movie.language != null)
            _buildInfoRow(
              context,
              'movie_detail.language'.tr(),
              movie.language!,
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: context.theme.colorScheme.onSurface.withValues(
                  alpha: 0.7,
                ),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: context.theme.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieDescription(BuildContext context, FavoriteMovieData movie) {
    return (movie.plot == null || movie.plot!.isEmpty)
        ? const SizedBox.shrink()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie_detail.summary'.tr(),
              style: context.theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              movie.plot!,
              style: context.theme.textTheme.bodyLarge?.copyWith(
                color: context.theme.colorScheme.onSurface.withValues(
                  alpha: 0.9,
                ),
                height: 1.5,
              ),
            ),
          ],
        );
  }

  Widget _buildCastInfo(BuildContext context, FavoriteMovieData movie) {
    return (movie.actors == null || movie.actors!.isEmpty)
        ? const SizedBox.shrink()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie_detail.cast'.tr(),
              style: context.theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              movie.actors!,
              style: context.theme.textTheme.bodyLarge?.copyWith(
                color: context.theme.colorScheme.onSurface.withValues(
                  alpha: 0.9,
                ),
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
              backgroundColor: context.theme.colorScheme.primary,
              foregroundColor: context.theme.colorScheme.onPrimary,
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
                  style: context.theme.textTheme.titleMedium?.copyWith(
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
              color: context.theme.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.share, color: context.theme.colorScheme.onSurface),
          ),
        ),
      ],
    );
  }
}
