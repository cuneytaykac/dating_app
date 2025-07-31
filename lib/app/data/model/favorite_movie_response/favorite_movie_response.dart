import 'package:dating_app/app/data/model/favorite_movie_data/favorite_movie_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/network/interfaces/base_network_model.dart';

part 'favorite_movie_response.g.dart';

@JsonSerializable()
final class FavoriteMovieResponse
    implements BaseNetworkModel<FavoriteMovieResponse> {
  final List<FavoriteMovieData?>? data;

  FavoriteMovieResponse({this.data});

  factory FavoriteMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteMovieResponseToJson(this);

  @override
  FavoriteMovieResponse fromJson(Map<String, dynamic> json) {
    return FavoriteMovieResponse.fromJson(json);
  }
}
