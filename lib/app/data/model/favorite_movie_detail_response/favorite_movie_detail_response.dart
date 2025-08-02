import 'package:dating_app/app/data/model/favorite_movie_detail/favorite_movie_detail.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/network/interfaces/base_network_model.dart';

part 'favorite_movie_detail_response.g.dart';

@JsonSerializable()
final class FavoriteMovieDetailResponse
    implements BaseNetworkModel<FavoriteMovieDetailResponse> {
  final FavoriteMovieDetail? data;

  FavoriteMovieDetailResponse({this.data});

  factory FavoriteMovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMovieDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteMovieDetailResponseToJson(this);

  @override
  FavoriteMovieDetailResponse fromJson(Map<String, dynamic> json) {
    return FavoriteMovieDetailResponse.fromJson(json);
  }
}
