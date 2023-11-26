import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../enums/enums.dart';

part 'diamond_transaction_history.freezed.dart';

part 'diamond_transaction_history.g.dart';

@freezed
class DiamondTransactionHistoryFilter with _$DiamondTransactionHistoryFilter {
  const factory DiamondTransactionHistoryFilter({
    @Default([]) List<DiamondTransactionHistoryType> transactionType,
    @Default([]) List<DiamondTransactionHistoryStatus> status,
    // ignore: invalid_annotation_target
    @JsonKey(toJson: _dateTimeToString) DateTime? date,
  }) = _DiamondTransactionHistoryFilter;

  factory DiamondTransactionHistoryFilter.fromJson(Map<String, dynamic> json) =>
      _$DiamondTransactionHistoryFilterFromJson(json);
}

String _dateTimeToString(DateTime? dateTime) {
  final engine = DateFormat('MM-yyyy');

  if (dateTime != null) {
    return engine.format(dateTime);
  }

  return engine.format(DateTime.now());
}
