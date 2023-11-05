// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$GroupCopyWithImpl<$Res, Group>;
  @useResult
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
class _$GroupCopyWithImpl<$Res, $Val extends Group>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      codeId: freezed == codeId
          ? _value.codeId
          : codeId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isProvincialGroup: freezed == isProvincialGroup
          ? _value.isProvincialGroup
          : isProvincialGroup // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      introduction: freezed == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      boss: freezed == boss
          ? _value.boss
          : boss // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get boss {
    if (_value.boss == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.boss!, (value) {
      return _then(_value.copyWith(boss: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupImplCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$$GroupImplCopyWith(
          _$GroupImpl value, $Res Function(_$GroupImpl) then) =
      __$$GroupImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$GroupImplCopyWithImpl<$Res>
    extends _$GroupCopyWithImpl<$Res, _$GroupImpl>
    implements _$$GroupImplCopyWith<$Res> {
  __$$GroupImplCopyWithImpl(
      _$GroupImpl _value, $Res Function(_$GroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
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
    return _then(_$GroupImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      codeId: freezed == codeId
          ? _value.codeId
          : codeId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isProvincialGroup: freezed == isProvincialGroup
          ? _value.isProvincialGroup
          : isProvincialGroup // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      introduction: freezed == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
      boss: freezed == boss
          ? _value.boss
          : boss // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupImpl implements _Group {
  const _$GroupImpl(
      {this.id,
      this.codeId,
      this.name,
      this.isProvincialGroup,
      this.avatar,
      this.banner,
      this.introduction,
      this.boss});

  factory _$GroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupImplFromJson(json);

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
            other is _$GroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.codeId, codeId) || other.codeId == codeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isProvincialGroup, isProvincialGroup) ||
                other.isProvincialGroup == isProvincialGroup) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.introduction, introduction) ||
                other.introduction == introduction) &&
            (identical(other.boss, boss) || other.boss == boss));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, codeId, name,
      isProvincialGroup, avatar, banner, introduction, boss);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      __$$GroupImplCopyWithImpl<_$GroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupImplToJson(
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
      final User? boss}) = _$GroupImpl;

  factory _Group.fromJson(Map<String, dynamic> json) = _$GroupImpl.fromJson;

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
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
