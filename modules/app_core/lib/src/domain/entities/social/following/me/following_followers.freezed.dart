// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_followers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingFollowers _$FollowingFollowersFromJson(Map<String, dynamic> json) {
  return _FollowingFollowers.fromJson(json);
}

/// @nodoc
mixin _$FollowingFollowers {
  int? get total => throw _privateConstructorUsedError;
  List<FollowingFollower>? get followers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingFollowersCopyWith<FollowingFollowers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingFollowersCopyWith<$Res> {
  factory $FollowingFollowersCopyWith(
          FollowingFollowers value, $Res Function(FollowingFollowers) then) =
      _$FollowingFollowersCopyWithImpl<$Res, FollowingFollowers>;
  @useResult
  $Res call({int? total, List<FollowingFollower>? followers});
}

/// @nodoc
class _$FollowingFollowersCopyWithImpl<$Res, $Val extends FollowingFollowers>
    implements $FollowingFollowersCopyWith<$Res> {
  _$FollowingFollowersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? followers = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      followers: freezed == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<FollowingFollower>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingFollowersImplCopyWith<$Res>
    implements $FollowingFollowersCopyWith<$Res> {
  factory _$$FollowingFollowersImplCopyWith(_$FollowingFollowersImpl value,
          $Res Function(_$FollowingFollowersImpl) then) =
      __$$FollowingFollowersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? total, List<FollowingFollower>? followers});
}

/// @nodoc
class __$$FollowingFollowersImplCopyWithImpl<$Res>
    extends _$FollowingFollowersCopyWithImpl<$Res, _$FollowingFollowersImpl>
    implements _$$FollowingFollowersImplCopyWith<$Res> {
  __$$FollowingFollowersImplCopyWithImpl(_$FollowingFollowersImpl _value,
      $Res Function(_$FollowingFollowersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? followers = freezed,
  }) {
    return _then(_$FollowingFollowersImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      followers: freezed == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<FollowingFollower>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingFollowersImpl implements _FollowingFollowers {
  const _$FollowingFollowersImpl(
      {this.total, final List<FollowingFollower>? followers})
      : _followers = followers;

  factory _$FollowingFollowersImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingFollowersImplFromJson(json);

  @override
  final int? total;
  final List<FollowingFollower>? _followers;
  @override
  List<FollowingFollower>? get followers {
    final value = _followers;
    if (value == null) return null;
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowingFollowers(total: $total, followers: $followers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingFollowersImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_followers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingFollowersImplCopyWith<_$FollowingFollowersImpl> get copyWith =>
      __$$FollowingFollowersImplCopyWithImpl<_$FollowingFollowersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingFollowersImplToJson(
      this,
    );
  }
}

abstract class _FollowingFollowers implements FollowingFollowers {
  const factory _FollowingFollowers(
      {final int? total,
      final List<FollowingFollower>? followers}) = _$FollowingFollowersImpl;

  factory _FollowingFollowers.fromJson(Map<String, dynamic> json) =
      _$FollowingFollowersImpl.fromJson;

  @override
  int? get total;
  @override
  List<FollowingFollower>? get followers;
  @override
  @JsonKey(ignore: true)
  _$$FollowingFollowersImplCopyWith<_$FollowingFollowersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
