import 'package:chillflix2/data/models/image_attributes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'images.freezed.dart';
part 'images.g.dart';

@freezed
class Images with _$Images {
  factory Images({
    List<ImageAttributes>? backdrops,
    int? id,
    List<ImageAttributes>? logos,
    List<ImageAttributes>? posters,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
