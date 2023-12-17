// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$WardCopyWithImpl<$Res, Ward>;
  @useResult
  $Res call({String? name, int? id});
}

/// @nodoc
class _$WardCopyWithImpl<$Res, $Val extends Ward>
    implements $WardCopyWith<$Res> {
  _$WardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WardImplCopyWith<$Res> implements $WardCopyWith<$Res> {
  factory _$$WardImplCopyWith(
          _$WardImpl value, $Res Function(_$WardImpl) then) =
      __$$WardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int? id});
}

/// @nodoc
class __$$WardImplCopyWithImpl<$Res>
    extends _$WardCopyWithImpl<$Res, _$WardImpl>
    implements _$$WardImplCopyWith<$Res> {
  __$$WardImplCopyWithImpl(_$WardImpl _value, $Res Function(_$WardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_$WardImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WardImpl implements _Ward {
  const _$WardImpl({this.name, this.id});

  factory _$WardImpl.fromJson(Map<String, dynamic> json) =>
      _$$WardImplFromJson(json);

  @override
  final String? name;
  @override
  final int? id;

  @override
  String toString() {
    return 'Ward(name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WardImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WardImplCopyWith<_$WardImpl> get copyWith =>
      __$$WardImplCopyWithImpl<_$WardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WardImplToJson(
      this,
    );
  }
}

abstract class _Ward implements Ward {
  const factory _Ward({final String? name, final int? id}) = _$WardImpl;

  factory _Ward.fromJson(Map<String, dynamic> json) = _$WardImpl.fromJson;

  @override
  String? get name;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$WardImplCopyWith<_$WardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
