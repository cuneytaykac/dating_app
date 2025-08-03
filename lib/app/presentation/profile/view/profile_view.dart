import 'dart:ui';

import 'package:dating_app/app/components/app_bar/custom_app_bar.dart';
import 'package:dating_app/app/components/bottom_navigation/custom_bottom_navigation.dart';
import 'package:dating_app/app/components/cache_image/cached_network_image.dart';
import 'package:dating_app/app/data/model/favorite_movie_data/favorite_movie_data.dart';
import 'package:dating_app/app/data/model/sign_in/sign_in.dart';
import 'package:dating_app/app/presentation/profile/cubit/profile_cubit.dart';
import 'package:dating_app/app/presentation/profile/state/profile_state.dart';
import 'package:dating_app/app/presentation/profile/view/widgets/limited_offer_modal.dart';
import 'package:dating_app/core/mixins/theme_mixin.dart';
import 'package:dating_app/core/navigation/app_routes.dart';
import 'package:dating_app/core/result_state_builder/result_state_builder.dart';
import 'package:dating_app/core/utility/cache/cache_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moon_extension/moon_extension.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getfavoriteMovies(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'profile.title'.tr(),
          showBackButton: true,
          showLimitedOffer: true,
          limitedOfferText: 'profile.limited_offer'.tr(),
          onBackPressed: () => Navigator.of(context).pop(),
          onLimitedOfferPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: context.theme.colorScheme.surface.withValues(
                alpha: 0.5,
              ),
              builder:
                  (context) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: const LimitedOfferModal(),
                  ),
            );
          },
        ),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: _body(context),
      ),
    );
  }

  Stack _body(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildProfileCard(context),
              const SizedBox(height: 30),
              Expanded(child: _buildLikedMoviesSection()),
              const SizedBox(height: 30),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomBottomNavigation(currentIndex: 1),
        ),
      ],
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero,
      child: ValueListenableBuilder(
        valueListenable: HiveHelper.shared.listenable<SignIn>(
          boxName: HiveHelper.signInBoxKey,
        ),
        builder:
            (BuildContext context, value, Widget? child) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: cachedNetworkImage(
                  value.values.first.photoUrl ?? "",
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                ),
              ),
              title: Text(
                value.values.first.name ?? "",
                style: context.theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'ID: ${value.values.first.id}',
                style: context.theme.textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.onSurface.withValues(
                    alpha: 0.5,
                  ),
                ),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.createProfilePictureView.name);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.colorScheme.primary,
                  foregroundColor: context.theme.colorScheme.onPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  'profile.add_photo'.tr(),
                  style: context.theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
      ),
    );
  }

  Widget _buildLikedMoviesSection() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ResultStateBuilder(
          resultState: state.getFavorites,
          completed:
              (data) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'profile.liked_movies'.tr(),
                    style: context.theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.6,
                          ),
                      itemCount: data?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final movie = data?.data?[index];
                        return _buildMovieCard(
                          movie: movie ?? FavoriteMovieData(),
                          context: context,
                        );
                      },
                    ),
                  ),
                ],
              ),
        );
      },
    );
  }

  Widget _buildMovieCard({
    required FavoriteMovieData movie,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.movieDetailView.path, extra: movie.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: context.screenHeight(.26),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Hero(
                tag: 'movie_poster_${movie.id}',
                child: cachedNetworkImage(
                  movie.images?.first ?? "",
                  width: double.infinity,
                  fit: BoxFit.fill,
                  height: context.screenHeight(.26),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'movie_title_${movie.id}',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        movie.title ?? "",
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    movie.director ?? "",
                    style: context.theme.textTheme.labelSmall?.copyWith(
                      color: context.theme.colorScheme.onSurface.withValues(
                        alpha: 0.7,
                      ),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
