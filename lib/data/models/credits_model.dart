import 'package:freezed_annotation/freezed_annotation.dart';

import 'cast_model.dart';
import 'crew_model.dart';

part 'credits_model.freezed.dart';
part 'credits_model.g.dart';

@freezed
class CreditsModel with _$CreditsModel {
  factory CreditsModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'cast') List<CastModel>? cast,
    @JsonKey(name: 'crew') List<CrewModel>? crew,
  }) = _CreditsModel;

  factory CreditsModel.fromJson(Map<String, dynamic> json) => _$CreditsModelFromJson(json);
}
