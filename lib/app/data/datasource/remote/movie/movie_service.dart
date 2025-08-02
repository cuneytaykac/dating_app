import 'package:dating_app/app/data/datasource/remote/movie/i_movie_service.dart';
import 'package:dating_app/app/data/model/favorite_movie_detail_response/favorite_movie_detail_response.dart';
import 'package:dating_app/app/data/model/favorite_movie_response/favorite_movie_response.dart';
import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';
import 'package:dating_app/core/getIt/injection.dart';
import 'package:dating_app/core/network/builder/network_manager.dart';
import 'package:dating_app/core/network/enum/request_method_enum.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMovieService)
final class MovieService extends IMovieService {
  final client = getIt.get<NetworkManager>();

  @override
  ResultDecode<FavoriteMovieResponse?, BaseNetworkErrorType>
  getFavorites() async {
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.GET)
        .setBaseUrl(path: "https://caseapi.servicelabs.tech/")
        .setPath(path: "movie/favorites")
        .setInterceptor()
        .setFunctionName(functionName: "movie/favorites")
        .execute<FavoriteMovieResponse, FavoriteMovieResponse>(
          FavoriteMovieResponse(),
        );
    return response;
  }

  @override
  ResultDecode<FavoriteMovieDetailResponse?, BaseNetworkErrorType>
  getFavoriteDetail({required String id}) async {
    final response = await client
        .setRequestMethod(requestMethodEnum: RequestMethodEnum.POST)
        .setBaseUrl(path: "https://caseapi.servicelabs.tech/")
        .setPath(path: "movie/favorite/$id")
        .setInterceptor()
        .setFunctionName(functionName: "movie/favorite/$id")
        .execute<FavoriteMovieDetailResponse, FavoriteMovieDetailResponse>(
          FavoriteMovieDetailResponse(),
        );
    return response;
  }
}
