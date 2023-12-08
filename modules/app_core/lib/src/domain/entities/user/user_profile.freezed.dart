// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileInfo _$UserProfileInfoFromJson(Map<String, dynamic> json) {
  return _UserProfileInfo.fromJson(json);
}

/// @nodoc
mixin _$UserProfileInfo {
  DateTime? get birthday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileInfoCopyWith<UserProfileInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileInfoCopyWith<$Res> {
  factory $UserProfileInfoCopyWith(
          UserProfileInfo value, $Res Function(UserProfileInfo) then) =
      _$UserProfileInfoCopyWithImpl<$Res, UserProfileInfo>;
  @useResult
  $Res call({DateTime? birthday});
}

/// @nodoc
class _$UserProfileInfoCopyWithImpl<$Res, $Val extends UserProfileInfo>
    implements $UserProfileInfoCopyWith<$Res> {
  _$UserProfileInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthday = freezed,
  }) {
    return _then(_value.copyWith(
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileInfoImplCopyWith<$Res>
    implements $UserProfileInfoCopyWith<$Res> {
  factory _$$UserProfileInfoImplCopyWith(_$UserProfileInfoImpl value,
          $Res Function(_$UserProfileInfoImpl) then) =
      __$$UserProfileInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? birthday});
}

/// @nodoc
class __$$UserProfileInfoImplCopyWithImpl<$Res>
    extends _$UserProfileInfoCopyWithImpl<$Res, _$UserProfileInfoImpl>
    implements _$$UserProfileInfoImplCopyWith<$Res> {
  __$$UserProfileInfoImplCopyWithImpl(
      _$UserProfileInfoImpl _value, $Res Function(_$UserProfileInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthday = freezed,
  }) {
    return _then(_$UserProfileInfoImpl(
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileInfoImpl implements _UserProfileInfo {
  const _$UserProfileInfoImpl({this.birthday});

  factory _$UserProfileInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileInfoImplFromJson(json);

  @override
  final DateTime? birthday;

  @override
  String toString() {
    return 'UserProfileInfo(birthday: $birthday)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileInfoImpl &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, birthday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileInfoImplCopyWith<_$UserProfileInfoImpl> get copyWith =>
      __$$UserProfileInfoImplCopyWithImpl<_$UserProfileInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileInfoImplToJson(
      this,
    );
  }
}

abstract class _UserProfileInfo implements UserProfileInfo {
  const factory _UserProfileInfo({final DateTime? birthday}) =
      _$UserProfileInfoImpl;

  factory _UserProfileInfo.fromJson(Map<String, dynamic> json) =
      _$UserProfileInfoImpl.fromJson;

  @override
  DateTime? get birthday;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileInfoImplCopyWith<_$UserProfileInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
