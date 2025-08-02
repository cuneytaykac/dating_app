// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteMovieDetail _$FavoriteMovieDetailFromJson(Map<String, dynamic> json) =>
    FavoriteMovieDetail(
      movie: json['movie'] == null
          ? null
          : FavoriteMovieData.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteMovieDetailToJson(
        FavoriteMovieDetail instance) =>
    <String, dynamic>{
      'movie': instance.movie,
    };
