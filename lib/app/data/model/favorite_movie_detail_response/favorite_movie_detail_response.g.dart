// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteMovieDetailResponse _$FavoriteMovieDetailResponseFromJson(
        Map<String, dynamic> json) =>
    FavoriteMovieDetailResponse(
      data: json['data'] == null
          ? null
          : FavoriteMovieDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteMovieDetailResponseToJson(
        FavoriteMovieDetailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
