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
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => FavoriteMovieData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteMovieDetailToJson(
        FavoriteMovieDetail instance) =>
    <String, dynamic>{
      'movie': instance.movie,
      'movies': instance.movies,
      'pagination': instance.pagination,
    };
