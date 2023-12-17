// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) {
  return _BankAccount.fromJson(json);
}

/// @nodoc
mixin _$BankAccount {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get bankNumber => throw _privateConstructorUsedError;
  String? get bankHolder => throw _privateConstructorUsedError;
  bool? get isDefault => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  Bank? get bank => throw _privateConstructorUsedError;
  String? get qrImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountCopyWith<BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountCopyWith<$Res> {
  factory $BankAccountCopyWith(
          BankAccount value, $Res Function(BankAccount) then) =
      _$BankAccountCopyWithImpl<$Res, BankAccount>;
  @useResult
  $Res call(
      {int? id,
      int? userId,
      String? bankNumber,
      String? bankHolder,
      bool? isDefault,
      DateTime? createdAt,
      Bank? bank,
      String? qrImage});

  $BankCopyWith<$Res>? get bank;
}

/// @nodoc
class _$BankAccountCopyWithImpl<$Res, $Val extends BankAccount>
    implements $BankAccountCopyWith<$Res> {
  _$BankAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? bankNumber = freezed,
    Object? bankHolder = freezed,
    Object? isDefault = freezed,
    Object? createdAt = freezed,
    Object? bank = freezed,
    Object? qrImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankNumber: freezed == bankNumber
          ? _value.bankNumber
          : bankNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankHolder: freezed == bankHolder
          ? _value.bankHolder
          : bankHolder // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as Bank?,
      qrImage: freezed == qrImage
          ? _value.qrImage
          : qrImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BankCopyWith<$Res>? get bank {
    if (_value.bank == null) {
      return null;
    }

    return $BankCopyWith<$Res>(_value.bank!, (value) {
      return _then(_value.copyWith(bank: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BankAccountImplCopyWith<$Res>
    implements $BankAccountCopyWith<$Res> {
  factory _$$BankAccountImplCopyWith(
          _$BankAccountImpl value, $Res Function(_$BankAccountImpl) then) =
      __$$BankAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? userId,
      String? bankNumber,
      String? bankHolder,
      bool? isDefault,
      DateTime? createdAt,
      Bank? bank,
      String? qrImage});

  @override
  $BankCopyWith<$Res>? get bank;
}

/// @nodoc
class __$$BankAccountImplCopyWithImpl<$Res>
    extends _$BankAccountCopyWithImpl<$Res, _$BankAccountImpl>
    implements _$$BankAccountImplCopyWith<$Res> {
  __$$BankAccountImplCopyWithImpl(
      _$BankAccountImpl _value, $Res Function(_$BankAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? bankNumber = freezed,
    Object? bankHolder = freezed,
    Object? isDefault = freezed,
    Object? createdAt = freezed,
    Object? bank = freezed,
    Object? qrImage = freezed,
  }) {
    return _then(_$BankAccountImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      bankNumber: freezed == bankNumber
          ? _value.bankNumber
          : bankNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankHolder: freezed == bankHolder
          ? _value.bankHolder
          : bankHolder // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as Bank?,
      qrImage: freezed == qrImage
          ? _value.qrImage
          : qrImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankAccountImpl implements _BankAccount {
  const _$BankAccountImpl(
      {this.id,
      this.userId,
      this.bankNumber,
      this.bankHolder,
      this.isDefault,
      this.createdAt,
      this.bank,
      this.qrImage});

  factory _$BankAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountImplFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final String? bankNumber;
  @override
  final String? bankHolder;
  @override
  final bool? isDefault;
  @override
  final DateTime? createdAt;
  @override
  final Bank? bank;
  @override
  final String? qrImage;

  @override
  String toString() {
    return 'BankAccount(id: $id, userId: $userId, bankNumber: $bankNumber, bankHolder: $bankHolder, isDefault: $isDefault, createdAt: $createdAt, bank: $bank, qrImage: $qrImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.bankNumber, bankNumber) ||
                other.bankNumber == bankNumber) &&
            (identical(other.bankHolder, bankHolder) ||
                other.bankHolder == bankHolder) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.qrImage, qrImage) || other.qrImage == qrImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, bankNumber,
      bankHolder, isDefault, createdAt, bank, qrImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountImplCopyWith<_$BankAccountImpl> get copyWith =>
      __$$BankAccountImplCopyWithImpl<_$BankAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountImplToJson(
      this,
    );
  }
}

abstract class _BankAccount implements BankAccount {
  const factory _BankAccount(
      {final int? id,
      final int? userId,
      final String? bankNumber,
      final String? bankHolder,
      final bool? isDefault,
      final DateTime? createdAt,
      final Bank? bank,
      final String? qrImage}) = _$BankAccountImpl;

  factory _BankAccount.fromJson(Map<String, dynamic> json) =
      _$BankAccountImpl.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  String? get bankNumber;
  @override
  String? get bankHolder;
  @override
  bool? get isDefault;
  @override
  DateTime? get createdAt;
  @override
  Bank? get bank;
  @override
  String? get qrImage;
  @override
  @JsonKey(ignore: true)
  _$$BankAccountImplCopyWith<_$BankAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
