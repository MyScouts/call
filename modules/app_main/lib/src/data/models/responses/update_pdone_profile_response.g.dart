// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_pdone_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePDoneProfileReponseImpl _$$UpdatePDoneProfileReponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePDoneProfileReponseImpl(
      profile: (json['profile'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, InformationProfile.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$UpdatePDoneProfileReponseImplToJson(
        _$UpdatePDoneProfileReponseImpl instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };
