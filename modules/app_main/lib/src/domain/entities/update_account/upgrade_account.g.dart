// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpgradeAccountImpl _$$UpgradeAccountImplFromJson(Map<String, dynamic> json) =>
    _$UpgradeAccountImpl(
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

Map<String, dynamic> _$$UpgradeAccountImplToJson(
        _$UpgradeAccountImpl instance) =>
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

_$JobImpl _$$JobImplFromJson(Map<String, dynamic> json) => _$JobImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$JobImplToJson(_$JobImpl instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

_$GenderImpl _$$GenderImplFromJson(Map<String, dynamic> json) => _$GenderImpl(
      key: json['key'] as int?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$GenderImplToJson(_$GenderImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

_$ProtectorImpl _$$ProtectorImplFromJson(Map<String, dynamic> json) =>
    _$ProtectorImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ProtectorImplToJson(_$ProtectorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$BloodGroupImpl _$$BloodGroupImplFromJson(Map<String, dynamic> json) =>
    _$BloodGroupImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$BloodGroupImplToJson(_$BloodGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$MaritalStatusImpl _$$MaritalStatusImplFromJson(Map<String, dynamic> json) =>
    _$MaritalStatusImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$MaritalStatusImplToJson(_$MaritalStatusImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

_$AcademicLevelImpl _$$AcademicLevelImplFromJson(Map<String, dynamic> json) =>
    _$AcademicLevelImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$AcademicLevelImplToJson(_$AcademicLevelImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

_$InterestImpl _$$InterestImplFromJson(Map<String, dynamic> json) =>
    _$InterestImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$InterestImplToJson(_$InterestImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };

_$AutocompleteOptionImpl _$$AutocompleteOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$AutocompleteOptionImpl(
      displayText: json['displayText'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$$AutocompleteOptionImplToJson(
        _$AutocompleteOptionImpl instance) =>
    <String, dynamic>{
      'displayText': instance.displayText,
      'key': instance.key,
    };

_$TalentImpl _$$TalentImplFromJson(Map<String, dynamic> json) => _$TalentImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$TalentImplToJson(_$TalentImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };
