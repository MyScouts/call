// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$GroupDetailCopyWithImpl<$Res>;
  $Res call({Team? team, Group? group});

  $TeamCopyWith<$Res>? get team;
  $GroupCopyWith<$Res>? get group;
}

/// @nodoc
class _$GroupDetailCopyWithImpl<$Res> implements $GroupDetailCopyWith<$Res> {
  _$GroupDetailCopyWithImpl(this._value, this._then);

  final GroupDetail _value;
  // ignore: unused_field
  final $Res Function(GroupDetail) _then;

  @override
  $Res call({
    Object? team = freezed,
    Object? group = freezed,
  }) {
    return _then(_value.copyWith(
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team?,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
    ));
  }

  @override
  $TeamCopyWith<$Res>? get team {
    if (_value.team == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.team!, (value) {
      return _then(_value.copyWith(team: value));
    });
  }

  @override
  $GroupCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $GroupCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value));
    });
  }
}

/// @nodoc
abstract class _$$_GroupDetailCopyWith<$Res>
    implements $GroupDetailCopyWith<$Res> {
  factory _$$_GroupDetailCopyWith(
          _$_GroupDetail value, $Res Function(_$_GroupDetail) then) =
      __$$_GroupDetailCopyWithImpl<$Res>;
  @override
  $Res call({Team? team, Group? group});

  @override
  $TeamCopyWith<$Res>? get team;
  @override
  $GroupCopyWith<$Res>? get group;
}

/// @nodoc
class __$$_GroupDetailCopyWithImpl<$Res> extends _$GroupDetailCopyWithImpl<$Res>
    implements _$$_GroupDetailCopyWith<$Res> {
  __$$_GroupDetailCopyWithImpl(
      _$_GroupDetail _value, $Res Function(_$_GroupDetail) _then)
      : super(_value, (v) => _then(v as _$_GroupDetail));

  @override
  _$_GroupDetail get _value => super._value as _$_GroupDetail;

  @override
  $Res call({
    Object? team = freezed,
    Object? group = freezed,
  }) {
    return _then(_$_GroupDetail(
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team?,
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupDetail implements _GroupDetail {
  const _$_GroupDetail({this.team, this.group});

  factory _$_GroupDetail.fromJson(Map<String, dynamic> json) =>
      _$$_GroupDetailFromJson(json);

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
            other is _$_GroupDetail &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality().equals(other.group, group));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(team),
      const DeepCollectionEquality().hash(group));

  @JsonKey(ignore: true)
  @override
  _$$_GroupDetailCopyWith<_$_GroupDetail> get copyWith =>
      __$$_GroupDetailCopyWithImpl<_$_GroupDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupDetailToJson(
      this,
    );
  }
}

abstract class _GroupDetail implements GroupDetail {
  const factory _GroupDetail({final Team? team, final Group? group}) =
      _$_GroupDetail;

  factory _GroupDetail.fromJson(Map<String, dynamic> json) =
      _$_GroupDetail.fromJson;

  @override
  Team? get team;
  @override
  Group? get group;
  @override
  @JsonKey(ignore: true)
  _$$_GroupDetailCopyWith<_$_GroupDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
