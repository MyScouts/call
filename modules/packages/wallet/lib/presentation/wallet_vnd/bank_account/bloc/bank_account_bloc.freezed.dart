// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BankAccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountEventCopyWith<$Res> {
  factory $BankAccountEventCopyWith(
          BankAccountEvent value, $Res Function(BankAccountEvent) then) =
      _$BankAccountEventCopyWithImpl<$Res, BankAccountEvent>;
}

/// @nodoc
class _$BankAccountEventCopyWithImpl<$Res, $Val extends BankAccountEvent>
    implements $BankAccountEventCopyWith<$Res> {
  _$BankAccountEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetBankAccountsImplCopyWith<$Res> {
  factory _$$GetBankAccountsImplCopyWith(_$GetBankAccountsImpl value,
          $Res Function(_$GetBankAccountsImpl) then) =
      __$$GetBankAccountsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBankAccountsImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$GetBankAccountsImpl>
    implements _$$GetBankAccountsImplCopyWith<$Res> {
  __$$GetBankAccountsImplCopyWithImpl(
      _$GetBankAccountsImpl _value, $Res Function(_$GetBankAccountsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBankAccountsImpl implements _GetBankAccounts {
  const _$GetBankAccountsImpl();

  @override
  String toString() {
    return 'BankAccountEvent.getBankAccounts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBankAccountsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return getBankAccounts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return getBankAccounts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (getBankAccounts != null) {
      return getBankAccounts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return getBankAccounts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return getBankAccounts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (getBankAccounts != null) {
      return getBankAccounts(this);
    }
    return orElse();
  }
}

abstract class _GetBankAccounts implements BankAccountEvent {
  const factory _GetBankAccounts() = _$GetBankAccountsImpl;
}

/// @nodoc
abstract class _$$GetAllBanksInfoImplCopyWith<$Res> {
  factory _$$GetAllBanksInfoImplCopyWith(_$GetAllBanksInfoImpl value,
          $Res Function(_$GetAllBanksInfoImpl) then) =
      __$$GetAllBanksInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllBanksInfoImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$GetAllBanksInfoImpl>
    implements _$$GetAllBanksInfoImplCopyWith<$Res> {
  __$$GetAllBanksInfoImplCopyWithImpl(
      _$GetAllBanksInfoImpl _value, $Res Function(_$GetAllBanksInfoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllBanksInfoImpl implements _GetAllBanksInfo {
  const _$GetAllBanksInfoImpl();

  @override
  String toString() {
    return 'BankAccountEvent.getAllBanksInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllBanksInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return getAllBanksInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return getAllBanksInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (getAllBanksInfo != null) {
      return getAllBanksInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return getAllBanksInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return getAllBanksInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (getAllBanksInfo != null) {
      return getAllBanksInfo(this);
    }
    return orElse();
  }
}

abstract class _GetAllBanksInfo implements BankAccountEvent {
  const factory _GetAllBanksInfo() = _$GetAllBanksInfoImpl;
}

/// @nodoc
abstract class _$$SearchBankImplCopyWith<$Res> {
  factory _$$SearchBankImplCopyWith(
          _$SearchBankImpl value, $Res Function(_$SearchBankImpl) then) =
      __$$SearchBankImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String search});
}

/// @nodoc
class __$$SearchBankImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$SearchBankImpl>
    implements _$$SearchBankImplCopyWith<$Res> {
  __$$SearchBankImplCopyWithImpl(
      _$SearchBankImpl _value, $Res Function(_$SearchBankImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
  }) {
    return _then(_$SearchBankImpl(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchBankImpl implements _SearchBank {
  const _$SearchBankImpl({required this.search});

  @override
  final String search;

  @override
  String toString() {
    return 'BankAccountEvent.searchBank(search: $search)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchBankImpl &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchBankImplCopyWith<_$SearchBankImpl> get copyWith =>
      __$$SearchBankImplCopyWithImpl<_$SearchBankImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return searchBank(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return searchBank?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (searchBank != null) {
      return searchBank(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return searchBank(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return searchBank?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (searchBank != null) {
      return searchBank(this);
    }
    return orElse();
  }
}

abstract class _SearchBank implements BankAccountEvent {
  const factory _SearchBank({required final String search}) = _$SearchBankImpl;

  String get search;
  @JsonKey(ignore: true)
  _$$SearchBankImplCopyWith<_$SearchBankImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOtpImplCopyWith<$Res> {
  factory _$$GetOtpImplCopyWith(
          _$GetOtpImpl value, $Res Function(_$GetOtpImpl) then) =
      __$$GetOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isResend});
}

/// @nodoc
class __$$GetOtpImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$GetOtpImpl>
    implements _$$GetOtpImplCopyWith<$Res> {
  __$$GetOtpImplCopyWithImpl(
      _$GetOtpImpl _value, $Res Function(_$GetOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isResend = null,
  }) {
    return _then(_$GetOtpImpl(
      isResend: null == isResend
          ? _value.isResend
          : isResend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetOtpImpl implements _GetOtp {
  const _$GetOtpImpl({this.isResend = false});

  @override
  @JsonKey()
  final bool isResend;

  @override
  String toString() {
    return 'BankAccountEvent.getOtp(isResend: $isResend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOtpImpl &&
            (identical(other.isResend, isResend) ||
                other.isResend == isResend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isResend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOtpImplCopyWith<_$GetOtpImpl> get copyWith =>
      __$$GetOtpImplCopyWithImpl<_$GetOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return getOtp(isResend);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return getOtp?.call(isResend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (getOtp != null) {
      return getOtp(isResend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return getOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return getOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (getOtp != null) {
      return getOtp(this);
    }
    return orElse();
  }
}

abstract class _GetOtp implements BankAccountEvent {
  const factory _GetOtp({final bool isResend}) = _$GetOtpImpl;

  bool get isResend;
  @JsonKey(ignore: true)
  _$$GetOtpImplCopyWith<_$GetOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddBankAccountImplCopyWith<$Res> {
  factory _$$AddBankAccountImplCopyWith(_$AddBankAccountImpl value,
          $Res Function(_$AddBankAccountImpl) then) =
      __$$AddBankAccountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddBankAccountRequest request});
}

/// @nodoc
class __$$AddBankAccountImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$AddBankAccountImpl>
    implements _$$AddBankAccountImplCopyWith<$Res> {
  __$$AddBankAccountImplCopyWithImpl(
      _$AddBankAccountImpl _value, $Res Function(_$AddBankAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$AddBankAccountImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as AddBankAccountRequest,
    ));
  }
}

/// @nodoc

class _$AddBankAccountImpl implements _AddBankAccount {
  const _$AddBankAccountImpl({required this.request});

  @override
  final AddBankAccountRequest request;

  @override
  String toString() {
    return 'BankAccountEvent.addBankAccount(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBankAccountImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddBankAccountImplCopyWith<_$AddBankAccountImpl> get copyWith =>
      __$$AddBankAccountImplCopyWithImpl<_$AddBankAccountImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return addBankAccount(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return addBankAccount?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (addBankAccount != null) {
      return addBankAccount(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return addBankAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return addBankAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (addBankAccount != null) {
      return addBankAccount(this);
    }
    return orElse();
  }
}

abstract class _AddBankAccount implements BankAccountEvent {
  const factory _AddBankAccount(
      {required final AddBankAccountRequest request}) = _$AddBankAccountImpl;

  AddBankAccountRequest get request;
  @JsonKey(ignore: true)
  _$$AddBankAccountImplCopyWith<_$AddBankAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadImageImplCopyWith<$Res> {
  factory _$$UploadImageImplCopyWith(
          _$UploadImageImpl value, $Res Function(_$UploadImageImpl) then) =
      __$$UploadImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$UploadImageImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$UploadImageImpl>
    implements _$$UploadImageImplCopyWith<$Res> {
  __$$UploadImageImplCopyWithImpl(
      _$UploadImageImpl _value, $Res Function(_$UploadImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$UploadImageImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$UploadImageImpl implements _UploadImage {
  const _$UploadImageImpl({required this.file});

  @override
  final File file;

  @override
  String toString() {
    return 'BankAccountEvent.uploadImage(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadImageImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadImageImplCopyWith<_$UploadImageImpl> get copyWith =>
      __$$UploadImageImplCopyWithImpl<_$UploadImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return uploadImage(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return uploadImage?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return uploadImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return uploadImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (uploadImage != null) {
      return uploadImage(this);
    }
    return orElse();
  }
}

abstract class _UploadImage implements BankAccountEvent {
  const factory _UploadImage({required final File file}) = _$UploadImageImpl;

  File get file;
  @JsonKey(ignore: true)
  _$$UploadImageImplCopyWith<_$UploadImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteBankAccountImplCopyWith<$Res> {
  factory _$$DeleteBankAccountImplCopyWith(_$DeleteBankAccountImpl value,
          $Res Function(_$DeleteBankAccountImpl) then) =
      __$$DeleteBankAccountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int bankId});
}

/// @nodoc
class __$$DeleteBankAccountImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$DeleteBankAccountImpl>
    implements _$$DeleteBankAccountImplCopyWith<$Res> {
  __$$DeleteBankAccountImplCopyWithImpl(_$DeleteBankAccountImpl _value,
      $Res Function(_$DeleteBankAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankId = null,
  }) {
    return _then(_$DeleteBankAccountImpl(
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteBankAccountImpl implements _DeleteBankAccount {
  const _$DeleteBankAccountImpl({required this.bankId});

  @override
  final int bankId;

  @override
  String toString() {
    return 'BankAccountEvent.deleteBankAccount(bankId: $bankId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBankAccountImpl &&
            (identical(other.bankId, bankId) || other.bankId == bankId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bankId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBankAccountImplCopyWith<_$DeleteBankAccountImpl> get copyWith =>
      __$$DeleteBankAccountImplCopyWithImpl<_$DeleteBankAccountImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return deleteBankAccount(bankId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return deleteBankAccount?.call(bankId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (deleteBankAccount != null) {
      return deleteBankAccount(bankId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return deleteBankAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return deleteBankAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (deleteBankAccount != null) {
      return deleteBankAccount(this);
    }
    return orElse();
  }
}

abstract class _DeleteBankAccount implements BankAccountEvent {
  const factory _DeleteBankAccount({required final int bankId}) =
      _$DeleteBankAccountImpl;

  int get bankId;
  @JsonKey(ignore: true)
  _$$DeleteBankAccountImplCopyWith<_$DeleteBankAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetVndWalletInfoImplCopyWith<$Res> {
  factory _$$GetVndWalletInfoImplCopyWith(_$GetVndWalletInfoImpl value,
          $Res Function(_$GetVndWalletInfoImpl) then) =
      __$$GetVndWalletInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetVndWalletInfoImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$GetVndWalletInfoImpl>
    implements _$$GetVndWalletInfoImplCopyWith<$Res> {
  __$$GetVndWalletInfoImplCopyWithImpl(_$GetVndWalletInfoImpl _value,
      $Res Function(_$GetVndWalletInfoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetVndWalletInfoImpl implements _GetVndWalletInfo {
  const _$GetVndWalletInfoImpl();

  @override
  String toString() {
    return 'BankAccountEvent.getVndWalletInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetVndWalletInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return getVndWalletInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return getVndWalletInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (getVndWalletInfo != null) {
      return getVndWalletInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return getVndWalletInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return getVndWalletInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (getVndWalletInfo != null) {
      return getVndWalletInfo(this);
    }
    return orElse();
  }
}

abstract class _GetVndWalletInfo implements BankAccountEvent {
  const factory _GetVndWalletInfo() = _$GetVndWalletInfoImpl;
}

/// @nodoc
abstract class _$$EstimateTaxImplCopyWith<$Res> {
  factory _$$EstimateTaxImplCopyWith(
          _$EstimateTaxImpl value, $Res Function(_$EstimateTaxImpl) then) =
      __$$EstimateTaxImplCopyWithImpl<$Res>;
  @useResult
  $Res call({num value});
}

/// @nodoc
class __$$EstimateTaxImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$EstimateTaxImpl>
    implements _$$EstimateTaxImplCopyWith<$Res> {
  __$$EstimateTaxImplCopyWithImpl(
      _$EstimateTaxImpl _value, $Res Function(_$EstimateTaxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$EstimateTaxImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$EstimateTaxImpl implements _EstimateTax {
  const _$EstimateTaxImpl({required this.value});

  @override
  final num value;

  @override
  String toString() {
    return 'BankAccountEvent.estimateTax(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstimateTaxImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EstimateTaxImplCopyWith<_$EstimateTaxImpl> get copyWith =>
      __$$EstimateTaxImplCopyWithImpl<_$EstimateTaxImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return estimateTax(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return estimateTax?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (estimateTax != null) {
      return estimateTax(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return estimateTax(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return estimateTax?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (estimateTax != null) {
      return estimateTax(this);
    }
    return orElse();
  }
}

abstract class _EstimateTax implements BankAccountEvent {
  const factory _EstimateTax({required final num value}) = _$EstimateTaxImpl;

  num get value;
  @JsonKey(ignore: true)
  _$$EstimateTaxImplCopyWith<_$EstimateTaxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestWithdrawOtpEventImplCopyWith<$Res> {
  factory _$$RequestWithdrawOtpEventImplCopyWith(
          _$RequestWithdrawOtpEventImpl value,
          $Res Function(_$RequestWithdrawOtpEventImpl) then) =
      __$$RequestWithdrawOtpEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestWithdrawOtpEventImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$RequestWithdrawOtpEventImpl>
    implements _$$RequestWithdrawOtpEventImplCopyWith<$Res> {
  __$$RequestWithdrawOtpEventImplCopyWithImpl(
      _$RequestWithdrawOtpEventImpl _value,
      $Res Function(_$RequestWithdrawOtpEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestWithdrawOtpEventImpl implements _RequestWithdrawOtpEvent {
  const _$RequestWithdrawOtpEventImpl();

  @override
  String toString() {
    return 'BankAccountEvent.requestWithdrawOtp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestWithdrawOtpEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return requestWithdrawOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return requestWithdrawOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (requestWithdrawOtp != null) {
      return requestWithdrawOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return requestWithdrawOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return requestWithdrawOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (requestWithdrawOtp != null) {
      return requestWithdrawOtp(this);
    }
    return orElse();
  }
}

abstract class _RequestWithdrawOtpEvent implements BankAccountEvent {
  const factory _RequestWithdrawOtpEvent() = _$RequestWithdrawOtpEventImpl;
}

/// @nodoc
abstract class _$$ResendWithdrawOtpEventImplCopyWith<$Res> {
  factory _$$ResendWithdrawOtpEventImplCopyWith(
          _$ResendWithdrawOtpEventImpl value,
          $Res Function(_$ResendWithdrawOtpEventImpl) then) =
      __$$ResendWithdrawOtpEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendWithdrawOtpEventImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$ResendWithdrawOtpEventImpl>
    implements _$$ResendWithdrawOtpEventImplCopyWith<$Res> {
  __$$ResendWithdrawOtpEventImplCopyWithImpl(
      _$ResendWithdrawOtpEventImpl _value,
      $Res Function(_$ResendWithdrawOtpEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResendWithdrawOtpEventImpl implements _ResendWithdrawOtpEvent {
  const _$ResendWithdrawOtpEventImpl();

  @override
  String toString() {
    return 'BankAccountEvent.resendWithdrawOtp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendWithdrawOtpEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return resendWithdrawOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return resendWithdrawOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (resendWithdrawOtp != null) {
      return resendWithdrawOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return resendWithdrawOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return resendWithdrawOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (resendWithdrawOtp != null) {
      return resendWithdrawOtp(this);
    }
    return orElse();
  }
}

abstract class _ResendWithdrawOtpEvent implements BankAccountEvent {
  const factory _ResendWithdrawOtpEvent() = _$ResendWithdrawOtpEventImpl;
}

/// @nodoc
abstract class _$$WithdrawImplCopyWith<$Res> {
  factory _$$WithdrawImplCopyWith(
          _$WithdrawImpl value, $Res Function(_$WithdrawImpl) then) =
      __$$WithdrawImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WithdrawRequest request});
}

/// @nodoc
class __$$WithdrawImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$WithdrawImpl>
    implements _$$WithdrawImplCopyWith<$Res> {
  __$$WithdrawImplCopyWithImpl(
      _$WithdrawImpl _value, $Res Function(_$WithdrawImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$WithdrawImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as WithdrawRequest,
    ));
  }
}

/// @nodoc

class _$WithdrawImpl implements _Withdraw {
  const _$WithdrawImpl({required this.request});

  @override
  final WithdrawRequest request;

  @override
  String toString() {
    return 'BankAccountEvent.withdraw(request: $request)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawImplCopyWith<_$WithdrawImpl> get copyWith =>
      __$$WithdrawImplCopyWithImpl<_$WithdrawImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return withdraw(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return withdraw?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (withdraw != null) {
      return withdraw(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return withdraw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return withdraw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (withdraw != null) {
      return withdraw(this);
    }
    return orElse();
  }
}

abstract class _Withdraw implements BankAccountEvent {
  const factory _Withdraw({required final WithdrawRequest request}) =
      _$WithdrawImpl;

  WithdrawRequest get request;
  @JsonKey(ignore: true)
  _$$WithdrawImplCopyWith<_$WithdrawImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetDefaultBankAccountImplCopyWith<$Res> {
  factory _$$SetDefaultBankAccountImplCopyWith(
          _$SetDefaultBankAccountImpl value,
          $Res Function(_$SetDefaultBankAccountImpl) then) =
      __$$SetDefaultBankAccountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int bankAccountId, bool isDefault});
}

/// @nodoc
class __$$SetDefaultBankAccountImplCopyWithImpl<$Res>
    extends _$BankAccountEventCopyWithImpl<$Res, _$SetDefaultBankAccountImpl>
    implements _$$SetDefaultBankAccountImplCopyWith<$Res> {
  __$$SetDefaultBankAccountImplCopyWithImpl(_$SetDefaultBankAccountImpl _value,
      $Res Function(_$SetDefaultBankAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankAccountId = null,
    Object? isDefault = null,
  }) {
    return _then(_$SetDefaultBankAccountImpl(
      bankAccountId: null == bankAccountId
          ? _value.bankAccountId
          : bankAccountId // ignore: cast_nullable_to_non_nullable
              as int,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SetDefaultBankAccountImpl implements _SetDefaultBankAccount {
  const _$SetDefaultBankAccountImpl(
      {required this.bankAccountId, required this.isDefault});

  @override
  final int bankAccountId;
  @override
  final bool isDefault;

  @override
  String toString() {
    return 'BankAccountEvent.setDefaultBankAccount(bankAccountId: $bankAccountId, isDefault: $isDefault)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDefaultBankAccountImpl &&
            (identical(other.bankAccountId, bankAccountId) ||
                other.bankAccountId == bankAccountId) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bankAccountId, isDefault);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDefaultBankAccountImplCopyWith<_$SetDefaultBankAccountImpl>
      get copyWith => __$$SetDefaultBankAccountImplCopyWithImpl<
          _$SetDefaultBankAccountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBankAccounts,
    required TResult Function() getAllBanksInfo,
    required TResult Function(String search) searchBank,
    required TResult Function(bool isResend) getOtp,
    required TResult Function(AddBankAccountRequest request) addBankAccount,
    required TResult Function(File file) uploadImage,
    required TResult Function(int bankId) deleteBankAccount,
    required TResult Function() getVndWalletInfo,
    required TResult Function(num value) estimateTax,
    required TResult Function() requestWithdrawOtp,
    required TResult Function() resendWithdrawOtp,
    required TResult Function(WithdrawRequest request) withdraw,
    required TResult Function(int bankAccountId, bool isDefault)
        setDefaultBankAccount,
  }) {
    return setDefaultBankAccount(bankAccountId, isDefault);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBankAccounts,
    TResult? Function()? getAllBanksInfo,
    TResult? Function(String search)? searchBank,
    TResult? Function(bool isResend)? getOtp,
    TResult? Function(AddBankAccountRequest request)? addBankAccount,
    TResult? Function(File file)? uploadImage,
    TResult? Function(int bankId)? deleteBankAccount,
    TResult? Function()? getVndWalletInfo,
    TResult? Function(num value)? estimateTax,
    TResult? Function()? requestWithdrawOtp,
    TResult? Function()? resendWithdrawOtp,
    TResult? Function(WithdrawRequest request)? withdraw,
    TResult? Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
  }) {
    return setDefaultBankAccount?.call(bankAccountId, isDefault);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBankAccounts,
    TResult Function()? getAllBanksInfo,
    TResult Function(String search)? searchBank,
    TResult Function(bool isResend)? getOtp,
    TResult Function(AddBankAccountRequest request)? addBankAccount,
    TResult Function(File file)? uploadImage,
    TResult Function(int bankId)? deleteBankAccount,
    TResult Function()? getVndWalletInfo,
    TResult Function(num value)? estimateTax,
    TResult Function()? requestWithdrawOtp,
    TResult Function()? resendWithdrawOtp,
    TResult Function(WithdrawRequest request)? withdraw,
    TResult Function(int bankAccountId, bool isDefault)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (setDefaultBankAccount != null) {
      return setDefaultBankAccount(bankAccountId, isDefault);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBankAccounts value) getBankAccounts,
    required TResult Function(_GetAllBanksInfo value) getAllBanksInfo,
    required TResult Function(_SearchBank value) searchBank,
    required TResult Function(_GetOtp value) getOtp,
    required TResult Function(_AddBankAccount value) addBankAccount,
    required TResult Function(_UploadImage value) uploadImage,
    required TResult Function(_DeleteBankAccount value) deleteBankAccount,
    required TResult Function(_GetVndWalletInfo value) getVndWalletInfo,
    required TResult Function(_EstimateTax value) estimateTax,
    required TResult Function(_RequestWithdrawOtpEvent value)
        requestWithdrawOtp,
    required TResult Function(_ResendWithdrawOtpEvent value) resendWithdrawOtp,
    required TResult Function(_Withdraw value) withdraw,
    required TResult Function(_SetDefaultBankAccount value)
        setDefaultBankAccount,
  }) {
    return setDefaultBankAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBankAccounts value)? getBankAccounts,
    TResult? Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult? Function(_SearchBank value)? searchBank,
    TResult? Function(_GetOtp value)? getOtp,
    TResult? Function(_AddBankAccount value)? addBankAccount,
    TResult? Function(_UploadImage value)? uploadImage,
    TResult? Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult? Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult? Function(_EstimateTax value)? estimateTax,
    TResult? Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult? Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult? Function(_Withdraw value)? withdraw,
    TResult? Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
  }) {
    return setDefaultBankAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBankAccounts value)? getBankAccounts,
    TResult Function(_GetAllBanksInfo value)? getAllBanksInfo,
    TResult Function(_SearchBank value)? searchBank,
    TResult Function(_GetOtp value)? getOtp,
    TResult Function(_AddBankAccount value)? addBankAccount,
    TResult Function(_UploadImage value)? uploadImage,
    TResult Function(_DeleteBankAccount value)? deleteBankAccount,
    TResult Function(_GetVndWalletInfo value)? getVndWalletInfo,
    TResult Function(_EstimateTax value)? estimateTax,
    TResult Function(_RequestWithdrawOtpEvent value)? requestWithdrawOtp,
    TResult Function(_ResendWithdrawOtpEvent value)? resendWithdrawOtp,
    TResult Function(_Withdraw value)? withdraw,
    TResult Function(_SetDefaultBankAccount value)? setDefaultBankAccount,
    required TResult orElse(),
  }) {
    if (setDefaultBankAccount != null) {
      return setDefaultBankAccount(this);
    }
    return orElse();
  }
}

abstract class _SetDefaultBankAccount implements BankAccountEvent {
  const factory _SetDefaultBankAccount(
      {required final int bankAccountId,
      required final bool isDefault}) = _$SetDefaultBankAccountImpl;

  int get bankAccountId;
  bool get isDefault;
  @JsonKey(ignore: true)
  _$$SetDefaultBankAccountImplCopyWith<_$SetDefaultBankAccountImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BankAccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountStateCopyWith<$Res> {
  factory $BankAccountStateCopyWith(
          BankAccountState value, $Res Function(BankAccountState) then) =
      _$BankAccountStateCopyWithImpl<$Res, BankAccountState>;
}

/// @nodoc
class _$BankAccountStateCopyWithImpl<$Res, $Val extends BankAccountState>
    implements $BankAccountStateCopyWith<$Res> {
  _$BankAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'BankAccountState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BankAccountState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$ErrorImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.err);

  @override
  final String err;

  @override
  String toString() {
    return 'BankAccountState.error(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements BankAccountState {
  const factory _Error(final String err) = _$ErrorImpl;

  String get err;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBankAccountsSuccessImplCopyWith<$Res> {
  factory _$$GetBankAccountsSuccessImplCopyWith(
          _$GetBankAccountsSuccessImpl value,
          $Res Function(_$GetBankAccountsSuccessImpl) then) =
      __$$GetBankAccountsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BankAccount> bankAccounts});
}

/// @nodoc
class __$$GetBankAccountsSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$GetBankAccountsSuccessImpl>
    implements _$$GetBankAccountsSuccessImplCopyWith<$Res> {
  __$$GetBankAccountsSuccessImplCopyWithImpl(
      _$GetBankAccountsSuccessImpl _value,
      $Res Function(_$GetBankAccountsSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankAccounts = null,
  }) {
    return _then(_$GetBankAccountsSuccessImpl(
      bankAccounts: null == bankAccounts
          ? _value._bankAccounts
          : bankAccounts // ignore: cast_nullable_to_non_nullable
              as List<BankAccount>,
    ));
  }
}

/// @nodoc

class _$GetBankAccountsSuccessImpl implements _GetBankAccountsSuccess {
  const _$GetBankAccountsSuccessImpl(
      {required final List<BankAccount> bankAccounts})
      : _bankAccounts = bankAccounts;

  final List<BankAccount> _bankAccounts;
  @override
  List<BankAccount> get bankAccounts {
    if (_bankAccounts is EqualUnmodifiableListView) return _bankAccounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bankAccounts);
  }

  @override
  String toString() {
    return 'BankAccountState.getBankAccountsSuccess(bankAccounts: $bankAccounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBankAccountsSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._bankAccounts, _bankAccounts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_bankAccounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBankAccountsSuccessImplCopyWith<_$GetBankAccountsSuccessImpl>
      get copyWith => __$$GetBankAccountsSuccessImplCopyWithImpl<
          _$GetBankAccountsSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsSuccess(bankAccounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsSuccess?.call(bankAccounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getBankAccountsSuccess != null) {
      return getBankAccountsSuccess(bankAccounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getBankAccountsSuccess != null) {
      return getBankAccountsSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetBankAccountsSuccess implements BankAccountState {
  const factory _GetBankAccountsSuccess(
          {required final List<BankAccount> bankAccounts}) =
      _$GetBankAccountsSuccessImpl;

  List<BankAccount> get bankAccounts;
  @JsonKey(ignore: true)
  _$$GetBankAccountsSuccessImplCopyWith<_$GetBankAccountsSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBankAccountsLoadingImplCopyWith<$Res> {
  factory _$$GetBankAccountsLoadingImplCopyWith(
          _$GetBankAccountsLoadingImpl value,
          $Res Function(_$GetBankAccountsLoadingImpl) then) =
      __$$GetBankAccountsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBankAccountsLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$GetBankAccountsLoadingImpl>
    implements _$$GetBankAccountsLoadingImplCopyWith<$Res> {
  __$$GetBankAccountsLoadingImplCopyWithImpl(
      _$GetBankAccountsLoadingImpl _value,
      $Res Function(_$GetBankAccountsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBankAccountsLoadingImpl implements _GetBankAccountsLoading {
  const _$GetBankAccountsLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.getBankAccountsLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBankAccountsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getBankAccountsLoading != null) {
      return getBankAccountsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getBankAccountsLoading != null) {
      return getBankAccountsLoading(this);
    }
    return orElse();
  }
}

abstract class _GetBankAccountsLoading implements BankAccountState {
  const factory _GetBankAccountsLoading() = _$GetBankAccountsLoadingImpl;
}

/// @nodoc
abstract class _$$GetBankAccountsErrorImplCopyWith<$Res> {
  factory _$$GetBankAccountsErrorImplCopyWith(_$GetBankAccountsErrorImpl value,
          $Res Function(_$GetBankAccountsErrorImpl) then) =
      __$$GetBankAccountsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$GetBankAccountsErrorImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$GetBankAccountsErrorImpl>
    implements _$$GetBankAccountsErrorImplCopyWith<$Res> {
  __$$GetBankAccountsErrorImplCopyWithImpl(_$GetBankAccountsErrorImpl _value,
      $Res Function(_$GetBankAccountsErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$GetBankAccountsErrorImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetBankAccountsErrorImpl implements _GetBankAccountsError {
  const _$GetBankAccountsErrorImpl(this.err);

  @override
  final String err;

  @override
  String toString() {
    return 'BankAccountState.getBankAccountsError(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBankAccountsErrorImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBankAccountsErrorImplCopyWith<_$GetBankAccountsErrorImpl>
      get copyWith =>
          __$$GetBankAccountsErrorImplCopyWithImpl<_$GetBankAccountsErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsError(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsError?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getBankAccountsError != null) {
      return getBankAccountsError(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return getBankAccountsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getBankAccountsError != null) {
      return getBankAccountsError(this);
    }
    return orElse();
  }
}

abstract class _GetBankAccountsError implements BankAccountState {
  const factory _GetBankAccountsError(final String err) =
      _$GetBankAccountsErrorImpl;

  String get err;
  @JsonKey(ignore: true)
  _$$GetBankAccountsErrorImplCopyWith<_$GetBankAccountsErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAllBanksInfoSuccessImplCopyWith<$Res> {
  factory _$$GetAllBanksInfoSuccessImplCopyWith(
          _$GetAllBanksInfoSuccessImpl value,
          $Res Function(_$GetAllBanksInfoSuccessImpl) then) =
      __$$GetAllBanksInfoSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllBanksInfoSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$GetAllBanksInfoSuccessImpl>
    implements _$$GetAllBanksInfoSuccessImplCopyWith<$Res> {
  __$$GetAllBanksInfoSuccessImplCopyWithImpl(
      _$GetAllBanksInfoSuccessImpl _value,
      $Res Function(_$GetAllBanksInfoSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllBanksInfoSuccessImpl implements _GetAllBanksInfoSuccess {
  const _$GetAllBanksInfoSuccessImpl();

  @override
  String toString() {
    return 'BankAccountState.getAllBanksInfoSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllBanksInfoSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return getAllBanksInfoSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return getAllBanksInfoSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getAllBanksInfoSuccess != null) {
      return getAllBanksInfoSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return getAllBanksInfoSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return getAllBanksInfoSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getAllBanksInfoSuccess != null) {
      return getAllBanksInfoSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetAllBanksInfoSuccess implements BankAccountState {
  const factory _GetAllBanksInfoSuccess() = _$GetAllBanksInfoSuccessImpl;
}

/// @nodoc
abstract class _$$GetAllBanksInfoLoadingImplCopyWith<$Res> {
  factory _$$GetAllBanksInfoLoadingImplCopyWith(
          _$GetAllBanksInfoLoadingImpl value,
          $Res Function(_$GetAllBanksInfoLoadingImpl) then) =
      __$$GetAllBanksInfoLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllBanksInfoLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$GetAllBanksInfoLoadingImpl>
    implements _$$GetAllBanksInfoLoadingImplCopyWith<$Res> {
  __$$GetAllBanksInfoLoadingImplCopyWithImpl(
      _$GetAllBanksInfoLoadingImpl _value,
      $Res Function(_$GetAllBanksInfoLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllBanksInfoLoadingImpl implements _GetAllBanksInfoLoading {
  const _$GetAllBanksInfoLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.getAllBanksInfoLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllBanksInfoLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return getAllBanksInfoLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return getAllBanksInfoLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getAllBanksInfoLoading != null) {
      return getAllBanksInfoLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return getAllBanksInfoLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return getAllBanksInfoLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getAllBanksInfoLoading != null) {
      return getAllBanksInfoLoading(this);
    }
    return orElse();
  }
}

abstract class _GetAllBanksInfoLoading implements BankAccountState {
  const factory _GetAllBanksInfoLoading() = _$GetAllBanksInfoLoadingImpl;
}

/// @nodoc
abstract class _$$GetOtpSuccessImplCopyWith<$Res> {
  factory _$$GetOtpSuccessImplCopyWith(
          _$GetOtpSuccessImpl value, $Res Function(_$GetOtpSuccessImpl) then) =
      __$$GetOtpSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetOtpSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$GetOtpSuccessImpl>
    implements _$$GetOtpSuccessImplCopyWith<$Res> {
  __$$GetOtpSuccessImplCopyWithImpl(
      _$GetOtpSuccessImpl _value, $Res Function(_$GetOtpSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetOtpSuccessImpl implements _GetOtpSuccess {
  const _$GetOtpSuccessImpl();

  @override
  String toString() {
    return 'BankAccountState.getOtpSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetOtpSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return getOtpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return getOtpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getOtpSuccess != null) {
      return getOtpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return getOtpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return getOtpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getOtpSuccess != null) {
      return getOtpSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetOtpSuccess implements BankAccountState {
  const factory _GetOtpSuccess() = _$GetOtpSuccessImpl;
}

/// @nodoc
abstract class _$$GetOtpLoadingImplCopyWith<$Res> {
  factory _$$GetOtpLoadingImplCopyWith(
          _$GetOtpLoadingImpl value, $Res Function(_$GetOtpLoadingImpl) then) =
      __$$GetOtpLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetOtpLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$GetOtpLoadingImpl>
    implements _$$GetOtpLoadingImplCopyWith<$Res> {
  __$$GetOtpLoadingImplCopyWithImpl(
      _$GetOtpLoadingImpl _value, $Res Function(_$GetOtpLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetOtpLoadingImpl implements _GetOtpLoading {
  const _$GetOtpLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.getOtpLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetOtpLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return getOtpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return getOtpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getOtpLoading != null) {
      return getOtpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return getOtpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return getOtpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getOtpLoading != null) {
      return getOtpLoading(this);
    }
    return orElse();
  }
}

abstract class _GetOtpLoading implements BankAccountState {
  const factory _GetOtpLoading() = _$GetOtpLoadingImpl;
}

/// @nodoc
abstract class _$$ResendOtpLoadingImplCopyWith<$Res> {
  factory _$$ResendOtpLoadingImplCopyWith(_$ResendOtpLoadingImpl value,
          $Res Function(_$ResendOtpLoadingImpl) then) =
      __$$ResendOtpLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendOtpLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$ResendOtpLoadingImpl>
    implements _$$ResendOtpLoadingImplCopyWith<$Res> {
  __$$ResendOtpLoadingImplCopyWithImpl(_$ResendOtpLoadingImpl _value,
      $Res Function(_$ResendOtpLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResendOtpLoadingImpl implements _ResendOtpLoading {
  const _$ResendOtpLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.resendOtpLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResendOtpLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return resendOtpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return resendOtpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (resendOtpLoading != null) {
      return resendOtpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return resendOtpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return resendOtpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (resendOtpLoading != null) {
      return resendOtpLoading(this);
    }
    return orElse();
  }
}

abstract class _ResendOtpLoading implements BankAccountState {
  const factory _ResendOtpLoading() = _$ResendOtpLoadingImpl;
}

/// @nodoc
abstract class _$$ResendOtpSuccessImplCopyWith<$Res> {
  factory _$$ResendOtpSuccessImplCopyWith(_$ResendOtpSuccessImpl value,
          $Res Function(_$ResendOtpSuccessImpl) then) =
      __$$ResendOtpSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendOtpSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$ResendOtpSuccessImpl>
    implements _$$ResendOtpSuccessImplCopyWith<$Res> {
  __$$ResendOtpSuccessImplCopyWithImpl(_$ResendOtpSuccessImpl _value,
      $Res Function(_$ResendOtpSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResendOtpSuccessImpl implements _ResendOtpSuccess {
  const _$ResendOtpSuccessImpl();

  @override
  String toString() {
    return 'BankAccountState.resendOtpSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResendOtpSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return resendOtpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return resendOtpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (resendOtpSuccess != null) {
      return resendOtpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return resendOtpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return resendOtpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (resendOtpSuccess != null) {
      return resendOtpSuccess(this);
    }
    return orElse();
  }
}

abstract class _ResendOtpSuccess implements BankAccountState {
  const factory _ResendOtpSuccess() = _$ResendOtpSuccessImpl;
}

/// @nodoc
abstract class _$$AddBankAccountSuccessImplCopyWith<$Res> {
  factory _$$AddBankAccountSuccessImplCopyWith(
          _$AddBankAccountSuccessImpl value,
          $Res Function(_$AddBankAccountSuccessImpl) then) =
      __$$AddBankAccountSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BankAccount bankAccount});

  $BankAccountCopyWith<$Res> get bankAccount;
}

/// @nodoc
class __$$AddBankAccountSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$AddBankAccountSuccessImpl>
    implements _$$AddBankAccountSuccessImplCopyWith<$Res> {
  __$$AddBankAccountSuccessImplCopyWithImpl(_$AddBankAccountSuccessImpl _value,
      $Res Function(_$AddBankAccountSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankAccount = null,
  }) {
    return _then(_$AddBankAccountSuccessImpl(
      bankAccount: null == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccount,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BankAccountCopyWith<$Res> get bankAccount {
    return $BankAccountCopyWith<$Res>(_value.bankAccount, (value) {
      return _then(_value.copyWith(bankAccount: value));
    });
  }
}

/// @nodoc

class _$AddBankAccountSuccessImpl implements _AddBankAccountSuccess {
  const _$AddBankAccountSuccessImpl({required this.bankAccount});

  @override
  final BankAccount bankAccount;

  @override
  String toString() {
    return 'BankAccountState.addBankAccountSuccess(bankAccount: $bankAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBankAccountSuccessImpl &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bankAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddBankAccountSuccessImplCopyWith<_$AddBankAccountSuccessImpl>
      get copyWith => __$$AddBankAccountSuccessImplCopyWithImpl<
          _$AddBankAccountSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return addBankAccountSuccess(bankAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return addBankAccountSuccess?.call(bankAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (addBankAccountSuccess != null) {
      return addBankAccountSuccess(bankAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return addBankAccountSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return addBankAccountSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (addBankAccountSuccess != null) {
      return addBankAccountSuccess(this);
    }
    return orElse();
  }
}

abstract class _AddBankAccountSuccess implements BankAccountState {
  const factory _AddBankAccountSuccess(
      {required final BankAccount bankAccount}) = _$AddBankAccountSuccessImpl;

  BankAccount get bankAccount;
  @JsonKey(ignore: true)
  _$$AddBankAccountSuccessImplCopyWith<_$AddBankAccountSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddBankAccountLoadingImplCopyWith<$Res> {
  factory _$$AddBankAccountLoadingImplCopyWith(
          _$AddBankAccountLoadingImpl value,
          $Res Function(_$AddBankAccountLoadingImpl) then) =
      __$$AddBankAccountLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddBankAccountLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$AddBankAccountLoadingImpl>
    implements _$$AddBankAccountLoadingImplCopyWith<$Res> {
  __$$AddBankAccountLoadingImplCopyWithImpl(_$AddBankAccountLoadingImpl _value,
      $Res Function(_$AddBankAccountLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddBankAccountLoadingImpl implements _AddBankAccountLoading {
  const _$AddBankAccountLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.addBankAccountLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBankAccountLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return addBankAccountLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return addBankAccountLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (addBankAccountLoading != null) {
      return addBankAccountLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return addBankAccountLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return addBankAccountLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (addBankAccountLoading != null) {
      return addBankAccountLoading(this);
    }
    return orElse();
  }
}

abstract class _AddBankAccountLoading implements BankAccountState {
  const factory _AddBankAccountLoading() = _$AddBankAccountLoadingImpl;
}

/// @nodoc
abstract class _$$AddBankAccountOtpNotMatchImplCopyWith<$Res> {
  factory _$$AddBankAccountOtpNotMatchImplCopyWith(
          _$AddBankAccountOtpNotMatchImpl value,
          $Res Function(_$AddBankAccountOtpNotMatchImpl) then) =
      __$$AddBankAccountOtpNotMatchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddBankAccountOtpNotMatchImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res,
        _$AddBankAccountOtpNotMatchImpl>
    implements _$$AddBankAccountOtpNotMatchImplCopyWith<$Res> {
  __$$AddBankAccountOtpNotMatchImplCopyWithImpl(
      _$AddBankAccountOtpNotMatchImpl _value,
      $Res Function(_$AddBankAccountOtpNotMatchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddBankAccountOtpNotMatchImpl implements _AddBankAccountOtpNotMatch {
  const _$AddBankAccountOtpNotMatchImpl();

  @override
  String toString() {
    return 'BankAccountState.addBankAccountOtpNotMatch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBankAccountOtpNotMatchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return addBankAccountOtpNotMatch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return addBankAccountOtpNotMatch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (addBankAccountOtpNotMatch != null) {
      return addBankAccountOtpNotMatch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return addBankAccountOtpNotMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return addBankAccountOtpNotMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (addBankAccountOtpNotMatch != null) {
      return addBankAccountOtpNotMatch(this);
    }
    return orElse();
  }
}

abstract class _AddBankAccountOtpNotMatch implements BankAccountState {
  const factory _AddBankAccountOtpNotMatch() = _$AddBankAccountOtpNotMatchImpl;
}

/// @nodoc
abstract class _$$UploadImageSuccessImplCopyWith<$Res> {
  factory _$$UploadImageSuccessImplCopyWith(_$UploadImageSuccessImpl value,
          $Res Function(_$UploadImageSuccessImpl) then) =
      __$$UploadImageSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String imgUrl});
}

/// @nodoc
class __$$UploadImageSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$UploadImageSuccessImpl>
    implements _$$UploadImageSuccessImplCopyWith<$Res> {
  __$$UploadImageSuccessImplCopyWithImpl(_$UploadImageSuccessImpl _value,
      $Res Function(_$UploadImageSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgUrl = null,
  }) {
    return _then(_$UploadImageSuccessImpl(
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UploadImageSuccessImpl implements _UploadImageSuccess {
  const _$UploadImageSuccessImpl({required this.imgUrl});

  @override
  final String imgUrl;

  @override
  String toString() {
    return 'BankAccountState.uploadImageSuccess(imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadImageSuccessImpl &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imgUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadImageSuccessImplCopyWith<_$UploadImageSuccessImpl> get copyWith =>
      __$$UploadImageSuccessImplCopyWithImpl<_$UploadImageSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return uploadImageSuccess(imgUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return uploadImageSuccess?.call(imgUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (uploadImageSuccess != null) {
      return uploadImageSuccess(imgUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return uploadImageSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return uploadImageSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (uploadImageSuccess != null) {
      return uploadImageSuccess(this);
    }
    return orElse();
  }
}

abstract class _UploadImageSuccess implements BankAccountState {
  const factory _UploadImageSuccess({required final String imgUrl}) =
      _$UploadImageSuccessImpl;

  String get imgUrl;
  @JsonKey(ignore: true)
  _$$UploadImageSuccessImplCopyWith<_$UploadImageSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadImageLoadingImplCopyWith<$Res> {
  factory _$$UploadImageLoadingImplCopyWith(_$UploadImageLoadingImpl value,
          $Res Function(_$UploadImageLoadingImpl) then) =
      __$$UploadImageLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UploadImageLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$UploadImageLoadingImpl>
    implements _$$UploadImageLoadingImplCopyWith<$Res> {
  __$$UploadImageLoadingImplCopyWithImpl(_$UploadImageLoadingImpl _value,
      $Res Function(_$UploadImageLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UploadImageLoadingImpl implements _UploadImageLoading {
  const _$UploadImageLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.uploadImageLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UploadImageLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return uploadImageLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return uploadImageLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (uploadImageLoading != null) {
      return uploadImageLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return uploadImageLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return uploadImageLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (uploadImageLoading != null) {
      return uploadImageLoading(this);
    }
    return orElse();
  }
}

abstract class _UploadImageLoading implements BankAccountState {
  const factory _UploadImageLoading() = _$UploadImageLoadingImpl;
}

/// @nodoc
abstract class _$$DeleteBankAccountSuccessImplCopyWith<$Res> {
  factory _$$DeleteBankAccountSuccessImplCopyWith(
          _$DeleteBankAccountSuccessImpl value,
          $Res Function(_$DeleteBankAccountSuccessImpl) then) =
      __$$DeleteBankAccountSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteBankAccountSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$DeleteBankAccountSuccessImpl>
    implements _$$DeleteBankAccountSuccessImplCopyWith<$Res> {
  __$$DeleteBankAccountSuccessImplCopyWithImpl(
      _$DeleteBankAccountSuccessImpl _value,
      $Res Function(_$DeleteBankAccountSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteBankAccountSuccessImpl implements _DeleteBankAccountSuccess {
  const _$DeleteBankAccountSuccessImpl();

  @override
  String toString() {
    return 'BankAccountState.deleteBankAccountSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBankAccountSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return deleteBankAccountSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return deleteBankAccountSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (deleteBankAccountSuccess != null) {
      return deleteBankAccountSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return deleteBankAccountSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return deleteBankAccountSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (deleteBankAccountSuccess != null) {
      return deleteBankAccountSuccess(this);
    }
    return orElse();
  }
}

abstract class _DeleteBankAccountSuccess implements BankAccountState {
  const factory _DeleteBankAccountSuccess() = _$DeleteBankAccountSuccessImpl;
}

/// @nodoc
abstract class _$$DeleteBankAccountLoadingImplCopyWith<$Res> {
  factory _$$DeleteBankAccountLoadingImplCopyWith(
          _$DeleteBankAccountLoadingImpl value,
          $Res Function(_$DeleteBankAccountLoadingImpl) then) =
      __$$DeleteBankAccountLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteBankAccountLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$DeleteBankAccountLoadingImpl>
    implements _$$DeleteBankAccountLoadingImplCopyWith<$Res> {
  __$$DeleteBankAccountLoadingImplCopyWithImpl(
      _$DeleteBankAccountLoadingImpl _value,
      $Res Function(_$DeleteBankAccountLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteBankAccountLoadingImpl implements _DeleteBankAccountLoading {
  const _$DeleteBankAccountLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.deleteBankAccountLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBankAccountLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return deleteBankAccountLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return deleteBankAccountLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (deleteBankAccountLoading != null) {
      return deleteBankAccountLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return deleteBankAccountLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return deleteBankAccountLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (deleteBankAccountLoading != null) {
      return deleteBankAccountLoading(this);
    }
    return orElse();
  }
}

abstract class _DeleteBankAccountLoading implements BankAccountState {
  const factory _DeleteBankAccountLoading() = _$DeleteBankAccountLoadingImpl;
}

/// @nodoc
abstract class _$$GetVndWalletInfoLoadingImplCopyWith<$Res> {
  factory _$$GetVndWalletInfoLoadingImplCopyWith(
          _$GetVndWalletInfoLoadingImpl value,
          $Res Function(_$GetVndWalletInfoLoadingImpl) then) =
      __$$GetVndWalletInfoLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetVndWalletInfoLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$GetVndWalletInfoLoadingImpl>
    implements _$$GetVndWalletInfoLoadingImplCopyWith<$Res> {
  __$$GetVndWalletInfoLoadingImplCopyWithImpl(
      _$GetVndWalletInfoLoadingImpl _value,
      $Res Function(_$GetVndWalletInfoLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetVndWalletInfoLoadingImpl implements _GetVndWalletInfoLoading {
  const _$GetVndWalletInfoLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.getVndWalletInfoLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetVndWalletInfoLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return getVndWalletInfoLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return getVndWalletInfoLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getVndWalletInfoLoading != null) {
      return getVndWalletInfoLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return getVndWalletInfoLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return getVndWalletInfoLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getVndWalletInfoLoading != null) {
      return getVndWalletInfoLoading(this);
    }
    return orElse();
  }
}

abstract class _GetVndWalletInfoLoading implements BankAccountState {
  const factory _GetVndWalletInfoLoading() = _$GetVndWalletInfoLoadingImpl;
}

/// @nodoc
abstract class _$$GetVndWalletInfoSuccessImplCopyWith<$Res> {
  factory _$$GetVndWalletInfoSuccessImplCopyWith(
          _$GetVndWalletInfoSuccessImpl value,
          $Res Function(_$GetVndWalletInfoSuccessImpl) then) =
      __$$GetVndWalletInfoSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VndWalletInfo vndWalletInfo});

  $VndWalletInfoCopyWith<$Res> get vndWalletInfo;
}

/// @nodoc
class __$$GetVndWalletInfoSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$GetVndWalletInfoSuccessImpl>
    implements _$$GetVndWalletInfoSuccessImplCopyWith<$Res> {
  __$$GetVndWalletInfoSuccessImplCopyWithImpl(
      _$GetVndWalletInfoSuccessImpl _value,
      $Res Function(_$GetVndWalletInfoSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vndWalletInfo = null,
  }) {
    return _then(_$GetVndWalletInfoSuccessImpl(
      null == vndWalletInfo
          ? _value.vndWalletInfo
          : vndWalletInfo // ignore: cast_nullable_to_non_nullable
              as VndWalletInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $VndWalletInfoCopyWith<$Res> get vndWalletInfo {
    return $VndWalletInfoCopyWith<$Res>(_value.vndWalletInfo, (value) {
      return _then(_value.copyWith(vndWalletInfo: value));
    });
  }
}

/// @nodoc

class _$GetVndWalletInfoSuccessImpl implements _GetVndWalletInfoSuccess {
  const _$GetVndWalletInfoSuccessImpl(this.vndWalletInfo);

  @override
  final VndWalletInfo vndWalletInfo;

  @override
  String toString() {
    return 'BankAccountState.getVndWalletInfoSuccess(vndWalletInfo: $vndWalletInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetVndWalletInfoSuccessImpl &&
            (identical(other.vndWalletInfo, vndWalletInfo) ||
                other.vndWalletInfo == vndWalletInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vndWalletInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetVndWalletInfoSuccessImplCopyWith<_$GetVndWalletInfoSuccessImpl>
      get copyWith => __$$GetVndWalletInfoSuccessImplCopyWithImpl<
          _$GetVndWalletInfoSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return getVndWalletInfoSuccess(vndWalletInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return getVndWalletInfoSuccess?.call(vndWalletInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getVndWalletInfoSuccess != null) {
      return getVndWalletInfoSuccess(vndWalletInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return getVndWalletInfoSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return getVndWalletInfoSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (getVndWalletInfoSuccess != null) {
      return getVndWalletInfoSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetVndWalletInfoSuccess implements BankAccountState {
  const factory _GetVndWalletInfoSuccess(final VndWalletInfo vndWalletInfo) =
      _$GetVndWalletInfoSuccessImpl;

  VndWalletInfo get vndWalletInfo;
  @JsonKey(ignore: true)
  _$$GetVndWalletInfoSuccessImplCopyWith<_$GetVndWalletInfoSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EstimateTaxSuccessImplCopyWith<$Res> {
  factory _$$EstimateTaxSuccessImplCopyWith(_$EstimateTaxSuccessImpl value,
          $Res Function(_$EstimateTaxSuccessImpl) then) =
      __$$EstimateTaxSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EstimateTaxResponse estimateTax});
}

/// @nodoc
class __$$EstimateTaxSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$EstimateTaxSuccessImpl>
    implements _$$EstimateTaxSuccessImplCopyWith<$Res> {
  __$$EstimateTaxSuccessImplCopyWithImpl(_$EstimateTaxSuccessImpl _value,
      $Res Function(_$EstimateTaxSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estimateTax = null,
  }) {
    return _then(_$EstimateTaxSuccessImpl(
      null == estimateTax
          ? _value.estimateTax
          : estimateTax // ignore: cast_nullable_to_non_nullable
              as EstimateTaxResponse,
    ));
  }
}

/// @nodoc

class _$EstimateTaxSuccessImpl implements _EstimateTaxSuccess {
  const _$EstimateTaxSuccessImpl(this.estimateTax);

  @override
  final EstimateTaxResponse estimateTax;

  @override
  String toString() {
    return 'BankAccountState.estimateTaxSuccess(estimateTax: $estimateTax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstimateTaxSuccessImpl &&
            (identical(other.estimateTax, estimateTax) ||
                other.estimateTax == estimateTax));
  }

  @override
  int get hashCode => Object.hash(runtimeType, estimateTax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EstimateTaxSuccessImplCopyWith<_$EstimateTaxSuccessImpl> get copyWith =>
      __$$EstimateTaxSuccessImplCopyWithImpl<_$EstimateTaxSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return estimateTaxSuccess(estimateTax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return estimateTaxSuccess?.call(estimateTax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (estimateTaxSuccess != null) {
      return estimateTaxSuccess(estimateTax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return estimateTaxSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return estimateTaxSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (estimateTaxSuccess != null) {
      return estimateTaxSuccess(this);
    }
    return orElse();
  }
}

abstract class _EstimateTaxSuccess implements BankAccountState {
  const factory _EstimateTaxSuccess(final EstimateTaxResponse estimateTax) =
      _$EstimateTaxSuccessImpl;

  EstimateTaxResponse get estimateTax;
  @JsonKey(ignore: true)
  _$$EstimateTaxSuccessImplCopyWith<_$EstimateTaxSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestWithdrawOtpLoadingImplCopyWith<$Res> {
  factory _$$RequestWithdrawOtpLoadingImplCopyWith(
          _$RequestWithdrawOtpLoadingImpl value,
          $Res Function(_$RequestWithdrawOtpLoadingImpl) then) =
      __$$RequestWithdrawOtpLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestWithdrawOtpLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res,
        _$RequestWithdrawOtpLoadingImpl>
    implements _$$RequestWithdrawOtpLoadingImplCopyWith<$Res> {
  __$$RequestWithdrawOtpLoadingImplCopyWithImpl(
      _$RequestWithdrawOtpLoadingImpl _value,
      $Res Function(_$RequestWithdrawOtpLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestWithdrawOtpLoadingImpl implements _RequestWithdrawOtpLoading {
  const _$RequestWithdrawOtpLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.requestWithdrawOtpLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestWithdrawOtpLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return requestWithdrawOtpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return requestWithdrawOtpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (requestWithdrawOtpLoading != null) {
      return requestWithdrawOtpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return requestWithdrawOtpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return requestWithdrawOtpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (requestWithdrawOtpLoading != null) {
      return requestWithdrawOtpLoading(this);
    }
    return orElse();
  }
}

abstract class _RequestWithdrawOtpLoading implements BankAccountState {
  const factory _RequestWithdrawOtpLoading() = _$RequestWithdrawOtpLoadingImpl;
}

/// @nodoc
abstract class _$$RequestWithdrawOtpSuccessImplCopyWith<$Res> {
  factory _$$RequestWithdrawOtpSuccessImplCopyWith(
          _$RequestWithdrawOtpSuccessImpl value,
          $Res Function(_$RequestWithdrawOtpSuccessImpl) then) =
      __$$RequestWithdrawOtpSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestWithdrawOtpSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res,
        _$RequestWithdrawOtpSuccessImpl>
    implements _$$RequestWithdrawOtpSuccessImplCopyWith<$Res> {
  __$$RequestWithdrawOtpSuccessImplCopyWithImpl(
      _$RequestWithdrawOtpSuccessImpl _value,
      $Res Function(_$RequestWithdrawOtpSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestWithdrawOtpSuccessImpl implements _RequestWithdrawOtpSuccess {
  const _$RequestWithdrawOtpSuccessImpl();

  @override
  String toString() {
    return 'BankAccountState.requestWithdrawOtpSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestWithdrawOtpSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return requestWithdrawOtpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return requestWithdrawOtpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (requestWithdrawOtpSuccess != null) {
      return requestWithdrawOtpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return requestWithdrawOtpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return requestWithdrawOtpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (requestWithdrawOtpSuccess != null) {
      return requestWithdrawOtpSuccess(this);
    }
    return orElse();
  }
}

abstract class _RequestWithdrawOtpSuccess implements BankAccountState {
  const factory _RequestWithdrawOtpSuccess() = _$RequestWithdrawOtpSuccessImpl;
}

/// @nodoc
abstract class _$$EstimateTaxLoadingImplCopyWith<$Res> {
  factory _$$EstimateTaxLoadingImplCopyWith(_$EstimateTaxLoadingImpl value,
          $Res Function(_$EstimateTaxLoadingImpl) then) =
      __$$EstimateTaxLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EstimateTaxLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$EstimateTaxLoadingImpl>
    implements _$$EstimateTaxLoadingImplCopyWith<$Res> {
  __$$EstimateTaxLoadingImplCopyWithImpl(_$EstimateTaxLoadingImpl _value,
      $Res Function(_$EstimateTaxLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EstimateTaxLoadingImpl implements _EstimateTaxLoading {
  const _$EstimateTaxLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.estimateTaxLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EstimateTaxLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return estimateTaxLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return estimateTaxLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (estimateTaxLoading != null) {
      return estimateTaxLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return estimateTaxLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return estimateTaxLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (estimateTaxLoading != null) {
      return estimateTaxLoading(this);
    }
    return orElse();
  }
}

abstract class _EstimateTaxLoading implements BankAccountState {
  const factory _EstimateTaxLoading() = _$EstimateTaxLoadingImpl;
}

/// @nodoc
abstract class _$$WithdrawLoadingImplCopyWith<$Res> {
  factory _$$WithdrawLoadingImplCopyWith(_$WithdrawLoadingImpl value,
          $Res Function(_$WithdrawLoadingImpl) then) =
      __$$WithdrawLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WithdrawLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$WithdrawLoadingImpl>
    implements _$$WithdrawLoadingImplCopyWith<$Res> {
  __$$WithdrawLoadingImplCopyWithImpl(
      _$WithdrawLoadingImpl _value, $Res Function(_$WithdrawLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WithdrawLoadingImpl implements _WithdrawLoading {
  const _$WithdrawLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.withdrawLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WithdrawLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return withdrawLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return withdrawLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (withdrawLoading != null) {
      return withdrawLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return withdrawLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return withdrawLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (withdrawLoading != null) {
      return withdrawLoading(this);
    }
    return orElse();
  }
}

abstract class _WithdrawLoading implements BankAccountState {
  const factory _WithdrawLoading() = _$WithdrawLoadingImpl;
}

/// @nodoc
abstract class _$$WithdrawLoadedImplCopyWith<$Res> {
  factory _$$WithdrawLoadedImplCopyWith(_$WithdrawLoadedImpl value,
          $Res Function(_$WithdrawLoadedImpl) then) =
      __$$WithdrawLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WithdrawLoadedImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$WithdrawLoadedImpl>
    implements _$$WithdrawLoadedImplCopyWith<$Res> {
  __$$WithdrawLoadedImplCopyWithImpl(
      _$WithdrawLoadedImpl _value, $Res Function(_$WithdrawLoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WithdrawLoadedImpl implements _WithdrawLoaded {
  const _$WithdrawLoadedImpl();

  @override
  String toString() {
    return 'BankAccountState.withdrawLoaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WithdrawLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return withdrawLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return withdrawLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (withdrawLoaded != null) {
      return withdrawLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return withdrawLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return withdrawLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (withdrawLoaded != null) {
      return withdrawLoaded(this);
    }
    return orElse();
  }
}

abstract class _WithdrawLoaded implements BankAccountState {
  const factory _WithdrawLoaded() = _$WithdrawLoadedImpl;
}

/// @nodoc
abstract class _$$SetDefaultBankAccountSuccessImplCopyWith<$Res> {
  factory _$$SetDefaultBankAccountSuccessImplCopyWith(
          _$SetDefaultBankAccountSuccessImpl value,
          $Res Function(_$SetDefaultBankAccountSuccessImpl) then) =
      __$$SetDefaultBankAccountSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetDefaultBankAccountSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res,
        _$SetDefaultBankAccountSuccessImpl>
    implements _$$SetDefaultBankAccountSuccessImplCopyWith<$Res> {
  __$$SetDefaultBankAccountSuccessImplCopyWithImpl(
      _$SetDefaultBankAccountSuccessImpl _value,
      $Res Function(_$SetDefaultBankAccountSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetDefaultBankAccountSuccessImpl
    implements _SetDefaultBankAccountSuccess {
  const _$SetDefaultBankAccountSuccessImpl();

  @override
  String toString() {
    return 'BankAccountState.setDefaultBankAccountSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDefaultBankAccountSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return setDefaultBankAccountSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return setDefaultBankAccountSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (setDefaultBankAccountSuccess != null) {
      return setDefaultBankAccountSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return setDefaultBankAccountSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return setDefaultBankAccountSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (setDefaultBankAccountSuccess != null) {
      return setDefaultBankAccountSuccess(this);
    }
    return orElse();
  }
}

abstract class _SetDefaultBankAccountSuccess implements BankAccountState {
  const factory _SetDefaultBankAccountSuccess() =
      _$SetDefaultBankAccountSuccessImpl;
}

/// @nodoc
abstract class _$$SetDefaultBankAccountLoadingImplCopyWith<$Res> {
  factory _$$SetDefaultBankAccountLoadingImplCopyWith(
          _$SetDefaultBankAccountLoadingImpl value,
          $Res Function(_$SetDefaultBankAccountLoadingImpl) then) =
      __$$SetDefaultBankAccountLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetDefaultBankAccountLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res,
        _$SetDefaultBankAccountLoadingImpl>
    implements _$$SetDefaultBankAccountLoadingImplCopyWith<$Res> {
  __$$SetDefaultBankAccountLoadingImplCopyWithImpl(
      _$SetDefaultBankAccountLoadingImpl _value,
      $Res Function(_$SetDefaultBankAccountLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetDefaultBankAccountLoadingImpl
    implements _SetDefaultBankAccountLoading {
  const _$SetDefaultBankAccountLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.setDefaultBankAccountLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDefaultBankAccountLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return setDefaultBankAccountLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return setDefaultBankAccountLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (setDefaultBankAccountLoading != null) {
      return setDefaultBankAccountLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return setDefaultBankAccountLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return setDefaultBankAccountLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (setDefaultBankAccountLoading != null) {
      return setDefaultBankAccountLoading(this);
    }
    return orElse();
  }
}

abstract class _SetDefaultBankAccountLoading implements BankAccountState {
  const factory _SetDefaultBankAccountLoading() =
      _$SetDefaultBankAccountLoadingImpl;
}

/// @nodoc
abstract class _$$ResendWithdrawOtpLoadingImplCopyWith<$Res> {
  factory _$$ResendWithdrawOtpLoadingImplCopyWith(
          _$ResendWithdrawOtpLoadingImpl value,
          $Res Function(_$ResendWithdrawOtpLoadingImpl) then) =
      __$$ResendWithdrawOtpLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendWithdrawOtpLoadingImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$ResendWithdrawOtpLoadingImpl>
    implements _$$ResendWithdrawOtpLoadingImplCopyWith<$Res> {
  __$$ResendWithdrawOtpLoadingImplCopyWithImpl(
      _$ResendWithdrawOtpLoadingImpl _value,
      $Res Function(_$ResendWithdrawOtpLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResendWithdrawOtpLoadingImpl implements _ResendWithdrawOtpLoading {
  const _$ResendWithdrawOtpLoadingImpl();

  @override
  String toString() {
    return 'BankAccountState.resendWithdrawOtpLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendWithdrawOtpLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return resendWithdrawOtpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return resendWithdrawOtpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (resendWithdrawOtpLoading != null) {
      return resendWithdrawOtpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return resendWithdrawOtpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return resendWithdrawOtpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (resendWithdrawOtpLoading != null) {
      return resendWithdrawOtpLoading(this);
    }
    return orElse();
  }
}

abstract class _ResendWithdrawOtpLoading implements BankAccountState {
  const factory _ResendWithdrawOtpLoading() = _$ResendWithdrawOtpLoadingImpl;
}

/// @nodoc
abstract class _$$ResendWithdrawOtpSuccessImplCopyWith<$Res> {
  factory _$$ResendWithdrawOtpSuccessImplCopyWith(
          _$ResendWithdrawOtpSuccessImpl value,
          $Res Function(_$ResendWithdrawOtpSuccessImpl) then) =
      __$$ResendWithdrawOtpSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendWithdrawOtpSuccessImplCopyWithImpl<$Res>
    extends _$BankAccountStateCopyWithImpl<$Res, _$ResendWithdrawOtpSuccessImpl>
    implements _$$ResendWithdrawOtpSuccessImplCopyWith<$Res> {
  __$$ResendWithdrawOtpSuccessImplCopyWithImpl(
      _$ResendWithdrawOtpSuccessImpl _value,
      $Res Function(_$ResendWithdrawOtpSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResendWithdrawOtpSuccessImpl implements _ResendWithdrawOtpSuccess {
  const _$ResendWithdrawOtpSuccessImpl();

  @override
  String toString() {
    return 'BankAccountState.resendWithdrawOtpSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendWithdrawOtpSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(List<BankAccount> bankAccounts)
        getBankAccountsSuccess,
    required TResult Function() getBankAccountsLoading,
    required TResult Function(String err) getBankAccountsError,
    required TResult Function() getAllBanksInfoSuccess,
    required TResult Function() getAllBanksInfoLoading,
    required TResult Function() getOtpSuccess,
    required TResult Function() getOtpLoading,
    required TResult Function() resendOtpLoading,
    required TResult Function() resendOtpSuccess,
    required TResult Function(BankAccount bankAccount) addBankAccountSuccess,
    required TResult Function() addBankAccountLoading,
    required TResult Function() addBankAccountOtpNotMatch,
    required TResult Function(String imgUrl) uploadImageSuccess,
    required TResult Function() uploadImageLoading,
    required TResult Function() deleteBankAccountSuccess,
    required TResult Function() deleteBankAccountLoading,
    required TResult Function() getVndWalletInfoLoading,
    required TResult Function(VndWalletInfo vndWalletInfo)
        getVndWalletInfoSuccess,
    required TResult Function(EstimateTaxResponse estimateTax)
        estimateTaxSuccess,
    required TResult Function() requestWithdrawOtpLoading,
    required TResult Function() requestWithdrawOtpSuccess,
    required TResult Function() estimateTaxLoading,
    required TResult Function() withdrawLoading,
    required TResult Function() withdrawLoaded,
    required TResult Function() setDefaultBankAccountSuccess,
    required TResult Function() setDefaultBankAccountLoading,
    required TResult Function() resendWithdrawOtpLoading,
    required TResult Function() resendWithdrawOtpSuccess,
  }) {
    return resendWithdrawOtpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult? Function()? getBankAccountsLoading,
    TResult? Function(String err)? getBankAccountsError,
    TResult? Function()? getAllBanksInfoSuccess,
    TResult? Function()? getAllBanksInfoLoading,
    TResult? Function()? getOtpSuccess,
    TResult? Function()? getOtpLoading,
    TResult? Function()? resendOtpLoading,
    TResult? Function()? resendOtpSuccess,
    TResult? Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult? Function()? addBankAccountLoading,
    TResult? Function()? addBankAccountOtpNotMatch,
    TResult? Function(String imgUrl)? uploadImageSuccess,
    TResult? Function()? uploadImageLoading,
    TResult? Function()? deleteBankAccountSuccess,
    TResult? Function()? deleteBankAccountLoading,
    TResult? Function()? getVndWalletInfoLoading,
    TResult? Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult? Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult? Function()? requestWithdrawOtpLoading,
    TResult? Function()? requestWithdrawOtpSuccess,
    TResult? Function()? estimateTaxLoading,
    TResult? Function()? withdrawLoading,
    TResult? Function()? withdrawLoaded,
    TResult? Function()? setDefaultBankAccountSuccess,
    TResult? Function()? setDefaultBankAccountLoading,
    TResult? Function()? resendWithdrawOtpLoading,
    TResult? Function()? resendWithdrawOtpSuccess,
  }) {
    return resendWithdrawOtpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(List<BankAccount> bankAccounts)? getBankAccountsSuccess,
    TResult Function()? getBankAccountsLoading,
    TResult Function(String err)? getBankAccountsError,
    TResult Function()? getAllBanksInfoSuccess,
    TResult Function()? getAllBanksInfoLoading,
    TResult Function()? getOtpSuccess,
    TResult Function()? getOtpLoading,
    TResult Function()? resendOtpLoading,
    TResult Function()? resendOtpSuccess,
    TResult Function(BankAccount bankAccount)? addBankAccountSuccess,
    TResult Function()? addBankAccountLoading,
    TResult Function()? addBankAccountOtpNotMatch,
    TResult Function(String imgUrl)? uploadImageSuccess,
    TResult Function()? uploadImageLoading,
    TResult Function()? deleteBankAccountSuccess,
    TResult Function()? deleteBankAccountLoading,
    TResult Function()? getVndWalletInfoLoading,
    TResult Function(VndWalletInfo vndWalletInfo)? getVndWalletInfoSuccess,
    TResult Function(EstimateTaxResponse estimateTax)? estimateTaxSuccess,
    TResult Function()? requestWithdrawOtpLoading,
    TResult Function()? requestWithdrawOtpSuccess,
    TResult Function()? estimateTaxLoading,
    TResult Function()? withdrawLoading,
    TResult Function()? withdrawLoaded,
    TResult Function()? setDefaultBankAccountSuccess,
    TResult Function()? setDefaultBankAccountLoading,
    TResult Function()? resendWithdrawOtpLoading,
    TResult Function()? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (resendWithdrawOtpSuccess != null) {
      return resendWithdrawOtpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetBankAccountsSuccess value)
        getBankAccountsSuccess,
    required TResult Function(_GetBankAccountsLoading value)
        getBankAccountsLoading,
    required TResult Function(_GetBankAccountsError value) getBankAccountsError,
    required TResult Function(_GetAllBanksInfoSuccess value)
        getAllBanksInfoSuccess,
    required TResult Function(_GetAllBanksInfoLoading value)
        getAllBanksInfoLoading,
    required TResult Function(_GetOtpSuccess value) getOtpSuccess,
    required TResult Function(_GetOtpLoading value) getOtpLoading,
    required TResult Function(_ResendOtpLoading value) resendOtpLoading,
    required TResult Function(_ResendOtpSuccess value) resendOtpSuccess,
    required TResult Function(_AddBankAccountSuccess value)
        addBankAccountSuccess,
    required TResult Function(_AddBankAccountLoading value)
        addBankAccountLoading,
    required TResult Function(_AddBankAccountOtpNotMatch value)
        addBankAccountOtpNotMatch,
    required TResult Function(_UploadImageSuccess value) uploadImageSuccess,
    required TResult Function(_UploadImageLoading value) uploadImageLoading,
    required TResult Function(_DeleteBankAccountSuccess value)
        deleteBankAccountSuccess,
    required TResult Function(_DeleteBankAccountLoading value)
        deleteBankAccountLoading,
    required TResult Function(_GetVndWalletInfoLoading value)
        getVndWalletInfoLoading,
    required TResult Function(_GetVndWalletInfoSuccess value)
        getVndWalletInfoSuccess,
    required TResult Function(_EstimateTaxSuccess value) estimateTaxSuccess,
    required TResult Function(_RequestWithdrawOtpLoading value)
        requestWithdrawOtpLoading,
    required TResult Function(_RequestWithdrawOtpSuccess value)
        requestWithdrawOtpSuccess,
    required TResult Function(_EstimateTaxLoading value) estimateTaxLoading,
    required TResult Function(_WithdrawLoading value) withdrawLoading,
    required TResult Function(_WithdrawLoaded value) withdrawLoaded,
    required TResult Function(_SetDefaultBankAccountSuccess value)
        setDefaultBankAccountSuccess,
    required TResult Function(_SetDefaultBankAccountLoading value)
        setDefaultBankAccountLoading,
    required TResult Function(_ResendWithdrawOtpLoading value)
        resendWithdrawOtpLoading,
    required TResult Function(_ResendWithdrawOtpSuccess value)
        resendWithdrawOtpSuccess,
  }) {
    return resendWithdrawOtpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult? Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult? Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult? Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult? Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult? Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult? Function(_GetOtpLoading value)? getOtpLoading,
    TResult? Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult? Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult? Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult? Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult? Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult? Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult? Function(_UploadImageLoading value)? uploadImageLoading,
    TResult? Function(_DeleteBankAccountSuccess value)?
        deleteBankAccountSuccess,
    TResult? Function(_DeleteBankAccountLoading value)?
        deleteBankAccountLoading,
    TResult? Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult? Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult? Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult? Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult? Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult? Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult? Function(_WithdrawLoading value)? withdrawLoading,
    TResult? Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult? Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult? Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult? Function(_ResendWithdrawOtpLoading value)?
        resendWithdrawOtpLoading,
    TResult? Function(_ResendWithdrawOtpSuccess value)?
        resendWithdrawOtpSuccess,
  }) {
    return resendWithdrawOtpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetBankAccountsSuccess value)? getBankAccountsSuccess,
    TResult Function(_GetBankAccountsLoading value)? getBankAccountsLoading,
    TResult Function(_GetBankAccountsError value)? getBankAccountsError,
    TResult Function(_GetAllBanksInfoSuccess value)? getAllBanksInfoSuccess,
    TResult Function(_GetAllBanksInfoLoading value)? getAllBanksInfoLoading,
    TResult Function(_GetOtpSuccess value)? getOtpSuccess,
    TResult Function(_GetOtpLoading value)? getOtpLoading,
    TResult Function(_ResendOtpLoading value)? resendOtpLoading,
    TResult Function(_ResendOtpSuccess value)? resendOtpSuccess,
    TResult Function(_AddBankAccountSuccess value)? addBankAccountSuccess,
    TResult Function(_AddBankAccountLoading value)? addBankAccountLoading,
    TResult Function(_AddBankAccountOtpNotMatch value)?
        addBankAccountOtpNotMatch,
    TResult Function(_UploadImageSuccess value)? uploadImageSuccess,
    TResult Function(_UploadImageLoading value)? uploadImageLoading,
    TResult Function(_DeleteBankAccountSuccess value)? deleteBankAccountSuccess,
    TResult Function(_DeleteBankAccountLoading value)? deleteBankAccountLoading,
    TResult Function(_GetVndWalletInfoLoading value)? getVndWalletInfoLoading,
    TResult Function(_GetVndWalletInfoSuccess value)? getVndWalletInfoSuccess,
    TResult Function(_EstimateTaxSuccess value)? estimateTaxSuccess,
    TResult Function(_RequestWithdrawOtpLoading value)?
        requestWithdrawOtpLoading,
    TResult Function(_RequestWithdrawOtpSuccess value)?
        requestWithdrawOtpSuccess,
    TResult Function(_EstimateTaxLoading value)? estimateTaxLoading,
    TResult Function(_WithdrawLoading value)? withdrawLoading,
    TResult Function(_WithdrawLoaded value)? withdrawLoaded,
    TResult Function(_SetDefaultBankAccountSuccess value)?
        setDefaultBankAccountSuccess,
    TResult Function(_SetDefaultBankAccountLoading value)?
        setDefaultBankAccountLoading,
    TResult Function(_ResendWithdrawOtpLoading value)? resendWithdrawOtpLoading,
    TResult Function(_ResendWithdrawOtpSuccess value)? resendWithdrawOtpSuccess,
    required TResult orElse(),
  }) {
    if (resendWithdrawOtpSuccess != null) {
      return resendWithdrawOtpSuccess(this);
    }
    return orElse();
  }
}

abstract class _ResendWithdrawOtpSuccess implements BankAccountState {
  const factory _ResendWithdrawOtpSuccess() = _$ResendWithdrawOtpSuccessImpl;
}
