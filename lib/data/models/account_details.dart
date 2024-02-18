import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details.freezed.dart';
part 'account_details.g.dart';

@freezed
class AccountDetails with _$AccountDetails {
  factory AccountDetails({
    int? id,
    String? iso_639_1,
    String? iso_3166_1,
    String? name,
    bool? include_adult,
    String? username,
  }) = _AccountDetails;

  factory AccountDetails.fromJson(Map<String, dynamic> json) => _$AccountDetailsFromJson(json);
}
