// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_user_friends.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowingUserFriends _$FollowingUserFriendsFromJson(Map<String, dynamic> json) {
  return _FollowingUserFriends.fromJson(json);
}

/// @nodoc
mixin _$FollowingUserFriends {
  int? get total => throw _privateConstructorUsedError;
  List<FollowingRelationUser>? get friends =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowingUserFriendsCopyWith<FollowingUserFriends> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingUserFriendsCopyWith<$Res> {
  factory $FollowingUserFriendsCopyWith(FollowingUserFriends value,
          $Res Function(FollowingUserFriends) then) =
      _$FollowingUserFriendsCopyWithImpl<$Res, FollowingUserFriends>;
  @useResult
  $Res call({int? total, List<FollowingRelationUser>? friends});
}

/// @nodoc
class _$FollowingUserFriendsCopyWithImpl<$Res,
        $Val extends FollowingUserFriends>
    implements $FollowingUserFriendsCopyWith<$Res> {
  _$FollowingUserFriendsCopyWithImpl(this._value, this._then);

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
              as List<FollowingRelationUser>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowingUserFriendsImplCopyWith<$Res>
    implements $FollowingUserFriendsCopyWith<$Res> {
  factory _$$FollowingUserFriendsImplCopyWith(_$FollowingUserFriendsImpl value,
          $Res Function(_$FollowingUserFriendsImpl) then) =
      __$$FollowingUserFriendsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? total, List<FollowingRelationUser>? friends});
}

/// @nodoc
class __$$FollowingUserFriendsImplCopyWithImpl<$Res>
    extends _$FollowingUserFriendsCopyWithImpl<$Res, _$FollowingUserFriendsImpl>
    implements _$$FollowingUserFriendsImplCopyWith<$Res> {
  __$$FollowingUserFriendsImplCopyWithImpl(_$FollowingUserFriendsImpl _value,
      $Res Function(_$FollowingUserFriendsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? friends = freezed,
  }) {
    return _then(_$FollowingUserFriendsImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      friends: freezed == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<FollowingRelationUser>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowingUserFriendsImpl implements _FollowingUserFriends {
  const _$FollowingUserFriendsImpl(
      {this.total, final List<FollowingRelationUser>? friends})
      : _friends = friends;

  factory _$FollowingUserFriendsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingUserFriendsImplFromJson(json);

  @override
  final int? total;
  final List<FollowingRelationUser>? _friends;
  @override
  List<FollowingRelationUser>? get friends {
    final value = _friends;
    if (value == null) return null;
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FollowingUserFriends(total: $total, friends: $friends)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingUserFriendsImpl &&
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
  _$$FollowingUserFriendsImplCopyWith<_$FollowingUserFriendsImpl>
      get copyWith =>
          __$$FollowingUserFriendsImplCopyWithImpl<_$FollowingUserFriendsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingUserFriendsImplToJson(
      this,
    );
  }
}

abstract class _FollowingUserFriends implements FollowingUserFriends {
  const factory _FollowingUserFriends(
      {final int? total,
      final List<FollowingRelationUser>? friends}) = _$FollowingUserFriendsImpl;

  factory _FollowingUserFriends.fromJson(Map<String, dynamic> json) =
      _$FollowingUserFriendsImpl.fromJson;

  @override
  int? get total;
  @override
  List<FollowingRelationUser>? get friends;
  @override
  @JsonKey(ignore: true)
  _$$FollowingUserFriendsImplCopyWith<_$FollowingUserFriendsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
