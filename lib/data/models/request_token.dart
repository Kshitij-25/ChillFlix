import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_token.freezed.dart';
part 'request_token.g.dart';

@freezed
class RequestToken with _$RequestToken {
  factory RequestToken(
    bool? success,
    String? expires_at,
    String? request_token,
  ) = _RequestToken;

  factory RequestToken.fromJson(Map<String, dynamic> json) => _$RequestTokenFromJson(json);
}
