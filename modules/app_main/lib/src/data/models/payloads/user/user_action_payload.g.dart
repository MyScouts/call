// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_action_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportUserPayload _$ReportUserPayloadFromJson(Map<String, dynamic> json) =>
    ReportUserPayload(
      content: json['content'] as String,
    );

Map<String, dynamic> _$ReportUserPayloadToJson(ReportUserPayload instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

FollowUserPayload _$FollowUserPayloadFromJson(Map<String, dynamic> json) =>
    FollowUserPayload(
      id: json['id'] as int,
    );

Map<String, dynamic> _$FollowUserPayloadToJson(FollowUserPayload instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UnFollowPayload _$UnFollowPayloadFromJson(Map<String, dynamic> json) =>
    UnFollowPayload(
      id: json['id'] as int,
    );

Map<String, dynamic> _$UnFollowPayloadToJson(UnFollowPayload instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

DeleteUserPayload _$DeleteUserPayloadFromJson(Map<String, dynamic> json) =>
    DeleteUserPayload(
      password: json['password'] as String,
    );

Map<String, dynamic> _$DeleteUserPayloadToJson(DeleteUserPayload instance) =>
    <String, dynamic>{
      'password': instance.password,
    };

SearchUserPayload _$SearchUserPayloadFromJson(Map<String, dynamic> json) =>
    SearchUserPayload(
      query: json['query'] as String,
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
    );

Map<String, dynamic> _$SearchUserPayloadToJson(SearchUserPayload instance) =>
    <String, dynamic>{
      'query': instance.query,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };

UpdatePDoneProfilePayload _$UpdatePDoneProfilePayloadFromJson(
        Map<String, dynamic> json) =>
    UpdatePDoneProfilePayload(
      nickName: json['nickName'] as String,
      currentPlace: json['currentPlace'] == null
          ? null
          : UpdatePlaceInformationPayload.fromJson(
              json['currentPlace'] as Map<String, dynamic>),
      height: json['height'] as int,
      weight: json['weight'] as int,
      maritalStatus: json['maritalStatus'] as String,
      bloodGroup: json['bloodGroup'] as String,
      academicLevel: json['academicLevel'] as String,
      job: json['job'] as String,
      interest: json['interest'] as String,
      talent: json['talent'] as String,
    );

Map<String, dynamic> _$UpdatePDoneProfilePayloadToJson(
        UpdatePDoneProfilePayload instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'currentPlace': instance.currentPlace,
      'height': instance.height,
      'weight': instance.weight,
      'maritalStatus': instance.maritalStatus,
      'bloodGroup': instance.bloodGroup,
      'academicLevel': instance.academicLevel,
      'job': instance.job,
      'interest': instance.interest,
      'talent': instance.talent,
    };

UpdateNonePDoneProfilePayload _$UpdateNonePDoneProfilePayloadFromJson(
        Map<String, dynamic> json) =>
    UpdateNonePDoneProfilePayload(
      nickName: json['nickName'] as String,
      currentPlace: json['currentPlace'] == null
          ? null
          : UpdatePlaceInformationPayload.fromJson(
              json['currentPlace'] as Map<String, dynamic>),
      height: json['height'] as int,
      weight: json['weight'] as int,
      maritalStatus: json['maritalStatus'] as String,
      bloodGroup: json['bloodGroup'] as String,
      academicLevel: json['academicLevel'] as String,
      job: json['job'] as String,
      interest: json['interest'] as String,
      talent: json['talent'] as String,
      sex: json['sex'] as int,
      birthPlace: json['birthPlace'] == null
          ? null
          : UpdatePDoneBirthPlacePayload2.fromJson(
              json['birthPlace'] as Map<String, dynamic>),
      birthday: json['birthday'] as String,
      identityNumber: json['identityNumber'] as String,
      supplyDate: json['supplyDate'] as String,
      supplyAddress: json['supplyAddress'] as String,
    );

Map<String, dynamic> _$UpdateNonePDoneProfilePayloadToJson(
        UpdateNonePDoneProfilePayload instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'currentPlace': instance.currentPlace,
      'height': instance.height,
      'weight': instance.weight,
      'maritalStatus': instance.maritalStatus,
      'bloodGroup': instance.bloodGroup,
      'academicLevel': instance.academicLevel,
      'job': instance.job,
      'interest': instance.interest,
      'talent': instance.talent,
      'sex': instance.sex,
      'birthPlace': instance.birthPlace,
      'birthday': instance.birthday,
      'identityNumber': instance.identityNumber,
      'supplyDate': instance.supplyDate,
      'supplyAddress': instance.supplyAddress,
    };
