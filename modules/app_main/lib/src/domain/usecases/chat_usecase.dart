import 'package:app_main/src/core/networking/items_response.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/repository/chat_repository.dart';
import 'package:app_main/src/domain/repository/friend_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatUseCase {
  final ChatRepository _chatRepository;
  final FriendRepository _friendRepository;

  ChatUseCase(this._chatRepository, this._friendRepository);

  Future<FriendResponseModel> getFriends({
    required int page,
    required int pageSize,
  }) {
    return _friendRepository.getFriends(page: page, pageSize: pageSize);
  }

  Future<ItemsResponse<ConversationModel>> getConversations({
    required int page,
    required int pageSize,
  }) {
    return _chatRepository.getConversations(page: page, pageSize: pageSize);
  }

  Future<ItemsResponse<ConversationModel>> createConversations({
    required NewConversationsPayload payload,
  }) {
    return _chatRepository.createConversations(payload: payload);
  }

  Future<ConversationModel> getConversationsDetail({
    required int conversationId,
  }) {
    return _chatRepository.getConversationsDetail(conversationId: conversationId);
  }

  Future<ResultModel> deleteConversations({
    required int conversationId,
  }) {
    return _chatRepository.deleteConversations(conversationId: conversationId);
  }

  Future<ResultModel> realAllConversations({
    required int conversationId,
  }) {
    return _chatRepository.realAllConversations(conversationId: conversationId);
  }

  Future<ResultModel> newMessage({
    required int conversationId,
    required NewMessagePayload payload,
  }) {
    return _chatRepository.newMessage(conversationId: conversationId, payload: payload);
  }

  Future<ItemsResponse<MessageModel>> getMessages({
    required int conversationId,
    required int page,
    required int pageSize,
  }) {
    return _chatRepository.getMessages(
        conversationId: conversationId, page: page, pageSize: pageSize);
  }
}
