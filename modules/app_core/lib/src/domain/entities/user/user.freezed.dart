// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$UserCopyWithImpl<$Res, User>;
  @useResult
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
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
    Object? totalFollower = null,
    Object? totalFollowing = null,
    Object? totalFriend = null,
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      forgotHash: freezed == forgotHash
          ? _value.forgotHash
          : forgotHash // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleMemberCode: freezed == roleMemberCode
          ? _value.roleMemberCode
          : roleMemberCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      pDoneId: freezed == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPDone: freezed == isPDone
          ? _value.isPDone
          : isPDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFriend: freezed == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalFollower: null == totalFollower
          ? _value.totalFollower
          : totalFollower // ignore: cast_nullable_to_non_nullable
              as int,
      totalFollowing: null == totalFollowing
          ? _value.totalFollowing
          : totalFollowing // ignore: cast_nullable_to_non_nullable
              as int,
      totalFriend: null == totalFriend
          ? _value.totalFriend
          : totalFriend // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundImages: freezed == backgroundImages
          ? _value.backgroundImages
          : backgroundImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      defaultBackground: freezed == defaultBackground
          ? _value.defaultBackground
          : defaultBackground // ignore: cast_nullable_to_non_nullable
              as String?,
      isJA: freezed == isJA
          ? _value.isJA
          : isJA // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVShop: freezed == isVShop
          ? _value.isVShop
          : isVShop // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSupervisor: freezed == isSupervisor
          ? _value.isSupervisor
          : isSupervisor // ignore: cast_nullable_to_non_nullable
              as bool?,
      isModerator: freezed == isModerator
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinedTeam: freezed == joinedTeam
          ? _value.joinedTeam
          : joinedTeam // ignore: cast_nullable_to_non_nullable
              as Team?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      jaAt: freezed == jaAt
          ? _value.jaAt
          : jaAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vShopId: freezed == vShopId
          ? _value.vShopId
          : vShopId // ignore: cast_nullable_to_non_nullable
              as String?,
      vShopPDoneId: freezed == vShopPDoneId
          ? _value.vShopPDoneId
          : vShopPDoneId // ignore: cast_nullable_to_non_nullable
              as int?,
      fanGroup: freezed == fanGroup
          ? _value.fanGroup
          : fanGroup // ignore: cast_nullable_to_non_nullable
              as UserFanGroupInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get joinedTeam {
    if (_value.joinedTeam == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.joinedTeam!, (value) {
      return _then(_value.copyWith(joinedTeam: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserFanGroupInfoCopyWith<$Res>? get fanGroup {
    if (_value.fanGroup == null) {
      return null;
    }

    return $UserFanGroupInfoCopyWith<$Res>(_value.fanGroup!, (value) {
      return _then(_value.copyWith(fanGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    Object? totalFollower = null,
    Object? totalFollowing = null,
    Object? totalFriend = null,
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex?,
      phoneCode: freezed == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      forgotHash: freezed == forgotHash
          ? _value.forgotHash
          : forgotHash // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleMemberCode: freezed == roleMemberCode
          ? _value.roleMemberCode
          : roleMemberCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      pDoneId: freezed == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPDone: freezed == isPDone
          ? _value.isPDone
          : isPDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFriend: freezed == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalFollower: null == totalFollower
          ? _value.totalFollower
          : totalFollower // ignore: cast_nullable_to_non_nullable
              as int,
      totalFollowing: null == totalFollowing
          ? _value.totalFollowing
          : totalFollowing // ignore: cast_nullable_to_non_nullable
              as int,
      totalFriend: null == totalFriend
          ? _value.totalFriend
          : totalFriend // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundImages: freezed == backgroundImages
          ? _value._backgroundImages
          : backgroundImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      defaultBackground: freezed == defaultBackground
          ? _value.defaultBackground
          : defaultBackground // ignore: cast_nullable_to_non_nullable
              as String?,
      isJA: freezed == isJA
          ? _value.isJA
          : isJA // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVShop: freezed == isVShop
          ? _value.isVShop
          : isVShop // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSupervisor: freezed == isSupervisor
          ? _value.isSupervisor
          : isSupervisor // ignore: cast_nullable_to_non_nullable
              as bool?,
      isModerator: freezed == isModerator
          ? _value.isModerator
          : isModerator // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinedTeam: freezed == joinedTeam
          ? _value.joinedTeam
          : joinedTeam // ignore: cast_nullable_to_non_nullable
              as Team?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      jaAt: freezed == jaAt
          ? _value.jaAt
          : jaAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vShopId: freezed == vShopId
          ? _value.vShopId
          : vShopId // ignore: cast_nullable_to_non_nullable
              as String?,
      vShopPDoneId: freezed == vShopPDoneId
          ? _value.vShopPDoneId
          : vShopPDoneId // ignore: cast_nullable_to_non_nullable
              as int?,
      fanGroup: freezed == fanGroup
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
    if (_backgroundImages is EqualUnmodifiableListView)
      return _backgroundImages;
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
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.forgotHash, forgotHash) ||
                other.forgotHash == forgotHash) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.roleMemberCode, roleMemberCode) ||
                other.roleMemberCode == roleMemberCode) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.pDoneId, pDoneId) || other.pDoneId == pDoneId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.isPDone, isPDone) || other.isPDone == isPDone) &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed) &&
            (identical(other.totalFollower, totalFollower) ||
                other.totalFollower == totalFollower) &&
            (identical(other.totalFollowing, totalFollowing) ||
                other.totalFollowing == totalFollowing) &&
            (identical(other.totalFriend, totalFriend) ||
                other.totalFriend == totalFriend) &&
            const DeepCollectionEquality()
                .equals(other._backgroundImages, _backgroundImages) &&
            (identical(other.defaultBackground, defaultBackground) ||
                other.defaultBackground == defaultBackground) &&
            (identical(other.isJA, isJA) || other.isJA == isJA) &&
            (identical(other.isVShop, isVShop) || other.isVShop == isVShop) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            (identical(other.isSupervisor, isSupervisor) ||
                other.isSupervisor == isSupervisor) &&
            (identical(other.isModerator, isModerator) ||
                other.isModerator == isModerator) &&
            (identical(other.joinedTeam, joinedTeam) ||
                other.joinedTeam == joinedTeam) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.jaAt, jaAt) || other.jaAt == jaAt) &&
            (identical(other.vShopId, vShopId) || other.vShopId == vShopId) &&
            (identical(other.vShopPDoneId, vShopPDoneId) ||
                other.vShopPDoneId == vShopPDoneId) &&
            (identical(other.fanGroup, fanGroup) ||
                other.fanGroup == fanGroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        username,
        name,
        nickname,
        email,
        phone,
        avatar,
        sex,
        phoneCode,
        address,
        forgotHash,
        status,
        roleId,
        roleMemberCode,
        createdById,
        createdAt,
        updatedAt,
        deletedAt,
        pDoneId,
        displayName,
        isPDone,
        isFriend,
        isFollowing,
        isFollowed,
        totalFollower,
        totalFollowing,
        totalFriend,
        const DeepCollectionEquality().hash(_backgroundImages),
        defaultBackground,
        isJA,
        isVShop,
        isLive,
        isSupervisor,
        isModerator,
        joinedTeam,
        birthday,
        jaAt,
        vShopId,
        vShopPDoneId,
        fanGroup
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
