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
    required TResult Function(
            WalletType walletType, WalletTransactionsRequest request)
        getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
    required TResult Function(FilterOption filter) filterTransaction,
    required TResult Function() getPDoneProfile,
    required TResult Function() getOnboarding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
    TResult? Function(FilterOption filter)? filterTransaction,
    TResult? Function()? getPDoneProfile,
    TResult? Function()? getOnboarding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    TResult Function(FilterOption filter)? filterTransaction,
    TResult Function()? getPDoneProfile,
    TResult Function()? getOnboarding,
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
    required TResult Function(_FilterTransactionEvent value) filterTransaction,
    required TResult Function(_GetPDoneProfileEvent value) getPDoneProfile,
    required TResult Function(_GetOnboardingEvent value) getOnboarding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult? Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult? Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    TResult? Function(_FilterTransactionEvent value)? filterTransaction,
    TResult? Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult? Function(_GetOnboardingEvent value)? getOnboarding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    TResult Function(_FilterTransactionEvent value)? filterTransaction,
    TResult Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult Function(_GetOnboardingEvent value)? getOnboarding,
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
    required TResult Function(
            WalletType walletType, WalletTransactionsRequest request)
        getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
    required TResult Function(FilterOption filter) filterTransaction,
    required TResult Function() getPDoneProfile,
    required TResult Function() getOnboarding,
  }) {
    return getWalletInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
    TResult? Function(FilterOption filter)? filterTransaction,
    TResult? Function()? getPDoneProfile,
    TResult? Function()? getOnboarding,
  }) {
    return getWalletInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    TResult Function(FilterOption filter)? filterTransaction,
    TResult Function()? getPDoneProfile,
    TResult Function()? getOnboarding,
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
    required TResult Function(_FilterTransactionEvent value) filterTransaction,
    required TResult Function(_GetPDoneProfileEvent value) getPDoneProfile,
    required TResult Function(_GetOnboardingEvent value) getOnboarding,
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
    TResult? Function(_FilterTransactionEvent value)? filterTransaction,
    TResult? Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult? Function(_GetOnboardingEvent value)? getOnboarding,
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
    TResult Function(_FilterTransactionEvent value)? filterTransaction,
    TResult Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult Function(_GetOnboardingEvent value)? getOnboarding,
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
  $Res call({WalletType walletType, WalletTransactionsRequest request});
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
    Object? request = null,
  }) {
    return _then(_$GetWalletTransactionListEventImpl(
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as WalletType,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as WalletTransactionsRequest,
    ));
  }
}

/// @nodoc

class _$GetWalletTransactionListEventImpl
    with DiagnosticableTreeMixin
    implements _GetWalletTransactionListEvent {
  const _$GetWalletTransactionListEventImpl(
      {required this.walletType, required this.request});

  @override
  final WalletType walletType;
  @override
  final WalletTransactionsRequest request;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletEvent.getWalletTransactionList(walletType: $walletType, request: $request)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletEvent.getWalletTransactionList'))
      ..add(DiagnosticsProperty('walletType', walletType))
      ..add(DiagnosticsProperty('request', request));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletTransactionListEventImpl &&
            (identical(other.walletType, walletType) ||
                other.walletType == walletType) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, walletType, request);

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
    required TResult Function(
            WalletType walletType, WalletTransactionsRequest request)
        getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
    required TResult Function(FilterOption filter) filterTransaction,
    required TResult Function() getPDoneProfile,
    required TResult Function() getOnboarding,
  }) {
    return getWalletTransactionList(walletType, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
    TResult? Function(FilterOption filter)? filterTransaction,
    TResult? Function()? getPDoneProfile,
    TResult? Function()? getOnboarding,
  }) {
    return getWalletTransactionList?.call(walletType, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    TResult Function(FilterOption filter)? filterTransaction,
    TResult Function()? getPDoneProfile,
    TResult Function()? getOnboarding,
    required TResult orElse(),
  }) {
    if (getWalletTransactionList != null) {
      return getWalletTransactionList(walletType, request);
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
    required TResult Function(_FilterTransactionEvent value) filterTransaction,
    required TResult Function(_GetPDoneProfileEvent value) getPDoneProfile,
    required TResult Function(_GetOnboardingEvent value) getOnboarding,
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
    TResult? Function(_FilterTransactionEvent value)? filterTransaction,
    TResult? Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult? Function(_GetOnboardingEvent value)? getOnboarding,
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
    TResult Function(_FilterTransactionEvent value)? filterTransaction,
    TResult Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult Function(_GetOnboardingEvent value)? getOnboarding,
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
          {required final WalletType walletType,
          required final WalletTransactionsRequest request}) =
      _$GetWalletTransactionListEventImpl;

  WalletType get walletType;
  WalletTransactionsRequest get request;
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
    required TResult Function(
            WalletType walletType, WalletTransactionsRequest request)
        getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
    required TResult Function(FilterOption filter) filterTransaction,
    required TResult Function() getPDoneProfile,
    required TResult Function() getOnboarding,
  }) {
    return getWalletTransactionDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
    TResult? Function(FilterOption filter)? filterTransaction,
    TResult? Function()? getPDoneProfile,
    TResult? Function()? getOnboarding,
  }) {
    return getWalletTransactionDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    TResult Function(FilterOption filter)? filterTransaction,
    TResult Function()? getPDoneProfile,
    TResult Function()? getOnboarding,
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
    required TResult Function(_FilterTransactionEvent value) filterTransaction,
    required TResult Function(_GetPDoneProfileEvent value) getPDoneProfile,
    required TResult Function(_GetOnboardingEvent value) getOnboarding,
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
    TResult? Function(_FilterTransactionEvent value)? filterTransaction,
    TResult? Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult? Function(_GetOnboardingEvent value)? getOnboarding,
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
    TResult Function(_FilterTransactionEvent value)? filterTransaction,
    TResult Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult Function(_GetOnboardingEvent value)? getOnboarding,
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
abstract class _$$FilterTransactionEventImplCopyWith<$Res> {
  factory _$$FilterTransactionEventImplCopyWith(
          _$FilterTransactionEventImpl value,
          $Res Function(_$FilterTransactionEventImpl) then) =
      __$$FilterTransactionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FilterOption filter});
}

/// @nodoc
class __$$FilterTransactionEventImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$FilterTransactionEventImpl>
    implements _$$FilterTransactionEventImplCopyWith<$Res> {
  __$$FilterTransactionEventImplCopyWithImpl(
      _$FilterTransactionEventImpl _value,
      $Res Function(_$FilterTransactionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$FilterTransactionEventImpl(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as FilterOption,
    ));
  }
}

/// @nodoc

class _$FilterTransactionEventImpl
    with DiagnosticableTreeMixin
    implements _FilterTransactionEvent {
  const _$FilterTransactionEventImpl({required this.filter});

  @override
  final FilterOption filter;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletEvent.filterTransaction(filter: $filter)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletEvent.filterTransaction'))
      ..add(DiagnosticsProperty('filter', filter));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterTransactionEventImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterTransactionEventImplCopyWith<_$FilterTransactionEventImpl>
      get copyWith => __$$FilterTransactionEventImplCopyWithImpl<
          _$FilterTransactionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getWalletInfo,
    required TResult Function(
            WalletType walletType, WalletTransactionsRequest request)
        getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
    required TResult Function(FilterOption filter) filterTransaction,
    required TResult Function() getPDoneProfile,
    required TResult Function() getOnboarding,
  }) {
    return filterTransaction(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
    TResult? Function(FilterOption filter)? filterTransaction,
    TResult? Function()? getPDoneProfile,
    TResult? Function()? getOnboarding,
  }) {
    return filterTransaction?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    TResult Function(FilterOption filter)? filterTransaction,
    TResult Function()? getPDoneProfile,
    TResult Function()? getOnboarding,
    required TResult orElse(),
  }) {
    if (filterTransaction != null) {
      return filterTransaction(filter);
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
    required TResult Function(_FilterTransactionEvent value) filterTransaction,
    required TResult Function(_GetPDoneProfileEvent value) getPDoneProfile,
    required TResult Function(_GetOnboardingEvent value) getOnboarding,
  }) {
    return filterTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult? Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult? Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    TResult? Function(_FilterTransactionEvent value)? filterTransaction,
    TResult? Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult? Function(_GetOnboardingEvent value)? getOnboarding,
  }) {
    return filterTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    TResult Function(_FilterTransactionEvent value)? filterTransaction,
    TResult Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult Function(_GetOnboardingEvent value)? getOnboarding,
    required TResult orElse(),
  }) {
    if (filterTransaction != null) {
      return filterTransaction(this);
    }
    return orElse();
  }
}

abstract class _FilterTransactionEvent implements WalletEvent {
  const factory _FilterTransactionEvent({required final FilterOption filter}) =
      _$FilterTransactionEventImpl;

  FilterOption get filter;
  @JsonKey(ignore: true)
  _$$FilterTransactionEventImplCopyWith<_$FilterTransactionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPDoneProfileEventImplCopyWith<$Res> {
  factory _$$GetPDoneProfileEventImplCopyWith(_$GetPDoneProfileEventImpl value,
          $Res Function(_$GetPDoneProfileEventImpl) then) =
      __$$GetPDoneProfileEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPDoneProfileEventImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$GetPDoneProfileEventImpl>
    implements _$$GetPDoneProfileEventImplCopyWith<$Res> {
  __$$GetPDoneProfileEventImplCopyWithImpl(_$GetPDoneProfileEventImpl _value,
      $Res Function(_$GetPDoneProfileEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPDoneProfileEventImpl
    with DiagnosticableTreeMixin
    implements _GetPDoneProfileEvent {
  const _$GetPDoneProfileEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletEvent.getPDoneProfile()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'WalletEvent.getPDoneProfile'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPDoneProfileEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getWalletInfo,
    required TResult Function(
            WalletType walletType, WalletTransactionsRequest request)
        getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
    required TResult Function(FilterOption filter) filterTransaction,
    required TResult Function() getPDoneProfile,
    required TResult Function() getOnboarding,
  }) {
    return getPDoneProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
    TResult? Function(FilterOption filter)? filterTransaction,
    TResult? Function()? getPDoneProfile,
    TResult? Function()? getOnboarding,
  }) {
    return getPDoneProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    TResult Function(FilterOption filter)? filterTransaction,
    TResult Function()? getPDoneProfile,
    TResult Function()? getOnboarding,
    required TResult orElse(),
  }) {
    if (getPDoneProfile != null) {
      return getPDoneProfile();
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
    required TResult Function(_FilterTransactionEvent value) filterTransaction,
    required TResult Function(_GetPDoneProfileEvent value) getPDoneProfile,
    required TResult Function(_GetOnboardingEvent value) getOnboarding,
  }) {
    return getPDoneProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult? Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult? Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    TResult? Function(_FilterTransactionEvent value)? filterTransaction,
    TResult? Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult? Function(_GetOnboardingEvent value)? getOnboarding,
  }) {
    return getPDoneProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    TResult Function(_FilterTransactionEvent value)? filterTransaction,
    TResult Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult Function(_GetOnboardingEvent value)? getOnboarding,
    required TResult orElse(),
  }) {
    if (getPDoneProfile != null) {
      return getPDoneProfile(this);
    }
    return orElse();
  }
}

abstract class _GetPDoneProfileEvent implements WalletEvent {
  const factory _GetPDoneProfileEvent() = _$GetPDoneProfileEventImpl;
}

/// @nodoc
abstract class _$$GetOnboardingEventImplCopyWith<$Res> {
  factory _$$GetOnboardingEventImplCopyWith(_$GetOnboardingEventImpl value,
          $Res Function(_$GetOnboardingEventImpl) then) =
      __$$GetOnboardingEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetOnboardingEventImplCopyWithImpl<$Res>
    extends _$WalletEventCopyWithImpl<$Res, _$GetOnboardingEventImpl>
    implements _$$GetOnboardingEventImplCopyWith<$Res> {
  __$$GetOnboardingEventImplCopyWithImpl(_$GetOnboardingEventImpl _value,
      $Res Function(_$GetOnboardingEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetOnboardingEventImpl
    with DiagnosticableTreeMixin
    implements _GetOnboardingEvent {
  const _$GetOnboardingEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletEvent.getOnboarding()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'WalletEvent.getOnboarding'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetOnboardingEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getWalletInfo,
    required TResult Function(
            WalletType walletType, WalletTransactionsRequest request)
        getWalletTransactionList,
    required TResult Function(String id) getWalletTransactionDetail,
    required TResult Function(FilterOption filter) filterTransaction,
    required TResult Function() getPDoneProfile,
    required TResult Function() getOnboarding,
  }) {
    return getOnboarding();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWalletInfo,
    TResult? Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult? Function(String id)? getWalletTransactionDetail,
    TResult? Function(FilterOption filter)? filterTransaction,
    TResult? Function()? getPDoneProfile,
    TResult? Function()? getOnboarding,
  }) {
    return getOnboarding?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWalletInfo,
    TResult Function(WalletType walletType, WalletTransactionsRequest request)?
        getWalletTransactionList,
    TResult Function(String id)? getWalletTransactionDetail,
    TResult Function(FilterOption filter)? filterTransaction,
    TResult Function()? getPDoneProfile,
    TResult Function()? getOnboarding,
    required TResult orElse(),
  }) {
    if (getOnboarding != null) {
      return getOnboarding();
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
    required TResult Function(_FilterTransactionEvent value) filterTransaction,
    required TResult Function(_GetPDoneProfileEvent value) getPDoneProfile,
    required TResult Function(_GetOnboardingEvent value) getOnboarding,
  }) {
    return getOnboarding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult? Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult? Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    TResult? Function(_FilterTransactionEvent value)? filterTransaction,
    TResult? Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult? Function(_GetOnboardingEvent value)? getOnboarding,
  }) {
    return getOnboarding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWalletInfoEvent value)? getWalletInfo,
    TResult Function(_GetWalletTransactionListEvent value)?
        getWalletTransactionList,
    TResult Function(_GetWalletTransactionDetailEvent value)?
        getWalletTransactionDetail,
    TResult Function(_FilterTransactionEvent value)? filterTransaction,
    TResult Function(_GetPDoneProfileEvent value)? getPDoneProfile,
    TResult Function(_GetOnboardingEvent value)? getOnboarding,
    required TResult orElse(),
  }) {
    if (getOnboarding != null) {
      return getOnboarding(this);
    }
    return orElse();
  }
}

abstract class _GetOnboardingEvent implements WalletEvent {
  const factory _GetOnboardingEvent() = _$GetOnboardingEventImpl;
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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
  $Res call({TransactionItem transaction});
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
    Object? transaction = null,
  }) {
    return _then(_$GetWalletTransactionDetailSuccessImpl(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionItem,
    ));
  }
}

/// @nodoc

class _$GetWalletTransactionDetailSuccessImpl
    with DiagnosticableTreeMixin
    implements _GetWalletTransactionDetailSuccess {
  const _$GetWalletTransactionDetailSuccessImpl({required this.transaction});

  @override
  final TransactionItem transaction;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getWalletTransactionDetailSuccess(transaction: $transaction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'WalletState.getWalletTransactionDetailSuccess'))
      ..add(DiagnosticsProperty('transaction', transaction));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWalletTransactionDetailSuccessImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
  }) {
    return getWalletTransactionDetailSuccess(transaction);
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
  }) {
    return getWalletTransactionDetailSuccess?.call(transaction);
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getWalletTransactionDetailSuccess != null) {
      return getWalletTransactionDetailSuccess(transaction);
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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
          {required final TransactionItem transaction}) =
      _$GetWalletTransactionDetailSuccessImpl;

  TransactionItem get transaction;
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
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

/// @nodoc
abstract class _$$GetPDoneProfileLoadingImplCopyWith<$Res> {
  factory _$$GetPDoneProfileLoadingImplCopyWith(
          _$GetPDoneProfileLoadingImpl value,
          $Res Function(_$GetPDoneProfileLoadingImpl) then) =
      __$$GetPDoneProfileLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPDoneProfileLoadingImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$GetPDoneProfileLoadingImpl>
    implements _$$GetPDoneProfileLoadingImplCopyWith<$Res> {
  __$$GetPDoneProfileLoadingImplCopyWithImpl(
      _$GetPDoneProfileLoadingImpl _value,
      $Res Function(_$GetPDoneProfileLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPDoneProfileLoadingImpl
    with DiagnosticableTreeMixin
    implements _GetPDoneProfileLoading {
  const _$GetPDoneProfileLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getPDoneProfileLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'WalletState.getPDoneProfileLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPDoneProfileLoadingImpl);
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
  }) {
    return getPDoneProfileLoading();
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
  }) {
    return getPDoneProfileLoading?.call();
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getPDoneProfileLoading != null) {
      return getPDoneProfileLoading();
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
  }) {
    return getPDoneProfileLoading(this);
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
  }) {
    return getPDoneProfileLoading?.call(this);
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getPDoneProfileLoading != null) {
      return getPDoneProfileLoading(this);
    }
    return orElse();
  }
}

abstract class _GetPDoneProfileLoading implements WalletState {
  const factory _GetPDoneProfileLoading() = _$GetPDoneProfileLoadingImpl;
}

/// @nodoc
abstract class _$$GetPDoneProfileSuccessImplCopyWith<$Res> {
  factory _$$GetPDoneProfileSuccessImplCopyWith(
          _$GetPDoneProfileSuccessImpl value,
          $Res Function(_$GetPDoneProfileSuccessImpl) then) =
      __$$GetPDoneProfileSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PDoneProfile pDoneProfile});

  $PDoneProfileCopyWith<$Res> get pDoneProfile;
}

/// @nodoc
class __$$GetPDoneProfileSuccessImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$GetPDoneProfileSuccessImpl>
    implements _$$GetPDoneProfileSuccessImplCopyWith<$Res> {
  __$$GetPDoneProfileSuccessImplCopyWithImpl(
      _$GetPDoneProfileSuccessImpl _value,
      $Res Function(_$GetPDoneProfileSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pDoneProfile = null,
  }) {
    return _then(_$GetPDoneProfileSuccessImpl(
      null == pDoneProfile
          ? _value.pDoneProfile
          : pDoneProfile // ignore: cast_nullable_to_non_nullable
              as PDoneProfile,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PDoneProfileCopyWith<$Res> get pDoneProfile {
    return $PDoneProfileCopyWith<$Res>(_value.pDoneProfile, (value) {
      return _then(_value.copyWith(pDoneProfile: value));
    });
  }
}

/// @nodoc

class _$GetPDoneProfileSuccessImpl
    with DiagnosticableTreeMixin
    implements _GetPDoneProfileSuccess {
  const _$GetPDoneProfileSuccessImpl(this.pDoneProfile);

  @override
  final PDoneProfile pDoneProfile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getPDoneProfileSuccess(pDoneProfile: $pDoneProfile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletState.getPDoneProfileSuccess'))
      ..add(DiagnosticsProperty('pDoneProfile', pDoneProfile));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPDoneProfileSuccessImpl &&
            (identical(other.pDoneProfile, pDoneProfile) ||
                other.pDoneProfile == pDoneProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pDoneProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPDoneProfileSuccessImplCopyWith<_$GetPDoneProfileSuccessImpl>
      get copyWith => __$$GetPDoneProfileSuccessImplCopyWithImpl<
          _$GetPDoneProfileSuccessImpl>(this, _$identity);

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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
  }) {
    return getPDoneProfileSuccess(pDoneProfile);
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
  }) {
    return getPDoneProfileSuccess?.call(pDoneProfile);
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getPDoneProfileSuccess != null) {
      return getPDoneProfileSuccess(pDoneProfile);
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
  }) {
    return getPDoneProfileSuccess(this);
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
  }) {
    return getPDoneProfileSuccess?.call(this);
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getPDoneProfileSuccess != null) {
      return getPDoneProfileSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetPDoneProfileSuccess implements WalletState {
  const factory _GetPDoneProfileSuccess(final PDoneProfile pDoneProfile) =
      _$GetPDoneProfileSuccessImpl;

  PDoneProfile get pDoneProfile;
  @JsonKey(ignore: true)
  _$$GetPDoneProfileSuccessImplCopyWith<_$GetPDoneProfileSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPDoneProfileFailedImplCopyWith<$Res> {
  factory _$$GetPDoneProfileFailedImplCopyWith(
          _$GetPDoneProfileFailedImpl value,
          $Res Function(_$GetPDoneProfileFailedImpl) then) =
      __$$GetPDoneProfileFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$GetPDoneProfileFailedImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$GetPDoneProfileFailedImpl>
    implements _$$GetPDoneProfileFailedImplCopyWith<$Res> {
  __$$GetPDoneProfileFailedImplCopyWithImpl(_$GetPDoneProfileFailedImpl _value,
      $Res Function(_$GetPDoneProfileFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$GetPDoneProfileFailedImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetPDoneProfileFailedImpl
    with DiagnosticableTreeMixin
    implements _GetPDoneProfileFailed {
  const _$GetPDoneProfileFailedImpl(this.err);

  @override
  final String err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getPDoneProfileFailed(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletState.getPDoneProfileFailed'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPDoneProfileFailedImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPDoneProfileFailedImplCopyWith<_$GetPDoneProfileFailedImpl>
      get copyWith => __$$GetPDoneProfileFailedImplCopyWithImpl<
          _$GetPDoneProfileFailedImpl>(this, _$identity);

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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
  }) {
    return getPDoneProfileFailed(err);
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
  }) {
    return getPDoneProfileFailed?.call(err);
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getPDoneProfileFailed != null) {
      return getPDoneProfileFailed(err);
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
  }) {
    return getPDoneProfileFailed(this);
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
  }) {
    return getPDoneProfileFailed?.call(this);
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getPDoneProfileFailed != null) {
      return getPDoneProfileFailed(this);
    }
    return orElse();
  }
}

abstract class _GetPDoneProfileFailed implements WalletState {
  const factory _GetPDoneProfileFailed(final String err) =
      _$GetPDoneProfileFailedImpl;

  String get err;
  @JsonKey(ignore: true)
  _$$GetPDoneProfileFailedImplCopyWith<_$GetPDoneProfileFailedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOnboardingLoadingImplCopyWith<$Res> {
  factory _$$GetOnboardingLoadingImplCopyWith(_$GetOnboardingLoadingImpl value,
          $Res Function(_$GetOnboardingLoadingImpl) then) =
      __$$GetOnboardingLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetOnboardingLoadingImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$GetOnboardingLoadingImpl>
    implements _$$GetOnboardingLoadingImplCopyWith<$Res> {
  __$$GetOnboardingLoadingImplCopyWithImpl(_$GetOnboardingLoadingImpl _value,
      $Res Function(_$GetOnboardingLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetOnboardingLoadingImpl
    with DiagnosticableTreeMixin
    implements _GetOnboardingLoading {
  const _$GetOnboardingLoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getOnboardingLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'WalletState.getOnboardingLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOnboardingLoadingImpl);
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
  }) {
    return getOnboardingLoading();
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
  }) {
    return getOnboardingLoading?.call();
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getOnboardingLoading != null) {
      return getOnboardingLoading();
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
  }) {
    return getOnboardingLoading(this);
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
  }) {
    return getOnboardingLoading?.call(this);
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getOnboardingLoading != null) {
      return getOnboardingLoading(this);
    }
    return orElse();
  }
}

abstract class _GetOnboardingLoading implements WalletState {
  const factory _GetOnboardingLoading() = _$GetOnboardingLoadingImpl;
}

/// @nodoc
abstract class _$$GetOnboardingSuccessImplCopyWith<$Res> {
  factory _$$GetOnboardingSuccessImplCopyWith(_$GetOnboardingSuccessImpl value,
          $Res Function(_$GetOnboardingSuccessImpl) then) =
      __$$GetOnboardingSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OnboardingResponse onboarding});
}

/// @nodoc
class __$$GetOnboardingSuccessImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$GetOnboardingSuccessImpl>
    implements _$$GetOnboardingSuccessImplCopyWith<$Res> {
  __$$GetOnboardingSuccessImplCopyWithImpl(_$GetOnboardingSuccessImpl _value,
      $Res Function(_$GetOnboardingSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboarding = null,
  }) {
    return _then(_$GetOnboardingSuccessImpl(
      null == onboarding
          ? _value.onboarding
          : onboarding // ignore: cast_nullable_to_non_nullable
              as OnboardingResponse,
    ));
  }
}

/// @nodoc

class _$GetOnboardingSuccessImpl
    with DiagnosticableTreeMixin
    implements _GetOnboardingSuccess {
  const _$GetOnboardingSuccessImpl(this.onboarding);

  @override
  final OnboardingResponse onboarding;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getOnboardingSuccess(onboarding: $onboarding)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletState.getOnboardingSuccess'))
      ..add(DiagnosticsProperty('onboarding', onboarding));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOnboardingSuccessImpl &&
            (identical(other.onboarding, onboarding) ||
                other.onboarding == onboarding));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onboarding);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOnboardingSuccessImplCopyWith<_$GetOnboardingSuccessImpl>
      get copyWith =>
          __$$GetOnboardingSuccessImplCopyWithImpl<_$GetOnboardingSuccessImpl>(
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
  }) {
    return getOnboardingSuccess(onboarding);
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
  }) {
    return getOnboardingSuccess?.call(onboarding);
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getOnboardingSuccess != null) {
      return getOnboardingSuccess(onboarding);
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
  }) {
    return getOnboardingSuccess(this);
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
  }) {
    return getOnboardingSuccess?.call(this);
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getOnboardingSuccess != null) {
      return getOnboardingSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetOnboardingSuccess implements WalletState {
  const factory _GetOnboardingSuccess(final OnboardingResponse onboarding) =
      _$GetOnboardingSuccessImpl;

  OnboardingResponse get onboarding;
  @JsonKey(ignore: true)
  _$$GetOnboardingSuccessImplCopyWith<_$GetOnboardingSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetOnboardingFailImplCopyWith<$Res> {
  factory _$$GetOnboardingFailImplCopyWith(_$GetOnboardingFailImpl value,
          $Res Function(_$GetOnboardingFailImpl) then) =
      __$$GetOnboardingFailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$GetOnboardingFailImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$GetOnboardingFailImpl>
    implements _$$GetOnboardingFailImplCopyWith<$Res> {
  __$$GetOnboardingFailImplCopyWithImpl(_$GetOnboardingFailImpl _value,
      $Res Function(_$GetOnboardingFailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$GetOnboardingFailImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetOnboardingFailImpl
    with DiagnosticableTreeMixin
    implements _GetOnboardingFail {
  const _$GetOnboardingFailImpl(this.err);

  @override
  final String err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletState.getOnboardingFail(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletState.getOnboardingFail'))
      ..add(DiagnosticsProperty('err', err));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOnboardingFailImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOnboardingFailImplCopyWith<_$GetOnboardingFailImpl> get copyWith =>
      __$$GetOnboardingFailImplCopyWithImpl<_$GetOnboardingFailImpl>(
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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
  }) {
    return getOnboardingFail(err);
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
  }) {
    return getOnboardingFail?.call(err);
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getOnboardingFail != null) {
      return getOnboardingFail(err);
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
  }) {
    return getOnboardingFail(this);
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
  }) {
    return getOnboardingFail?.call(this);
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (getOnboardingFail != null) {
      return getOnboardingFail(this);
    }
    return orElse();
  }
}

abstract class _GetOnboardingFail implements WalletState {
  const factory _GetOnboardingFail(final String err) = _$GetOnboardingFailImpl;

  String get err;
  @JsonKey(ignore: true)
  _$$GetOnboardingFailImplCopyWith<_$GetOnboardingFailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterTransactionSuccessImplCopyWith<$Res> {
  factory _$$FilterTransactionSuccessImplCopyWith(
          _$FilterTransactionSuccessImpl value,
          $Res Function(_$FilterTransactionSuccessImpl) then) =
      __$$FilterTransactionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionItem> transactions});
}

/// @nodoc
class __$$FilterTransactionSuccessImplCopyWithImpl<$Res>
    extends _$WalletStateCopyWithImpl<$Res, _$FilterTransactionSuccessImpl>
    implements _$$FilterTransactionSuccessImplCopyWith<$Res> {
  __$$FilterTransactionSuccessImplCopyWithImpl(
      _$FilterTransactionSuccessImpl _value,
      $Res Function(_$FilterTransactionSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$FilterTransactionSuccessImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
    ));
  }
}

/// @nodoc

class _$FilterTransactionSuccessImpl
    with DiagnosticableTreeMixin
    implements _FilterTransactionSuccess {
  const _$FilterTransactionSuccessImpl(
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
    return 'WalletState.filterTransactionSuccess(transactions: $transactions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletState.filterTransactionSuccess'))
      ..add(DiagnosticsProperty('transactions', transactions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterTransactionSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterTransactionSuccessImplCopyWith<_$FilterTransactionSuccessImpl>
      get copyWith => __$$FilterTransactionSuccessImplCopyWithImpl<
          _$FilterTransactionSuccessImpl>(this, _$identity);

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
    required TResult Function(TransactionItem transaction)
        getWalletTransactionDetailSuccess,
    required TResult Function() getWalletTransactionDetailLoading,
    required TResult Function(String err) getWalletTransactionDetailFailed,
    required TResult Function() getPDoneProfileLoading,
    required TResult Function(PDoneProfile pDoneProfile) getPDoneProfileSuccess,
    required TResult Function(String err) getPDoneProfileFailed,
    required TResult Function() getOnboardingLoading,
    required TResult Function(OnboardingResponse onboarding)
        getOnboardingSuccess,
    required TResult Function(String err) getOnboardingFail,
    required TResult Function(List<TransactionItem> transactions)
        filterTransactionSuccess,
  }) {
    return filterTransactionSuccess(transactions);
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
    TResult? Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult? Function()? getWalletTransactionDetailLoading,
    TResult? Function(String err)? getWalletTransactionDetailFailed,
    TResult? Function()? getPDoneProfileLoading,
    TResult? Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult? Function(String err)? getPDoneProfileFailed,
    TResult? Function()? getOnboardingLoading,
    TResult? Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult? Function(String err)? getOnboardingFail,
    TResult? Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
  }) {
    return filterTransactionSuccess?.call(transactions);
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
    TResult Function(TransactionItem transaction)?
        getWalletTransactionDetailSuccess,
    TResult Function()? getWalletTransactionDetailLoading,
    TResult Function(String err)? getWalletTransactionDetailFailed,
    TResult Function()? getPDoneProfileLoading,
    TResult Function(PDoneProfile pDoneProfile)? getPDoneProfileSuccess,
    TResult Function(String err)? getPDoneProfileFailed,
    TResult Function()? getOnboardingLoading,
    TResult Function(OnboardingResponse onboarding)? getOnboardingSuccess,
    TResult Function(String err)? getOnboardingFail,
    TResult Function(List<TransactionItem> transactions)?
        filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (filterTransactionSuccess != null) {
      return filterTransactionSuccess(transactions);
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
    required TResult Function(_GetPDoneProfileLoading value)
        getPDoneProfileLoading,
    required TResult Function(_GetPDoneProfileSuccess value)
        getPDoneProfileSuccess,
    required TResult Function(_GetPDoneProfileFailed value)
        getPDoneProfileFailed,
    required TResult Function(_GetOnboardingLoading value) getOnboardingLoading,
    required TResult Function(_GetOnboardingSuccess value) getOnboardingSuccess,
    required TResult Function(_GetOnboardingFail value) getOnboardingFail,
    required TResult Function(_FilterTransactionSuccess value)
        filterTransactionSuccess,
  }) {
    return filterTransactionSuccess(this);
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
    TResult? Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult? Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult? Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult? Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult? Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult? Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult? Function(_FilterTransactionSuccess value)?
        filterTransactionSuccess,
  }) {
    return filterTransactionSuccess?.call(this);
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
    TResult Function(_GetPDoneProfileLoading value)? getPDoneProfileLoading,
    TResult Function(_GetPDoneProfileSuccess value)? getPDoneProfileSuccess,
    TResult Function(_GetPDoneProfileFailed value)? getPDoneProfileFailed,
    TResult Function(_GetOnboardingLoading value)? getOnboardingLoading,
    TResult Function(_GetOnboardingSuccess value)? getOnboardingSuccess,
    TResult Function(_GetOnboardingFail value)? getOnboardingFail,
    TResult Function(_FilterTransactionSuccess value)? filterTransactionSuccess,
    required TResult orElse(),
  }) {
    if (filterTransactionSuccess != null) {
      return filterTransactionSuccess(this);
    }
    return orElse();
  }
}

abstract class _FilterTransactionSuccess implements WalletState {
  const factory _FilterTransactionSuccess(
          {required final List<TransactionItem> transactions}) =
      _$FilterTransactionSuccessImpl;

  List<TransactionItem> get transactions;
  @JsonKey(ignore: true)
  _$$FilterTransactionSuccessImplCopyWith<_$FilterTransactionSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
