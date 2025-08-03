part of '../view/home_view.dart';

class MovieCardWidget extends StatelessWidget {
  final FavoriteMovieData movie;

  const MovieCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
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
                  movie.title ?? 'home.movie_title_default'.tr(),
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
                    context.push(
                      AppRoutes.movieDetailView.path,
                      extra: movie.id,
                    );
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
                    child: Text(
                      'home.view_details'.tr(),
                      style: const TextStyle(
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
}
