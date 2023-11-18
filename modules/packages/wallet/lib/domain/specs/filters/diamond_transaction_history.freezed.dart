// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diamond_transaction_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiamondTransactionHistoryFilter _$DiamondTransactionHistoryFilterFromJson(
    Map<String, dynamic> json) {
  return _DiamondTransactionHistoryFilter.fromJson(json);
}

/// @nodoc
mixin _$DiamondTransactionHistoryFilter {
  List<DiamondTransactionHistoryType> get transactionType =>
      throw _privateConstructorUsedError;
  List<DiamondTransactionHistoryStatus> get status =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(toJson: _dateTimeToString)
  DateTime? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiamondTransactionHistoryFilterCopyWith<DiamondTransactionHistoryFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiamondTransactionHistoryFilterCopyWith<$Res> {
  factory $DiamondTransactionHistoryFilterCopyWith(
          DiamondTransactionHistoryFilter value,
          $Res Function(DiamondTransactionHistoryFilter) then) =
      _$DiamondTransactionHistoryFilterCopyWithImpl<$Res,
          DiamondTransactionHistoryFilter>;
  @useResult
  $Res call(
      {List<DiamondTransactionHistoryType> transactionType,
      List<DiamondTransactionHistoryStatus> status,
      @JsonKey(toJson: _dateTimeToString) DateTime? date});
}

/// @nodoc
class _$DiamondTransactionHistoryFilterCopyWithImpl<$Res,
        $Val extends DiamondTransactionHistoryFilter>
    implements $DiamondTransactionHistoryFilterCopyWith<$Res> {
  _$DiamondTransactionHistoryFilterCopyWithImpl(this._value, this._then);

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
              as List<DiamondTransactionHistoryType>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<DiamondTransactionHistoryStatus>,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiamondTransactionHistoryFilterImplCopyWith<$Res>
    implements $DiamondTransactionHistoryFilterCopyWith<$Res> {
  factory _$$DiamondTransactionHistoryFilterImplCopyWith(
          _$DiamondTransactionHistoryFilterImpl value,
          $Res Function(_$DiamondTransactionHistoryFilterImpl) then) =
      __$$DiamondTransactionHistoryFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DiamondTransactionHistoryType> transactionType,
      List<DiamondTransactionHistoryStatus> status,
      @JsonKey(toJson: _dateTimeToString) DateTime? date});
}

/// @nodoc
class __$$DiamondTransactionHistoryFilterImplCopyWithImpl<$Res>
    extends _$DiamondTransactionHistoryFilterCopyWithImpl<$Res,
        _$DiamondTransactionHistoryFilterImpl>
    implements _$$DiamondTransactionHistoryFilterImplCopyWith<$Res> {
  __$$DiamondTransactionHistoryFilterImplCopyWithImpl(
      _$DiamondTransactionHistoryFilterImpl _value,
      $Res Function(_$DiamondTransactionHistoryFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = null,
    Object? status = null,
    Object? date = freezed,
  }) {
    return _then(_$DiamondTransactionHistoryFilterImpl(
      transactionType: null == transactionType
          ? _value._transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as List<DiamondTransactionHistoryType>,
      status: null == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<DiamondTransactionHistoryStatus>,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiamondTransactionHistoryFilterImpl
    implements _DiamondTransactionHistoryFilter {
  const _$DiamondTransactionHistoryFilterImpl(
      {final List<DiamondTransactionHistoryType> transactionType = const [],
      final List<DiamondTransactionHistoryStatus> status = const [],
      @JsonKey(toJson: _dateTimeToString) this.date})
      : _transactionType = transactionType,
        _status = status;

  factory _$DiamondTransactionHistoryFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DiamondTransactionHistoryFilterImplFromJson(json);

  final List<DiamondTransactionHistoryType> _transactionType;
  @override
  @JsonKey()
  List<DiamondTransactionHistoryType> get transactionType {
    if (_transactionType is EqualUnmodifiableListView) return _transactionType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionType);
  }

  final List<DiamondTransactionHistoryStatus> _status;
  @override
  @JsonKey()
  List<DiamondTransactionHistoryStatus> get status {
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_status);
  }

// ignore: invalid_annotation_target
  @override
  @JsonKey(toJson: _dateTimeToString)
  final DateTime? date;

  @override
  String toString() {
    return 'DiamondTransactionHistoryFilter(transactionType: $transactionType, status: $status, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiamondTransactionHistoryFilterImpl &&
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
  _$$DiamondTransactionHistoryFilterImplCopyWith<
          _$DiamondTransactionHistoryFilterImpl>
      get copyWith => __$$DiamondTransactionHistoryFilterImplCopyWithImpl<
          _$DiamondTransactionHistoryFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiamondTransactionHistoryFilterImplToJson(
      this,
    );
  }
}

abstract class _DiamondTransactionHistoryFilter
    implements DiamondTransactionHistoryFilter {
  const factory _DiamondTransactionHistoryFilter(
          {final List<DiamondTransactionHistoryType> transactionType,
          final List<DiamondTransactionHistoryStatus> status,
          @JsonKey(toJson: _dateTimeToString) final DateTime? date}) =
      _$DiamondTransactionHistoryFilterImpl;

  factory _DiamondTransactionHistoryFilter.fromJson(Map<String, dynamic> json) =
      _$DiamondTransactionHistoryFilterImpl.fromJson;

  @override
  List<DiamondTransactionHistoryType> get transactionType;
  @override
  List<DiamondTransactionHistoryStatus> get status;
  @override // ignore: invalid_annotation_target
  @JsonKey(toJson: _dateTimeToString)
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$DiamondTransactionHistoryFilterImplCopyWith<
          _$DiamondTransactionHistoryFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
