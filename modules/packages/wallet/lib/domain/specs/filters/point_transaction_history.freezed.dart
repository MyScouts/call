// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'point_transaction_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointTransactionHistoryFilter _$PointTransactionHistoryFilterFromJson(
    Map<String, dynamic> json) {
  return _PointTransactionHistoryFilter.fromJson(json);
}

/// @nodoc
mixin _$PointTransactionHistoryFilter {
  List<PointTransactionHistoryType> get transactionType =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(toJson: _dateTimeToString)
  DateTime? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointTransactionHistoryFilterCopyWith<PointTransactionHistoryFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointTransactionHistoryFilterCopyWith<$Res> {
  factory $PointTransactionHistoryFilterCopyWith(
          PointTransactionHistoryFilter value,
          $Res Function(PointTransactionHistoryFilter) then) =
      _$PointTransactionHistoryFilterCopyWithImpl<$Res,
          PointTransactionHistoryFilter>;
  @useResult
  $Res call(
      {List<PointTransactionHistoryType> transactionType,
      @JsonKey(toJson: _dateTimeToString) DateTime? date});
}

/// @nodoc
class _$PointTransactionHistoryFilterCopyWithImpl<$Res,
        $Val extends PointTransactionHistoryFilter>
    implements $PointTransactionHistoryFilterCopyWith<$Res> {
  _$PointTransactionHistoryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = null,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as List<PointTransactionHistoryType>,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointTransactionHistoryFilterImplCopyWith<$Res>
    implements $PointTransactionHistoryFilterCopyWith<$Res> {
  factory _$$PointTransactionHistoryFilterImplCopyWith(
          _$PointTransactionHistoryFilterImpl value,
          $Res Function(_$PointTransactionHistoryFilterImpl) then) =
      __$$PointTransactionHistoryFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PointTransactionHistoryType> transactionType,
      @JsonKey(toJson: _dateTimeToString) DateTime? date});
}

/// @nodoc
class __$$PointTransactionHistoryFilterImplCopyWithImpl<$Res>
    extends _$PointTransactionHistoryFilterCopyWithImpl<$Res,
        _$PointTransactionHistoryFilterImpl>
    implements _$$PointTransactionHistoryFilterImplCopyWith<$Res> {
  __$$PointTransactionHistoryFilterImplCopyWithImpl(
      _$PointTransactionHistoryFilterImpl _value,
      $Res Function(_$PointTransactionHistoryFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = null,
    Object? date = freezed,
  }) {
    return _then(_$PointTransactionHistoryFilterImpl(
      transactionType: null == transactionType
          ? _value._transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as List<PointTransactionHistoryType>,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PointTransactionHistoryFilterImpl
    implements _PointTransactionHistoryFilter {
  const _$PointTransactionHistoryFilterImpl(
      {final List<PointTransactionHistoryType> transactionType = const [],
      @JsonKey(toJson: _dateTimeToString) this.date})
      : _transactionType = transactionType;

  factory _$PointTransactionHistoryFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PointTransactionHistoryFilterImplFromJson(json);

  final List<PointTransactionHistoryType> _transactionType;
  @override
  @JsonKey()
  List<PointTransactionHistoryType> get transactionType {
    if (_transactionType is EqualUnmodifiableListView) return _transactionType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionType);
  }

// ignore: invalid_annotation_target
  @override
  @JsonKey(toJson: _dateTimeToString)
  final DateTime? date;

  @override
  String toString() {
    return 'PointTransactionHistoryFilter(transactionType: $transactionType, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointTransactionHistoryFilterImpl &&
            const DeepCollectionEquality()
                .equals(other._transactionType, _transactionType) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactionType), date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PointTransactionHistoryFilterImplCopyWith<
          _$PointTransactionHistoryFilterImpl>
      get copyWith => __$$PointTransactionHistoryFilterImplCopyWithImpl<
          _$PointTransactionHistoryFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointTransactionHistoryFilterImplToJson(
      this,
    );
  }
}

abstract class _PointTransactionHistoryFilter
    implements PointTransactionHistoryFilter {
  const factory _PointTransactionHistoryFilter(
          {final List<PointTransactionHistoryType> transactionType,
          @JsonKey(toJson: _dateTimeToString) final DateTime? date}) =
      _$PointTransactionHistoryFilterImpl;

  factory _PointTransactionHistoryFilter.fromJson(Map<String, dynamic> json) =
      _$PointTransactionHistoryFilterImpl.fromJson;

  @override
  List<PointTransactionHistoryType> get transactionType;
  @override // ignore: invalid_annotation_target
  @JsonKey(toJson: _dateTimeToString)
  DateTime? get date;
  @override
  @JsonKey(ignore: true)
  _$$PointTransactionHistoryFilterImplCopyWith<
          _$PointTransactionHistoryFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
