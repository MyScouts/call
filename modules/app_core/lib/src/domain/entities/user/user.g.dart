// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      nickname: json['nickname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      sex: $enumDecodeNullable(_$SexEnumMap, json['sex']),
      phoneCode: json['phoneCode'] as String?,
      address: json['address'] as String?,
      forgotHash: json['forgotHash'] as String?,
      status: json['status'] as int?,
      roleId: json['roleId'] as int?,
      roleMemberCode: json['roleMemberCode'] as String?,
      createdById: json['createdById'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      pDoneId: json['pDoneId'] as String?,
      displayName: json['displayName'] as String?,
      fullName: json['fullName'] as String?,
      isPDone: json['isPDone'] as bool? ?? false,
      isFriend: json['isFriend'] as bool? ?? false,
      isFollowing: json['isFollowing'] as bool? ?? false,
      isFollowed: json['isFollowed'] as bool? ?? false,
      totalFollower: json['totalFollower'] as int? ?? 0,
      totalFollowing: json['totalFollowing'] as int? ?? 0,
      totalFriend: json['totalFriend'] as int? ?? 0,
      old: json['old'] as int? ?? 0,
      isBlock: json['isBlock'] as bool? ?? false,
      backgroundImages: (json['backgroundImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defaultBackground: json['defaultBackground'] as String?,
      isJA: json['isJA'] as bool?,
      isVShop: json['isVShop'] as bool?,
      isLive: json['isLive'] as bool?,
      isSupervisor: json['isSupervisor'] as bool?,
      isModerator: json['isModerator'] as bool?,
      joinedTeam: json['joinedTeam'] == null
          ? null
          : Team.fromJson(json['joinedTeam'] as Map<String, dynamic>),
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      jaAt:
          json['jaAt'] == null ? null : DateTime.parse(json['jaAt'] as String),
      vShopId: json['vShopId'] as String?,
      vShopPDoneId: json['vShopPDoneId'] as int?,
      fanGroup: json['fanGroup'] == null
          ? null
          : UserFanGroupInfo.fromJson(json['fanGroup'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : UserProfileInfo.fromJson(json['profile'] as Map<String, dynamic>),
      sexCode: json['sexCode'] as int?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'nickname': instance.nickname,
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'sex': _$SexEnumMap[instance.sex],
      'phoneCode': instance.phoneCode,
      'address': instance.address,
      'forgotHash': instance.forgotHash,
      'status': instance.status,
      'roleId': instance.roleId,
      'roleMemberCode': instance.roleMemberCode,
      'createdById': instance.createdById,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'pDoneId': instance.pDoneId,
      'displayName': instance.displayName,
      'fullName': instance.fullName,
      'isPDone': instance.isPDone,
      'isFriend': instance.isFriend,
      'isFollowing': instance.isFollowing,
      'isFollowed': instance.isFollowed,
      'totalFollower': instance.totalFollower,
      'totalFollowing': instance.totalFollowing,
      'totalFriend': instance.totalFriend,
      'old': instance.old,
      'isBlock': instance.isBlock,
      'backgroundImages': instance.backgroundImages,
      'defaultBackground': instance.defaultBackground,
      'isJA': instance.isJA,
      'isVShop': instance.isVShop,
      'isLive': instance.isLive,
      'isSupervisor': instance.isSupervisor,
      'isModerator': instance.isModerator,
      'joinedTeam': instance.joinedTeam,
      'birthday': instance.birthday?.toIso8601String(),
      'jaAt': instance.jaAt?.toIso8601String(),
      'vShopId': instance.vShopId,
      'vShopPDoneId': instance.vShopPDoneId,
      'fanGroup': instance.fanGroup,
      'profile': instance.profile,
      'sexCode': instance.sexCode,
    };

const _$SexEnumMap = {
  Sex.male: 'Nam',
  Sex.female: 'Nữ',
  Sex.other: 'Khác',
  Sex.unknown: 'Không xác định`',
};
