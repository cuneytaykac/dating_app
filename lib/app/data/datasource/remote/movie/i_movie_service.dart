import 'package:dating_app/app/data/model/favorite_movie_response/favorite_movie_response.dart';
import 'package:dating_app/core/base/base_network_error_type.dart';
import 'package:dating_app/core/base/base_network_type_def.dart';

abstract class IMovieService {
  ResultDecode<FavoriteMovieResponse?, BaseNetworkErrorType> getFavorites();
}
