import 'package:app_main/src/domain/entities/chat/conversation_detail_response_model.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_status_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_room_state.freezed.dart';

@freezed
abstract class ChatRoomState with _$ChatRoomState {
  const factory ChatRoomState(
      {required List<MessageModel> messages,
      required ConversationDetailResponseModel conversation,
      FriendStatusModel? friendStatus,
      required int page,
      required bool canLoadMore,
      bool? loadMoreError}) = ChatRoomStateData;
  const factory ChatRoomState.loading() = ChatRoomStateLoading;
  const factory ChatRoomState.error(dynamic error) = ChatRoomStateError;
}
