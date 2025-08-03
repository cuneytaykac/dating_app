part of '../view/home_view.dart';

class MovieListWidget extends StatelessWidget {
  final List<FavoriteMovieData> movies;

  const MovieListWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          context.read<HomeCubit>().loadMoreMovies();
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          await context.read<HomeCubit>().refreshMovies();
        },
        color: context.theme.colorScheme.primary,
        backgroundColor: context.theme.scaffoldBackgroundColor,
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
              return const LoadMoreIndicatorWidget();
            }
            return MovieCardWidget(movie: movies[index]);
          },
        ),
      ),
    );
  }
}
