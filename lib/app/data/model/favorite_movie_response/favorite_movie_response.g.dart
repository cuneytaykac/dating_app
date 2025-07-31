// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteMovieResponse _$FavoriteMovieResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteMovieResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : FavoriteMovieData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavoriteMovieResponseToJson(
        FavoriteMovieResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
