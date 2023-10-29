// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpgradeAccount _$$_UpgradeAccountFromJson(Map<String, dynamic> json) =>
    _$_UpgradeAccount(
      jobs: (json['jobs'] as List<dynamic>?)
          ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      genders: (json['sex'] as List<dynamic>?)
          ?.map((e) => Gender.fromJson(e as Map<String, dynamic>))
          .toList(),
      protectors: (json['protectors'] as List<dynamic>?)
          ?.map((e) => Protector.fromJson(e as Map<String, dynamic>))
          .toList(),
      bloodGroups: (json['blood_groups'] as List<dynamic>?)
          ?.map((e) => BloodGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      maritalStatus: (json['marital_status'] as List<dynamic>?)
          ?.map((e) => MaritalStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      academicLevels: (json['academic_levels'] as List<dynamic>?)
          ?.map((e) => AcademicLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => Interest.fromJson(e as Map<String, dynamic>))
          .toList(),
      talents: (json['talents'] as List<dynamic>?)
          ?.map((e) => Talent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UpgradeAccountToJson(_$_UpgradeAccount instance) =>
    <String, dynamic>{
      'jobs': instance.jobs,
      'sex': instance.genders,
      'protectors': instance.protectors,
      'blood_groups': instance.bloodGroups,
      'marital_status': instance.maritalStatus,
      'academic_levels': instance.academicLevels,
      'interests': instance.interests,
      'talents': instance.talents,
    };

_$_Job _$$_JobFromJson(Map<String, dynamic> json) => _$_Job(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_JobToJson(_$_Job instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

_$_Gender _$$_GenderFromJson(Map<String, dynamic> json) => _$_Gender(
      key: json['key'] as int?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$_GenderToJson(_$_Gender instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

_$_Protector _$$_ProtectorFromJson(Map<String, dynamic> json) => _$_Protector(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_ProtectorToJson(_$_Protector instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_BloodGroup _$$_BloodGroupFromJson(Map<String, dynamic> json) =>
    _$_BloodGroup(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_BloodGroupToJson(_$_BloodGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_MaritalStatus _$$_MaritalStatusFromJson(Map<String, dynamic> json) =>
    _$_MaritalStatus(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_MaritalStatusToJson(_$_MaritalStatus instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

_$_AcademicLevel _$$_AcademicLevelFromJson(Map<String, dynamic> json) =>
    _$_AcademicLevel(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_AcademicLevelToJson(_$_AcademicLevel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

_$_Interest _$$_InterestFromJson(Map<String, dynamic> json) => _$_Interest(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_InterestToJson(_$_Interest instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

_$_Talent _$$_TalentFromJson(Map<String, dynamic> json) => _$_Talent(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_TalentToJson(_$_Talent instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };
