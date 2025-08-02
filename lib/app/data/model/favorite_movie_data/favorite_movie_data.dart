import 'package:json_annotation/json_annotation.dart';

import '../../../../core/network/interfaces/base_network_model.dart';

part 'favorite_movie_data.g.dart';

@JsonSerializable()
final class FavoriteMovieData implements BaseNetworkModel<FavoriteMovieData> {
  final String? id;
  @JsonKey(name: "Title")
  final String? title;
  @JsonKey(name: "Year")
  final String? year;
  @JsonKey(name: "Rated")
  final String? rated;
  @JsonKey(name: "Released")
  final String? released;
  @JsonKey(name: "Runtime")
  final String? runtime;
  @JsonKey(name: "Genre")
  final String? genre;
  @JsonKey(name: "Director")
  final String? director;
  @JsonKey(name: "Writer")
  final String? writer;
  @JsonKey(name: "Actors")
  final String? actors;
  @JsonKey(name: "Plot")
  final String? plot;
  @JsonKey(name: "Language")
  final String? language;
  @JsonKey(name: "Country")
  final String? country;
  @JsonKey(name: "Awards")
  final String? awards;
  @JsonKey(name: "Poster")
  final String? poster;
  @JsonKey(name: "Metascore")
  final String? metascore;
  @JsonKey(name: "imdbRating")
  final String? imdbRating;
  @JsonKey(name: "imdbVotes")
  final String? imdbVotes;
  @JsonKey(name: "imdbID")
  final String? imdbID;
  @JsonKey(name: "Type")
  final String? type;

  @JsonKey(name: "Images")
  final List<String>? images;
  @JsonKey(name: "ComingSoon")
  final bool? comingSoon;
  @JsonKey(name: "isFavorite")
  final bool? isFavorite;
  final String? action;

  FavoriteMovieData({
    this.id,
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.images,
    this.comingSoon,
    this.isFavorite,
    this.action,
  });

  factory FavoriteMovieData.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMovieDataFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteMovieDataToJson(this);

  @override
  FavoriteMovieData fromJson(Map<String, dynamic> json) {
    return FavoriteMovieData.fromJson(json);
  }
}
