// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_community_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateCommunityPayload _$UpdateCommunityPayloadFromJson(
    Map<String, dynamic> json) {
  return _UpdateCommunityPayload.fromJson(json);
}

/// @nodoc
mixin _$UpdateCommunityPayload {
  String? get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get banner => throw _privateConstructorUsedError;
  String? get introduction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateCommunityPayloadCopyWith<UpdateCommunityPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCommunityPayloadCopyWith<$Res> {
  factory $UpdateCommunityPayloadCopyWith(UpdateCommunityPayload value,
          $Res Function(UpdateCommunityPayload) then) =
      _$UpdateCommunityPayloadCopyWithImpl<$Res, UpdateCommunityPayload>;
  @useResult
  $Res call(
      {String? name, String? avatar, String? banner, String? introduction});
}

/// @nodoc
class _$UpdateCommunityPayloadCopyWithImpl<$Res,
        $Val extends UpdateCommunityPayload>
    implements $UpdateCommunityPayloadCopyWith<$Res> {
  _$UpdateCommunityPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? avatar = freezed,
    Object? banner = freezed,
    Object? introduction = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateCommunityPayloadImplCopyWith<$Res>
    implements $UpdateCommunityPayloadCopyWith<$Res> {
  factory _$$UpdateCommunityPayloadImplCopyWith(
          _$UpdateCommunityPayloadImpl value,
          $Res Function(_$UpdateCommunityPayloadImpl) then) =
      __$$UpdateCommunityPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name, String? avatar, String? banner, String? introduction});
}

/// @nodoc
class __$$UpdateCommunityPayloadImplCopyWithImpl<$Res>
    extends _$UpdateCommunityPayloadCopyWithImpl<$Res,
        _$UpdateCommunityPayloadImpl>
    implements _$$UpdateCommunityPayloadImplCopyWith<$Res> {
  __$$UpdateCommunityPayloadImplCopyWithImpl(
      _$UpdateCommunityPayloadImpl _value,
      $Res Function(_$UpdateCommunityPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? avatar = freezed,
    Object? banner = freezed,
    Object? introduction = freezed,
  }) {
    return _then(_$UpdateCommunityPayloadImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UpdateCommunityPayloadImpl implements _UpdateCommunityPayload {
  const _$UpdateCommunityPayloadImpl(
      {this.name, this.avatar, this.banner, this.introduction});

  factory _$UpdateCommunityPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateCommunityPayloadImplFromJson(json);

  @override
  final String? name;
  @override
  final String? avatar;
  @override
  final String? banner;
  @override
  final String? introduction;

  @override
  String toString() {
    return 'UpdateCommunityPayload(name: $name, avatar: $avatar, banner: $banner, introduction: $introduction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCommunityPayloadImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.introduction, introduction) ||
                other.introduction == introduction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, avatar, banner, introduction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCommunityPayloadImplCopyWith<_$UpdateCommunityPayloadImpl>
      get copyWith => __$$UpdateCommunityPayloadImplCopyWithImpl<
          _$UpdateCommunityPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCommunityPayloadImplToJson(
      this,
    );
  }
}

abstract class _UpdateCommunityPayload implements UpdateCommunityPayload {
  const factory _UpdateCommunityPayload(
      {final String? name,
      final String? avatar,
      final String? banner,
      final String? introduction}) = _$UpdateCommunityPayloadImpl;

  factory _UpdateCommunityPayload.fromJson(Map<String, dynamic> json) =
      _$UpdateCommunityPayloadImpl.fromJson;

  @override
  String? get name;
  @override
  String? get avatar;
  @override
  String? get banner;
  @override
  String? get introduction;
  @override
  @JsonKey(ignore: true)
  _$$UpdateCommunityPayloadImplCopyWith<_$UpdateCommunityPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
