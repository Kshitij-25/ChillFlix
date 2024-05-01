import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  factory VideoModel({
    @JsonKey(name: "iso_639_1") String? iso_639_1,
    @JsonKey(name: "iso_3166_1") String? iso_3166_1,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "key") String? key,
    @JsonKey(name: "site") String? site,
    @JsonKey(name: "size") int? size,
    @JsonKey(name: "type") String? type,
    @JsonKey(name: "official") bool? official,
    @JsonKey(name: "published_at") String? publishedAt,
    @JsonKey(name: "id") String? id,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);
}
