import 'package:app_main/src/core/networking/items_response.dart';
import 'package:app_main/src/data/data_sources/remote/chat_api.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/domain/entities/chat/conversation_detail_response_model.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:app_main/src/domain/repository/chat_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl extends ChatRepository {
  final ChatApi _chatApi;

  ChatRepositoryImpl(
    this._chatApi,
  );

  @override
  Future<ResultModel> createConversations(
      {required NewConversationsPayload payload}) async {
    return await _chatApi.createConversations(payload: payload);
  }

  @override
  Future<ResultModel> deleteConversations({required int conversationId}) async {
    return await _chatApi.deleteConversations(conversationId: conversationId);
  }

  @override
  Future<ItemsResponse<ConversationModel>> getConversations(
      {required int page, required int pageSize}) async {
    return await _chatApi.getConversations(page: page, pageSize: pageSize);
  }

  @override
  Future<ConversationDetailResponseModel> getConversationsDetail({required int conversationId}) async {
    return await _chatApi.getConversationsDetail(conversationId: conversationId);
  }

  @override
  Future<ItemsResponse<MessageModel>> getMessages(
      {required int conversationId, required int page, required int pageSize}) async {
    return await _chatApi.getMessages(
        conversationId: conversationId, page: page, pageSize: pageSize);
  }

  @override
  Future<MessageModel> newMessage(
      {required int conversationId, required NewMessagePayload payload}) async {
    return await _chatApi.newMessage(conversationId: conversationId, payload: payload);
  }

  @override
  Future<ResultModel> realAllConversations({required int conversationId}) async {
    return await _chatApi.realAllConversations(conversationId: conversationId);
  }
}
