// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupDetail _$GroupDetailFromJson(Map<String, dynamic> json) {
  return _GroupDetail.fromJson(json);
}

/// @nodoc
mixin _$GroupDetail {
  Team? get team => throw _privateConstructorUsedError;
  Group? get group => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupDetailCopyWith<GroupDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupDetailCopyWith<$Res> {
  factory $GroupDetailCopyWith(
          GroupDetail value, $Res Function(GroupDetail) then) =
      _$GroupDetailCopyWithImpl<$Res, GroupDetail>;
  @useResult
  $Res call({Team? team, Group? group});

  $TeamCopyWith<$Res>? get team;
  $GroupCopyWith<$Res>? get group;
}

/// @nodoc
class _$GroupDetailCopyWithImpl<$Res, $Val extends GroupDetail>
    implements $GroupDetailCopyWith<$Res> {
  _$GroupDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = freezed,
    Object? group = freezed,
  }) {
    return _then(_value.copyWith(
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res>? get team {
    if (_value.team == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.team!, (value) {
      return _then(_value.copyWith(team: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $GroupCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupDetailImplCopyWith<$Res>
    implements $GroupDetailCopyWith<$Res> {
  factory _$$GroupDetailImplCopyWith(
          _$GroupDetailImpl value, $Res Function(_$GroupDetailImpl) then) =
      __$$GroupDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Team? team, Group? group});

  @override
  $TeamCopyWith<$Res>? get team;
  @override
  $GroupCopyWith<$Res>? get group;
}

/// @nodoc
class __$$GroupDetailImplCopyWithImpl<$Res>
    extends _$GroupDetailCopyWithImpl<$Res, _$GroupDetailImpl>
    implements _$$GroupDetailImplCopyWith<$Res> {
  __$$GroupDetailImplCopyWithImpl(
      _$GroupDetailImpl _value, $Res Function(_$GroupDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = freezed,
    Object? group = freezed,
  }) {
    return _then(_$GroupDetailImpl(
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupDetailImpl implements _GroupDetail {
  const _$GroupDetailImpl({this.team, this.group});

  factory _$GroupDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupDetailImplFromJson(json);

  @override
  final Team? team;
  @override
  final Group? group;

  @override
  String toString() {
    return 'GroupDetail(team: $team, group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupDetailImpl &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, team, group);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupDetailImplCopyWith<_$GroupDetailImpl> get copyWith =>
      __$$GroupDetailImplCopyWithImpl<_$GroupDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupDetailImplToJson(
      this,
    );
  }
}

abstract class _GroupDetail implements GroupDetail {
  const factory _GroupDetail({final Team? team, final Group? group}) =
      _$GroupDetailImpl;

  factory _GroupDetail.fromJson(Map<String, dynamic> json) =
      _$GroupDetailImpl.fromJson;

  @override
  Team? get team;
  @override
  Group? get group;
  @override
  @JsonKey(ignore: true)
  _$$GroupDetailImplCopyWith<_$GroupDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
