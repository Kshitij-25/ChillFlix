import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_attributes.freezed.dart';
part 'image_attributes.g.dart';

@freezed
class ImageAttributes with _$ImageAttributes {
  factory ImageAttributes({
    double? aspectRatio,
    int? height,
    String? iso6391,
    String? filePath,
    double? voteAverage,
    int? voteCount,
    int? width,
  }) = _ImageAttributes;

  factory ImageAttributes.fromJson(Map<String, dynamic> json) => _$ImageAttributesFromJson(json);
}
