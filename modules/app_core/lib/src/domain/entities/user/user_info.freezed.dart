// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  int get id => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get pDoneId => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get sexCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {int id,
      String? avatar,
      String displayName,
      String pDoneId,
      String? fullName,
      DateTime? birthday,
      String phone,
      String? email,
      int? sexCode});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = freezed,
    Object? displayName = null,
    Object? pDoneId = null,
    Object? fullName = freezed,
    Object? birthday = freezed,
    Object? phone = null,
    Object? email = freezed,
    Object? sexCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      pDoneId: null == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      sexCode: freezed == sexCode
          ? _value.sexCode
          : sexCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? avatar,
      String displayName,
      String pDoneId,
      String? fullName,
      DateTime? birthday,
      String phone,
      String? email,
      int? sexCode});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avatar = freezed,
    Object? displayName = null,
    Object? pDoneId = null,
    Object? fullName = freezed,
    Object? birthday = freezed,
    Object? phone = null,
    Object? email = freezed,
    Object? sexCode = freezed,
  }) {
    return _then(_$UserInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      pDoneId: null == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      sexCode: freezed == sexCode
          ? _value.sexCode
          : sexCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {required this.id,
      this.avatar,
      required this.displayName,
      required this.pDoneId,
      this.fullName,
      this.birthday,
      required this.phone,
      this.email,
      this.sexCode});

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final int id;
  @override
  final String? avatar;
  @override
  final String displayName;
  @override
  final String pDoneId;
  @override
  final String? fullName;
  @override
  final DateTime? birthday;
  @override
  final String phone;
  @override
  final String? email;
  @override
  final int? sexCode;

  @override
  String toString() {
    return 'UserInfo(id: $id, avatar: $avatar, displayName: $displayName, pDoneId: $pDoneId, fullName: $fullName, birthday: $birthday, phone: $phone, email: $email, sexCode: $sexCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.pDoneId, pDoneId) || other.pDoneId == pDoneId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.sexCode, sexCode) || other.sexCode == sexCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, avatar, displayName, pDoneId,
      fullName, birthday, phone, email, sexCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {required final int id,
      final String? avatar,
      required final String displayName,
      required final String pDoneId,
      final String? fullName,
      final DateTime? birthday,
      required final String phone,
      final String? email,
      final int? sexCode}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  int get id;
  @override
  String? get avatar;
  @override
  String get displayName;
  @override
  String get pDoneId;
  @override
  String? get fullName;
  @override
  DateTime? get birthday;
  @override
  String get phone;
  @override
  String? get email;
  @override
  int? get sexCode;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
