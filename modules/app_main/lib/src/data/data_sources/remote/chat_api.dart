import 'package:app_main/src/core/networking/items_response.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/data/models/responses/chat/conversation_dto.dart';
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
  Future<ItemsResponse<ConversationDto>> createConversations({
    @Body() required NewConversationsPayload payload,
  });

  @GET(ChatApiConstant.detailConversations)
  Future<ConversationDto> getConversationsDetail({
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
  Future<ResultDto> newMessage({
    @Path('conversationId') required int conversationId,
    @Body() required NewMessagePayload payload,
  });

  @GET(ChatApiConstant.messages)
  Future<ItemsResponse<MessageDto>> getMessages({
    @Path('conversationId') required int conversationId,
    @Query('page') required int page,
    @Query('pageSize') required int pageSize,
  });
}
