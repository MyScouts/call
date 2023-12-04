
import 'package:app_main/src/domain/entities/call/call_history_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'phone_book_detail_state.freezed.dart';

@freezed
abstract class PhoneBookDetailState with _$PhoneBookDetailState {
  const factory PhoneBookDetailState({
  required List<CallHistoryModel> data,
  required bool canLoadMore,
  required int page}) = PhoneBookDetailStateData;
  const factory PhoneBookDetailState.loading() = PhoneBookDetailStateLoading;
  const factory PhoneBookDetailState.error(dynamic error) = PhoneBookDetailStateError;
}