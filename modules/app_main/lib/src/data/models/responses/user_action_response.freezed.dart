// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_action_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowUserResponse _$FollowUserResponseFromJson(Map<String, dynamic> json) {
  return _FollowUserResponse.fromJson(json);
}

/// @nodoc
mixin _$FollowUserResponse {
  bool get isFriend => throw _privateConstructorUsedError;
  bool get isFollowed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowUserResponseCopyWith<FollowUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUserResponseCopyWith<$Res> {
  factory $FollowUserResponseCopyWith(
          FollowUserResponse value, $Res Function(FollowUserResponse) then) =
      _$FollowUserResponseCopyWithImpl<$Res, FollowUserResponse>;
  @useResult
  $Res call({bool isFriend, bool isFollowed});
}

/// @nodoc
class _$FollowUserResponseCopyWithImpl<$Res, $Val extends FollowUserResponse>
    implements $FollowUserResponseCopyWith<$Res> {
  _$FollowUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFriend = null,
    Object? isFollowed = null,
  }) {
    return _then(_value.copyWith(
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowed: null == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowUserResponseImplCopyWith<$Res>
    implements $FollowUserResponseCopyWith<$Res> {
  factory _$$FollowUserResponseImplCopyWith(_$FollowUserResponseImpl value,
          $Res Function(_$FollowUserResponseImpl) then) =
      __$$FollowUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFriend, bool isFollowed});
}

/// @nodoc
class __$$FollowUserResponseImplCopyWithImpl<$Res>
    extends _$FollowUserResponseCopyWithImpl<$Res, _$FollowUserResponseImpl>
    implements _$$FollowUserResponseImplCopyWith<$Res> {
  __$$FollowUserResponseImplCopyWithImpl(_$FollowUserResponseImpl _value,
      $Res Function(_$FollowUserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFriend = null,
    Object? isFollowed = null,
  }) {
    return _then(_$FollowUserResponseImpl(
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowed: null == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowUserResponseImpl implements _FollowUserResponse {
  const _$FollowUserResponseImpl(
      {required this.isFriend, required this.isFollowed});

  factory _$FollowUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUserResponseImplFromJson(json);

  @override
  final bool isFriend;
  @override
  final bool isFollowed;

  @override
  String toString() {
    return 'FollowUserResponse(isFriend: $isFriend, isFollowed: $isFollowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUserResponseImpl &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isFriend, isFollowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUserResponseImplCopyWith<_$FollowUserResponseImpl> get copyWith =>
      __$$FollowUserResponseImplCopyWithImpl<_$FollowUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUserResponseImplToJson(
      this,
    );
  }
}

abstract class _FollowUserResponse implements FollowUserResponse {
  const factory _FollowUserResponse(
      {required final bool isFriend,
      required final bool isFollowed}) = _$FollowUserResponseImpl;

  factory _FollowUserResponse.fromJson(Map<String, dynamic> json) =
      _$FollowUserResponseImpl.fromJson;

  @override
  bool get isFriend;
  @override
  bool get isFollowed;
  @override
  @JsonKey(ignore: true)
  _$$FollowUserResponseImplCopyWith<_$FollowUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
