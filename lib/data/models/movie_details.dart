// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import 'genre_list.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
class MovieDetails with _$MovieDetails {
  factory MovieDetails({
    bool? adult,
    String? backdrop_path,
    int? budget,
    List<GenreList>? genres,
    String? homepage,
    int? id,
    String? imdb_id,
    String? original_language,
    String? original_title,
    String? overview,
    double? popularity,
    String? poster_path,
    String? release_date,
    int? revenue,
    int? runtime,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? vote_average,
    double? vote_count,
    @Default(false) bool? addedToMyList,
    @Default(false) bool? addedToWatchlist,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
}
