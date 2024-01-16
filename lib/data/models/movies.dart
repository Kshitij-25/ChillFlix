import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@freezed
class Movies with _$Movies {
  factory Movies({
    bool? adult,
    String? backdrop_path,
    int? id,
    String? title,
    String? original_language,
    String? original_title,
    String? overview,
    String? poster_path,
    String? media_type,
    List<int>? genre_ids,
    double? popularity,
    String? release_date,
    bool? video,
    double? vote_average,
    int? vote_count,
  }) = _Movies;

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}
