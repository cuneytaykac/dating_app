import 'package:dating_app/app/components/app_bar/custom_app_bar.dart';
import 'package:dating_app/app/components/bottom_navigation/custom_bottom_navigation.dart';
import 'package:dating_app/app/components/cache_image/cached_network_image.dart';
import 'package:dating_app/app/data/model/movie/movie.dart';
import 'package:dating_app/app/presentation/profile/cubit/profile_cubit.dart';
import 'package:dating_app/app/presentation/profile/state/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..loadLikedMovies(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Profil Detayı',
          showBackButton: true,
          showLimitedOffer: true,
          limitedOfferText: 'Sınırlı Teklif',
          onBackPressed: () => Navigator.of(context).pop(),
          onLimitedOfferPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sınırlı teklif tıklandı!'),
                backgroundColor: Color(0xFFE53E3E),
              ),
            );
          },
          backgroundColor: const Color(0xFF1A1A1A),
          titleColor: Colors.white,
          backButtonColor: const Color(0xFF2A2A2A),
          limitedOfferColor: const Color(0xFFE53E3E),
        ),
        backgroundColor: const Color(0xFF1A1A1A),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildProfileCard(),
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
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: SizedBox(
            width: 50,
            height: 50,
            child: cachedNetworkImage(
              "https://images.unsplash.com/photo-1542856391-010fb87dcfed?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbHBhcGVycyUyMGhkfGVufDB8fDB8fHww",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: const Text(
          'Ayça Aydoğan',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          'ID: 245677',
          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // TODO: Implement photo upload
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE53E3E),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: const Text(
            'Fotoğraf Ekle',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _buildLikedMoviesSection() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        if (state.error != null) {
          return Center(
            child: Text(
              'Hata: ${state.error}',
              style: const TextStyle(color: Colors.white),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Beğendiğim Filmler',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio:
                      0.6, // Yüksekliği artırdığımız için oranı düşürdük
                ),
                itemCount: state.likedMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.likedMovies[index];
                  return _buildMovieCard(movie: movie);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMovieCard({required Movie movie}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF1A1A1A),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: cachedNetworkImage(
                movie.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    movie.productionCompany,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 10,
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
