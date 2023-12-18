// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdone_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PDoneAccount _$PDoneAccountFromJson(Map<String, dynamic> json) {
  return _PDoneAccount.fromJson(json);
}

/// @nodoc
mixin _$PDoneAccount {
  int? get id => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  List<String>? get backgroundImages => throw _privateConstructorUsedError;
  String? get pDoneId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile')
  PDoneProfile? get profile => throw _privateConstructorUsedError;
  Kyc? get kyc => throw _privateConstructorUsedError;
  bool? get isPDone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PDoneAccountCopyWith<PDoneAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PDoneAccountCopyWith<$Res> {
  factory $PDoneAccountCopyWith(
          PDoneAccount value, $Res Function(PDoneAccount) then) =
      _$PDoneAccountCopyWithImpl<$Res, PDoneAccount>;
  @useResult
  $Res call(
      {int? id,
      String? avatar,
      List<String>? backgroundImages,
      String? pDoneId,
      String? name,
      String? email,
      String? phone,
      int? status,
      String? nickname,
      String? displayName,
      @JsonKey(name: 'profile') PDoneProfile? profile,
      Kyc? kyc,
      bool? isPDone});

  $PDoneProfileCopyWith<$Res>? get profile;
  $KycCopyWith<$Res>? get kyc;
}

/// @nodoc
class _$PDoneAccountCopyWithImpl<$Res, $Val extends PDoneAccount>
    implements $PDoneAccountCopyWith<$Res> {
  _$PDoneAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? avatar = freezed,
    Object? backgroundImages = freezed,
    Object? pDoneId = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? status = freezed,
    Object? nickname = freezed,
    Object? displayName = freezed,
    Object? profile = freezed,
    Object? kyc = freezed,
    Object? isPDone = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImages: freezed == backgroundImages
          ? _value.backgroundImages
          : backgroundImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pDoneId: freezed == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as PDoneProfile?,
      kyc: freezed == kyc
          ? _value.kyc
          : kyc // ignore: cast_nullable_to_non_nullable
              as Kyc?,
      isPDone: freezed == isPDone
          ? _value.isPDone
          : isPDone // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PDoneProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $PDoneProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $KycCopyWith<$Res>? get kyc {
    if (_value.kyc == null) {
      return null;
    }

    return $KycCopyWith<$Res>(_value.kyc!, (value) {
      return _then(_value.copyWith(kyc: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PDoneAccountImplCopyWith<$Res>
    implements $PDoneAccountCopyWith<$Res> {
  factory _$$PDoneAccountImplCopyWith(
          _$PDoneAccountImpl value, $Res Function(_$PDoneAccountImpl) then) =
      __$$PDoneAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? avatar,
      List<String>? backgroundImages,
      String? pDoneId,
      String? name,
      String? email,
      String? phone,
      int? status,
      String? nickname,
      String? displayName,
      @JsonKey(name: 'profile') PDoneProfile? profile,
      Kyc? kyc,
      bool? isPDone});

  @override
  $PDoneProfileCopyWith<$Res>? get profile;
  @override
  $KycCopyWith<$Res>? get kyc;
}

/// @nodoc
class __$$PDoneAccountImplCopyWithImpl<$Res>
    extends _$PDoneAccountCopyWithImpl<$Res, _$PDoneAccountImpl>
    implements _$$PDoneAccountImplCopyWith<$Res> {
  __$$PDoneAccountImplCopyWithImpl(
      _$PDoneAccountImpl _value, $Res Function(_$PDoneAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? avatar = freezed,
    Object? backgroundImages = freezed,
    Object? pDoneId = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? status = freezed,
    Object? nickname = freezed,
    Object? displayName = freezed,
    Object? profile = freezed,
    Object? kyc = freezed,
    Object? isPDone = freezed,
  }) {
    return _then(_$PDoneAccountImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundImages: freezed == backgroundImages
          ? _value._backgroundImages
          : backgroundImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      pDoneId: freezed == pDoneId
          ? _value.pDoneId
          : pDoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as PDoneProfile?,
      kyc: freezed == kyc
          ? _value.kyc
          : kyc // ignore: cast_nullable_to_non_nullable
              as Kyc?,
      isPDone: freezed == isPDone
          ? _value.isPDone
          : isPDone // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PDoneAccountImpl implements _PDoneAccount {
  const _$PDoneAccountImpl(
      {this.id,
      this.avatar,
      final List<String>? backgroundImages,
      this.pDoneId,
      this.name,
      this.email,
      this.phone,
      this.status,
      this.nickname,
      this.displayName,
      @JsonKey(name: 'profile') this.profile,
      this.kyc,
      this.isPDone})
      : _backgroundImages = backgroundImages;

  factory _$PDoneAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$PDoneAccountImplFromJson(json);

  @override
  final int? id;
  @override
  final String? avatar;
  final List<String>? _backgroundImages;
  @override
  List<String>? get backgroundImages {
    final value = _backgroundImages;
    if (value == null) return null;
    if (_backgroundImages is EqualUnmodifiableListView)
      return _backgroundImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? pDoneId;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final int? status;
  @override
  final String? nickname;
  @override
  final String? displayName;
  @override
  @JsonKey(name: 'profile')
  final PDoneProfile? profile;
  @override
  final Kyc? kyc;
  @override
  final bool? isPDone;

  @override
  String toString() {
    return 'PDoneAccount(id: $id, avatar: $avatar, backgroundImages: $backgroundImages, pDoneId: $pDoneId, name: $name, email: $email, phone: $phone, status: $status, nickname: $nickname, displayName: $displayName, profile: $profile, kyc: $kyc, isPDone: $isPDone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PDoneAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality()
                .equals(other._backgroundImages, _backgroundImages) &&
            (identical(other.pDoneId, pDoneId) || other.pDoneId == pDoneId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.kyc, kyc) || other.kyc == kyc) &&
            (identical(other.isPDone, isPDone) || other.isPDone == isPDone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      avatar,
      const DeepCollectionEquality().hash(_backgroundImages),
      pDoneId,
      name,
      email,
      phone,
      status,
      nickname,
      displayName,
      profile,
      kyc,
      isPDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PDoneAccountImplCopyWith<_$PDoneAccountImpl> get copyWith =>
      __$$PDoneAccountImplCopyWithImpl<_$PDoneAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PDoneAccountImplToJson(
      this,
    );
  }
}

abstract class _PDoneAccount implements PDoneAccount {
  const factory _PDoneAccount(
      {final int? id,
      final String? avatar,
      final List<String>? backgroundImages,
      final String? pDoneId,
      final String? name,
      final String? email,
      final String? phone,
      final int? status,
      final String? nickname,
      final String? displayName,
      @JsonKey(name: 'profile') final PDoneProfile? profile,
      final Kyc? kyc,
      final bool? isPDone}) = _$PDoneAccountImpl;

  factory _PDoneAccount.fromJson(Map<String, dynamic> json) =
      _$PDoneAccountImpl.fromJson;

  @override
  int? get id;
  @override
  String? get avatar;
  @override
  List<String>? get backgroundImages;
  @override
  String? get pDoneId;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  int? get status;
  @override
  String? get nickname;
  @override
  String? get displayName;
  @override
  @JsonKey(name: 'profile')
  PDoneProfile? get profile;
  @override
  Kyc? get kyc;
  @override
  bool? get isPDone;
  @override
  @JsonKey(ignore: true)
  _$$PDoneAccountImplCopyWith<_$PDoneAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
