import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'new_message_state.freezed.dart';

@freezed
abstract class NewMessageState with _$NewMessageState {
  const factory NewMessageState({
    required List<MemberModel> friends,
    required int page,
    required bool canLoadMore,
    required String keySearch,
  }) = NewMessageStateData;
  const factory NewMessageState.loading() = NewMessageStateLoading;
  const factory NewMessageState.error(dynamic error) = NewMessageStateError;
}
