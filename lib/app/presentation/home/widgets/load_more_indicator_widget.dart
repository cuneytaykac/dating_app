part of '../view/home_view.dart';

class LoadMoreIndicatorWidget extends StatelessWidget {
  const LoadMoreIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.hasReachedMax) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'home.all_movies_loaded'.tr(),
                style: context.theme.textTheme.bodyLarge,
              ),
            ),
          );
        }

        // Sadece gerçekten loading olduğunda göster
        if (state.movieList.maybeWhen(
          pending: (_) => true,
          orElse: () => false,
        )) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: CircularProgressIndicator(
                color: context.theme.colorScheme.primary,
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
