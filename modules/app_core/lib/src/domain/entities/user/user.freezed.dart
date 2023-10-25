// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  Sex? get sex => throw _privateConstructorUsedError;
  String? get phoneCode => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get forgotHash => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  int? get roleId => throw _privateConstructorUsedError;
  String? get roleMemberCode => throw _privateConstructorUsedError;
  int? get createdById => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get deletedAt => throw _privateConstructorUsedError;
  String? get pDoneId => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  bool? get isPDone => throw _privateConstructorUsedError;
  bool? get isFriend => throw _privateConstructorUsedError;
  bool? get isFollowing => throw _privateConstructorUsedError;
  bool? get isFollowed => throw _privateConstructorUsedError;
  int get totalFollower => throw _privateConstructorUsedError;
  int get totalFollowing => throw _privateConstructorUsedError;
  int get totalFriend => throw _privateConstructorUsedError;
  List<String>? get backgroundImages => throw _privateConstructorUsedError;
  String? get defaultBackground => throw _privateConstructorUsedError;
  bool? get isJA => throw _privateConstructorUsedError;
  bool? get isVShop => throw _privateConstructorUsedError;
  bool? get isLive => throw _privateConstructorUsedError;
  bool? get isSupervisor => throw _privateConstructorUsedError;
  bool? get isModerator => throw _privateConstructorUsedError;
  Team? get joinedTeam => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  DateTime? get jaAt => throw _privateConstructorUsedError;
  String? get vShopId => throw _privateConstructorUsedError;
  int? get vShopPDoneId => throw _privateConstructorUsedError;
  UserFanGroupInfo? get fanGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? username,
      String? name,
      String? nickname,
      String? email,
      String? phone,
      String? avatar,
      Sex? sex,
      String? phoneCode,
      String? address,
      String? forgotHash,
      int? status,
      int? roleId,
      String? roleMemberCode,
      int? createdById,
      String? createdAt,
      String? updatedAt,
      String? deletedAt,
      String? pDoneId,
      String? displayName,
      bool? isPDone,
      bool? isFriend,
      bool? isFollowing,
      bool? isFollowed,
      int totalFollower,
      int totalFollowing,
      int totalFriend,
      List<String>? backgroundImages,
      String? defaultBackground,
      bool? isJA,
      bool? isVShop,
      bool? isLive,
      bool? isSupervisor,
      bool? isModerator,
      Team? joinedTeam,
      DateTime? birthday,
      DateTime? jaAt,
      String? vShopId,
      int? vShopPDoneId,
      UserFanGroupInfo? fanGroup});

  $TeamCopyWith<$Res>? get joinedTeam;
  $UserFanGroupInfoCopyWith<$Res>? get fanGroup;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? sex = freezed,
    Object? phoneCode = freezed,
    Object? address = freezed,
    Object? forgotHash = freezed,
    Object? status = freezed,
    Object? roleId = freezed,
    Object? roleMemberCode = freezed,
    Object? createdById = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? pDoneId = freezed,
    Object? displayName = freezed,
    Object? isPDone = freezed,
    Object? isFriend = freezed,
    Object? isFollowing = freezed,
    Object? isFollowed = freezed,
    Object? totalFollower = freezed,
    Object? totalFollowing = freezed,
    Object? totalFriend = freezed,
    Object? backgroundImages = freezed,
    Object? defaultBackground = freezed,
    Object? isJA = freezed,
    Object? isVShop = freezed,
    Object? isLive = freezed,
    Object? isSupervisor = freezed,
    Object? isModerator = freezed,
    Object? joinedTeam = freezed,
    Object? birthday = freezed,
    Object? jaAt = freezed,
    Object? vShopId = freezed,
    Object? vShopPDoneId = freezed,
    Object? fanGroup = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex?,
      phoneCode: phoneCode == freezed
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      forgotHash: forgotHash == freezed
          ? _value.forgotHash
          : forgotHash // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: roleId == freezed
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleMemberCode: roleMemberCode == freezed
          ? _value.roleMemberCode
          : roleMemberCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: createdById == freezed
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      pDoneId: pDoneId == freezed
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPDone: isPDone == freezed
          ? _value.isPDone
          : isPDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFriend: isFriend == freezed
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: isFollowing == freezed
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowed: isFollowed == freezed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalFollower: totalFollower == freezed
          ? _value.totalFollower
          : totalFollower // ignore: cast_nullable_to_non_nullable
              as int,
      totalFollowing: totalFollowing == freezed
          ? _value.totalFollowing
          : totalFollowing // ignore: cast_nullable_to_non_nullable
              as int,
      totalFriend: totalFriend == freezed
          ? _value.totalFriend
          : totalFriend // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundImages: backgroundImages == freezed
          ? _value.backgroundImages
          : backgroundImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      defaultBackground: defaultBackground == freezed
          ? _value.defaultBackground
          : defaultBackground // ignore: cast_nullable_to_non_nullable
              as String?,
      isJA: isJA == freezed
          ? _value.isJA
          : isJA // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVShop: isVShop == freezed
          ? _value.isVShop
          : isVShop // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLive: isLive == freezed
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSupervisor: isSupervisor == freezed
          ? _value.isSupervisor
          : isSupervisor // ignore: cast_nullable_to_non_nullable
              as bool?,
      isModerator: isModerator == freezed
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinedTeam: joinedTeam == freezed
          ? _value.joinedTeam
          : joinedTeam // ignore: cast_nullable_to_non_nullable
              as Team?,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      jaAt: jaAt == freezed
          ? _value.jaAt
          : jaAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vShopId: vShopId == freezed
          ? _value.vShopId
          : vShopId // ignore: cast_nullable_to_non_nullable
              as String?,
      vShopPDoneId: vShopPDoneId == freezed
          ? _value.vShopPDoneId
          : vShopPDoneId // ignore: cast_nullable_to_non_nullable
              as int?,
      fanGroup: fanGroup == freezed
          ? _value.fanGroup
          : fanGroup // ignore: cast_nullable_to_non_nullable
              as UserFanGroupInfo?,
    ));
  }

  @override
  $TeamCopyWith<$Res>? get joinedTeam {
    if (_value.joinedTeam == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.joinedTeam!, (value) {
      return _then(_value.copyWith(joinedTeam: value));
    });
  }

  @override
  $UserFanGroupInfoCopyWith<$Res>? get fanGroup {
    if (_value.fanGroup == null) {
      return null;
    }

    return $UserFanGroupInfoCopyWith<$Res>(_value.fanGroup!, (value) {
      return _then(_value.copyWith(fanGroup: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? username,
      String? name,
      String? nickname,
      String? email,
      String? phone,
      String? avatar,
      Sex? sex,
      String? phoneCode,
      String? address,
      String? forgotHash,
      int? status,
      int? roleId,
      String? roleMemberCode,
      int? createdById,
      String? createdAt,
      String? updatedAt,
      String? deletedAt,
      String? pDoneId,
      String? displayName,
      bool? isPDone,
      bool? isFriend,
      bool? isFollowing,
      bool? isFollowed,
      int totalFollower,
      int totalFollowing,
      int totalFriend,
      List<String>? backgroundImages,
      String? defaultBackground,
      bool? isJA,
      bool? isVShop,
      bool? isLive,
      bool? isSupervisor,
      bool? isModerator,
      Team? joinedTeam,
      DateTime? birthday,
      DateTime? jaAt,
      String? vShopId,
      int? vShopPDoneId,
      UserFanGroupInfo? fanGroup});

  @override
  $TeamCopyWith<$Res>? get joinedTeam;
  @override
  $UserFanGroupInfoCopyWith<$Res>? get fanGroup;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? sex = freezed,
    Object? phoneCode = freezed,
    Object? address = freezed,
    Object? forgotHash = freezed,
    Object? status = freezed,
    Object? roleId = freezed,
    Object? roleMemberCode = freezed,
    Object? createdById = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? pDoneId = freezed,
    Object? displayName = freezed,
    Object? isPDone = freezed,
    Object? isFriend = freezed,
    Object? isFollowing = freezed,
    Object? isFollowed = freezed,
    Object? totalFollower = freezed,
    Object? totalFollowing = freezed,
    Object? totalFriend = freezed,
    Object? backgroundImages = freezed,
    Object? defaultBackground = freezed,
    Object? isJA = freezed,
    Object? isVShop = freezed,
    Object? isLive = freezed,
    Object? isSupervisor = freezed,
    Object? isModerator = freezed,
    Object? joinedTeam = freezed,
    Object? birthday = freezed,
    Object? jaAt = freezed,
    Object? vShopId = freezed,
    Object? vShopPDoneId = freezed,
    Object? fanGroup = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex?,
      phoneCode: phoneCode == freezed
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      forgotHash: forgotHash == freezed
          ? _value.forgotHash
          : forgotHash // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: roleId == freezed
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleMemberCode: roleMemberCode == freezed
          ? _value.roleMemberCode
          : roleMemberCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: createdById == freezed
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: deletedAt == freezed
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      pDoneId: pDoneId == freezed
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPDone: isPDone == freezed
          ? _value.isPDone
          : isPDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFriend: isFriend == freezed
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: isFollowing == freezed
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowed: isFollowed == freezed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalFollower: totalFollower == freezed
          ? _value.totalFollower
          : totalFollower // ignore: cast_nullable_to_non_nullable
              as int,
      totalFollowing: totalFollowing == freezed
          ? _value.totalFollowing
          : totalFollowing // ignore: cast_nullable_to_non_nullable
              as int,
      totalFriend: totalFriend == freezed
          ? _value.totalFriend
          : totalFriend // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundImages: backgroundImages == freezed
          ? _value._backgroundImages
          : backgroundImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      defaultBackground: defaultBackground == freezed
          ? _value.defaultBackground
          : defaultBackground // ignore: cast_nullable_to_non_nullable
              as String?,
      isJA: isJA == freezed
          ? _value.isJA
          : isJA // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVShop: isVShop == freezed
          ? _value.isVShop
          : isVShop // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLive: isLive == freezed
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSupervisor: isSupervisor == freezed
          ? _value.isSupervisor
          : isSupervisor // ignore: cast_nullable_to_non_nullable
              as bool?,
      isModerator: isModerator == freezed
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinedTeam: joinedTeam == freezed
          ? _value.joinedTeam
          : joinedTeam // ignore: cast_nullable_to_non_nullable
              as Team?,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      jaAt: jaAt == freezed
          ? _value.jaAt
          : jaAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vShopId: vShopId == freezed
          ? _value.vShopId
          : vShopId // ignore: cast_nullable_to_non_nullable
              as String?,
      vShopPDoneId: vShopPDoneId == freezed
          ? _value.vShopPDoneId
          : vShopPDoneId // ignore: cast_nullable_to_non_nullable
              as int?,
      fanGroup: fanGroup == freezed
          ? _value.fanGroup
          : fanGroup // ignore: cast_nullable_to_non_nullable
              as UserFanGroupInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {this.id,
      this.username,
      this.name,
      this.nickname,
      this.email,
      this.phone,
      this.avatar,
      this.sex,
      this.phoneCode,
      this.address,
      this.forgotHash,
      this.status,
      this.roleId,
      this.roleMemberCode,
      this.createdById,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pDoneId,
      this.displayName,
      this.isPDone,
      this.isFriend,
      this.isFollowing,
      this.isFollowed,
      this.totalFollower = 0,
      this.totalFollowing = 0,
      this.totalFriend = 0,
      final List<String>? backgroundImages,
      this.defaultBackground,
      this.isJA,
      this.isVShop,
      this.isLive,
      this.isSupervisor,
      this.isModerator,
      this.joinedTeam,
      this.birthday,
      this.jaAt,
      this.vShopId,
      this.vShopPDoneId,
      this.fanGroup})
      : _backgroundImages = backgroundImages;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int? id;
  @override
  final String? username;
  @override
  final String? name;
  @override
  final String? nickname;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? avatar;
  @override
  final Sex? sex;
  @override
  final String? phoneCode;
  @override
  final String? address;
  @override
  final String? forgotHash;
  @override
  final int? status;
  @override
  final int? roleId;
  @override
  final String? roleMemberCode;
  @override
  final int? createdById;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? deletedAt;
  @override
  final String? pDoneId;
  @override
  final String? displayName;
  @override
  final bool? isPDone;
  @override
  final bool? isFriend;
  @override
  final bool? isFollowing;
  @override
  final bool? isFollowed;
  @override
  @JsonKey()
  final int totalFollower;
  @override
  @JsonKey()
  final int totalFollowing;
  @override
  @JsonKey()
  final int totalFriend;
  final List<String>? _backgroundImages;
  @override
  List<String>? get backgroundImages {
    final value = _backgroundImages;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? defaultBackground;
  @override
  final bool? isJA;
  @override
  final bool? isVShop;
  @override
  final bool? isLive;
  @override
  final bool? isSupervisor;
  @override
  final bool? isModerator;
  @override
  final Team? joinedTeam;
  @override
  final DateTime? birthday;
  @override
  final DateTime? jaAt;
  @override
  final String? vShopId;
  @override
  final int? vShopPDoneId;
  @override
  final UserFanGroupInfo? fanGroup;

  @override
  String toString() {
    return 'User(id: $id, username: $username, name: $name, nickname: $nickname, email: $email, phone: $phone, avatar: $avatar, sex: $sex, phoneCode: $phoneCode, address: $address, forgotHash: $forgotHash, status: $status, roleId: $roleId, roleMemberCode: $roleMemberCode, createdById: $createdById, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, pDoneId: $pDoneId, displayName: $displayName, isPDone: $isPDone, isFriend: $isFriend, isFollowing: $isFollowing, isFollowed: $isFollowed, totalFollower: $totalFollower, totalFollowing: $totalFollowing, totalFriend: $totalFriend, backgroundImages: $backgroundImages, defaultBackground: $defaultBackground, isJA: $isJA, isVShop: $isVShop, isLive: $isLive, isSupervisor: $isSupervisor, isModerator: $isModerator, joinedTeam: $joinedTeam, birthday: $birthday, jaAt: $jaAt, vShopId: $vShopId, vShopPDoneId: $vShopPDoneId, fanGroup: $fanGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.sex, sex) &&
            const DeepCollectionEquality().equals(other.phoneCode, phoneCode) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.forgotHash, forgotHash) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.roleId, roleId) &&
            const DeepCollectionEquality()
                .equals(other.roleMemberCode, roleMemberCode) &&
            const DeepCollectionEquality()
                .equals(other.createdById, createdById) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            const DeepCollectionEquality().equals(other.pDoneId, pDoneId) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.isPDone, isPDone) &&
            const DeepCollectionEquality().equals(other.isFriend, isFriend) &&
            const DeepCollectionEquality()
                .equals(other.isFollowing, isFollowing) &&
            const DeepCollectionEquality()
                .equals(other.isFollowed, isFollowed) &&
            const DeepCollectionEquality()
                .equals(other.totalFollower, totalFollower) &&
            const DeepCollectionEquality()
                .equals(other.totalFollowing, totalFollowing) &&
            const DeepCollectionEquality()
                .equals(other.totalFriend, totalFriend) &&
            const DeepCollectionEquality()
                .equals(other._backgroundImages, _backgroundImages) &&
            const DeepCollectionEquality()
                .equals(other.defaultBackground, defaultBackground) &&
            const DeepCollectionEquality().equals(other.isJA, isJA) &&
            const DeepCollectionEquality().equals(other.isVShop, isVShop) &&
            const DeepCollectionEquality().equals(other.isLive, isLive) &&
            const DeepCollectionEquality()
                .equals(other.isSupervisor, isSupervisor) &&
            const DeepCollectionEquality()
                .equals(other.isModerator, isModerator) &&
            const DeepCollectionEquality()
                .equals(other.joinedTeam, joinedTeam) &&
            const DeepCollectionEquality().equals(other.birthday, birthday) &&
            const DeepCollectionEquality().equals(other.jaAt, jaAt) &&
            const DeepCollectionEquality().equals(other.vShopId, vShopId) &&
            const DeepCollectionEquality()
                .equals(other.vShopPDoneId, vShopPDoneId) &&
            const DeepCollectionEquality().equals(other.fanGroup, fanGroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(username),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(nickname),
        const DeepCollectionEquality().hash(email),
        const DeepCollectionEquality().hash(phone),
        const DeepCollectionEquality().hash(avatar),
        const DeepCollectionEquality().hash(sex),
        const DeepCollectionEquality().hash(phoneCode),
        const DeepCollectionEquality().hash(address),
        const DeepCollectionEquality().hash(forgotHash),
        const DeepCollectionEquality().hash(status),
        const DeepCollectionEquality().hash(roleId),
        const DeepCollectionEquality().hash(roleMemberCode),
        const DeepCollectionEquality().hash(createdById),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(updatedAt),
        const DeepCollectionEquality().hash(deletedAt),
        const DeepCollectionEquality().hash(pDoneId),
        const DeepCollectionEquality().hash(displayName),
        const DeepCollectionEquality().hash(isPDone),
        const DeepCollectionEquality().hash(isFriend),
        const DeepCollectionEquality().hash(isFollowing),
        const DeepCollectionEquality().hash(isFollowed),
        const DeepCollectionEquality().hash(totalFollower),
        const DeepCollectionEquality().hash(totalFollowing),
        const DeepCollectionEquality().hash(totalFriend),
        const DeepCollectionEquality().hash(_backgroundImages),
        const DeepCollectionEquality().hash(defaultBackground),
        const DeepCollectionEquality().hash(isJA),
        const DeepCollectionEquality().hash(isVShop),
        const DeepCollectionEquality().hash(isLive),
        const DeepCollectionEquality().hash(isSupervisor),
        const DeepCollectionEquality().hash(isModerator),
        const DeepCollectionEquality().hash(joinedTeam),
        const DeepCollectionEquality().hash(birthday),
        const DeepCollectionEquality().hash(jaAt),
        const DeepCollectionEquality().hash(vShopId),
        const DeepCollectionEquality().hash(vShopPDoneId),
        const DeepCollectionEquality().hash(fanGroup)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final int? id,
      final String? username,
      final String? name,
      final String? nickname,
      final String? email,
      final String? phone,
      final String? avatar,
      final Sex? sex,
      final String? phoneCode,
      final String? address,
      final String? forgotHash,
      final int? status,
      final int? roleId,
      final String? roleMemberCode,
      final int? createdById,
      final String? createdAt,
      final String? updatedAt,
      final String? deletedAt,
      final String? pDoneId,
      final String? displayName,
      final bool? isPDone,
      final bool? isFriend,
      final bool? isFollowing,
      final bool? isFollowed,
      final int totalFollower,
      final int totalFollowing,
      final int totalFriend,
      final List<String>? backgroundImages,
      final String? defaultBackground,
      final bool? isJA,
      final bool? isVShop,
      final bool? isLive,
      final bool? isSupervisor,
      final bool? isModerator,
      final Team? joinedTeam,
      final DateTime? birthday,
      final DateTime? jaAt,
      final String? vShopId,
      final int? vShopPDoneId,
      final UserFanGroupInfo? fanGroup}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int? get id;
  @override
  String? get username;
  @override
  String? get name;
  @override
  String? get nickname;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get avatar;
  @override
  Sex? get sex;
  @override
  String? get phoneCode;
  @override
  String? get address;
  @override
  String? get forgotHash;
  @override
  int? get status;
  @override
  int? get roleId;
  @override
  String? get roleMemberCode;
  @override
  int? get createdById;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get deletedAt;
  @override
  String? get pDoneId;
  @override
  String? get displayName;
  @override
  bool? get isPDone;
  @override
  bool? get isFriend;
  @override
  bool? get isFollowing;
  @override
  bool? get isFollowed;
  @override
  int get totalFollower;
  @override
  int get totalFollowing;
  @override
  int get totalFriend;
  @override
  List<String>? get backgroundImages;
  @override
  String? get defaultBackground;
  @override
  bool? get isJA;
  @override
  bool? get isVShop;
  @override
  bool? get isLive;
  @override
  bool? get isSupervisor;
  @override
  bool? get isModerator;
  @override
  Team? get joinedTeam;
  @override
  DateTime? get birthday;
  @override
  DateTime? get jaAt;
  @override
  String? get vShopId;
  @override
  int? get vShopPDoneId;
  @override
  UserFanGroupInfo? get fanGroup;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
