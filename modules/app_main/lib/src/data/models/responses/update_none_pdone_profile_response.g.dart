// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_none_pdone_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateNonePDoneProfileReponseImpl
    _$$UpdateNonePDoneProfileReponseImplFromJson(Map<String, dynamic> json) =>
        _$UpdateNonePDoneProfileReponseImpl(
          profile: (json['profile'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(
                k, InformationProfile.fromJson(e as Map<String, dynamic>)),
          ),
        );

Map<String, dynamic> _$$UpdateNonePDoneProfileReponseImplToJson(
        _$UpdateNonePDoneProfileReponseImpl instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };
