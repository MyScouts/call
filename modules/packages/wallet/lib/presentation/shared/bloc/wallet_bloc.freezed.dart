// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getWalletInfo,
    required TResult Function(WalletType walletType) getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType)? getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType)? getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetWalletInfoEvent value) getWalletInfo,
    required TResult Function(_GetWalletTransactionListEvent value)
        getWalletTransactionList,
    required TResult Function(_GetWalletTransactionDetailEvent value)
        getWalletTransactionDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult? Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult? Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletEventCopyWith<$Res> {
  factory $WalletEventCopyWith(
          WalletEvent value, $Res Function(WalletEvent) then) =
      _$WalletEventCopyWithImpl<$Res, WalletEvent>;
}

/// @nodoc
class _$WalletEventCopyWithImpl<$Res, $Val extends WalletEvent>
    implements $WalletEventCopyWith<$Res> {
  _$WalletEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetWalletInfoEventImplCopyWith<$Res> {
  factory _$$GetWalletInfoEventImplCopyWith(_$GetWalletInfoEventImpl value,
          $Res Function(_$GetWalletInfoEventImpl) then) =
      __$$GetWalletInfoEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetWalletInfoEventImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$GetWalletInfoEventImpl>
    implements _$$GetWalletInfoEventImplCopyWith<$Res> {
  __$$GetWalletInfoEventImplCopyWithImpl(_$GetWalletInfoEventImpl _value,
      $Res Function(_$GetWalletInfoEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetWalletInfoEventImpl
    with DiagnosticableTreeMixin
    implements _GetWalletInfoEvent {
  const _$GetWalletInfoEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletEvent.getWalletInfo()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'WalletEvent.getWalletInfo'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetWalletInfoEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getWalletInfo,
    required TResult Function(WalletType walletType) getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
  }) {
    return getWalletInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType)? getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
  }) {
    return getWalletInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType)? getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    required TResult orElse(),
  }) {
    if (getWalletInfo != null) {
      return getWalletInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetWalletInfoEvent value) getWalletInfo,
    required TResult Function(_GetWalletTransactionListEvent value)
        getWalletTransactionList,
    required TResult Function(_GetWalletTransactionDetailEvent value)
        getWalletTransactionDetail,
  }) {
    return getWalletInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult? Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult? Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
  }) {
    return getWalletInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    required TResult orElse(),
  }) {
    if (getWalletInfo != null) {
      return getWalletInfo(this);
    }
    return orElse();
  }
}

abstract class _GetWalletInfoEvent implements WalletEvent {
  const factory _GetWalletInfoEvent() = _$GetWalletInfoEventImpl;
}

/// @nodoc
abstract class _$$GetWalletTransactionListEventImplCopyWith<$Res> {
  factory _$$GetWalletTransactionListEventImplCopyWith(
          _$GetWalletTransactionListEventImpl value,
          $Res Function(_$GetWalletTransactionListEventImpl) then) =
      __$$GetWalletTransactionListEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({WalletType walletType});
}

/// @nodoc
class __$$GetWalletTransactionListEventImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$GetWalletTransactionListEventImpl>
    implements _$$GetWalletTransactionListEventImplCopyWith<$Res> {
  __$$GetWalletTransactionListEventImplCopyWithImpl(
      _$GetWalletTransactionListEventImpl _value,
      $Res Function(_$GetWalletTransactionListEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletType = null,
  }) {
    return _then(_$GetWalletTransactionListEventImpl(
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as WalletType,
    ));
  }
}

/// @nodoc

class _$GetWalletTransactionListEventImpl
    with DiagnosticableTreeMixin
    implements _GetWalletTransactionListEvent {
  const _$GetWalletTransactionListEventImpl({required this.walletType});

  @override
  final WalletType walletType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletEvent.getWalletTransactionList(walletType: $walletType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletEvent.getWalletTransactionList'))
      ..add(DiagnosticsProperty('walletType', walletType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletTransactionListEventImpl &&
            (identical(other.walletType, walletType) ||
                other.walletType == walletType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, walletType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWalletTransactionListEventImplCopyWith<
          _$GetWalletTransactionListEventImpl>
      get copyWith => __$$GetWalletTransactionListEventImplCopyWithImpl<
          _$GetWalletTransactionListEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getWalletInfo,
    required TResult Function(WalletType walletType) getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
  }) {
    return getWalletTransactionList(walletType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType)? getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
  }) {
    return getWalletTransactionList?.call(walletType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType)? getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    required TResult orElse(),
  }) {
    if (getWalletTransactionList != null) {
      return getWalletTransactionList(walletType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetWalletInfoEvent value) getWalletInfo,
    required TResult Function(_GetWalletTransactionListEvent value)
        getWalletTransactionList,
    required TResult Function(_GetWalletTransactionDetailEvent value)
        getWalletTransactionDetail,
  }) {
    return getWalletTransactionList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult? Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult? Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
  }) {
    return getWalletTransactionList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    required TResult orElse(),
  }) {
    if (getWalletTransactionList != null) {
      return getWalletTransactionList(this);
    }
    return orElse();
  }
}

abstract class _GetWalletTransactionListEvent implements WalletEvent {
  const factory _GetWalletTransactionListEvent(
          {required final WalletType walletType}) =
      _$GetWalletTransactionListEventImpl;

  WalletType get walletType;
  @JsonKey(ignore: true)
  _$$GetWalletTransactionListEventImplCopyWith<
          _$GetWalletTransactionListEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetWalletTransactionDetailEventImplCopyWith<$Res> {
  factory _$$GetWalletTransactionDetailEventImplCopyWith(
          _$GetWalletTransactionDetailEventImpl value,
          $Res Function(_$GetWalletTransactionDetailEventImpl) then) =
      __$$GetWalletTransactionDetailEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$GetWalletTransactionDetailEventImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res,
        _$GetWalletTransactionDetailEventImpl>
    implements _$$GetWalletTransactionDetailEventImplCopyWith<$Res> {
  __$$GetWalletTransactionDetailEventImplCopyWithImpl(
      _$GetWalletTransactionDetailEventImpl _value,
      $Res Function(_$GetWalletTransactionDetailEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetWalletTransactionDetailEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetWalletTransactionDetailEventImpl
    with DiagnosticableTreeMixin
    implements _GetWalletTransactionDetailEvent {
  const _$GetWalletTransactionDetailEventImpl({required this.id});

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletEvent.getWalletTransactionDetail(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'WalletEvent.getWalletTransactionDetail'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletTransactionDetailEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWalletTransactionDetailEventImplCopyWith<
          _$GetWalletTransactionDetailEventImpl>
      get copyWith => __$$GetWalletTransactionDetailEventImplCopyWithImpl<
          _$GetWalletTransactionDetailEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getWalletInfo,
    required TResult Function(WalletType walletType) getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
  }) {
    return getWalletTransactionDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType)? getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
  }) {
    return getWalletTransactionDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType)? getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    required TResult orElse(),
  }) {
    if (getWalletTransactionDetail != null) {
      return getWalletTransactionDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetWalletInfoEvent value) getWalletInfo,
    required TResult Function(_GetWalletTransactionListEvent value)
        getWalletTransactionList,
    required TResult Function(_GetWalletTransactionDetailEvent value)
        getWalletTransactionDetail,
  }) {
    return getWalletTransactionDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult? Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult? Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
  }) {
    return getWalletTransactionDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    required TResult orElse(),
  }) {
    if (getWalletTransactionDetail != null) {
      return getWalletTransactionDetail(this);
    }
    return orElse();
  }
}

abstract class _GetWalletTransactionDetailEvent implements WalletEvent {
  const factory _GetWalletTransactionDetailEvent({required final String id}) =
      _$GetWalletTransactionDetailEventImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$GetWalletTransactionDetailEventImplCopyWith<
          _$GetWalletTransactionDetailEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WalletState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletStateCopyWith<$Res> {
  factory $WalletStateCopyWith(
          WalletState value, $Res Function(WalletState) then) =
      _$WalletStateCopyWithImpl<$Res, WalletState>;
}

/// @nodoc
class _$WalletStateCopyWithImpl<$Res, $Val extends WalletState>
    implements $WalletStateCopyWith<$Res> {
  _$WalletStateCopyWithImpl(this._value, this._then);

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
    extends _$WalletStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'WalletState.initial'));
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
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
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
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WalletState {
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
    extends _$WalletStateCopyWithImpl<$Res, _$ErrorImpl>
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

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.err);

  @override
  final String err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.error(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletState.error'))
      ..add(DiagnosticsProperty('err', err));
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
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
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
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements WalletState {
  const factory _Error(final String err) = _$ErrorImpl;

  String get err;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetWalletInfoSuccessImplCopyWith<$Res> {
  factory _$$GetWalletInfoSuccessImplCopyWith(_$GetWalletInfoSuccessImpl value,
          $Res Function(_$GetWalletInfoSuccessImpl) then) =
      __$$GetWalletInfoSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserWallet? wallet});
}

/// @nodoc
class __$$GetWalletInfoSuccessImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$GetWalletInfoSuccessImpl>
    implements _$$GetWalletInfoSuccessImplCopyWith<$Res> {
  __$$GetWalletInfoSuccessImplCopyWithImpl(_$GetWalletInfoSuccessImpl _value,
      $Res Function(_$GetWalletInfoSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = freezed,
  }) {
    return _then(_$GetWalletInfoSuccessImpl(
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as UserWallet?,
    ));
  }
}

/// @nodoc

class _$GetWalletInfoSuccessImpl
    with DiagnosticableTreeMixin
    implements _GetWalletInfoSuccess {
  const _$GetWalletInfoSuccessImpl({this.wallet});

  @override
  final UserWallet? wallet;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getWalletInfoSuccess(wallet: $wallet)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletState.getWalletInfoSuccess'))
      ..add(DiagnosticsProperty('wallet', wallet));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletInfoSuccessImpl &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWalletInfoSuccessImplCopyWith<_$GetWalletInfoSuccessImpl>
      get copyWith =>
          __$$GetWalletInfoSuccessImplCopyWithImpl<_$GetWalletInfoSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) {
    return getWalletInfoSuccess(wallet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) {
    return getWalletInfoSuccess?.call(wallet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletInfoSuccess != null) {
      return getWalletInfoSuccess(wallet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) {
    return getWalletInfoSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) {
    return getWalletInfoSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletInfoSuccess != null) {
      return getWalletInfoSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetWalletInfoSuccess implements WalletState {
  const factory _GetWalletInfoSuccess({final UserWallet? wallet}) =
      _$GetWalletInfoSuccessImpl;

  UserWallet? get wallet;
  @JsonKey(ignore: true)
  _$$GetWalletInfoSuccessImplCopyWith<_$GetWalletInfoSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetWalletInfoLoadingImplCopyWith<$Res> {
  factory _$$GetWalletInfoLoadingImplCopyWith(_$GetWalletInfoLoadingImpl value,
          $Res Function(_$GetWalletInfoLoadingImpl) then) =
      __$$GetWalletInfoLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetWalletInfoLoadingImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$GetWalletInfoLoadingImpl>
    implements _$$GetWalletInfoLoadingImplCopyWith<$Res> {
  __$$GetWalletInfoLoadingImplCopyWithImpl(_$GetWalletInfoLoadingImpl _value,
      $Res Function(_$GetWalletInfoLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetWalletInfoLoadingImpl
    with DiagnosticableTreeMixin
    implements _GetWalletInfoLoading {
  const _$GetWalletInfoLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getWalletInfoLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'WalletState.getWalletInfoLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletInfoLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) {
    return getWalletInfoLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) {
    return getWalletInfoLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletInfoLoading != null) {
      return getWalletInfoLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) {
    return getWalletInfoLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) {
    return getWalletInfoLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletInfoLoading != null) {
      return getWalletInfoLoading(this);
    }
    return orElse();
  }
}

abstract class _GetWalletInfoLoading implements WalletState {
  const factory _GetWalletInfoLoading() = _$GetWalletInfoLoadingImpl;
}

/// @nodoc
abstract class _$$GetWalletTransactionListFailedImplCopyWith<$Res> {
  factory _$$GetWalletTransactionListFailedImplCopyWith(
          _$GetWalletTransactionListFailedImpl value,
          $Res Function(_$GetWalletTransactionListFailedImpl) then) =
      __$$GetWalletTransactionListFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$GetWalletTransactionListFailedImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res,
        _$GetWalletTransactionListFailedImpl>
    implements _$$GetWalletTransactionListFailedImplCopyWith<$Res> {
  __$$GetWalletTransactionListFailedImplCopyWithImpl(
      _$GetWalletTransactionListFailedImpl _value,
      $Res Function(_$GetWalletTransactionListFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$GetWalletTransactionListFailedImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetWalletTransactionListFailedImpl
    with DiagnosticableTreeMixin
    implements _GetWalletTransactionListFailed {
  const _$GetWalletTransactionListFailedImpl(this.err);

  @override
  final String err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getWalletTransactionListFailed(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'WalletState.getWalletTransactionListFailed'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletTransactionListFailedImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWalletTransactionListFailedImplCopyWith<
          _$GetWalletTransactionListFailedImpl>
      get copyWith => __$$GetWalletTransactionListFailedImplCopyWithImpl<
          _$GetWalletTransactionListFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListFailed(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListFailed?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionListFailed != null) {
      return getWalletTransactionListFailed(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionListFailed != null) {
      return getWalletTransactionListFailed(this);
    }
    return orElse();
  }
}

abstract class _GetWalletTransactionListFailed implements WalletState {
  const factory _GetWalletTransactionListFailed(final String err) =
      _$GetWalletTransactionListFailedImpl;

  String get err;
  @JsonKey(ignore: true)
  _$$GetWalletTransactionListFailedImplCopyWith<
          _$GetWalletTransactionListFailedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetWalletTransactionListSuccessImplCopyWith<$Res> {
  factory _$$GetWalletTransactionListSuccessImplCopyWith(
          _$GetWalletTransactionListSuccessImpl value,
          $Res Function(_$GetWalletTransactionListSuccessImpl) then) =
      __$$GetWalletTransactionListSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionItem> transactions});
}

/// @nodoc
class __$$GetWalletTransactionListSuccessImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res,
        _$GetWalletTransactionListSuccessImpl>
    implements _$$GetWalletTransactionListSuccessImplCopyWith<$Res> {
  __$$GetWalletTransactionListSuccessImplCopyWithImpl(
      _$GetWalletTransactionListSuccessImpl _value,
      $Res Function(_$GetWalletTransactionListSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$GetWalletTransactionListSuccessImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
    ));
  }
}

/// @nodoc

class _$GetWalletTransactionListSuccessImpl
    with DiagnosticableTreeMixin
    implements _GetWalletTransactionListSuccess {
  const _$GetWalletTransactionListSuccessImpl(
      {required final List<TransactionItem> transactions})
      : _transactions = transactions;

  final List<TransactionItem> _transactions;
  @override
  List<TransactionItem> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getWalletTransactionListSuccess(transactions: $transactions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'WalletState.getWalletTransactionListSuccess'))
      ..add(DiagnosticsProperty('transactions', transactions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletTransactionListSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWalletTransactionListSuccessImplCopyWith<
          _$GetWalletTransactionListSuccessImpl>
      get copyWith => __$$GetWalletTransactionListSuccessImplCopyWithImpl<
          _$GetWalletTransactionListSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListSuccess(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListSuccess?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionListSuccess != null) {
      return getWalletTransactionListSuccess(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionListSuccess != null) {
      return getWalletTransactionListSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetWalletTransactionListSuccess implements WalletState {
  const factory _GetWalletTransactionListSuccess(
          {required final List<TransactionItem> transactions}) =
      _$GetWalletTransactionListSuccessImpl;

  List<TransactionItem> get transactions;
  @JsonKey(ignore: true)
  _$$GetWalletTransactionListSuccessImplCopyWith<
          _$GetWalletTransactionListSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetWalletTransactionListLoadingImplCopyWith<$Res> {
  factory _$$GetWalletTransactionListLoadingImplCopyWith(
          _$GetWalletTransactionListLoadingImpl value,
          $Res Function(_$GetWalletTransactionListLoadingImpl) then) =
      __$$GetWalletTransactionListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetWalletTransactionListLoadingImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res,
        _$GetWalletTransactionListLoadingImpl>
    implements _$$GetWalletTransactionListLoadingImplCopyWith<$Res> {
  __$$GetWalletTransactionListLoadingImplCopyWithImpl(
      _$GetWalletTransactionListLoadingImpl _value,
      $Res Function(_$GetWalletTransactionListLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetWalletTransactionListLoadingImpl
    with DiagnosticableTreeMixin
    implements _GetWalletTransactionListLoading {
  const _$GetWalletTransactionListLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getWalletTransactionListLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty(
        'type', 'WalletState.getWalletTransactionListLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletTransactionListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionListLoading != null) {
      return getWalletTransactionListLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionListLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionListLoading != null) {
      return getWalletTransactionListLoading(this);
    }
    return orElse();
  }
}

abstract class _GetWalletTransactionListLoading implements WalletState {
  const factory _GetWalletTransactionListLoading() =
      _$GetWalletTransactionListLoadingImpl;
}

/// @nodoc
abstract class _$$GetWalletTransactionDetailSuccessImplCopyWith<$Res> {
  factory _$$GetWalletTransactionDetailSuccessImplCopyWith(
          _$GetWalletTransactionDetailSuccessImpl value,
          $Res Function(_$GetWalletTransactionDetailSuccessImpl) then) =
      __$$GetWalletTransactionDetailSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionItem transactions});
}

/// @nodoc
class __$$GetWalletTransactionDetailSuccessImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res,
        _$GetWalletTransactionDetailSuccessImpl>
    implements _$$GetWalletTransactionDetailSuccessImplCopyWith<$Res> {
  __$$GetWalletTransactionDetailSuccessImplCopyWithImpl(
      _$GetWalletTransactionDetailSuccessImpl _value,
      $Res Function(_$GetWalletTransactionDetailSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$GetWalletTransactionDetailSuccessImpl(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as TransactionItem,
    ));
  }
}

/// @nodoc

class _$GetWalletTransactionDetailSuccessImpl
    with DiagnosticableTreeMixin
    implements _GetWalletTransactionDetailSuccess {
  const _$GetWalletTransactionDetailSuccessImpl({required this.transactions});

  @override
  final TransactionItem transactions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getWalletTransactionDetailSuccess(transactions: $transactions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'WalletState.getWalletTransactionDetailSuccess'))
      ..add(DiagnosticsProperty('transactions', transactions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletTransactionDetailSuccessImpl &&
            (identical(other.transactions, transactions) ||
                other.transactions == transactions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWalletTransactionDetailSuccessImplCopyWith<
          _$GetWalletTransactionDetailSuccessImpl>
      get copyWith => __$$GetWalletTransactionDetailSuccessImplCopyWithImpl<
          _$GetWalletTransactionDetailSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailSuccess(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailSuccess?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionDetailSuccess != null) {
      return getWalletTransactionDetailSuccess(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionDetailSuccess != null) {
      return getWalletTransactionDetailSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetWalletTransactionDetailSuccess implements WalletState {
  const factory _GetWalletTransactionDetailSuccess(
          {required final TransactionItem transactions}) =
      _$GetWalletTransactionDetailSuccessImpl;

  TransactionItem get transactions;
  @JsonKey(ignore: true)
  _$$GetWalletTransactionDetailSuccessImplCopyWith<
          _$GetWalletTransactionDetailSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetWalletTransactionDetailLoadingImplCopyWith<$Res> {
  factory _$$GetWalletTransactionDetailLoadingImplCopyWith(
          _$GetWalletTransactionDetailLoadingImpl value,
          $Res Function(_$GetWalletTransactionDetailLoadingImpl) then) =
      __$$GetWalletTransactionDetailLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetWalletTransactionDetailLoadingImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res,
        _$GetWalletTransactionDetailLoadingImpl>
    implements _$$GetWalletTransactionDetailLoadingImplCopyWith<$Res> {
  __$$GetWalletTransactionDetailLoadingImplCopyWithImpl(
      _$GetWalletTransactionDetailLoadingImpl _value,
      $Res Function(_$GetWalletTransactionDetailLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetWalletTransactionDetailLoadingImpl
    with DiagnosticableTreeMixin
    implements _GetWalletTransactionDetailLoading {
  const _$GetWalletTransactionDetailLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getWalletTransactionDetailLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty(
        'type', 'WalletState.getWalletTransactionDetailLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletTransactionDetailLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionDetailLoading != null) {
      return getWalletTransactionDetailLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionDetailLoading != null) {
      return getWalletTransactionDetailLoading(this);
    }
    return orElse();
  }
}

abstract class _GetWalletTransactionDetailLoading implements WalletState {
  const factory _GetWalletTransactionDetailLoading() =
      _$GetWalletTransactionDetailLoadingImpl;
}

/// @nodoc
abstract class _$$GetWalletTransactionDetailFailedImplCopyWith<$Res> {
  factory _$$GetWalletTransactionDetailFailedImplCopyWith(
          _$GetWalletTransactionDetailFailedImpl value,
          $Res Function(_$GetWalletTransactionDetailFailedImpl) then) =
      __$$GetWalletTransactionDetailFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$GetWalletTransactionDetailFailedImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res,
        _$GetWalletTransactionDetailFailedImpl>
    implements _$$GetWalletTransactionDetailFailedImplCopyWith<$Res> {
  __$$GetWalletTransactionDetailFailedImplCopyWithImpl(
      _$GetWalletTransactionDetailFailedImpl _value,
      $Res Function(_$GetWalletTransactionDetailFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$GetWalletTransactionDetailFailedImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetWalletTransactionDetailFailedImpl
    with DiagnosticableTreeMixin
    implements _GetWalletTransactionDetailFailed {
  const _$GetWalletTransactionDetailFailedImpl(this.err);

  @override
  final String err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getWalletTransactionDetailFailed(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'WalletState.getWalletTransactionDetailFailed'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletTransactionDetailFailedImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWalletTransactionDetailFailedImplCopyWith<
          _$GetWalletTransactionDetailFailedImpl>
      get copyWith => __$$GetWalletTransactionDetailFailedImplCopyWithImpl<
          _$GetWalletTransactionDetailFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(UserWallet? wallet) getWalletInfoSuccess,
    required TResult Function() getWalletInfoLoading,
    required TResult Function(String err) getWalletTransactionListFailed,
    required TResult Function(List<TransactionItem> transactions)
        getWalletTransactionListSuccess,
    required TResult Function() getWalletTransactionListLoading,
    required TResult Function(TransactionItem transactions)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailFailed(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult? Function()? getWalletInfoLoading,
    TResult? Function(String err)? getWalletTransactionListFailed,
    TResult? Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult? Function()? getWalletTransactionListLoading,
    TResult? Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailFailed?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(UserWallet? wallet)? getWalletInfoSuccess,
    TResult Function()? getWalletInfoLoading,
    TResult Function(String err)? getWalletTransactionListFailed,
    TResult Function(List<TransactionItem> transactions)?
        getWalletTransactionListSuccess,
    TResult Function()? getWalletTransactionListLoading,
    TResult Function(TransactionItem transactions)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionDetailFailed != null) {
      return getWalletTransactionDetailFailed(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetWalletInfoSuccess value) getWalletInfoSuccess,
    required TResult Function(_GetWalletInfoLoading value) getWalletInfoLoading,
    required TResult Function(_GetWalletTransactionListFailed value)
        getWalletTransactionListFailed,
    required TResult Function(_GetWalletTransactionListSuccess value)
        getWalletTransactionListSuccess,
    required TResult Function(_GetWalletTransactionListLoading value)
        getWalletTransactionListLoading,
    required TResult Function(_GetWalletTransactionDetailSuccess value)
        getWalletTransactionDetailSuccess,
    required TResult Function(_GetWalletTransactionDetailLoading value)
        getWalletTransactionDetailLoading,
    required TResult Function(_GetWalletTransactionDetailFailed value)
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult? Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult? Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult? Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult? Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult? Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult? Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult? Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
  }) {
    return getWalletTransactionDetailFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetWalletInfoSuccess value)? getWalletInfoSuccess,
    TResult Function(_GetWalletInfoLoading value)? getWalletInfoLoading,
    TResult Function(_GetWalletTransactionListFailed value)?
        getWalletTransactionListFailed,
    TResult Function(_GetWalletTransactionListSuccess value)?
        getWalletTransactionListSuccess,
    TResult Function(_GetWalletTransactionListLoading value)?
        getWalletTransactionListLoading,
    TResult Function(_GetWalletTransactionDetailSuccess value)?
        getWalletTransactionDetailSuccess,
    TResult Function(_GetWalletTransactionDetailLoading value)?
        getWalletTransactionDetailLoading,
    TResult Function(_GetWalletTransactionDetailFailed value)?
        getWalletTransactionDetailFailed,
    required TResult orElse(),
  }) {
    if (getWalletTransactionDetailFailed != null) {
      return getWalletTransactionDetailFailed(this);
    }
    return orElse();
  }
}

abstract class _GetWalletTransactionDetailFailed implements WalletState {
  const factory _GetWalletTransactionDetailFailed(final String err) =
      _$GetWalletTransactionDetailFailedImpl;

  String get err;
  @JsonKey(ignore: true)
  _$$GetWalletTransactionDetailFailedImplCopyWith<
          _$GetWalletTransactionDetailFailedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
