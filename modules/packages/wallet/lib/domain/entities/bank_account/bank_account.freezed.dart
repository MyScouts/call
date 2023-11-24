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

BankAccountTransactionHistory _$BankAccountTransactionHistoryFromJson(
    Map<String, dynamic> json) {
  return _BankAccount.fromJson(json);
}

/// @nodoc
mixin _$BankAccountTransactionHistory {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get bankNumber => throw _privateConstructorUsedError;
  String get bankHolder => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  Bank? get bank => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountTransactionHistoryCopyWith<BankAccountTransactionHistory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountTransactionHistoryCopyWith<$Res> {
  factory $BankAccountTransactionHistoryCopyWith(
          BankAccountTransactionHistory value,
          $Res Function(BankAccountTransactionHistory) then) =
      _$BankAccountTransactionHistoryCopyWithImpl<$Res,
          BankAccountTransactionHistory>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String bankNumber,
      String bankHolder,
      bool isDefault,
      DateTime? createdAt,
      Bank? bank});

  $BankCopyWith<$Res>? get bank;
}

/// @nodoc
class _$BankAccountTransactionHistoryCopyWithImpl<$Res,
        $Val extends BankAccountTransactionHistory>
    implements $BankAccountTransactionHistoryCopyWith<$Res> {
  _$BankAccountTransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? bankNumber = null,
    Object? bankHolder = null,
    Object? isDefault = null,
    Object? createdAt = freezed,
    Object? bank = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      bankNumber: null == bankNumber
          ? _value.bankNumber
          : bankNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankHolder: null == bankHolder
          ? _value.bankHolder
          : bankHolder // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as Bank?,
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
    implements $BankAccountTransactionHistoryCopyWith<$Res> {
  factory _$$BankAccountImplCopyWith(
          _$BankAccountImpl value, $Res Function(_$BankAccountImpl) then) =
      __$$BankAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String bankNumber,
      String bankHolder,
      bool isDefault,
      DateTime? createdAt,
      Bank? bank});

  @override
  $BankCopyWith<$Res>? get bank;
}

/// @nodoc
class __$$BankAccountImplCopyWithImpl<$Res>
    extends _$BankAccountTransactionHistoryCopyWithImpl<$Res, _$BankAccountImpl>
    implements _$$BankAccountImplCopyWith<$Res> {
  __$$BankAccountImplCopyWithImpl(
      _$BankAccountImpl _value, $Res Function(_$BankAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? bankNumber = null,
    Object? bankHolder = null,
    Object? isDefault = null,
    Object? createdAt = freezed,
    Object? bank = freezed,
  }) {
    return _then(_$BankAccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      bankNumber: null == bankNumber
          ? _value.bankNumber
          : bankNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankHolder: null == bankHolder
          ? _value.bankHolder
          : bankHolder // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as Bank?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankAccountImpl implements _BankAccount {
  const _$BankAccountImpl(
      {this.id = 0,
      this.userId = 0,
      this.bankNumber = '',
      this.bankHolder = '',
      this.isDefault = true,
      this.createdAt,
      this.bank});

  factory _$BankAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int userId;
  @override
  @JsonKey()
  final String bankNumber;
  @override
  @JsonKey()
  final String bankHolder;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  final DateTime? createdAt;
  @override
  final Bank? bank;

  @override
  String toString() {
    return 'BankAccountTransactionHistory(id: $id, userId: $userId, bankNumber: $bankNumber, bankHolder: $bankHolder, isDefault: $isDefault, createdAt: $createdAt, bank: $bank)';
  }

  @override
  bool operator ==(dynamic other) {
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
            (identical(other.bank, bank) || other.bank == bank));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, bankNumber,
      bankHolder, isDefault, createdAt, bank);

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

abstract class _BankAccount implements BankAccountTransactionHistory {
  const factory _BankAccount(
      {final int id,
      final int userId,
      final String bankNumber,
      final String bankHolder,
      final bool isDefault,
      final DateTime? createdAt,
      final Bank? bank}) = _$BankAccountImpl;

  factory _BankAccount.fromJson(Map<String, dynamic> json) =
      _$BankAccountImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get bankNumber;
  @override
  String get bankHolder;
  @override
  bool get isDefault;
  @override
  DateTime? get createdAt;
  @override
  Bank? get bank;
  @override
  @JsonKey(ignore: true)
  _$$BankAccountImplCopyWith<_$BankAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
