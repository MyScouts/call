import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../enums/enums.dart';

part 'point_transaction_history.freezed.dart';

part 'point_transaction_history.g.dart';

@freezed
class PointTransactionHistoryFilter with _$PointTransactionHistoryFilter {
  const factory PointTransactionHistoryFilter({
    @Default([]) List<PointTransactionHistoryType> transactionType,
    // ignore: invalid_annotation_target
    @JsonKey(toJson: _dateTimeToString) DateTime? date,
  }) = _PointTransactionHistoryFilter;

  factory PointTransactionHistoryFilter.fromJson(Map<String, dynamic> json) =>
      _$PointTransactionHistoryFilterFromJson(json);
}

String? _dateTimeToString(DateTime? dateTime) {
  final engine = DateFormat('MM-yyyy');

  if (dateTime != null) {
    return engine.format(dateTime);
  }

  return null;
}
