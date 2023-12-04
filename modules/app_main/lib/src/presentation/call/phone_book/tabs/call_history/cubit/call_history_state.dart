import 'package:app_main/src/domain/entities/call/call_history_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'call_history_state.freezed.dart';

@freezed
abstract class CallHistoryState with _$CallHistoryState {
  const factory CallHistoryState(
      {required List<CallHistoryModel> data,
      required bool canLoadMore,
      required int page}) = CallHistoryStateData;
  const factory CallHistoryState.loading() = CallHistoryStateLoading;
  const factory CallHistoryState.error(dynamic error) = CallHistoryStateError;
}
