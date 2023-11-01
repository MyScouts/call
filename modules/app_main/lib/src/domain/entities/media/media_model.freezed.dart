// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) {
  return _MediaModel.fromJson(json);
}

/// @nodoc
mixin _$MediaModel {
  int? get id => throw _privateConstructorUsedError;
  String? get redirectUrl => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaModelCopyWith<MediaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaModelCopyWith<$Res> {
  factory $MediaModelCopyWith(
          MediaModel value, $Res Function(MediaModel) then) =
      _$MediaModelCopyWithImpl<$Res, MediaModel>;
  @useResult
  $Res call(
      {int? id,
      String? redirectUrl,
      String? url,
      String? type,
      String? category,
      String? name,
      int? order,
      DateTime? createdAt});
}

/// @nodoc
class _$MediaModelCopyWithImpl<$Res, $Val extends MediaModel>
    implements $MediaModelCopyWith<$Res> {
  _$MediaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? redirectUrl = freezed,
    Object? url = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? name = freezed,
    Object? order = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      redirectUrl: freezed == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaModelImplCopyWith<$Res>
    implements $MediaModelCopyWith<$Res> {
  factory _$$MediaModelImplCopyWith(
          _$MediaModelImpl value, $Res Function(_$MediaModelImpl) then) =
      __$$MediaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? redirectUrl,
      String? url,
      String? type,
      String? category,
      String? name,
      int? order,
      DateTime? createdAt});
}

/// @nodoc
class __$$MediaModelImplCopyWithImpl<$Res>
    extends _$MediaModelCopyWithImpl<$Res, _$MediaModelImpl>
    implements _$$MediaModelImplCopyWith<$Res> {
  __$$MediaModelImplCopyWithImpl(
      _$MediaModelImpl _value, $Res Function(_$MediaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? redirectUrl = freezed,
    Object? url = freezed,
    Object? type = freezed,
    Object? category = freezed,
    Object? name = freezed,
    Object? order = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$MediaModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      redirectUrl: freezed == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MediaModelImpl implements _MediaModel {
  const _$MediaModelImpl(
      {this.id,
      this.redirectUrl,
      this.url,
      this.type,
      this.category,
      this.name,
      this.order,
      this.createdAt});

  factory _$MediaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? redirectUrl;
  @override
  final String? url;
  @override
  final String? type;
  @override
  final String? category;
  @override
  final String? name;
  @override
  final int? order;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'MediaModel(id: $id, redirectUrl: $redirectUrl, url: $url, type: $type, category: $category, name: $name, order: $order, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.redirectUrl, redirectUrl) ||
                other.redirectUrl == redirectUrl) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, redirectUrl, url, type,
      category, name, order, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaModelImplCopyWith<_$MediaModelImpl> get copyWith =>
      __$$MediaModelImplCopyWithImpl<_$MediaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaModelImplToJson(
      this,
    );
  }
}

abstract class _MediaModel implements MediaModel {
  const factory _MediaModel(
      {final int? id,
      final String? redirectUrl,
      final String? url,
      final String? type,
      final String? category,
      final String? name,
      final int? order,
      final DateTime? createdAt}) = _$MediaModelImpl;

  factory _MediaModel.fromJson(Map<String, dynamic> json) =
      _$MediaModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get redirectUrl;
  @override
  String? get url;
  @override
  String? get type;
  @override
  String? get category;
  @override
  String? get name;
  @override
  int? get order;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MediaModelImplCopyWith<_$MediaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
