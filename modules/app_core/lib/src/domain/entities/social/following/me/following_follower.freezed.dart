// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_follower.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingFollower _$FollowingFollowerFromJson(Map<String, dynamic> json) {
  return _FollowingFollower.fromJson(json);
}

/// @nodoc
mixin _$FollowingFollower {
  bool? get isFriend => throw _privateConstructorUsedError;
  bool? get hasPendingApproval => throw _privateConstructorUsedError;
  FollowingUser? get follower => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingFollowerCopyWith<FollowingFollower> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingFollowerCopyWith<$Res> {
  factory $FollowingFollowerCopyWith(
          FollowingFollower value, $Res Function(FollowingFollower) then) =
      _$FollowingFollowerCopyWithImpl<$Res, FollowingFollower>;
  @useResult
  $Res call(
      {bool? isFriend, bool? hasPendingApproval, FollowingUser? follower});

  $FollowingUserCopyWith<$Res>? get follower;
}

/// @nodoc
class _$FollowingFollowerCopyWithImpl<$Res, $Val extends FollowingFollower>
    implements $FollowingFollowerCopyWith<$Res> {
  _$FollowingFollowerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFriend = freezed,
    Object? hasPendingApproval = freezed,
    Object? follower = freezed,
  }) {
    return _then(_value.copyWith(
      isFriend: freezed == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPendingApproval: freezed == hasPendingApproval
          ? _value.hasPendingApproval
          : hasPendingApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
      follower: freezed == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as FollowingUser?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FollowingUserCopyWith<$Res>? get follower {
    if (_value.follower == null) {
      return null;
    }

    return $FollowingUserCopyWith<$Res>(_value.follower!, (value) {
      return _then(_value.copyWith(follower: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowingFollowerImplCopyWith<$Res>
    implements $FollowingFollowerCopyWith<$Res> {
  factory _$$FollowingFollowerImplCopyWith(_$FollowingFollowerImpl value,
          $Res Function(_$FollowingFollowerImpl) then) =
      __$$FollowingFollowerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isFriend, bool? hasPendingApproval, FollowingUser? follower});

  @override
  $FollowingUserCopyWith<$Res>? get follower;
}

/// @nodoc
class __$$FollowingFollowerImplCopyWithImpl<$Res>
    extends _$FollowingFollowerCopyWithImpl<$Res, _$FollowingFollowerImpl>
    implements _$$FollowingFollowerImplCopyWith<$Res> {
  __$$FollowingFollowerImplCopyWithImpl(_$FollowingFollowerImpl _value,
      $Res Function(_$FollowingFollowerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFriend = freezed,
    Object? hasPendingApproval = freezed,
    Object? follower = freezed,
  }) {
    return _then(_$FollowingFollowerImpl(
      isFriend: freezed == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPendingApproval: freezed == hasPendingApproval
          ? _value.hasPendingApproval
          : hasPendingApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
      follower: freezed == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as FollowingUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingFollowerImpl implements _FollowingFollower {
  const _$FollowingFollowerImpl(
      {this.isFriend, this.hasPendingApproval, this.follower});

  factory _$FollowingFollowerImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingFollowerImplFromJson(json);

  @override
  final bool? isFriend;
  @override
  final bool? hasPendingApproval;
  @override
  final FollowingUser? follower;

  @override
  String toString() {
    return 'FollowingFollower(isFriend: $isFriend, hasPendingApproval: $hasPendingApproval, follower: $follower)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingFollowerImpl &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.hasPendingApproval, hasPendingApproval) ||
                other.hasPendingApproval == hasPendingApproval) &&
            (identical(other.follower, follower) ||
                other.follower == follower));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isFriend, hasPendingApproval, follower);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingFollowerImplCopyWith<_$FollowingFollowerImpl> get copyWith =>
      __$$FollowingFollowerImplCopyWithImpl<_$FollowingFollowerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingFollowerImplToJson(
      this,
    );
  }
}

abstract class _FollowingFollower implements FollowingFollower {
  const factory _FollowingFollower(
      {final bool? isFriend,
      final bool? hasPendingApproval,
      final FollowingUser? follower}) = _$FollowingFollowerImpl;

  factory _FollowingFollower.fromJson(Map<String, dynamic> json) =
      _$FollowingFollowerImpl.fromJson;

  @override
  bool? get isFriend;
  @override
  bool? get hasPendingApproval;
  @override
  FollowingUser? get follower;
  @override
  @JsonKey(ignore: true)
  _$$FollowingFollowerImplCopyWith<_$FollowingFollowerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
