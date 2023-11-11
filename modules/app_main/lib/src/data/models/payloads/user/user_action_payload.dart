import 'package:json_annotation/json_annotation.dart';

part 'user_action_payload.g.dart';

@JsonSerializable()
class ReportUserPayload {
  final String content;

  const ReportUserPayload({
    required this.content,
  });

  factory ReportUserPayload.fromJson(Map<String, dynamic> json) => _$ReportUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ReportUserPayloadToJson(this);
}

@JsonSerializable()
class FollowUserPayload {
  final int id;
  const FollowUserPayload({
    required this.id,
  });

  factory FollowUserPayload.fromJson(Map<String, dynamic> json) => _$FollowUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$FollowUserPayloadToJson(this);
}

@JsonSerializable()
class UnFollowPayload {
  final int id;
  const UnFollowPayload({
    required this.id,
  });

  factory UnFollowPayload.fromJson(Map<String, dynamic> json) => _$UnFollowPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$UnFollowPayloadToJson(this);
}

@JsonSerializable()
class DeleteUserPayload {
  final String password;
  const DeleteUserPayload({
    required this.password,
  });

  factory DeleteUserPayload.fromJson(Map<String, dynamic> json) => _$DeleteUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserPayloadToJson(this);
}

@JsonSerializable()
class SearchUserPayload {
  final String query;
  final int page;
  final int pageSize;
  const SearchUserPayload({
    required this.query,
    required this.page,
    required this.pageSize,
  });

  factory SearchUserPayload.fromJson(Map<String, dynamic> json) => _$SearchUserPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$SearchUserPayloadToJson(this);
}

@JsonSerializable()
class UpdatePDoneProfilePayload {
  final String nickName;
  final Map<String, String> currentPlace;
  final int height;
  final int weight;
  final String maritalStatus;
  final String bloodGroup;
  final String academicLevel;
  final String job;
  final String interest;
  final String talent;

  const UpdatePDoneProfilePayload({
    required this.nickName,
    required this.currentPlace,
    required this.height,
    required this.weight,
    required this.maritalStatus,
    required this.bloodGroup,
    required this.academicLevel,
    required this.job,
    required this.interest,
    required this.talent,
  });

  factory UpdatePDoneProfilePayload.fromJson(Map<String, dynamic> json) => _$UpdatePDoneProfilePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePDoneProfilePayloadToJson(this);
}

@JsonSerializable()
class UpdateNonePDoneProfilePayload {
  final String nickName;
  final Map<String, String> currentPlace;
  final int height;
  final int weight;
  final String maritalStatus;
  final String bloodGroup;
  final String academicLevel;
  final String job;
  final String interest;
  final String talent;
  final int sex;
  final Map<String, String> birthPlace;
  final String birthday;
  final String identityNumber;
  final String supplyDate;
  final String supplyAddress;

  const UpdateNonePDoneProfilePayload({
    required this.nickName,
    required this.currentPlace,
    required this.height,
    required this.weight,
    required this.maritalStatus,
    required this.bloodGroup,
    required this.academicLevel,
    required this.job,
    required this.interest,
    required this.talent,
    required this.sex,
    required this.birthPlace,
    required this.birthday,
    required this.identityNumber,
    required this.supplyDate,
    required this.supplyAddress,
  });

  factory UpdateNonePDoneProfilePayload.fromJson(Map<String, dynamic> json) =>
      _$UpdateNonePDoneProfilePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateNonePDoneProfilePayloadToJson(this);
}
