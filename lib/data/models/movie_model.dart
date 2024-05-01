// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
    @JsonKey(name: "adult") bool? isAdult,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "original_language") String? originalLanguage,
    @JsonKey(name: "original_title") String? originalTitle,
    @JsonKey(name: "overview") String? overview,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "media_type") String? mediaType,
    @JsonKey(name: "genre_ids") List<int>? genreIds,
    @JsonKey(name: "popularity") double? popularity,
    @JsonKey(name: "release_date") String? releaseDate,
    @JsonKey(name: "video") bool? video,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
}
