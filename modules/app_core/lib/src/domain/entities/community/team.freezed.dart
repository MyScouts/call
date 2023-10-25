// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
mixin _$Team {
  int? get id => throw _privateConstructorUsedError;
  String? get codeId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get banner => throw _privateConstructorUsedError;
  String? get introduction => throw _privateConstructorUsedError;
  User? get boss => throw _privateConstructorUsedError;
  bool? get isJoined => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? codeId,
      String? name,
      String? avatar,
      String? banner,
      String? introduction,
      User? boss,
      bool? isJoined});

  $UserCopyWith<$Res>? get boss;
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  final Team _value;
  // ignore: unused_field
  final $Res Function(Team) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? codeId = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? banner = freezed,
    Object? introduction = freezed,
    Object? boss = freezed,
    Object? isJoined = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      codeId: codeId == freezed
          ? _value.codeId
          : codeId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: banner == freezed
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      introduction: introduction == freezed
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      boss: boss == freezed
          ? _value.boss
          : boss // ignore: cast_nullable_to_non_nullable
              as User?,
      isJoined: isJoined == freezed
          ? _value.isJoined
          : isJoined // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get boss {
    if (_value.boss == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.boss!, (value) {
      return _then(_value.copyWith(boss: value));
    });
  }
}

/// @nodoc
abstract class _$$_TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$_TeamCopyWith(_$_Team value, $Res Function(_$_Team) then) =
      __$$_TeamCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? codeId,
      String? name,
      String? avatar,
      String? banner,
      String? introduction,
      User? boss,
      bool? isJoined});

  @override
  $UserCopyWith<$Res>? get boss;
}

/// @nodoc
class __$$_TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res>
    implements _$$_TeamCopyWith<$Res> {
  __$$_TeamCopyWithImpl(_$_Team _value, $Res Function(_$_Team) _then)
      : super(_value, (v) => _then(v as _$_Team));

  @override
  _$_Team get _value => super._value as _$_Team;

  @override
  $Res call({
    Object? id = freezed,
    Object? codeId = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? banner = freezed,
    Object? introduction = freezed,
    Object? boss = freezed,
    Object? isJoined = freezed,
  }) {
    return _then(_$_Team(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      codeId: codeId == freezed
          ? _value.codeId
          : codeId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: banner == freezed
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      introduction: introduction == freezed
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      boss: boss == freezed
          ? _value.boss
          : boss // ignore: cast_nullable_to_non_nullable
              as User?,
      isJoined: isJoined == freezed
          ? _value.isJoined
          : isJoined // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Team implements _Team {
  const _$_Team(
      {this.id,
      this.codeId,
      this.name,
      this.avatar,
      this.banner,
      this.introduction,
      this.boss,
      this.isJoined});

  factory _$_Team.fromJson(Map<String, dynamic> json) => _$$_TeamFromJson(json);

  @override
  final int? id;
  @override
  final String? codeId;
  @override
  final String? name;
  @override
  final String? avatar;
  @override
  final String? banner;
  @override
  final String? introduction;
  @override
  final User? boss;
  @override
  final bool? isJoined;

  @override
  String toString() {
    return 'Team(id: $id, codeId: $codeId, name: $name, avatar: $avatar, banner: $banner, introduction: $introduction, boss: $boss, isJoined: $isJoined)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Team &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.codeId, codeId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.banner, banner) &&
            const DeepCollectionEquality()
                .equals(other.introduction, introduction) &&
            const DeepCollectionEquality().equals(other.boss, boss) &&
            const DeepCollectionEquality().equals(other.isJoined, isJoined));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(codeId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(banner),
      const DeepCollectionEquality().hash(introduction),
      const DeepCollectionEquality().hash(boss),
      const DeepCollectionEquality().hash(isJoined));

  @JsonKey(ignore: true)
  @override
  _$$_TeamCopyWith<_$_Team> get copyWith =>
      __$$_TeamCopyWithImpl<_$_Team>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamToJson(
      this,
    );
  }
}

abstract class _Team implements Team {
  const factory _Team(
      {final int? id,
      final String? codeId,
      final String? name,
      final String? avatar,
      final String? banner,
      final String? introduction,
      final User? boss,
      final bool? isJoined}) = _$_Team;

  factory _Team.fromJson(Map<String, dynamic> json) = _$_Team.fromJson;

  @override
  int? get id;
  @override
  String? get codeId;
  @override
  String? get name;
  @override
  String? get avatar;
  @override
  String? get banner;
  @override
  String? get introduction;
  @override
  User? get boss;
  @override
  bool? get isJoined;
  @override
  @JsonKey(ignore: true)
  _$$_TeamCopyWith<_$_Team> get copyWith => throw _privateConstructorUsedError;
}
