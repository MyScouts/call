// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_followees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingFollowees _$FollowingFolloweesFromJson(Map<String, dynamic> json) {
  return _FollowingFollowees.fromJson(json);
}

/// @nodoc
mixin _$FollowingFollowees {
  int? get total => throw _privateConstructorUsedError;
  List<FollowingFollowee>? get followees => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingFolloweesCopyWith<FollowingFollowees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingFolloweesCopyWith<$Res> {
  factory $FollowingFolloweesCopyWith(
          FollowingFollowees value, $Res Function(FollowingFollowees) then) =
      _$FollowingFolloweesCopyWithImpl<$Res, FollowingFollowees>;
  @useResult
  $Res call({int? total, List<FollowingFollowee>? followees});
}

/// @nodoc
class _$FollowingFolloweesCopyWithImpl<$Res, $Val extends FollowingFollowees>
    implements $FollowingFolloweesCopyWith<$Res> {
  _$FollowingFolloweesCopyWithImpl(this._value, this._then);

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
              as List<FollowingFollowee>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingFolloweesImplCopyWith<$Res>
    implements $FollowingFolloweesCopyWith<$Res> {
  factory _$$FollowingFolloweesImplCopyWith(_$FollowingFolloweesImpl value,
          $Res Function(_$FollowingFolloweesImpl) then) =
      __$$FollowingFolloweesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? total, List<FollowingFollowee>? followees});
}

/// @nodoc
class __$$FollowingFolloweesImplCopyWithImpl<$Res>
    extends _$FollowingFolloweesCopyWithImpl<$Res, _$FollowingFolloweesImpl>
    implements _$$FollowingFolloweesImplCopyWith<$Res> {
  __$$FollowingFolloweesImplCopyWithImpl(_$FollowingFolloweesImpl _value,
      $Res Function(_$FollowingFolloweesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? followees = freezed,
  }) {
    return _then(_$FollowingFolloweesImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      followees: freezed == followees
          ? _value._followees
          : followees // ignore: cast_nullable_to_non_nullable
              as List<FollowingFollowee>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingFolloweesImpl implements _FollowingFollowees {
  const _$FollowingFolloweesImpl(
      {this.total, final List<FollowingFollowee>? followees})
      : _followees = followees;

  factory _$FollowingFolloweesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingFolloweesImplFromJson(json);

  @override
  final int? total;
  final List<FollowingFollowee>? _followees;
  @override
  List<FollowingFollowee>? get followees {
    final value = _followees;
    if (value == null) return null;
    if (_followees is EqualUnmodifiableListView) return _followees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowingFollowees(total: $total, followees: $followees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingFolloweesImpl &&
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
  _$$FollowingFolloweesImplCopyWith<_$FollowingFolloweesImpl> get copyWith =>
      __$$FollowingFolloweesImplCopyWithImpl<_$FollowingFolloweesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingFolloweesImplToJson(
      this,
    );
  }
}

abstract class _FollowingFollowees implements FollowingFollowees {
  const factory _FollowingFollowees(
      {final int? total,
      final List<FollowingFollowee>? followees}) = _$FollowingFolloweesImpl;

  factory _FollowingFollowees.fromJson(Map<String, dynamic> json) =
      _$FollowingFolloweesImpl.fromJson;

  @override
  int? get total;
  @override
  List<FollowingFollowee>? get followees;
  @override
  @JsonKey(ignore: true)
  _$$FollowingFolloweesImplCopyWith<_$FollowingFolloweesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
