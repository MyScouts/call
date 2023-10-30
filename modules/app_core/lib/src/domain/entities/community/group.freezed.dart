// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
mixin _$Group {
  int? get id => throw _privateConstructorUsedError;
  String? get codeId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get isProvincialGroup => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get banner => throw _privateConstructorUsedError;
  String? get introduction => throw _privateConstructorUsedError;
  User? get boss => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? codeId,
      String? name,
      bool? isProvincialGroup,
      String? avatar,
      String? banner,
      String? introduction,
      User? boss});

  $UserCopyWith<$Res>? get boss;
}

/// @nodoc
class _$GroupCopyWithImpl<$Res> implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  final Group _value;
  // ignore: unused_field
  final $Res Function(Group) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? codeId = freezed,
    Object? name = freezed,
    Object? isProvincialGroup = freezed,
    Object? avatar = freezed,
    Object? banner = freezed,
    Object? introduction = freezed,
    Object? boss = freezed,
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
      isProvincialGroup: isProvincialGroup == freezed
          ? _value.isProvincialGroup
          : isProvincialGroup // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$_GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$$_GroupCopyWith(_$_Group value, $Res Function(_$_Group) then) =
      __$$_GroupCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? codeId,
      String? name,
      bool? isProvincialGroup,
      String? avatar,
      String? banner,
      String? introduction,
      User? boss});

  @override
  $UserCopyWith<$Res>? get boss;
}

/// @nodoc
class __$$_GroupCopyWithImpl<$Res> extends _$GroupCopyWithImpl<$Res>
    implements _$$_GroupCopyWith<$Res> {
  __$$_GroupCopyWithImpl(_$_Group _value, $Res Function(_$_Group) _then)
      : super(_value, (v) => _then(v as _$_Group));

  @override
  _$_Group get _value => super._value as _$_Group;

  @override
  $Res call({
    Object? id = freezed,
    Object? codeId = freezed,
    Object? name = freezed,
    Object? isProvincialGroup = freezed,
    Object? avatar = freezed,
    Object? banner = freezed,
    Object? introduction = freezed,
    Object? boss = freezed,
  }) {
    return _then(_$_Group(
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
      isProvincialGroup: isProvincialGroup == freezed
          ? _value.isProvincialGroup
          : isProvincialGroup // ignore: cast_nullable_to_non_nullable
              as bool?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Group implements _Group {
  const _$_Group(
      {this.id,
      this.codeId,
      this.name,
      this.isProvincialGroup,
      this.avatar,
      this.banner,
      this.introduction,
      this.boss});

  factory _$_Group.fromJson(Map<String, dynamic> json) =>
      _$$_GroupFromJson(json);

  @override
  final int? id;
  @override
  final String? codeId;
  @override
  final String? name;
  @override
  final bool? isProvincialGroup;
  @override
  final String? avatar;
  @override
  final String? banner;
  @override
  final String? introduction;
  @override
  final User? boss;

  @override
  String toString() {
    return 'Group(id: $id, codeId: $codeId, name: $name, isProvincialGroup: $isProvincialGroup, avatar: $avatar, banner: $banner, introduction: $introduction, boss: $boss)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Group &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.codeId, codeId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.isProvincialGroup, isProvincialGroup) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.banner, banner) &&
            const DeepCollectionEquality()
                .equals(other.introduction, introduction) &&
            const DeepCollectionEquality().equals(other.boss, boss));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(codeId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isProvincialGroup),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(banner),
      const DeepCollectionEquality().hash(introduction),
      const DeepCollectionEquality().hash(boss));

  @JsonKey(ignore: true)
  @override
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      __$$_GroupCopyWithImpl<_$_Group>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupToJson(
      this,
    );
  }
}

abstract class _Group implements Group {
  const factory _Group(
      {final int? id,
      final String? codeId,
      final String? name,
      final bool? isProvincialGroup,
      final String? avatar,
      final String? banner,
      final String? introduction,
      final User? boss}) = _$_Group;

  factory _Group.fromJson(Map<String, dynamic> json) = _$_Group.fromJson;

  @override
  int? get id;
  @override
  String? get codeId;
  @override
  String? get name;
  @override
  bool? get isProvincialGroup;
  @override
  String? get avatar;
  @override
  String? get banner;
  @override
  String? get introduction;
  @override
  User? get boss;
  @override
  @JsonKey(ignore: true)
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      throw _privateConstructorUsedError;
}
