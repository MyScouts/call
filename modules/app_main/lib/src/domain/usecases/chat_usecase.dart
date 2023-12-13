import 'package:app_main/src/core/networking/items_response.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/domain/entities/chat/conversation_detail_response_model.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/domain/entities/chat/member_list_model.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_status_model.dart';
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

  Future<ResultModel> createConversations({
    required NewConversationsPayload payload,
  }) {
    return _chatRepository.createConversations(payload: payload);
  }

  Future<ConversationDetailResponseModel> getConversationsDetail({
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

  Future<MessageModel> newMessage({
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

  Future<FriendStatusModel> getFriendStatus({required int userId}) {
    return _friendRepository.getFriendStatus(userId: userId);
  }

  Future<MemberListModel> addMember({
    required int conversationId,
    required List<int> userIds,
  }) {
    return _chatRepository.addMember(conversationId: conversationId, userIds: userIds);
  }

  Future<MemberListModel> getAdmins({
    required int conversationId,
  }) {
    return _chatRepository.getAdmins(conversationId: conversationId);
  }

  Future<ResultModel> renameConversation({
    required int conversationId,
    required String name,
  }) {
    return _chatRepository.renameConversation(conversationId: conversationId, name: name);
  }

  Future<ResultModel> leaveChat({
    required int conversationId,
    required bool isNotice,
  }) {
    return _chatRepository.leaveChat(conversationId: conversationId, isNotice: isNotice);
  }

  Future<ResultModel> assignBoss({
    required int conversationId,
    required int memberId,
  }) {
    return _chatRepository.assignBoss(conversationId: conversationId, memberId: memberId);
  }

  Future<ResultModel> assignSecondBoss({
    required int conversationId,
    required int memberId,
  }) {
    return _chatRepository.assignSecondBoss(conversationId: conversationId, memberId: memberId);
  }

  Future<ResultModel> revokeSecondBoos({
    required int conversationId,
    required int memberId,
  }) {
    return _chatRepository.revokeSecondBoos(conversationId: conversationId, memberId: memberId);
  }

  Future<ResultModel> kickMember({
    required int conversationId,
    required int memberId,
    required bool isNotice,
  }) {
    return _chatRepository.kickMember(
        conversationId: conversationId, memberId: memberId, isNotice: isNotice);
  }

  Future<ResultModel> deleteMessage({
    required String messagesId,
    required int conversationId,
  }) {
    return _chatRepository.deleteMessage(messagesId: messagesId, conversationId: conversationId);
  }

  Future<ResultModel> revokeMessage({
    required String messagesId,
    required int conversationId,
  }) {
    return _chatRepository.revokeMessage(messagesId: messagesId, conversationId: conversationId);
  }
}
