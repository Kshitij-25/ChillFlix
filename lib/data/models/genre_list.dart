// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_list.freezed.dart';
part 'genre_list.g.dart';

@freezed
class GenreList with _$GenreList {
  factory GenreList({
    int? id,
    String? name,
  }) = _GenreList;

  factory GenreList.fromJson(Map<String, dynamic> json) => _$GenreListFromJson(json);
}
