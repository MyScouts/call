// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_relation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingRelation _$FollowingRelationFromJson(Map<String, dynamic> json) {
  return _FollowingRelation.fromJson(json);
}

/// @nodoc
mixin _$FollowingRelation {
  bool get isFriend => throw _privateConstructorUsedError;
  bool get isFollower => throw _privateConstructorUsedError;
  bool get isFollowee => throw _privateConstructorUsedError;
  bool get hasPendingApproval => throw _privateConstructorUsedError;
  bool get isBlocked => throw _privateConstructorUsedError;
  bool get isBlocking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingRelationCopyWith<FollowingRelation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingRelationCopyWith<$Res> {
  factory $FollowingRelationCopyWith(
          FollowingRelation value, $Res Function(FollowingRelation) then) =
      _$FollowingRelationCopyWithImpl<$Res, FollowingRelation>;
  @useResult
  $Res call(
      {bool isFriend,
      bool isFollower,
      bool isFollowee,
      bool hasPendingApproval,
      bool isBlocked,
      bool isBlocking});
}

/// @nodoc
class _$FollowingRelationCopyWithImpl<$Res, $Val extends FollowingRelation>
    implements $FollowingRelationCopyWith<$Res> {
  _$FollowingRelationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFriend = null,
    Object? isFollower = null,
    Object? isFollowee = null,
    Object? hasPendingApproval = null,
    Object? isBlocked = null,
    Object? isBlocking = null,
  }) {
    return _then(_value.copyWith(
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollower: null == isFollower
          ? _value.isFollower
          : isFollower // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowee: null == isFollowee
          ? _value.isFollowee
          : isFollowee // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPendingApproval: null == hasPendingApproval
          ? _value.hasPendingApproval
          : hasPendingApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocking: null == isBlocking
          ? _value.isBlocking
          : isBlocking // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingRelationImplCopyWith<$Res>
    implements $FollowingRelationCopyWith<$Res> {
  factory _$$FollowingRelationImplCopyWith(_$FollowingRelationImpl value,
          $Res Function(_$FollowingRelationImpl) then) =
      __$$FollowingRelationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFriend,
      bool isFollower,
      bool isFollowee,
      bool hasPendingApproval,
      bool isBlocked,
      bool isBlocking});
}

/// @nodoc
class __$$FollowingRelationImplCopyWithImpl<$Res>
    extends _$FollowingRelationCopyWithImpl<$Res, _$FollowingRelationImpl>
    implements _$$FollowingRelationImplCopyWith<$Res> {
  __$$FollowingRelationImplCopyWithImpl(_$FollowingRelationImpl _value,
      $Res Function(_$FollowingRelationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFriend = null,
    Object? isFollower = null,
    Object? isFollowee = null,
    Object? hasPendingApproval = null,
    Object? isBlocked = null,
    Object? isBlocking = null,
  }) {
    return _then(_$FollowingRelationImpl(
      isFriend: null == isFriend
          ? _value.isFriend
          : isFriend // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollower: null == isFollower
          ? _value.isFollower
          : isFollower // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowee: null == isFollowee
          ? _value.isFollowee
          : isFollowee // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPendingApproval: null == hasPendingApproval
          ? _value.hasPendingApproval
          : hasPendingApproval // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      isBlocking: null == isBlocking
          ? _value.isBlocking
          : isBlocking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingRelationImpl implements _FollowingRelation {
  const _$FollowingRelationImpl(
      {this.isFriend = false,
      this.isFollower = false,
      this.isFollowee = false,
      this.hasPendingApproval = false,
      this.isBlocked = false,
      this.isBlocking = false});

  factory _$FollowingRelationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingRelationImplFromJson(json);

  @override
  @JsonKey()
  final bool isFriend;
  @override
  @JsonKey()
  final bool isFollower;
  @override
  @JsonKey()
  final bool isFollowee;
  @override
  @JsonKey()
  final bool hasPendingApproval;
  @override
  @JsonKey()
  final bool isBlocked;
  @override
  @JsonKey()
  final bool isBlocking;

  @override
  String toString() {
    return 'FollowingRelation(isFriend: $isFriend, isFollower: $isFollower, isFollowee: $isFollowee, hasPendingApproval: $hasPendingApproval, isBlocked: $isBlocked, isBlocking: $isBlocking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingRelationImpl &&
            (identical(other.isFriend, isFriend) ||
                other.isFriend == isFriend) &&
            (identical(other.isFollower, isFollower) ||
                other.isFollower == isFollower) &&
            (identical(other.isFollowee, isFollowee) ||
                other.isFollowee == isFollowee) &&
            (identical(other.hasPendingApproval, hasPendingApproval) ||
                other.hasPendingApproval == hasPendingApproval) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.isBlocking, isBlocking) ||
                other.isBlocking == isBlocking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isFriend, isFollower, isFollowee,
      hasPendingApproval, isBlocked, isBlocking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingRelationImplCopyWith<_$FollowingRelationImpl> get copyWith =>
      __$$FollowingRelationImplCopyWithImpl<_$FollowingRelationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingRelationImplToJson(
      this,
    );
  }
}

abstract class _FollowingRelation implements FollowingRelation {
  const factory _FollowingRelation(
      {final bool isFriend,
      final bool isFollower,
      final bool isFollowee,
      final bool hasPendingApproval,
      final bool isBlocked,
      final bool isBlocking}) = _$FollowingRelationImpl;

  factory _FollowingRelation.fromJson(Map<String, dynamic> json) =
      _$FollowingRelationImpl.fromJson;

  @override
  bool get isFriend;
  @override
  bool get isFollower;
  @override
  bool get isFollowee;
  @override
  bool get hasPendingApproval;
  @override
  bool get isBlocked;
  @override
  bool get isBlocking;
  @override
  @JsonKey(ignore: true)
  _$$FollowingRelationImplCopyWith<_$FollowingRelationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
