// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_friends.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingFriends _$FollowingFriendsFromJson(Map<String, dynamic> json) {
  return _FollowingFriends.fromJson(json);
}

/// @nodoc
mixin _$FollowingFriends {
  int? get total => throw _privateConstructorUsedError;
  List<FollowingUser>? get friends => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingFriendsCopyWith<FollowingFriends> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingFriendsCopyWith<$Res> {
  factory $FollowingFriendsCopyWith(
          FollowingFriends value, $Res Function(FollowingFriends) then) =
      _$FollowingFriendsCopyWithImpl<$Res, FollowingFriends>;
  @useResult
  $Res call({int? total, List<FollowingUser>? friends});
}

/// @nodoc
class _$FollowingFriendsCopyWithImpl<$Res, $Val extends FollowingFriends>
    implements $FollowingFriendsCopyWith<$Res> {
  _$FollowingFriendsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? friends = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      friends: freezed == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FollowingUser>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingFriendsImplCopyWith<$Res>
    implements $FollowingFriendsCopyWith<$Res> {
  factory _$$FollowingFriendsImplCopyWith(_$FollowingFriendsImpl value,
          $Res Function(_$FollowingFriendsImpl) then) =
      __$$FollowingFriendsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? total, List<FollowingUser>? friends});
}

/// @nodoc
class __$$FollowingFriendsImplCopyWithImpl<$Res>
    extends _$FollowingFriendsCopyWithImpl<$Res, _$FollowingFriendsImpl>
    implements _$$FollowingFriendsImplCopyWith<$Res> {
  __$$FollowingFriendsImplCopyWithImpl(_$FollowingFriendsImpl _value,
      $Res Function(_$FollowingFriendsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? friends = freezed,
  }) {
    return _then(_$FollowingFriendsImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      friends: freezed == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FollowingUser>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingFriendsImpl implements _FollowingFriends {
  const _$FollowingFriendsImpl({this.total, final List<FollowingUser>? friends})
      : _friends = friends;

  factory _$FollowingFriendsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingFriendsImplFromJson(json);

  @override
  final int? total;
  final List<FollowingUser>? _friends;
  @override
  List<FollowingUser>? get friends {
    final value = _friends;
    if (value == null) return null;
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowingFriends(total: $total, friends: $friends)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingFriendsImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._friends, _friends));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_friends));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingFriendsImplCopyWith<_$FollowingFriendsImpl> get copyWith =>
      __$$FollowingFriendsImplCopyWithImpl<_$FollowingFriendsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingFriendsImplToJson(
      this,
    );
  }
}

abstract class _FollowingFriends implements FollowingFriends {
  const factory _FollowingFriends(
      {final int? total,
      final List<FollowingUser>? friends}) = _$FollowingFriendsImpl;

  factory _FollowingFriends.fromJson(Map<String, dynamic> json) =
      _$FollowingFriendsImpl.fromJson;

  @override
  int? get total;
  @override
  List<FollowingUser>? get friends;
  @override
  @JsonKey(ignore: true)
  _$$FollowingFriendsImplCopyWith<_$FollowingFriendsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
