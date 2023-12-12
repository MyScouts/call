import 'package:app_main/src/core/networking/items_response.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/data/models/responses/chat/conversation_detail_response_dto.dart';
import 'package:app_main/src/data/models/responses/chat/conversation_dto.dart';
import 'package:app_main/src/data/models/responses/chat/member_list_dto.dart';
import 'package:app_main/src/data/models/responses/chat/message_dto.dart';
import 'package:app_main/src/data/models/responses/chat/result_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'chat_api.g.dart';

class ChatApiConstant {
  static const String getConversations = 'api/v1/chat/conversations';
  static const String detailConversations = 'api/v1/chat/conversations/{conversationId}';
  static const String readAllConversations =
      'api/v1/chat/conversations/{conversationId}/read-messages';
  static const String messages = 'api/v1/chat/conversations/{conversationId}/messages';
  static const String memberChat = 'api/v1/chat/conversations/{conversationId}/members';
  static const String memberAdmin = 'api/v1/chat/conversations/{conversationId}/admin-members';
  static const String rename = 'api/v1/chat/conversations/{conversationId}/rename';
  static const String leaveChat = 'api/v1/chat/conversations/{conversationId}/leave';
  static const String assignBoss = 'api/v1/chat/conversations/{conversationId}/assign-boss';
  static const String assignSecondBoss = 'api/v1/chat/conversations/{conversationId}/assign-second-boss';
  static const String revokeSecondBoos = 'api/v1/chat/conversations/{conversationId}/revoke-second-boss';
  static const String kickMember = 'api/v1/chat/conversations/{conversationId}/kick-member';
  static const String deleteMessage = 'api/v1/chat/messages/{messagesId}/delete';
  static const String revokeMessage = 'api/v1/chat/messages/{messagesId}/revoke';
}

@RestApi()
@injectable
abstract class ChatApi {
  @factoryMethod
  factory ChatApi(Dio dio) = _ChatApi;

  @GET(ChatApiConstant.getConversations)
  Future<ItemsResponse<ConversationDto>> getConversations({
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
  });

  @POST(ChatApiConstant.getConversations)
  Future<ResultDto> createConversations({
    @Body() required NewConversationsPayload payload,
  });

  @GET(ChatApiConstant.detailConversations)
  Future<ConversationDetailResponseDto> getConversationsDetail({
    @Path('conversationId') required int conversationId,
  });

  @DELETE(ChatApiConstant.detailConversations)
  Future<ResultDto> deleteConversations({
    @Path('conversationId') required int conversationId,
  });

  @PATCH(ChatApiConstant.readAllConversations)
  Future<ResultDto> realAllConversations({
    @Path('conversationId') required int conversationId,
  });

  @POST(ChatApiConstant.messages)
  Future<MessageDto> newMessage({
    @Path('conversationId') required int conversationId,
    @Body() required NewMessagePayload payload,
  });

  @GET(ChatApiConstant.messages)
  Future<ItemsResponse<MessageDto>> getMessages({
    @Path('conversationId') required int conversationId,
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
  });

  @GET(ChatApiConstant.memberChat)
  Future<MemberListDto> getMembers({
    @Path('conversationId') required int conversationId,
  });

  @POST(ChatApiConstant.memberChat)
  Future<MemberListDto> addMember({
    @Path('conversationId') required int conversationId,
    @Body() required Map<String, List<int>> userIds,
  });

  @GET(ChatApiConstant.memberAdmin)
  Future<MemberListDto> getAdmins({
    @Path('conversationId') required int conversationId,
  });

  @PATCH(ChatApiConstant.rename)
  Future<ResultDto> renameConversation({
    @Path('conversationId') required int conversationId,
    @Body() required Map<String, String> name,
  });

  @POST(ChatApiConstant.leaveChat)
  Future<ResultDto> leaveChat({
    @Path('conversationId') required int conversationId,
    @Body() required Map<String, bool> isNotice,
  });

  @POST(ChatApiConstant.assignBoss)
  Future<ResultDto> assignBoss({
    @Path('conversationId') required int conversationId,
    @Body() required Map<String, int> memberId,
  });

  @POST(ChatApiConstant.assignSecondBoss)
  Future<ResultDto> assignSecondBoss({
    @Path('conversationId') required int conversationId,
    @Body() required Map<String, int> memberId,
  });

 @POST(ChatApiConstant.revokeSecondBoos)
  Future<ResultDto> revokeSecondBoos({
    @Path('conversationId') required int conversationId,
    @Body() required Map<String, int> memberId,
  });

  @POST(ChatApiConstant.kickMember)
  Future<ResultDto> kickMember({
    @Path('conversationId') required int conversationId,
    @Body() required Map<String, dynamic> data,
  });


 @DELETE(ChatApiConstant.deleteMessage)
  Future<ResultDto> deleteMessage({
    @Path('messagesId') required String messagesId,
    @Query('conversationId') required int conversationId,
  });

  @DELETE(ChatApiConstant.revokeMessage)
  Future<ResultDto> revokeMessage({
    @Path('messagesId') required String messagesId,
    @Query('conversationId') required int conversationId,
  });

}
