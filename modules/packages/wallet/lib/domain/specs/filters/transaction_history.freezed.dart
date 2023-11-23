// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionHistoryFilter _$TransactionHistoryFilterFromJson(
    Map<String, dynamic> json) {
  return _TransactionHistoryFilter.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistoryFilter {
  List<TransactionHistoryType> get transactionType =>
      throw _privateConstructorUsedError;
  List<TransactionHistoryStatus> get status =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(toJson: dateTimeToString)
  DateTime? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryFilterCopyWith<TransactionHistoryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryFilterCopyWith<$Res> {
  factory $TransactionHistoryFilterCopyWith(TransactionHistoryFilter value,
          $Res Function(TransactionHistoryFilter) then) =
      _$TransactionHistoryFilterCopyWithImpl<$Res, TransactionHistoryFilter>;
  @useResult
  $Res call(
      {List<TransactionHistoryType> transactionType,
      List<TransactionHistoryStatus> status,
      @JsonKey(toJson: dateTimeToString) DateTime? date});
}

/// @nodoc
class _$TransactionHistoryFilterCopyWithImpl<$Res,
        $Val extends TransactionHistoryFilter>
    implements $TransactionHistoryFilterCopyWith<$Res> {
  _$TransactionHistoryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = null,
    Object? status = null,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistoryType>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistoryStatus>,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionHistoryFilterImplCopyWith<$Res>
    implements $TransactionHistoryFilterCopyWith<$Res> {
  factory _$$TransactionHistoryFilterImplCopyWith(
          _$TransactionHistoryFilterImpl value,
          $Res Function(_$TransactionHistoryFilterImpl) then) =
      __$$TransactionHistoryFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionHistoryType> transactionType,
      List<TransactionHistoryStatus> status,
      @JsonKey(toJson: dateTimeToString) DateTime? date});
}

/// @nodoc
class __$$TransactionHistoryFilterImplCopyWithImpl<$Res>
    extends _$TransactionHistoryFilterCopyWithImpl<$Res,
        _$TransactionHistoryFilterImpl>
    implements _$$TransactionHistoryFilterImplCopyWith<$Res> {
  __$$TransactionHistoryFilterImplCopyWithImpl(
      _$TransactionHistoryFilterImpl _value,
      $Res Function(_$TransactionHistoryFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = null,
    Object? status = null,
    Object? date = freezed,
  }) {
    return _then(_$TransactionHistoryFilterImpl(
      transactionType: null == transactionType
          ? _value._transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistoryType>,
      status: null == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistoryStatus>,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionHistoryFilterImpl implements _TransactionHistoryFilter {
  const _$TransactionHistoryFilterImpl(
      {final List<TransactionHistoryType> transactionType = const [],
      final List<TransactionHistoryStatus> status = const [],
      @JsonKey(toJson: dateTimeToString) this.date})
      : _transactionType = transactionType,
        _status = status;

  factory _$TransactionHistoryFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionHistoryFilterImplFromJson(json);

  final List<TransactionHistoryType> _transactionType;
  @override
  @JsonKey()
  List<TransactionHistoryType> get transactionType {
    if (_transactionType is EqualUnmodifiableListView) return _transactionType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionType);
  }

  final List<TransactionHistoryStatus> _status;
  @override
  @JsonKey()
  List<TransactionHistoryStatus> get status {
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_status);
  }

// ignore: invalid_annotation_target
  @override
  @JsonKey(toJson: dateTimeToString)
  final DateTime? date;

  @override
  String toString() {
    return 'TransactionHistoryFilter(transactionType: $transactionType, status: $status, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionHistoryFilterImpl &&
            const DeepCollectionEquality()
                .equals(other._transactionType, _transactionType) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactionType),
      const DeepCollectionEquality().hash(_status),
      date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionHistoryFilterImplCopyWith<_$TransactionHistoryFilterImpl>
      get copyWith => __$$TransactionHistoryFilterImplCopyWithImpl<
          _$TransactionHistoryFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionHistoryFilterImplToJson(
      this,
    );
  }
}

abstract class _TransactionHistoryFilter implements TransactionHistoryFilter {
  const factory _TransactionHistoryFilter(
          {final List<TransactionHistoryType> transactionType,
          final List<TransactionHistoryStatus> status,
          @JsonKey(toJson: dateTimeToString) final DateTime? date}) =
      _$TransactionHistoryFilterImpl;

  factory _TransactionHistoryFilter.fromJson(Map<String, dynamic> json) =
      _$TransactionHistoryFilterImpl.fromJson;

  @override
  List<TransactionHistoryType> get transactionType;
  @override
  List<TransactionHistoryStatus> get status;
  @override // ignore: invalid_annotation_target
  @JsonKey(toJson: dateTimeToString)
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$TransactionHistoryFilterImplCopyWith<_$TransactionHistoryFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
