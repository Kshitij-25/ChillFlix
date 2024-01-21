import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_attributes.freezed.dart';
part 'image_attributes.g.dart';

@freezed
class ImageAttributes with _$ImageAttributes {
  factory ImageAttributes({
    double? aspect_ratio,
    int? height,
    String? iso_639_1,
    String? file_path,
    double? vote_average,
    int? vote_count,
    int? width,
  }) = _ImageAttributes;

  factory ImageAttributes.fromJson(Map<String, dynamic> json) => _$ImageAttributesFromJson(json);
}
