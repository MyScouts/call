// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveMedia _$LiveMediaFromJson(Map<String, dynamic> json) {
  return _LiveMedia.fromJson(json);
}

/// @nodoc
mixin _$LiveMedia {
  int get id => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveMediaCopyWith<LiveMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveMediaCopyWith<$Res> {
  factory $LiveMediaCopyWith(LiveMedia value, $Res Function(LiveMedia) then) =
      _$LiveMediaCopyWithImpl<$Res, LiveMedia>;
  @useResult
  $Res call({int id, String link});
}

/// @nodoc
class _$LiveMediaCopyWithImpl<$Res, $Val extends LiveMedia>
    implements $LiveMediaCopyWith<$Res> {
  _$LiveMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveMediaImplCopyWith<$Res>
    implements $LiveMediaCopyWith<$Res> {
  factory _$$LiveMediaImplCopyWith(
          _$LiveMediaImpl value, $Res Function(_$LiveMediaImpl) then) =
      __$$LiveMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String link});
}

/// @nodoc
class __$$LiveMediaImplCopyWithImpl<$Res>
    extends _$LiveMediaCopyWithImpl<$Res, _$LiveMediaImpl>
    implements _$$LiveMediaImplCopyWith<$Res> {
  __$$LiveMediaImplCopyWithImpl(
      _$LiveMediaImpl _value, $Res Function(_$LiveMediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? link = null,
  }) {
    return _then(_$LiveMediaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LiveMediaImpl implements _LiveMedia {
  const _$LiveMediaImpl({required this.id, required this.link});

  factory _$LiveMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveMediaImplFromJson(json);

  @override
  final int id;
  @override
  final String link;

  @override
  String toString() {
    return 'LiveMedia(id: $id, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveMediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveMediaImplCopyWith<_$LiveMediaImpl> get copyWith =>
      __$$LiveMediaImplCopyWithImpl<_$LiveMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveMediaImplToJson(
      this,
    );
  }
}

abstract class _LiveMedia implements LiveMedia {
  const factory _LiveMedia(
      {required final int id, required final String link}) = _$LiveMediaImpl;

  factory _LiveMedia.fromJson(Map<String, dynamic> json) =
      _$LiveMediaImpl.fromJson;

  @override
  int get id;
  @override
  String get link;
  @override
  @JsonKey(ignore: true)
  _$$LiveMediaImplCopyWith<_$LiveMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
