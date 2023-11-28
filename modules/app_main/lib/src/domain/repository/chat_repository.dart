import 'package:app_main/src/core/networking/items_response.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';

abstract class ChatRepository {
  Future<ItemsResponse<ConversationModel>> getConversations({
    required int page,
    required int pageSize,
  });

  Future<ItemsResponse<ConversationModel>> createConversations({
    required NewConversationsPayload payload,
  });

  Future<ConversationModel> getConversationsDetail({
    required int conversationId,
  });

  Future<ResultModel> deleteConversations({
    required int conversationId,
  });

  Future<ResultModel> realAllConversations({
    required int conversationId,
  });

  Future<ResultModel> newMessage({
    required int conversationId,
    required NewMessagePayload payload,
  });

  Future<ItemsResponse<MessageModel>> getMessages({
    required int conversationId,
    required int page,
    required int pageSize,
  });
}
