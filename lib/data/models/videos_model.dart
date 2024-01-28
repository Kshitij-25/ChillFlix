import 'package:freezed_annotation/freezed_annotation.dart';

part 'videos_model.freezed.dart';
part 'videos_model.g.dart';

@freezed
class VideosModel with _$VideosModel {
  factory VideosModel({
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
  }) = _VideosModel;

  factory VideosModel.fromJson(Map<String, dynamic> json) => _$VideosModelFromJson(json);
}
