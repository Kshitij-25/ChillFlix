// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  factory VideoModel({
    String? iso_639_1,
    String? iso_3166_1,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    String? published_at,
    String? id,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);
}
