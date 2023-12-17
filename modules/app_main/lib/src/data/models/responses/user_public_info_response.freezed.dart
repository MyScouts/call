// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_public_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPublicInfoResponse _$UserPublicInfoResponseFromJson(
    Map<String, dynamic> json) {
  return _UserPublicInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$UserPublicInfoResponse {
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPublicInfoResponseCopyWith<UserPublicInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPublicInfoResponseCopyWith<$Res> {
  factory $UserPublicInfoResponseCopyWith(UserPublicInfoResponse value,
          $Res Function(UserPublicInfoResponse) then) =
      _$UserPublicInfoResponseCopyWithImpl<$Res, UserPublicInfoResponse>;
  @useResult
  $Res call({User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserPublicInfoResponseCopyWithImpl<$Res,
        $Val extends UserPublicInfoResponse>
    implements $UserPublicInfoResponseCopyWith<$Res> {
  _$UserPublicInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserPublicInfoResponseImplCopyWith<$Res>
    implements $UserPublicInfoResponseCopyWith<$Res> {
  factory _$$UserPublicInfoResponseImplCopyWith(
          _$UserPublicInfoResponseImpl value,
          $Res Function(_$UserPublicInfoResponseImpl) then) =
      __$$UserPublicInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserPublicInfoResponseImplCopyWithImpl<$Res>
    extends _$UserPublicInfoResponseCopyWithImpl<$Res,
        _$UserPublicInfoResponseImpl>
    implements _$$UserPublicInfoResponseImplCopyWith<$Res> {
  __$$UserPublicInfoResponseImplCopyWithImpl(
      _$UserPublicInfoResponseImpl _value,
      $Res Function(_$UserPublicInfoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UserPublicInfoResponseImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPublicInfoResponseImpl implements _UserPublicInfoResponse {
  const _$UserPublicInfoResponseImpl({this.user});

  factory _$UserPublicInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPublicInfoResponseImplFromJson(json);

  @override
  final User? user;

  @override
  String toString() {
    return 'UserPublicInfoResponse(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPublicInfoResponseImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPublicInfoResponseImplCopyWith<_$UserPublicInfoResponseImpl>
      get copyWith => __$$UserPublicInfoResponseImplCopyWithImpl<
          _$UserPublicInfoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPublicInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _UserPublicInfoResponse implements UserPublicInfoResponse {
  const factory _UserPublicInfoResponse({final User? user}) =
      _$UserPublicInfoResponseImpl;

  factory _UserPublicInfoResponse.fromJson(Map<String, dynamic> json) =
      _$UserPublicInfoResponseImpl.fromJson;

  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$UserPublicInfoResponseImplCopyWith<_$UserPublicInfoResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
