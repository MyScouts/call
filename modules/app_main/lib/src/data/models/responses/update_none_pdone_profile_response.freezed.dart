// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_none_pdone_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateNonePDoneProfileReponse _$UpdateNonePDoneProfileReponseFromJson(
    Map<String, dynamic> json) {
  return _UpdateNonePDoneProfileReponse.fromJson(json);
}

/// @nodoc
mixin _$UpdateNonePDoneProfileReponse {
  InformationNonePdoneProfile get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateNonePDoneProfileReponseCopyWith<UpdateNonePDoneProfileReponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateNonePDoneProfileReponseCopyWith<$Res> {
  factory $UpdateNonePDoneProfileReponseCopyWith(
          UpdateNonePDoneProfileReponse value,
          $Res Function(UpdateNonePDoneProfileReponse) then) =
      _$UpdateNonePDoneProfileReponseCopyWithImpl<$Res,
          UpdateNonePDoneProfileReponse>;
  @useResult
  $Res call({InformationNonePdoneProfile profile});

  $InformationNonePdoneProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$UpdateNonePDoneProfileReponseCopyWithImpl<$Res,
        $Val extends UpdateNonePDoneProfileReponse>
    implements $UpdateNonePDoneProfileReponseCopyWith<$Res> {
  _$UpdateNonePDoneProfileReponseCopyWithImpl(this._value, this._then);

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
              as InformationNonePdoneProfile,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InformationNonePdoneProfileCopyWith<$Res> get profile {
    return $InformationNonePdoneProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateNonePDoneProfileReponseImplCopyWith<$Res>
    implements $UpdateNonePDoneProfileReponseCopyWith<$Res> {
  factory _$$UpdateNonePDoneProfileReponseImplCopyWith(
          _$UpdateNonePDoneProfileReponseImpl value,
          $Res Function(_$UpdateNonePDoneProfileReponseImpl) then) =
      __$$UpdateNonePDoneProfileReponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InformationNonePdoneProfile profile});

  @override
  $InformationNonePdoneProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$UpdateNonePDoneProfileReponseImplCopyWithImpl<$Res>
    extends _$UpdateNonePDoneProfileReponseCopyWithImpl<$Res,
        _$UpdateNonePDoneProfileReponseImpl>
    implements _$$UpdateNonePDoneProfileReponseImplCopyWith<$Res> {
  __$$UpdateNonePDoneProfileReponseImplCopyWithImpl(
      _$UpdateNonePDoneProfileReponseImpl _value,
      $Res Function(_$UpdateNonePDoneProfileReponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$UpdateNonePDoneProfileReponseImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as InformationNonePdoneProfile,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateNonePDoneProfileReponseImpl
    implements _UpdateNonePDoneProfileReponse {
  const _$UpdateNonePDoneProfileReponseImpl({required this.profile});

  factory _$UpdateNonePDoneProfileReponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateNonePDoneProfileReponseImplFromJson(json);

  @override
  final InformationNonePdoneProfile profile;

  @override
  String toString() {
    return 'UpdateNonePDoneProfileReponse(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNonePDoneProfileReponseImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNonePDoneProfileReponseImplCopyWith<
          _$UpdateNonePDoneProfileReponseImpl>
      get copyWith => __$$UpdateNonePDoneProfileReponseImplCopyWithImpl<
          _$UpdateNonePDoneProfileReponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateNonePDoneProfileReponseImplToJson(
      this,
    );
  }
}

abstract class _UpdateNonePDoneProfileReponse
    implements UpdateNonePDoneProfileReponse {
  const factory _UpdateNonePDoneProfileReponse(
          {required final InformationNonePdoneProfile profile}) =
      _$UpdateNonePDoneProfileReponseImpl;

  factory _UpdateNonePDoneProfileReponse.fromJson(Map<String, dynamic> json) =
      _$UpdateNonePDoneProfileReponseImpl.fromJson;

  @override
  InformationNonePdoneProfile get profile;
  @override
  @JsonKey(ignore: true)
  _$$UpdateNonePDoneProfileReponseImplCopyWith<
          _$UpdateNonePDoneProfileReponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
