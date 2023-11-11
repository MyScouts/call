// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_pdone_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdatePDoneProfileReponse _$UpdatePDoneProfileReponseFromJson(
    Map<String, dynamic> json) {
  return _UpdatePDoneProfileReponse.fromJson(json);
}

/// @nodoc
mixin _$UpdatePDoneProfileReponse {
  Map<String, String> get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePDoneProfileReponseCopyWith<UpdatePDoneProfileReponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePDoneProfileReponseCopyWith<$Res> {
  factory $UpdatePDoneProfileReponseCopyWith(UpdatePDoneProfileReponse value,
          $Res Function(UpdatePDoneProfileReponse) then) =
      _$UpdatePDoneProfileReponseCopyWithImpl<$Res, UpdatePDoneProfileReponse>;
  @useResult
  $Res call({Map<String, String> profile});
}

/// @nodoc
class _$UpdatePDoneProfileReponseCopyWithImpl<$Res,
        $Val extends UpdatePDoneProfileReponse>
    implements $UpdatePDoneProfileReponseCopyWith<$Res> {
  _$UpdatePDoneProfileReponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePDoneProfileReponseImplCopyWith<$Res>
    implements $UpdatePDoneProfileReponseCopyWith<$Res> {
  factory _$$UpdatePDoneProfileReponseImplCopyWith(
          _$UpdatePDoneProfileReponseImpl value,
          $Res Function(_$UpdatePDoneProfileReponseImpl) then) =
      __$$UpdatePDoneProfileReponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, String> profile});
}

/// @nodoc
class __$$UpdatePDoneProfileReponseImplCopyWithImpl<$Res>
    extends _$UpdatePDoneProfileReponseCopyWithImpl<$Res,
        _$UpdatePDoneProfileReponseImpl>
    implements _$$UpdatePDoneProfileReponseImplCopyWith<$Res> {
  __$$UpdatePDoneProfileReponseImplCopyWithImpl(
      _$UpdatePDoneProfileReponseImpl _value,
      $Res Function(_$UpdatePDoneProfileReponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$UpdatePDoneProfileReponseImpl(
      profile: null == profile
          ? _value._profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePDoneProfileReponseImpl implements _UpdatePDoneProfileReponse {
  const _$UpdatePDoneProfileReponseImpl(
      {required final Map<String, String> profile})
      : _profile = profile;

  factory _$UpdatePDoneProfileReponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePDoneProfileReponseImplFromJson(json);

  final Map<String, String> _profile;
  @override
  Map<String, String> get profile {
    if (_profile is EqualUnmodifiableMapView) return _profile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_profile);
  }

  @override
  String toString() {
    return 'UpdatePDoneProfileReponse(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePDoneProfileReponseImpl &&
            const DeepCollectionEquality().equals(other._profile, _profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_profile));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePDoneProfileReponseImplCopyWith<_$UpdatePDoneProfileReponseImpl>
      get copyWith => __$$UpdatePDoneProfileReponseImplCopyWithImpl<
          _$UpdatePDoneProfileReponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePDoneProfileReponseImplToJson(
      this,
    );
  }
}

abstract class _UpdatePDoneProfileReponse implements UpdatePDoneProfileReponse {
  const factory _UpdatePDoneProfileReponse(
          {required final Map<String, String> profile}) =
      _$UpdatePDoneProfileReponseImpl;

  factory _UpdatePDoneProfileReponse.fromJson(Map<String, dynamic> json) =
      _$UpdatePDoneProfileReponseImpl.fromJson;

  @override
  Map<String, String> get profile;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePDoneProfileReponseImplCopyWith<_$UpdatePDoneProfileReponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
