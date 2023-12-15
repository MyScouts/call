import 'package:app_main/src/core/networking/items_response.dart';
import 'package:app_main/src/data/data_sources/remote/chat_api.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/domain/entities/chat/conversation_detail_response_model.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/domain/entities/chat/member_list_model.dart';
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
  Future<ResultModel> createConversations({required NewConversationsPayload payload}) async {
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
  Future<ConversationDetailResponseModel> getConversationsDetail(
      {required int conversationId}) async {
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

  @override
  Future<MemberListModel> addMember(
      {required int conversationId, required List<int> userIds}) async {
    return await _chatApi.addMember(conversationId: conversationId, userIds: {'userIds': userIds});
  }

  @override
  Future<ResultModel> assignBoss({required int conversationId, required int memberId}) async {
    return await _chatApi
        .assignBoss(conversationId: conversationId, memberId: {'memberId': memberId});
  }

  @override
  Future<ResultModel> assignSecondBoss({required int conversationId, required int memberId}) async {
    return await _chatApi
        .assignSecondBoss(conversationId: conversationId, memberId: {'memberId': memberId});
  }

  @override
  Future<ResultModel> deleteMessage(
      {required String messagesId, required int conversationId}) async {
    return await _chatApi.deleteMessage(messagesId: messagesId, conversationId: conversationId);
  }

  @override
  Future<MemberListModel> getAdmins({required int conversationId}) async {
    return await _chatApi.getAdmins(conversationId: conversationId);
  }

  @override
  Future<ResultModel> kickMember(
      {required int conversationId, required int memberId, required bool isNotice}) async {
    return await _chatApi.kickMember(
        conversationId: conversationId, data: {'memberId': memberId, 'isNotice': isNotice});
  }

  @override
  Future<ResultModel> leaveChat({required int conversationId, required bool isNotice}) async {
    return await _chatApi
        .leaveChat(conversationId: conversationId, isNotice: {'isNotice': isNotice});
  }

  @override
  Future<ResultModel> renameConversation(
      {required int conversationId, required String name}) async {
    return await _chatApi.renameConversation(conversationId: conversationId, name: {'name': name});
  }

  @override
  Future<ResultModel> revokeMessage(
      {required String messagesId, required int conversationId}) async {
    return await _chatApi.revokeMessage(messagesId: messagesId, conversationId: conversationId);
  }

  @override
  Future<ResultModel> revokeSecondBoos({required int conversationId, required int memberId}) async {
    return await _chatApi
        .revokeSecondBoos(conversationId: conversationId, memberId: {'memberId': memberId});
  }

  @override
  Future<MemberListModel> getMembers({required int conversationId}) async {
    return await _chatApi.getMembers(conversationId: conversationId);
  }

}
