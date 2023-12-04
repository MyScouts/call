import 'package:app_main/src/core/networking/items_response.dart';
import 'package:app_main/src/data/data_sources/remote/chat_api.dart';
import 'package:app_main/src/data/data_sources/remote/friend_api.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/repository/chat_repository.dart';
import 'package:app_main/src/domain/repository/friend_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FriendRepository)
class FriendRepositoryImpl extends FriendRepository {
  final FriendApi _friendApi;

  FriendRepositoryImpl(
    this._friendApi,
  );
  @override
  Future<FriendResponseModel> getFriends({required int page, required int pageSize}) async {
    return await _friendApi.getConversations(page: page, pageSize: pageSize);
  }
}
