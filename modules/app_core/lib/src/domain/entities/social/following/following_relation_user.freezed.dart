// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_relation_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingRelationUser _$FollowingRelationUserFromJson(
    Map<String, dynamic> json) {
  return _FollowingRelationUser.fromJson(json);
}

/// @nodoc
mixin _$FollowingRelationUser {
  FollowingUser? get user => throw _privateConstructorUsedError;
  FollowingRelation? get relation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingRelationUserCopyWith<FollowingRelationUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingRelationUserCopyWith<$Res> {
  factory $FollowingRelationUserCopyWith(FollowingRelationUser value,
          $Res Function(FollowingRelationUser) then) =
      _$FollowingRelationUserCopyWithImpl<$Res, FollowingRelationUser>;
  @useResult
  $Res call({FollowingUser? user, FollowingRelation? relation});

  $FollowingUserCopyWith<$Res>? get user;
  $FollowingRelationCopyWith<$Res>? get relation;
}

/// @nodoc
class _$FollowingRelationUserCopyWithImpl<$Res,
        $Val extends FollowingRelationUser>
    implements $FollowingRelationUserCopyWith<$Res> {
  _$FollowingRelationUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? relation = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as FollowingUser?,
      relation: freezed == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as FollowingRelation?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FollowingUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $FollowingUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FollowingRelationCopyWith<$Res>? get relation {
    if (_value.relation == null) {
      return null;
    }

    return $FollowingRelationCopyWith<$Res>(_value.relation!, (value) {
      return _then(_value.copyWith(relation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowingRelationUserImplCopyWith<$Res>
    implements $FollowingRelationUserCopyWith<$Res> {
  factory _$$FollowingRelationUserImplCopyWith(
          _$FollowingRelationUserImpl value,
          $Res Function(_$FollowingRelationUserImpl) then) =
      __$$FollowingRelationUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FollowingUser? user, FollowingRelation? relation});

  @override
  $FollowingUserCopyWith<$Res>? get user;
  @override
  $FollowingRelationCopyWith<$Res>? get relation;
}

/// @nodoc
class __$$FollowingRelationUserImplCopyWithImpl<$Res>
    extends _$FollowingRelationUserCopyWithImpl<$Res,
        _$FollowingRelationUserImpl>
    implements _$$FollowingRelationUserImplCopyWith<$Res> {
  __$$FollowingRelationUserImplCopyWithImpl(_$FollowingRelationUserImpl _value,
      $Res Function(_$FollowingRelationUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? relation = freezed,
  }) {
    return _then(_$FollowingRelationUserImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as FollowingUser?,
      relation: freezed == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as FollowingRelation?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingRelationUserImpl implements _FollowingRelationUser {
  const _$FollowingRelationUserImpl({this.user, this.relation});

  factory _$FollowingRelationUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingRelationUserImplFromJson(json);

  @override
  final FollowingUser? user;
  @override
  final FollowingRelation? relation;

  @override
  String toString() {
    return 'FollowingRelationUser(user: $user, relation: $relation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingRelationUserImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.relation, relation) ||
                other.relation == relation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, relation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingRelationUserImplCopyWith<_$FollowingRelationUserImpl>
      get copyWith => __$$FollowingRelationUserImplCopyWithImpl<
          _$FollowingRelationUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingRelationUserImplToJson(
      this,
    );
  }
}

abstract class _FollowingRelationUser implements FollowingRelationUser {
  const factory _FollowingRelationUser(
      {final FollowingUser? user,
      final FollowingRelation? relation}) = _$FollowingRelationUserImpl;

  factory _FollowingRelationUser.fromJson(Map<String, dynamic> json) =
      _$FollowingRelationUserImpl.fromJson;

  @override
  FollowingUser? get user;
  @override
  FollowingRelation? get relation;
  @override
  @JsonKey(ignore: true)
  _$$FollowingRelationUserImplCopyWith<_$FollowingRelationUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}
