import 'package:freezed_annotation/freezed_annotation.dart';

import 'genrelist.dart';

part 'movies_details.freezed.dart';
part 'movies_details.g.dart';

@freezed
class MoviesDetails with _$MoviesDetails {
  factory MoviesDetails({
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
  }) = _MoviesDetails;

  factory MoviesDetails.fromJson(Map<String, dynamic> json) => _$MoviesDetailsFromJson(json);
}
