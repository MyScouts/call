// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KycStatus _$KycStatusFromJson(Map<String, dynamic> json) {
  return _KycStatus.fromJson(json);
}

/// @nodoc
mixin _$KycStatus {
  int get currentStep => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KycStatusCopyWith<KycStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycStatusCopyWith<$Res> {
  factory $KycStatusCopyWith(KycStatus value, $Res Function(KycStatus) then) =
      _$KycStatusCopyWithImpl<$Res, KycStatus>;
  @useResult
  $Res call({int currentStep});
}

/// @nodoc
class _$KycStatusCopyWithImpl<$Res, $Val extends KycStatus>
    implements $KycStatusCopyWith<$Res> {
  _$KycStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KycStatusImplCopyWith<$Res>
    implements $KycStatusCopyWith<$Res> {
  factory _$$KycStatusImplCopyWith(
          _$KycStatusImpl value, $Res Function(_$KycStatusImpl) then) =
      __$$KycStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentStep});
}

/// @nodoc
class __$$KycStatusImplCopyWithImpl<$Res>
    extends _$KycStatusCopyWithImpl<$Res, _$KycStatusImpl>
    implements _$$KycStatusImplCopyWith<$Res> {
  __$$KycStatusImplCopyWithImpl(
      _$KycStatusImpl _value, $Res Function(_$KycStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
  }) {
    return _then(_$KycStatusImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycStatusImpl implements _KycStatus {
  const _$KycStatusImpl({required this.currentStep});

  factory _$KycStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycStatusImplFromJson(json);

  @override
  final int currentStep;

  @override
  String toString() {
    return 'KycStatus(currentStep: $currentStep)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycStatusImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentStep);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KycStatusImplCopyWith<_$KycStatusImpl> get copyWith =>
      __$$KycStatusImplCopyWithImpl<_$KycStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycStatusImplToJson(
      this,
    );
  }
}

abstract class _KycStatus implements KycStatus {
  const factory _KycStatus({required final int currentStep}) = _$KycStatusImpl;

  factory _KycStatus.fromJson(Map<String, dynamic> json) =
      _$KycStatusImpl.fromJson;

  @override
  int get currentStep;
  @override
  @JsonKey(ignore: true)
  _$$KycStatusImplCopyWith<_$KycStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
