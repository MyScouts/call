// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agency_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AgencyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllAgency,
    required TResult Function(int id) getAgencyInfo,
    required TResult Function(int agencyId, num value) exchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllAgency,
    TResult? Function(int id)? getAgencyInfo,
    TResult? Function(int agencyId, num value)? exchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllAgency,
    TResult Function(int id)? getAgencyInfo,
    TResult Function(int agencyId, num value)? exchange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllAgency value) getAllAgency,
    required TResult Function(_GetAgencyInfo value) getAgencyInfo,
    required TResult Function(_Exchange value) exchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllAgency value)? getAllAgency,
    TResult? Function(_GetAgencyInfo value)? getAgencyInfo,
    TResult? Function(_Exchange value)? exchange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllAgency value)? getAllAgency,
    TResult Function(_GetAgencyInfo value)? getAgencyInfo,
    TResult Function(_Exchange value)? exchange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgencyEventCopyWith<$Res> {
  factory $AgencyEventCopyWith(
          AgencyEvent value, $Res Function(AgencyEvent) then) =
      _$AgencyEventCopyWithImpl<$Res, AgencyEvent>;
}

/// @nodoc
class _$AgencyEventCopyWithImpl<$Res, $Val extends AgencyEvent>
    implements $AgencyEventCopyWith<$Res> {
  _$AgencyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllAgencyImplCopyWith<$Res> {
  factory _$$GetAllAgencyImplCopyWith(
          _$GetAllAgencyImpl value, $Res Function(_$GetAllAgencyImpl) then) =
      __$$GetAllAgencyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllAgencyImplCopyWithImpl<$Res>
    extends _$AgencyEventCopyWithImpl<$Res, _$GetAllAgencyImpl>
    implements _$$GetAllAgencyImplCopyWith<$Res> {
  __$$GetAllAgencyImplCopyWithImpl(
      _$GetAllAgencyImpl _value, $Res Function(_$GetAllAgencyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllAgencyImpl implements _GetAllAgency {
  const _$GetAllAgencyImpl();

  @override
  String toString() {
    return 'AgencyEvent.getAllAgency()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllAgencyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllAgency,
    required TResult Function(int id) getAgencyInfo,
    required TResult Function(int agencyId, num value) exchange,
  }) {
    return getAllAgency();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllAgency,
    TResult? Function(int id)? getAgencyInfo,
    TResult? Function(int agencyId, num value)? exchange,
  }) {
    return getAllAgency?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllAgency,
    TResult Function(int id)? getAgencyInfo,
    TResult Function(int agencyId, num value)? exchange,
    required TResult orElse(),
  }) {
    if (getAllAgency != null) {
      return getAllAgency();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllAgency value) getAllAgency,
    required TResult Function(_GetAgencyInfo value) getAgencyInfo,
    required TResult Function(_Exchange value) exchange,
  }) {
    return getAllAgency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllAgency value)? getAllAgency,
    TResult? Function(_GetAgencyInfo value)? getAgencyInfo,
    TResult? Function(_Exchange value)? exchange,
  }) {
    return getAllAgency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllAgency value)? getAllAgency,
    TResult Function(_GetAgencyInfo value)? getAgencyInfo,
    TResult Function(_Exchange value)? exchange,
    required TResult orElse(),
  }) {
    if (getAllAgency != null) {
      return getAllAgency(this);
    }
    return orElse();
  }
}

abstract class _GetAllAgency implements AgencyEvent {
  const factory _GetAllAgency() = _$GetAllAgencyImpl;
}

/// @nodoc
abstract class _$$GetAgencyInfoImplCopyWith<$Res> {
  factory _$$GetAgencyInfoImplCopyWith(
          _$GetAgencyInfoImpl value, $Res Function(_$GetAgencyInfoImpl) then) =
      __$$GetAgencyInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetAgencyInfoImplCopyWithImpl<$Res>
    extends _$AgencyEventCopyWithImpl<$Res, _$GetAgencyInfoImpl>
    implements _$$GetAgencyInfoImplCopyWith<$Res> {
  __$$GetAgencyInfoImplCopyWithImpl(
      _$GetAgencyInfoImpl _value, $Res Function(_$GetAgencyInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetAgencyInfoImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetAgencyInfoImpl implements _GetAgencyInfo {
  const _$GetAgencyInfoImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'AgencyEvent.getAgencyInfo(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAgencyInfoImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAgencyInfoImplCopyWith<_$GetAgencyInfoImpl> get copyWith =>
      __$$GetAgencyInfoImplCopyWithImpl<_$GetAgencyInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllAgency,
    required TResult Function(int id) getAgencyInfo,
    required TResult Function(int agencyId, num value) exchange,
  }) {
    return getAgencyInfo(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllAgency,
    TResult? Function(int id)? getAgencyInfo,
    TResult? Function(int agencyId, num value)? exchange,
  }) {
    return getAgencyInfo?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllAgency,
    TResult Function(int id)? getAgencyInfo,
    TResult Function(int agencyId, num value)? exchange,
    required TResult orElse(),
  }) {
    if (getAgencyInfo != null) {
      return getAgencyInfo(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllAgency value) getAllAgency,
    required TResult Function(_GetAgencyInfo value) getAgencyInfo,
    required TResult Function(_Exchange value) exchange,
  }) {
    return getAgencyInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllAgency value)? getAllAgency,
    TResult? Function(_GetAgencyInfo value)? getAgencyInfo,
    TResult? Function(_Exchange value)? exchange,
  }) {
    return getAgencyInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllAgency value)? getAllAgency,
    TResult Function(_GetAgencyInfo value)? getAgencyInfo,
    TResult Function(_Exchange value)? exchange,
    required TResult orElse(),
  }) {
    if (getAgencyInfo != null) {
      return getAgencyInfo(this);
    }
    return orElse();
  }
}

abstract class _GetAgencyInfo implements AgencyEvent {
  const factory _GetAgencyInfo(final int id) = _$GetAgencyInfoImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$GetAgencyInfoImplCopyWith<_$GetAgencyInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExchangeImplCopyWith<$Res> {
  factory _$$ExchangeImplCopyWith(
          _$ExchangeImpl value, $Res Function(_$ExchangeImpl) then) =
      __$$ExchangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int agencyId, num value});
}

/// @nodoc
class __$$ExchangeImplCopyWithImpl<$Res>
    extends _$AgencyEventCopyWithImpl<$Res, _$ExchangeImpl>
    implements _$$ExchangeImplCopyWith<$Res> {
  __$$ExchangeImplCopyWithImpl(
      _$ExchangeImpl _value, $Res Function(_$ExchangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agencyId = null,
    Object? value = null,
  }) {
    return _then(_$ExchangeImpl(
      agencyId: null == agencyId
          ? _value.agencyId
          : agencyId // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$ExchangeImpl implements _Exchange {
  const _$ExchangeImpl({required this.agencyId, required this.value});

  @override
  final int agencyId;
  @override
  final num value;

  @override
  String toString() {
    return 'AgencyEvent.exchange(agencyId: $agencyId, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeImpl &&
            (identical(other.agencyId, agencyId) ||
                other.agencyId == agencyId) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, agencyId, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeImplCopyWith<_$ExchangeImpl> get copyWith =>
      __$$ExchangeImplCopyWithImpl<_$ExchangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllAgency,
    required TResult Function(int id) getAgencyInfo,
    required TResult Function(int agencyId, num value) exchange,
  }) {
    return exchange(agencyId, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllAgency,
    TResult? Function(int id)? getAgencyInfo,
    TResult? Function(int agencyId, num value)? exchange,
  }) {
    return exchange?.call(agencyId, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllAgency,
    TResult Function(int id)? getAgencyInfo,
    TResult Function(int agencyId, num value)? exchange,
    required TResult orElse(),
  }) {
    if (exchange != null) {
      return exchange(agencyId, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllAgency value) getAllAgency,
    required TResult Function(_GetAgencyInfo value) getAgencyInfo,
    required TResult Function(_Exchange value) exchange,
  }) {
    return exchange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllAgency value)? getAllAgency,
    TResult? Function(_GetAgencyInfo value)? getAgencyInfo,
    TResult? Function(_Exchange value)? exchange,
  }) {
    return exchange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllAgency value)? getAllAgency,
    TResult Function(_GetAgencyInfo value)? getAgencyInfo,
    TResult Function(_Exchange value)? exchange,
    required TResult orElse(),
  }) {
    if (exchange != null) {
      return exchange(this);
    }
    return orElse();
  }
}

abstract class _Exchange implements AgencyEvent {
  const factory _Exchange(
      {required final int agencyId, required final num value}) = _$ExchangeImpl;

  int get agencyId;
  num get value;
  @JsonKey(ignore: true)
  _$$ExchangeImplCopyWith<_$ExchangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AgencyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(AgencyInfo agencyInfo) getAgencyInfoSuccess,
    required TResult Function() getAgencyInfoLoading,
    required TResult Function() exchangeLoading,
    required TResult Function(num valueExchanged) exchangeSuccess,
    required TResult Function() getAllAgencyLoading,
    required TResult Function(List<Agency> agency) getAllAgencyLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult? Function()? getAgencyInfoLoading,
    TResult? Function()? exchangeLoading,
    TResult? Function(num valueExchanged)? exchangeSuccess,
    TResult? Function()? getAllAgencyLoading,
    TResult? Function(List<Agency> agency)? getAllAgencyLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult Function()? getAgencyInfoLoading,
    TResult Function()? exchangeLoading,
    TResult Function(num valueExchanged)? exchangeSuccess,
    TResult Function()? getAllAgencyLoading,
    TResult Function(List<Agency> agency)? getAllAgencyLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetAgencyInfoSuccess value) getAgencyInfoSuccess,
    required TResult Function(_GetAgencyInfoLoading value) getAgencyInfoLoading,
    required TResult Function(_ExchangeLoading value) exchangeLoading,
    required TResult Function(_ExchangeSuccess value) exchangeSuccess,
    required TResult Function(_GetAllAgencyLoading value) getAllAgencyLoading,
    required TResult Function(_GetAllAgencyLoaded value) getAllAgencyLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult? Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult? Function(_ExchangeLoading value)? exchangeLoading,
    TResult? Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult? Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult? Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult Function(_ExchangeLoading value)? exchangeLoading,
    TResult Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgencyStateCopyWith<$Res> {
  factory $AgencyStateCopyWith(
          AgencyState value, $Res Function(AgencyState) then) =
      _$AgencyStateCopyWithImpl<$Res, AgencyState>;
}

/// @nodoc
class _$AgencyStateCopyWithImpl<$Res, $Val extends AgencyState>
    implements $AgencyStateCopyWith<$Res> {
  _$AgencyStateCopyWithImpl(this._value, this._then);

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
    extends _$AgencyStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AgencyState.initial()';
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
    required TResult Function(AgencyInfo agencyInfo) getAgencyInfoSuccess,
    required TResult Function() getAgencyInfoLoading,
    required TResult Function() exchangeLoading,
    required TResult Function(num valueExchanged) exchangeSuccess,
    required TResult Function() getAllAgencyLoading,
    required TResult Function(List<Agency> agency) getAllAgencyLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult? Function()? getAgencyInfoLoading,
    TResult? Function()? exchangeLoading,
    TResult? Function(num valueExchanged)? exchangeSuccess,
    TResult? Function()? getAllAgencyLoading,
    TResult? Function(List<Agency> agency)? getAllAgencyLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult Function()? getAgencyInfoLoading,
    TResult Function()? exchangeLoading,
    TResult Function(num valueExchanged)? exchangeSuccess,
    TResult Function()? getAllAgencyLoading,
    TResult Function(List<Agency> agency)? getAllAgencyLoaded,
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
    required TResult Function(_GetAgencyInfoSuccess value) getAgencyInfoSuccess,
    required TResult Function(_GetAgencyInfoLoading value) getAgencyInfoLoading,
    required TResult Function(_ExchangeLoading value) exchangeLoading,
    required TResult Function(_ExchangeSuccess value) exchangeSuccess,
    required TResult Function(_GetAllAgencyLoading value) getAllAgencyLoading,
    required TResult Function(_GetAllAgencyLoaded value) getAllAgencyLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult? Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult? Function(_ExchangeLoading value)? exchangeLoading,
    TResult? Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult? Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult? Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult Function(_ExchangeLoading value)? exchangeLoading,
    TResult Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AgencyState {
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
    extends _$AgencyStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'AgencyState.error(err: $err)';
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
    required TResult Function(AgencyInfo agencyInfo) getAgencyInfoSuccess,
    required TResult Function() getAgencyInfoLoading,
    required TResult Function() exchangeLoading,
    required TResult Function(num valueExchanged) exchangeSuccess,
    required TResult Function() getAllAgencyLoading,
    required TResult Function(List<Agency> agency) getAllAgencyLoaded,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult? Function()? getAgencyInfoLoading,
    TResult? Function()? exchangeLoading,
    TResult? Function(num valueExchanged)? exchangeSuccess,
    TResult? Function()? getAllAgencyLoading,
    TResult? Function(List<Agency> agency)? getAllAgencyLoaded,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult Function()? getAgencyInfoLoading,
    TResult Function()? exchangeLoading,
    TResult Function(num valueExchanged)? exchangeSuccess,
    TResult Function()? getAllAgencyLoading,
    TResult Function(List<Agency> agency)? getAllAgencyLoaded,
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
    required TResult Function(_GetAgencyInfoSuccess value) getAgencyInfoSuccess,
    required TResult Function(_GetAgencyInfoLoading value) getAgencyInfoLoading,
    required TResult Function(_ExchangeLoading value) exchangeLoading,
    required TResult Function(_ExchangeSuccess value) exchangeSuccess,
    required TResult Function(_GetAllAgencyLoading value) getAllAgencyLoading,
    required TResult Function(_GetAllAgencyLoaded value) getAllAgencyLoaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult? Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult? Function(_ExchangeLoading value)? exchangeLoading,
    TResult? Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult? Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult? Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult Function(_ExchangeLoading value)? exchangeLoading,
    TResult Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AgencyState {
  const factory _Error(final String err) = _$ErrorImpl;

  String get err;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAgencyInfoSuccessImplCopyWith<$Res> {
  factory _$$GetAgencyInfoSuccessImplCopyWith(_$GetAgencyInfoSuccessImpl value,
          $Res Function(_$GetAgencyInfoSuccessImpl) then) =
      __$$GetAgencyInfoSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AgencyInfo agencyInfo});

  $AgencyInfoCopyWith<$Res> get agencyInfo;
}

/// @nodoc
class __$$GetAgencyInfoSuccessImplCopyWithImpl<$Res>
    extends _$AgencyStateCopyWithImpl<$Res, _$GetAgencyInfoSuccessImpl>
    implements _$$GetAgencyInfoSuccessImplCopyWith<$Res> {
  __$$GetAgencyInfoSuccessImplCopyWithImpl(_$GetAgencyInfoSuccessImpl _value,
      $Res Function(_$GetAgencyInfoSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agencyInfo = null,
  }) {
    return _then(_$GetAgencyInfoSuccessImpl(
      agencyInfo: null == agencyInfo
          ? _value.agencyInfo
          : agencyInfo // ignore: cast_nullable_to_non_nullable
              as AgencyInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AgencyInfoCopyWith<$Res> get agencyInfo {
    return $AgencyInfoCopyWith<$Res>(_value.agencyInfo, (value) {
      return _then(_value.copyWith(agencyInfo: value));
    });
  }
}

/// @nodoc

class _$GetAgencyInfoSuccessImpl implements _GetAgencyInfoSuccess {
  const _$GetAgencyInfoSuccessImpl({required this.agencyInfo});

  @override
  final AgencyInfo agencyInfo;

  @override
  String toString() {
    return 'AgencyState.getAgencyInfoSuccess(agencyInfo: $agencyInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAgencyInfoSuccessImpl &&
            (identical(other.agencyInfo, agencyInfo) ||
                other.agencyInfo == agencyInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, agencyInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAgencyInfoSuccessImplCopyWith<_$GetAgencyInfoSuccessImpl>
      get copyWith =>
          __$$GetAgencyInfoSuccessImplCopyWithImpl<_$GetAgencyInfoSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(AgencyInfo agencyInfo) getAgencyInfoSuccess,
    required TResult Function() getAgencyInfoLoading,
    required TResult Function() exchangeLoading,
    required TResult Function(num valueExchanged) exchangeSuccess,
    required TResult Function() getAllAgencyLoading,
    required TResult Function(List<Agency> agency) getAllAgencyLoaded,
  }) {
    return getAgencyInfoSuccess(agencyInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult? Function()? getAgencyInfoLoading,
    TResult? Function()? exchangeLoading,
    TResult? Function(num valueExchanged)? exchangeSuccess,
    TResult? Function()? getAllAgencyLoading,
    TResult? Function(List<Agency> agency)? getAllAgencyLoaded,
  }) {
    return getAgencyInfoSuccess?.call(agencyInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult Function()? getAgencyInfoLoading,
    TResult Function()? exchangeLoading,
    TResult Function(num valueExchanged)? exchangeSuccess,
    TResult Function()? getAllAgencyLoading,
    TResult Function(List<Agency> agency)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (getAgencyInfoSuccess != null) {
      return getAgencyInfoSuccess(agencyInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetAgencyInfoSuccess value) getAgencyInfoSuccess,
    required TResult Function(_GetAgencyInfoLoading value) getAgencyInfoLoading,
    required TResult Function(_ExchangeLoading value) exchangeLoading,
    required TResult Function(_ExchangeSuccess value) exchangeSuccess,
    required TResult Function(_GetAllAgencyLoading value) getAllAgencyLoading,
    required TResult Function(_GetAllAgencyLoaded value) getAllAgencyLoaded,
  }) {
    return getAgencyInfoSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult? Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult? Function(_ExchangeLoading value)? exchangeLoading,
    TResult? Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult? Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult? Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
  }) {
    return getAgencyInfoSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult Function(_ExchangeLoading value)? exchangeLoading,
    TResult Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (getAgencyInfoSuccess != null) {
      return getAgencyInfoSuccess(this);
    }
    return orElse();
  }
}

abstract class _GetAgencyInfoSuccess implements AgencyState {
  const factory _GetAgencyInfoSuccess({required final AgencyInfo agencyInfo}) =
      _$GetAgencyInfoSuccessImpl;

  AgencyInfo get agencyInfo;
  @JsonKey(ignore: true)
  _$$GetAgencyInfoSuccessImplCopyWith<_$GetAgencyInfoSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAgencyInfoLoadingImplCopyWith<$Res> {
  factory _$$GetAgencyInfoLoadingImplCopyWith(_$GetAgencyInfoLoadingImpl value,
          $Res Function(_$GetAgencyInfoLoadingImpl) then) =
      __$$GetAgencyInfoLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAgencyInfoLoadingImplCopyWithImpl<$Res>
    extends _$AgencyStateCopyWithImpl<$Res, _$GetAgencyInfoLoadingImpl>
    implements _$$GetAgencyInfoLoadingImplCopyWith<$Res> {
  __$$GetAgencyInfoLoadingImplCopyWithImpl(_$GetAgencyInfoLoadingImpl _value,
      $Res Function(_$GetAgencyInfoLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAgencyInfoLoadingImpl implements _GetAgencyInfoLoading {
  const _$GetAgencyInfoLoadingImpl();

  @override
  String toString() {
    return 'AgencyState.getAgencyInfoLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAgencyInfoLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(AgencyInfo agencyInfo) getAgencyInfoSuccess,
    required TResult Function() getAgencyInfoLoading,
    required TResult Function() exchangeLoading,
    required TResult Function(num valueExchanged) exchangeSuccess,
    required TResult Function() getAllAgencyLoading,
    required TResult Function(List<Agency> agency) getAllAgencyLoaded,
  }) {
    return getAgencyInfoLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult? Function()? getAgencyInfoLoading,
    TResult? Function()? exchangeLoading,
    TResult? Function(num valueExchanged)? exchangeSuccess,
    TResult? Function()? getAllAgencyLoading,
    TResult? Function(List<Agency> agency)? getAllAgencyLoaded,
  }) {
    return getAgencyInfoLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult Function()? getAgencyInfoLoading,
    TResult Function()? exchangeLoading,
    TResult Function(num valueExchanged)? exchangeSuccess,
    TResult Function()? getAllAgencyLoading,
    TResult Function(List<Agency> agency)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (getAgencyInfoLoading != null) {
      return getAgencyInfoLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetAgencyInfoSuccess value) getAgencyInfoSuccess,
    required TResult Function(_GetAgencyInfoLoading value) getAgencyInfoLoading,
    required TResult Function(_ExchangeLoading value) exchangeLoading,
    required TResult Function(_ExchangeSuccess value) exchangeSuccess,
    required TResult Function(_GetAllAgencyLoading value) getAllAgencyLoading,
    required TResult Function(_GetAllAgencyLoaded value) getAllAgencyLoaded,
  }) {
    return getAgencyInfoLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult? Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult? Function(_ExchangeLoading value)? exchangeLoading,
    TResult? Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult? Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult? Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
  }) {
    return getAgencyInfoLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult Function(_ExchangeLoading value)? exchangeLoading,
    TResult Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (getAgencyInfoLoading != null) {
      return getAgencyInfoLoading(this);
    }
    return orElse();
  }
}

abstract class _GetAgencyInfoLoading implements AgencyState {
  const factory _GetAgencyInfoLoading() = _$GetAgencyInfoLoadingImpl;
}

/// @nodoc
abstract class _$$ExchangeLoadingImplCopyWith<$Res> {
  factory _$$ExchangeLoadingImplCopyWith(_$ExchangeLoadingImpl value,
          $Res Function(_$ExchangeLoadingImpl) then) =
      __$$ExchangeLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExchangeLoadingImplCopyWithImpl<$Res>
    extends _$AgencyStateCopyWithImpl<$Res, _$ExchangeLoadingImpl>
    implements _$$ExchangeLoadingImplCopyWith<$Res> {
  __$$ExchangeLoadingImplCopyWithImpl(
      _$ExchangeLoadingImpl _value, $Res Function(_$ExchangeLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExchangeLoadingImpl implements _ExchangeLoading {
  const _$ExchangeLoadingImpl();

  @override
  String toString() {
    return 'AgencyState.exchangeLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExchangeLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(AgencyInfo agencyInfo) getAgencyInfoSuccess,
    required TResult Function() getAgencyInfoLoading,
    required TResult Function() exchangeLoading,
    required TResult Function(num valueExchanged) exchangeSuccess,
    required TResult Function() getAllAgencyLoading,
    required TResult Function(List<Agency> agency) getAllAgencyLoaded,
  }) {
    return exchangeLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult? Function()? getAgencyInfoLoading,
    TResult? Function()? exchangeLoading,
    TResult? Function(num valueExchanged)? exchangeSuccess,
    TResult? Function()? getAllAgencyLoading,
    TResult? Function(List<Agency> agency)? getAllAgencyLoaded,
  }) {
    return exchangeLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult Function()? getAgencyInfoLoading,
    TResult Function()? exchangeLoading,
    TResult Function(num valueExchanged)? exchangeSuccess,
    TResult Function()? getAllAgencyLoading,
    TResult Function(List<Agency> agency)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (exchangeLoading != null) {
      return exchangeLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetAgencyInfoSuccess value) getAgencyInfoSuccess,
    required TResult Function(_GetAgencyInfoLoading value) getAgencyInfoLoading,
    required TResult Function(_ExchangeLoading value) exchangeLoading,
    required TResult Function(_ExchangeSuccess value) exchangeSuccess,
    required TResult Function(_GetAllAgencyLoading value) getAllAgencyLoading,
    required TResult Function(_GetAllAgencyLoaded value) getAllAgencyLoaded,
  }) {
    return exchangeLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult? Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult? Function(_ExchangeLoading value)? exchangeLoading,
    TResult? Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult? Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult? Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
  }) {
    return exchangeLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult Function(_ExchangeLoading value)? exchangeLoading,
    TResult Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (exchangeLoading != null) {
      return exchangeLoading(this);
    }
    return orElse();
  }
}

abstract class _ExchangeLoading implements AgencyState {
  const factory _ExchangeLoading() = _$ExchangeLoadingImpl;
}

/// @nodoc
abstract class _$$ExchangeSuccessImplCopyWith<$Res> {
  factory _$$ExchangeSuccessImplCopyWith(_$ExchangeSuccessImpl value,
          $Res Function(_$ExchangeSuccessImpl) then) =
      __$$ExchangeSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({num valueExchanged});
}

/// @nodoc
class __$$ExchangeSuccessImplCopyWithImpl<$Res>
    extends _$AgencyStateCopyWithImpl<$Res, _$ExchangeSuccessImpl>
    implements _$$ExchangeSuccessImplCopyWith<$Res> {
  __$$ExchangeSuccessImplCopyWithImpl(
      _$ExchangeSuccessImpl _value, $Res Function(_$ExchangeSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueExchanged = null,
  }) {
    return _then(_$ExchangeSuccessImpl(
      valueExchanged: null == valueExchanged
          ? _value.valueExchanged
          : valueExchanged // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$ExchangeSuccessImpl implements _ExchangeSuccess {
  const _$ExchangeSuccessImpl({required this.valueExchanged});

  @override
  final num valueExchanged;

  @override
  String toString() {
    return 'AgencyState.exchangeSuccess(valueExchanged: $valueExchanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeSuccessImpl &&
            (identical(other.valueExchanged, valueExchanged) ||
                other.valueExchanged == valueExchanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, valueExchanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeSuccessImplCopyWith<_$ExchangeSuccessImpl> get copyWith =>
      __$$ExchangeSuccessImplCopyWithImpl<_$ExchangeSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(AgencyInfo agencyInfo) getAgencyInfoSuccess,
    required TResult Function() getAgencyInfoLoading,
    required TResult Function() exchangeLoading,
    required TResult Function(num valueExchanged) exchangeSuccess,
    required TResult Function() getAllAgencyLoading,
    required TResult Function(List<Agency> agency) getAllAgencyLoaded,
  }) {
    return exchangeSuccess(valueExchanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult? Function()? getAgencyInfoLoading,
    TResult? Function()? exchangeLoading,
    TResult? Function(num valueExchanged)? exchangeSuccess,
    TResult? Function()? getAllAgencyLoading,
    TResult? Function(List<Agency> agency)? getAllAgencyLoaded,
  }) {
    return exchangeSuccess?.call(valueExchanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult Function()? getAgencyInfoLoading,
    TResult Function()? exchangeLoading,
    TResult Function(num valueExchanged)? exchangeSuccess,
    TResult Function()? getAllAgencyLoading,
    TResult Function(List<Agency> agency)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (exchangeSuccess != null) {
      return exchangeSuccess(valueExchanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetAgencyInfoSuccess value) getAgencyInfoSuccess,
    required TResult Function(_GetAgencyInfoLoading value) getAgencyInfoLoading,
    required TResult Function(_ExchangeLoading value) exchangeLoading,
    required TResult Function(_ExchangeSuccess value) exchangeSuccess,
    required TResult Function(_GetAllAgencyLoading value) getAllAgencyLoading,
    required TResult Function(_GetAllAgencyLoaded value) getAllAgencyLoaded,
  }) {
    return exchangeSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult? Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult? Function(_ExchangeLoading value)? exchangeLoading,
    TResult? Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult? Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult? Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
  }) {
    return exchangeSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult Function(_ExchangeLoading value)? exchangeLoading,
    TResult Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (exchangeSuccess != null) {
      return exchangeSuccess(this);
    }
    return orElse();
  }
}

abstract class _ExchangeSuccess implements AgencyState {
  const factory _ExchangeSuccess({required final num valueExchanged}) =
      _$ExchangeSuccessImpl;

  num get valueExchanged;
  @JsonKey(ignore: true)
  _$$ExchangeSuccessImplCopyWith<_$ExchangeSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAllAgencyLoadingImplCopyWith<$Res> {
  factory _$$GetAllAgencyLoadingImplCopyWith(_$GetAllAgencyLoadingImpl value,
          $Res Function(_$GetAllAgencyLoadingImpl) then) =
      __$$GetAllAgencyLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllAgencyLoadingImplCopyWithImpl<$Res>
    extends _$AgencyStateCopyWithImpl<$Res, _$GetAllAgencyLoadingImpl>
    implements _$$GetAllAgencyLoadingImplCopyWith<$Res> {
  __$$GetAllAgencyLoadingImplCopyWithImpl(_$GetAllAgencyLoadingImpl _value,
      $Res Function(_$GetAllAgencyLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllAgencyLoadingImpl implements _GetAllAgencyLoading {
  const _$GetAllAgencyLoadingImpl();

  @override
  String toString() {
    return 'AgencyState.getAllAgencyLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllAgencyLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(AgencyInfo agencyInfo) getAgencyInfoSuccess,
    required TResult Function() getAgencyInfoLoading,
    required TResult Function() exchangeLoading,
    required TResult Function(num valueExchanged) exchangeSuccess,
    required TResult Function() getAllAgencyLoading,
    required TResult Function(List<Agency> agency) getAllAgencyLoaded,
  }) {
    return getAllAgencyLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult? Function()? getAgencyInfoLoading,
    TResult? Function()? exchangeLoading,
    TResult? Function(num valueExchanged)? exchangeSuccess,
    TResult? Function()? getAllAgencyLoading,
    TResult? Function(List<Agency> agency)? getAllAgencyLoaded,
  }) {
    return getAllAgencyLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult Function()? getAgencyInfoLoading,
    TResult Function()? exchangeLoading,
    TResult Function(num valueExchanged)? exchangeSuccess,
    TResult Function()? getAllAgencyLoading,
    TResult Function(List<Agency> agency)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (getAllAgencyLoading != null) {
      return getAllAgencyLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetAgencyInfoSuccess value) getAgencyInfoSuccess,
    required TResult Function(_GetAgencyInfoLoading value) getAgencyInfoLoading,
    required TResult Function(_ExchangeLoading value) exchangeLoading,
    required TResult Function(_ExchangeSuccess value) exchangeSuccess,
    required TResult Function(_GetAllAgencyLoading value) getAllAgencyLoading,
    required TResult Function(_GetAllAgencyLoaded value) getAllAgencyLoaded,
  }) {
    return getAllAgencyLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult? Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult? Function(_ExchangeLoading value)? exchangeLoading,
    TResult? Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult? Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult? Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
  }) {
    return getAllAgencyLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult Function(_ExchangeLoading value)? exchangeLoading,
    TResult Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (getAllAgencyLoading != null) {
      return getAllAgencyLoading(this);
    }
    return orElse();
  }
}

abstract class _GetAllAgencyLoading implements AgencyState {
  const factory _GetAllAgencyLoading() = _$GetAllAgencyLoadingImpl;
}

/// @nodoc
abstract class _$$GetAllAgencyLoadedImplCopyWith<$Res> {
  factory _$$GetAllAgencyLoadedImplCopyWith(_$GetAllAgencyLoadedImpl value,
          $Res Function(_$GetAllAgencyLoadedImpl) then) =
      __$$GetAllAgencyLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Agency> agency});
}

/// @nodoc
class __$$GetAllAgencyLoadedImplCopyWithImpl<$Res>
    extends _$AgencyStateCopyWithImpl<$Res, _$GetAllAgencyLoadedImpl>
    implements _$$GetAllAgencyLoadedImplCopyWith<$Res> {
  __$$GetAllAgencyLoadedImplCopyWithImpl(_$GetAllAgencyLoadedImpl _value,
      $Res Function(_$GetAllAgencyLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agency = null,
  }) {
    return _then(_$GetAllAgencyLoadedImpl(
      null == agency
          ? _value._agency
          : agency // ignore: cast_nullable_to_non_nullable
              as List<Agency>,
    ));
  }
}

/// @nodoc

class _$GetAllAgencyLoadedImpl implements _GetAllAgencyLoaded {
  const _$GetAllAgencyLoadedImpl(final List<Agency> agency) : _agency = agency;

  final List<Agency> _agency;
  @override
  List<Agency> get agency {
    if (_agency is EqualUnmodifiableListView) return _agency;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_agency);
  }

  @override
  String toString() {
    return 'AgencyState.getAllAgencyLoaded(agency: $agency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllAgencyLoadedImpl &&
            const DeepCollectionEquality().equals(other._agency, _agency));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_agency));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllAgencyLoadedImplCopyWith<_$GetAllAgencyLoadedImpl> get copyWith =>
      __$$GetAllAgencyLoadedImplCopyWithImpl<_$GetAllAgencyLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String err) error,
    required TResult Function(AgencyInfo agencyInfo) getAgencyInfoSuccess,
    required TResult Function() getAgencyInfoLoading,
    required TResult Function() exchangeLoading,
    required TResult Function(num valueExchanged) exchangeSuccess,
    required TResult Function() getAllAgencyLoading,
    required TResult Function(List<Agency> agency) getAllAgencyLoaded,
  }) {
    return getAllAgencyLoaded(agency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String err)? error,
    TResult? Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult? Function()? getAgencyInfoLoading,
    TResult? Function()? exchangeLoading,
    TResult? Function(num valueExchanged)? exchangeSuccess,
    TResult? Function()? getAllAgencyLoading,
    TResult? Function(List<Agency> agency)? getAllAgencyLoaded,
  }) {
    return getAllAgencyLoaded?.call(agency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String err)? error,
    TResult Function(AgencyInfo agencyInfo)? getAgencyInfoSuccess,
    TResult Function()? getAgencyInfoLoading,
    TResult Function()? exchangeLoading,
    TResult Function(num valueExchanged)? exchangeSuccess,
    TResult Function()? getAllAgencyLoading,
    TResult Function(List<Agency> agency)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (getAllAgencyLoaded != null) {
      return getAllAgencyLoaded(agency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_GetAgencyInfoSuccess value) getAgencyInfoSuccess,
    required TResult Function(_GetAgencyInfoLoading value) getAgencyInfoLoading,
    required TResult Function(_ExchangeLoading value) exchangeLoading,
    required TResult Function(_ExchangeSuccess value) exchangeSuccess,
    required TResult Function(_GetAllAgencyLoading value) getAllAgencyLoading,
    required TResult Function(_GetAllAgencyLoaded value) getAllAgencyLoaded,
  }) {
    return getAllAgencyLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Error value)? error,
    TResult? Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult? Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult? Function(_ExchangeLoading value)? exchangeLoading,
    TResult? Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult? Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult? Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
  }) {
    return getAllAgencyLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_GetAgencyInfoSuccess value)? getAgencyInfoSuccess,
    TResult Function(_GetAgencyInfoLoading value)? getAgencyInfoLoading,
    TResult Function(_ExchangeLoading value)? exchangeLoading,
    TResult Function(_ExchangeSuccess value)? exchangeSuccess,
    TResult Function(_GetAllAgencyLoading value)? getAllAgencyLoading,
    TResult Function(_GetAllAgencyLoaded value)? getAllAgencyLoaded,
    required TResult orElse(),
  }) {
    if (getAllAgencyLoaded != null) {
      return getAllAgencyLoaded(this);
    }
    return orElse();
  }
}

abstract class _GetAllAgencyLoaded implements AgencyState {
  const factory _GetAllAgencyLoaded(final List<Agency> agency) =
      _$GetAllAgencyLoadedImpl;

  List<Agency> get agency;
  @JsonKey(ignore: true)
  _$$GetAllAgencyLoadedImplCopyWith<_$GetAllAgencyLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
