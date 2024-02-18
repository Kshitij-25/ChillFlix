import 'package:freezed_annotation/freezed_annotation.dart';

part 'genrelist.freezed.dart';
part 'genrelist.g.dart';

@freezed
class GenreList with _$GenreList {
  factory GenreList({
    int? id,
    String? name,
  }) = _GenreList;

  factory GenreList.fromJson(Map<String, dynamic> json) => _$GenreListFromJson(json);
}
