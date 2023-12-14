// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_user_followers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingUserFollowers _$FollowingUserFollowersFromJson(
    Map<String, dynamic> json) {
  return _FollowingUserFollowers.fromJson(json);
}

/// @nodoc
mixin _$FollowingUserFollowers {
  int? get total => throw _privateConstructorUsedError;
  List<FollowingRelationUser>? get followers =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingUserFollowersCopyWith<FollowingUserFollowers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingUserFollowersCopyWith<$Res> {
  factory $FollowingUserFollowersCopyWith(FollowingUserFollowers value,
          $Res Function(FollowingUserFollowers) then) =
      _$FollowingUserFollowersCopyWithImpl<$Res, FollowingUserFollowers>;
  @useResult
  $Res call({int? total, List<FollowingRelationUser>? followers});
}

/// @nodoc
class _$FollowingUserFollowersCopyWithImpl<$Res,
        $Val extends FollowingUserFollowers>
    implements $FollowingUserFollowersCopyWith<$Res> {
  _$FollowingUserFollowersCopyWithImpl(this._value, this._then);

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
              as List<FollowingRelationUser>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingUserFollowersImplCopyWith<$Res>
    implements $FollowingUserFollowersCopyWith<$Res> {
  factory _$$FollowingUserFollowersImplCopyWith(
          _$FollowingUserFollowersImpl value,
          $Res Function(_$FollowingUserFollowersImpl) then) =
      __$$FollowingUserFollowersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? total, List<FollowingRelationUser>? followers});
}

/// @nodoc
class __$$FollowingUserFollowersImplCopyWithImpl<$Res>
    extends _$FollowingUserFollowersCopyWithImpl<$Res,
        _$FollowingUserFollowersImpl>
    implements _$$FollowingUserFollowersImplCopyWith<$Res> {
  __$$FollowingUserFollowersImplCopyWithImpl(
      _$FollowingUserFollowersImpl _value,
      $Res Function(_$FollowingUserFollowersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? followers = freezed,
  }) {
    return _then(_$FollowingUserFollowersImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      followers: freezed == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<FollowingRelationUser>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingUserFollowersImpl implements _FollowingUserFollowers {
  const _$FollowingUserFollowersImpl(
      {this.total, final List<FollowingRelationUser>? followers})
      : _followers = followers;

  factory _$FollowingUserFollowersImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingUserFollowersImplFromJson(json);

  @override
  final int? total;
  final List<FollowingRelationUser>? _followers;
  @override
  List<FollowingRelationUser>? get followers {
    final value = _followers;
    if (value == null) return null;
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowingUserFollowers(total: $total, followers: $followers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingUserFollowersImpl &&
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
  _$$FollowingUserFollowersImplCopyWith<_$FollowingUserFollowersImpl>
      get copyWith => __$$FollowingUserFollowersImplCopyWithImpl<
          _$FollowingUserFollowersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingUserFollowersImplToJson(
      this,
    );
  }
}

abstract class _FollowingUserFollowers implements FollowingUserFollowers {
  const factory _FollowingUserFollowers(
          {final int? total, final List<FollowingRelationUser>? followers}) =
      _$FollowingUserFollowersImpl;

  factory _FollowingUserFollowers.fromJson(Map<String, dynamic> json) =
      _$FollowingUserFollowersImpl.fromJson;

  @override
  int? get total;
  @override
  List<FollowingRelationUser>? get followers;
  @override
  @JsonKey(ignore: true)
  _$$FollowingUserFollowersImplCopyWith<_$FollowingUserFollowersImpl>
      get copyWith => throw _privateConstructorUsedError;
}
