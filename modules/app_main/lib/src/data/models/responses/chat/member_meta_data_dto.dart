import 'package:app_main/src/domain/entities/chat/member_meta_data_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'member_meta_data_dto.g.dart';

@JsonSerializable()
class MemberMetaDataDto extends MemberMetaDataModel {
  factory MemberMetaDataDto.fromJson(Map<String, dynamic> json) =>
      _$MemberMetaDataDtoFromJson(json);

  MemberMetaDataDto(
      {required this.avatar,
      required this.backgroundImages,
      required this.defaultBackground,
      required this.displayName,
      required this.hexId,
      required this.id,
      required this.pDoneId,
      required this.phone,
      required this.phoneCode,
      required this.roleMemberCode,
      required this.status});

  Map<String, dynamic> toJson() => _$MemberMetaDataDtoToJson(this);

  @override
  final String? avatar;

  @override
  final List<dynamic>? backgroundImages;

  @override
  final String? defaultBackground;

  @override
  final String displayName;

  @override
  final String? hexId;

  @override
  final int id;

  @override
  final String? pDoneId;

  @override
  final String? phone;

  @override
  final String? phoneCode;

  @override
  dynamic profile;

  @override
  final String? roleMemberCode;

  @override
  final int? status;
}
