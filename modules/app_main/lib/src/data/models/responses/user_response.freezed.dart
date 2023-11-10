// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OnboardingResponse _$OnboardingResponseFromJson(Map<String, dynamic> json) {
  return _OnboardingResponse.fromJson(json);
}

/// @nodoc
mixin _$OnboardingResponse {
  bool get isJA => throw _privateConstructorUsedError;
  bool get isPdone => throw _privateConstructorUsedError;
  bool get isMarshopOwner => throw _privateConstructorUsedError;
  bool get isMarshopCustomer => throw _privateConstructorUsedError;
  bool get hasDefaultBankAccount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnboardingResponseCopyWith<OnboardingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingResponseCopyWith<$Res> {
  factory $OnboardingResponseCopyWith(
          OnboardingResponse value, $Res Function(OnboardingResponse) then) =
      _$OnboardingResponseCopyWithImpl<$Res, OnboardingResponse>;
  @useResult
  $Res call(
      {bool isJA,
      bool isPdone,
      bool isMarshopOwner,
      bool isMarshopCustomer,
      bool hasDefaultBankAccount});
}

/// @nodoc
class _$OnboardingResponseCopyWithImpl<$Res, $Val extends OnboardingResponse>
    implements $OnboardingResponseCopyWith<$Res> {
  _$OnboardingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isJA = null,
    Object? isPdone = null,
    Object? isMarshopOwner = null,
    Object? isMarshopCustomer = null,
    Object? hasDefaultBankAccount = null,
  }) {
    return _then(_value.copyWith(
      isJA: null == isJA
          ? _value.isJA
          : isJA // ignore: cast_nullable_to_non_nullable
              as bool,
      isPdone: null == isPdone
          ? _value.isPdone
          : isPdone // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarshopOwner: null == isMarshopOwner
          ? _value.isMarshopOwner
          : isMarshopOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarshopCustomer: null == isMarshopCustomer
          ? _value.isMarshopCustomer
          : isMarshopCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDefaultBankAccount: null == hasDefaultBankAccount
          ? _value.hasDefaultBankAccount
          : hasDefaultBankAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingResponseImplCopyWith<$Res>
    implements $OnboardingResponseCopyWith<$Res> {
  factory _$$OnboardingResponseImplCopyWith(_$OnboardingResponseImpl value,
          $Res Function(_$OnboardingResponseImpl) then) =
      __$$OnboardingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isJA,
      bool isPdone,
      bool isMarshopOwner,
      bool isMarshopCustomer,
      bool hasDefaultBankAccount});
}

/// @nodoc
class __$$OnboardingResponseImplCopyWithImpl<$Res>
    extends _$OnboardingResponseCopyWithImpl<$Res, _$OnboardingResponseImpl>
    implements _$$OnboardingResponseImplCopyWith<$Res> {
  __$$OnboardingResponseImplCopyWithImpl(_$OnboardingResponseImpl _value,
      $Res Function(_$OnboardingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isJA = null,
    Object? isPdone = null,
    Object? isMarshopOwner = null,
    Object? isMarshopCustomer = null,
    Object? hasDefaultBankAccount = null,
  }) {
    return _then(_$OnboardingResponseImpl(
      isJA: null == isJA
          ? _value.isJA
          : isJA // ignore: cast_nullable_to_non_nullable
              as bool,
      isPdone: null == isPdone
          ? _value.isPdone
          : isPdone // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarshopOwner: null == isMarshopOwner
          ? _value.isMarshopOwner
          : isMarshopOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      isMarshopCustomer: null == isMarshopCustomer
          ? _value.isMarshopCustomer
          : isMarshopCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDefaultBankAccount: null == hasDefaultBankAccount
          ? _value.hasDefaultBankAccount
          : hasDefaultBankAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnboardingResponseImpl implements _OnboardingResponse {
  const _$OnboardingResponseImpl(
      {required this.isJA,
      required this.isPdone,
      required this.isMarshopOwner,
      required this.isMarshopCustomer,
      required this.hasDefaultBankAccount});

  factory _$OnboardingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnboardingResponseImplFromJson(json);

  @override
  final bool isJA;
  @override
  final bool isPdone;
  @override
  final bool isMarshopOwner;
  @override
  final bool isMarshopCustomer;
  @override
  final bool hasDefaultBankAccount;

  @override
  String toString() {
    return 'OnboardingResponse(isJA: $isJA, isPdone: $isPdone, isMarshopOwner: $isMarshopOwner, isMarshopCustomer: $isMarshopCustomer, hasDefaultBankAccount: $hasDefaultBankAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingResponseImpl &&
            (identical(other.isJA, isJA) || other.isJA == isJA) &&
            (identical(other.isPdone, isPdone) || other.isPdone == isPdone) &&
            (identical(other.isMarshopOwner, isMarshopOwner) ||
                other.isMarshopOwner == isMarshopOwner) &&
            (identical(other.isMarshopCustomer, isMarshopCustomer) ||
                other.isMarshopCustomer == isMarshopCustomer) &&
            (identical(other.hasDefaultBankAccount, hasDefaultBankAccount) ||
                other.hasDefaultBankAccount == hasDefaultBankAccount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isJA, isPdone, isMarshopOwner,
      isMarshopCustomer, hasDefaultBankAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingResponseImplCopyWith<_$OnboardingResponseImpl> get copyWith =>
      __$$OnboardingResponseImplCopyWithImpl<_$OnboardingResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnboardingResponseImplToJson(
      this,
    );
  }
}

abstract class _OnboardingResponse implements OnboardingResponse {
  const factory _OnboardingResponse(
      {required final bool isJA,
      required final bool isPdone,
      required final bool isMarshopOwner,
      required final bool isMarshopCustomer,
      required final bool hasDefaultBankAccount}) = _$OnboardingResponseImpl;

  factory _OnboardingResponse.fromJson(Map<String, dynamic> json) =
      _$OnboardingResponseImpl.fromJson;

  @override
  bool get isJA;
  @override
  bool get isPdone;
  @override
  bool get isMarshopOwner;
  @override
  bool get isMarshopCustomer;
  @override
  bool get hasDefaultBankAccount;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingResponseImplCopyWith<_$OnboardingResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
