// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_category_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveCategoryDetail _$LiveCategoryDetailFromJson(Map<String, dynamic> json) {
  return _LiveCategoryDetail.fromJson(json);
}

/// @nodoc
mixin _$LiveCategoryDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;
  String? get alias => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveCategoryDetailCopyWith<LiveCategoryDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveCategoryDetailCopyWith<$Res> {
  factory $LiveCategoryDetailCopyWith(
          LiveCategoryDetail value, $Res Function(LiveCategoryDetail) then) =
      _$LiveCategoryDetailCopyWithImpl<$Res, LiveCategoryDetail>;
  @useResult
  $Res call({int? id, String? name, bool? isSelected, String? alias});
}

/// @nodoc
class _$LiveCategoryDetailCopyWithImpl<$Res, $Val extends LiveCategoryDetail>
    implements $LiveCategoryDetailCopyWith<$Res> {
  _$LiveCategoryDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isSelected = freezed,
    Object? alias = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveCategoryDetailImplCopyWith<$Res>
    implements $LiveCategoryDetailCopyWith<$Res> {
  factory _$$LiveCategoryDetailImplCopyWith(_$LiveCategoryDetailImpl value,
          $Res Function(_$LiveCategoryDetailImpl) then) =
      __$$LiveCategoryDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, bool? isSelected, String? alias});
}

/// @nodoc
class __$$LiveCategoryDetailImplCopyWithImpl<$Res>
    extends _$LiveCategoryDetailCopyWithImpl<$Res, _$LiveCategoryDetailImpl>
    implements _$$LiveCategoryDetailImplCopyWith<$Res> {
  __$$LiveCategoryDetailImplCopyWithImpl(_$LiveCategoryDetailImpl _value,
      $Res Function(_$LiveCategoryDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isSelected = freezed,
    Object? alias = freezed,
  }) {
    return _then(_$LiveCategoryDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      alias: freezed == alias
          ? _value.alias
          : alias // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LiveCategoryDetailImpl implements _LiveCategoryDetail {
  _$LiveCategoryDetailImpl({this.id, this.name, this.isSelected, this.alias});

  factory _$LiveCategoryDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveCategoryDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final bool? isSelected;
  @override
  final String? alias;

  @override
  String toString() {
    return 'LiveCategoryDetail(id: $id, name: $name, isSelected: $isSelected, alias: $alias)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveCategoryDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.alias, alias) || other.alias == alias));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isSelected, alias);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveCategoryDetailImplCopyWith<_$LiveCategoryDetailImpl> get copyWith =>
      __$$LiveCategoryDetailImplCopyWithImpl<_$LiveCategoryDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveCategoryDetailImplToJson(
      this,
    );
  }
}

abstract class _LiveCategoryDetail implements LiveCategoryDetail {
  factory _LiveCategoryDetail(
      {final int? id,
      final String? name,
      final bool? isSelected,
      final String? alias}) = _$LiveCategoryDetailImpl;

  factory _LiveCategoryDetail.fromJson(Map<String, dynamic> json) =
      _$LiveCategoryDetailImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  bool? get isSelected;
  @override
  String? get alias;
  @override
  @JsonKey(ignore: true)
  _$$LiveCategoryDetailImplCopyWith<_$LiveCategoryDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
