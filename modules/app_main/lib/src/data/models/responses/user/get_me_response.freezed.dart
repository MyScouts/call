// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_me_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetMeResponse _$GetMeResponseFromJson(Map<String, dynamic> json) {
  return _GetMeResponse.fromJson(json);
}

/// @nodoc
mixin _$GetMeResponse {
  UserInfo get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetMeResponseCopyWith<GetMeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetMeResponseCopyWith<$Res> {
  factory $GetMeResponseCopyWith(
          GetMeResponse value, $Res Function(GetMeResponse) then) =
      _$GetMeResponseCopyWithImpl<$Res, GetMeResponse>;
  @useResult
  $Res call({UserInfo user});

  $UserInfoCopyWith<$Res> get user;
}

/// @nodoc
class _$GetMeResponseCopyWithImpl<$Res, $Val extends GetMeResponse>
    implements $GetMeResponseCopyWith<$Res> {
  _$GetMeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get user {
    return $UserInfoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetMeResponseImplCopyWith<$Res>
    implements $GetMeResponseCopyWith<$Res> {
  factory _$$GetMeResponseImplCopyWith(
          _$GetMeResponseImpl value, $Res Function(_$GetMeResponseImpl) then) =
      __$$GetMeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserInfo user});

  @override
  $UserInfoCopyWith<$Res> get user;
}

/// @nodoc
class __$$GetMeResponseImplCopyWithImpl<$Res>
    extends _$GetMeResponseCopyWithImpl<$Res, _$GetMeResponseImpl>
    implements _$$GetMeResponseImplCopyWith<$Res> {
  __$$GetMeResponseImplCopyWithImpl(
      _$GetMeResponseImpl _value, $Res Function(_$GetMeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$GetMeResponseImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetMeResponseImpl implements _GetMeResponse {
  const _$GetMeResponseImpl({required this.user});

  factory _$GetMeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetMeResponseImplFromJson(json);

  @override
  final UserInfo user;

  @override
  String toString() {
    return 'GetMeResponse(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMeResponseImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMeResponseImplCopyWith<_$GetMeResponseImpl> get copyWith =>
      __$$GetMeResponseImplCopyWithImpl<_$GetMeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetMeResponseImplToJson(
      this,
    );
  }
}

abstract class _GetMeResponse implements GetMeResponse {
  const factory _GetMeResponse({required final UserInfo user}) =
      _$GetMeResponseImpl;

  factory _GetMeResponse.fromJson(Map<String, dynamic> json) =
      _$GetMeResponseImpl.fromJson;

  @override
  UserInfo get user;
  @override
  @JsonKey(ignore: true)
  _$$GetMeResponseImplCopyWith<_$GetMeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
