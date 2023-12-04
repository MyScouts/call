import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'conversation_state.freezed.dart';

@freezed
abstract class ConversationState with _$ConversationState {
  const factory ConversationState({
    required List<ConversationModel> conversations,
    required List<MemberModel> friends,
    required int pageFriend,
    required int pageConversation,
    required bool canLoadMoreFriend,
    required bool canLoadMoreConversation,
  }) = ConversationStateData;
  const factory ConversationState.loading() = ConversationStateLoading;
  const factory ConversationState.error(dynamic error) = ConversationStateError;
}
