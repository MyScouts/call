// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'community.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Community {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get banner => throw _privateConstructorUsedError;
  String? get introduction => throw _privateConstructorUsedError;
  bool? get isProvincialGroup => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommunityCopyWith<Community> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityCopyWith<$Res> {
  factory $CommunityCopyWith(Community value, $Res Function(Community) then) =
      _$CommunityCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? avatar,
      String? banner,
      String? introduction,
      bool? isProvincialGroup});
}

/// @nodoc
class _$CommunityCopyWithImpl<$Res> implements $CommunityCopyWith<$Res> {
  _$CommunityCopyWithImpl(this._value, this._then);

  final Community _value;
  // ignore: unused_field
  final $Res Function(Community) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? banner = freezed,
    Object? introduction = freezed,
    Object? isProvincialGroup = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      isProvincialGroup: isProvincialGroup == freezed
          ? _value.isProvincialGroup
          : isProvincialGroup // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_CommunityCopyWith<$Res> implements $CommunityCopyWith<$Res> {
  factory _$$_CommunityCopyWith(
          _$_Community value, $Res Function(_$_Community) then) =
      __$$_CommunityCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? avatar,
      String? banner,
      String? introduction,
      bool? isProvincialGroup});
}

/// @nodoc
class __$$_CommunityCopyWithImpl<$Res> extends _$CommunityCopyWithImpl<$Res>
    implements _$$_CommunityCopyWith<$Res> {
  __$$_CommunityCopyWithImpl(
      _$_Community _value, $Res Function(_$_Community) _then)
      : super(_value, (v) => _then(v as _$_Community));

  @override
  _$_Community get _value => super._value as _$_Community;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? banner = freezed,
    Object? introduction = freezed,
    Object? isProvincialGroup = freezed,
  }) {
    return _then(_$_Community(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      isProvincialGroup: isProvincialGroup == freezed
          ? _value.isProvincialGroup
          : isProvincialGroup // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_Community implements _Community {
  const _$_Community(
      {this.id,
      this.name,
      this.avatar,
      this.banner,
      this.introduction,
      this.isProvincialGroup});

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? avatar;
  @override
  final String? banner;
  @override
  final String? introduction;
  @override
  final bool? isProvincialGroup;

  @override
  String toString() {
    return 'Community(id: $id, name: $name, avatar: $avatar, banner: $banner, introduction: $introduction, isProvincialGroup: $isProvincialGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Community &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.banner, banner) &&
            const DeepCollectionEquality()
                .equals(other.introduction, introduction) &&
            const DeepCollectionEquality()
                .equals(other.isProvincialGroup, isProvincialGroup));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(banner),
      const DeepCollectionEquality().hash(introduction),
      const DeepCollectionEquality().hash(isProvincialGroup));

  @JsonKey(ignore: true)
  @override
  _$$_CommunityCopyWith<_$_Community> get copyWith =>
      __$$_CommunityCopyWithImpl<_$_Community>(this, _$identity);
}

abstract class _Community implements Community {
  const factory _Community(
      {final int? id,
      final String? name,
      final String? avatar,
      final String? banner,
      final String? introduction,
      final bool? isProvincialGroup}) = _$_Community;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get avatar;
  @override
  String? get banner;
  @override
  String? get introduction;
  @override
  bool? get isProvincialGroup;
  @override
  @JsonKey(ignore: true)
  _$$_CommunityCopyWith<_$_Community> get copyWith =>
      throw _privateConstructorUsedError;
}
