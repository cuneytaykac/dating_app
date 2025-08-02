import 'package:dating_app/app/data/model/favorite_movie_data/favorite_movie_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/network/interfaces/base_network_model.dart';

part 'favorite_movie_detail.g.dart';

@JsonSerializable()
final class FavoriteMovieDetail
    implements BaseNetworkModel<FavoriteMovieDetail> {
  final FavoriteMovieData? movie;

  FavoriteMovieDetail({this.movie});

  factory FavoriteMovieDetail.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMovieDetailFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteMovieDetailToJson(this);

  @override
  FavoriteMovieDetail fromJson(Map<String, dynamic> json) {
    return FavoriteMovieDetail.fromJson(json);
  }
}
