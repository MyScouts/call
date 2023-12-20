import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required int id,
    String? avatar,
    required String displayName,
    required String pDoneId,
    String? fullName,
    DateTime? birthday,
    required String phone,
    String? email,
    int? sexCode,
    int? type,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
