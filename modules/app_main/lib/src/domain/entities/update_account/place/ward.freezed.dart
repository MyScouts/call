// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ward _$WardFromJson(Map<String, dynamic> json) {
  return _Ward.fromJson(json);
}

/// @nodoc
mixin _$Ward {
  String? get name => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WardCopyWith<Ward> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WardCopyWith<$Res> {
  factory $WardCopyWith(Ward value, $Res Function(Ward) then) =
      _$WardCopyWithImpl<$Res>;
  $Res call({String? name, int? id});
}

/// @nodoc
class _$WardCopyWithImpl<$Res> implements $WardCopyWith<$Res> {
  _$WardCopyWithImpl(this._value, this._then);

  final Ward _value;
  // ignore: unused_field
  final $Res Function(Ward) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_WardCopyWith<$Res> implements $WardCopyWith<$Res> {
  factory _$$_WardCopyWith(_$_Ward value, $Res Function(_$_Ward) then) =
      __$$_WardCopyWithImpl<$Res>;
  @override
  $Res call({String? name, int? id});
}

/// @nodoc
class __$$_WardCopyWithImpl<$Res> extends _$WardCopyWithImpl<$Res>
    implements _$$_WardCopyWith<$Res> {
  __$$_WardCopyWithImpl(_$_Ward _value, $Res Function(_$_Ward) _then)
      : super(_value, (v) => _then(v as _$_Ward));

  @override
  _$_Ward get _value => super._value as _$_Ward;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Ward(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ward implements _Ward {
  const _$_Ward({this.name, this.id});

  factory _$_Ward.fromJson(Map<String, dynamic> json) => _$$_WardFromJson(json);

  @override
  final String? name;
  @override
  final int? id;

  @override
  String toString() {
    return 'Ward(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ward &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_WardCopyWith<_$_Ward> get copyWith =>
      __$$_WardCopyWithImpl<_$_Ward>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WardToJson(
      this,
    );
  }
}

abstract class _Ward implements Ward {
  const factory _Ward({final String? name, final int? id}) = _$_Ward;

  factory _Ward.fromJson(Map<String, dynamic> json) = _$_Ward.fromJson;

  @override
  String? get name;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_WardCopyWith<_$_Ward> get copyWith => throw _privateConstructorUsedError;
}
