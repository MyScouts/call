import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../enums/enums.dart';

part 'transaction_history.freezed.dart';

part 'transaction_history.g.dart';

@freezed
class TransactionHistoryFilter with _$TransactionHistoryFilter {
  const factory TransactionHistoryFilter({
    @Default([]) List<TransactionHistoryType> transactionType,
    @Default([]) List<TransactionHistoryStatus> status,
    // ignore: invalid_annotation_target
    @JsonKey(toJson: dateTimeToString) DateTime? date,
  }) = _TransactionHistoryFilter;

  factory TransactionHistoryFilter.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFilterFromJson(json);
}

String dateTimeToString(DateTime? dateTime) {
  final engine = DateFormat('MM-yyyy');

  if (dateTime != null) {
    return engine.format(dateTime);
  }

  return engine.format(DateTime.now());
}
