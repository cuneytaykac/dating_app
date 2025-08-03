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
                style: const TextStyle(color: ColorName.appWhite, fontSize: 16),
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
