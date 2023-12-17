import 'package:app_main/src/core/networking/items_response.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/domain/entities/chat/conversation_detail_response_model.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/domain/entities/chat/member_list_model.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';

abstract class ChatRepository {
  Future<ItemsResponse<ConversationModel>> getConversations({
    required int page,
    required int pageSize,
  });

  Future<ResultModel> createConversations({
    required NewConversationsPayload payload,
  });

  Future<ConversationDetailResponseModel> getConversationsDetail({
    required int conversationId,
  });

  Future<ResultModel> deleteConversations({
    required int conversationId,
  });

  Future<ResultModel> realAllConversations({
    required int conversationId,
  });

  Future<MessageModel> newMessage({
    required int conversationId,
    required NewMessagePayload payload,
  });

  Future<ItemsResponse<MessageModel>> getMessages({
    required int conversationId,
    required int page,
    required int pageSize,
  });

  Future<ResultModel> addMember({
    required int conversationId,
    required List<int> userIds,
  });

  Future<MemberListModel> getAdmins({
    required int conversationId,
  });

  Future<MemberListModel> getMembers({
    required int conversationId,
  });

  Future<ResultModel> renameConversation({
    required int conversationId,
    required String name,
  });

  Future<ResultModel> leaveChat({
    required int conversationId,
    required bool isNotice,
  });

  Future<ResultModel> assignBoss({
    required int conversationId,
    required int memberId,
  });

  Future<ResultModel> assignSecondBoss({
    required int conversationId,
    required int memberId,
  });

  Future<ResultModel> revokeSecondBoos({
    required int conversationId,
    required int memberId,
  });

  Future<ResultModel> kickMember({
    required int conversationId,
    required int memberId,
    required bool isNotice,
  });

  Future<ResultModel> deleteMessage({
    required String messagesId,
    required int conversationId,
  });

  Future<ResultModel> revokeMessage({
    required String messagesId,
    required int conversationId,
  });
}
