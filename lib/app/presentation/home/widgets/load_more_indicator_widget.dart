part of '../view/home_view.dart';

class LoadMoreIndicatorWidget extends StatelessWidget {
  const LoadMoreIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
