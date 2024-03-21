// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
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
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
}
