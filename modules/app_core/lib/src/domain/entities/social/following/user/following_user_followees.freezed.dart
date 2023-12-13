// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_user_followees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingUserFollowees _$FollowingUserFolloweesFromJson(
    Map<String, dynamic> json) {
  return _FollowingUserFollowees.fromJson(json);
}

/// @nodoc
mixin _$FollowingUserFollowees {
  int? get total => throw _privateConstructorUsedError;
  List<FollowingRelationUser>? get followees =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingUserFolloweesCopyWith<FollowingUserFollowees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingUserFolloweesCopyWith<$Res> {
  factory $FollowingUserFolloweesCopyWith(FollowingUserFollowees value,
          $Res Function(FollowingUserFollowees) then) =
      _$FollowingUserFolloweesCopyWithImpl<$Res, FollowingUserFollowees>;
  @useResult
  $Res call({int? total, List<FollowingRelationUser>? followees});
}

/// @nodoc
class _$FollowingUserFolloweesCopyWithImpl<$Res,
        $Val extends FollowingUserFollowees>
    implements $FollowingUserFolloweesCopyWith<$Res> {
  _$FollowingUserFolloweesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? followees = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      followees: freezed == followees
          ? _value.followees
          : followees // ignore: cast_nullable_to_non_nullable
              as List<FollowingRelationUser>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingUserFolloweesImplCopyWith<$Res>
    implements $FollowingUserFolloweesCopyWith<$Res> {
  factory _$$FollowingUserFolloweesImplCopyWith(
          _$FollowingUserFolloweesImpl value,
          $Res Function(_$FollowingUserFolloweesImpl) then) =
      __$$FollowingUserFolloweesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? total, List<FollowingRelationUser>? followees});
}

/// @nodoc
class __$$FollowingUserFolloweesImplCopyWithImpl<$Res>
    extends _$FollowingUserFolloweesCopyWithImpl<$Res,
        _$FollowingUserFolloweesImpl>
    implements _$$FollowingUserFolloweesImplCopyWith<$Res> {
  __$$FollowingUserFolloweesImplCopyWithImpl(
      _$FollowingUserFolloweesImpl _value,
      $Res Function(_$FollowingUserFolloweesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? followees = freezed,
  }) {
    return _then(_$FollowingUserFolloweesImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      followees: freezed == followees
          ? _value._followees
          : followees // ignore: cast_nullable_to_non_nullable
              as List<FollowingRelationUser>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingUserFolloweesImpl implements _FollowingUserFollowees {
  const _$FollowingUserFolloweesImpl(
      {this.total, final List<FollowingRelationUser>? followees})
      : _followees = followees;

  factory _$FollowingUserFolloweesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingUserFolloweesImplFromJson(json);

  @override
  final int? total;
  final List<FollowingRelationUser>? _followees;
  @override
  List<FollowingRelationUser>? get followees {
    final value = _followees;
    if (value == null) return null;
    if (_followees is EqualUnmodifiableListView) return _followees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowingUserFollowees(total: $total, followees: $followees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingUserFolloweesImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._followees, _followees));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_followees));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingUserFolloweesImplCopyWith<_$FollowingUserFolloweesImpl>
      get copyWith => __$$FollowingUserFolloweesImplCopyWithImpl<
          _$FollowingUserFolloweesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingUserFolloweesImplToJson(
      this,
    );
  }
}

abstract class _FollowingUserFollowees implements FollowingUserFollowees {
  const factory _FollowingUserFollowees(
          {final int? total, final List<FollowingRelationUser>? followees}) =
      _$FollowingUserFolloweesImpl;

  factory _FollowingUserFollowees.fromJson(Map<String, dynamic> json) =
      _$FollowingUserFolloweesImpl.fromJson;

  @override
  int? get total;
  @override
  List<FollowingRelationUser>? get followees;
  @override
  @JsonKey(ignore: true)
  _$$FollowingUserFolloweesImplCopyWith<_$FollowingUserFolloweesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
