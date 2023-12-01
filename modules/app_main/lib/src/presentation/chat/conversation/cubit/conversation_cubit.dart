import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/networking/items_response.dart';
import 'package:app_main/src/domain/entities/chat/conversation_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/usecases/chat_usecase.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class ConversationCubit extends Cubit<ConversationState> {
  ConversationCubit(this._chatUseCase) : super(const ConversationState.loading());
  final int kPageSize = 20;
  final ChatUseCase _chatUseCase;

  Future<void> init() async {
    try {
      emit(const ConversationState.loading());
      final FriendResponseModel friendResponse =
          await _chatUseCase.getFriends(page: 1, pageSize: kPageSize);
      final ItemsResponse<ConversationModel> conversationResponse =
          await _chatUseCase.getConversations(page: 1, pageSize: kPageSize);
      emit(ConversationStateData(
          conversations: conversationResponse.items ?? [],
          friends: friendResponse.friends,
          pageFriend: 1,
          pageConversation: 1,
          canLoadMoreFriend: friendResponse.friends.length == kPageSize,
          canLoadMoreConversation: conversationResponse.items?.length == kPageSize));
    } catch (e) {
      emit(ConversationState.error(e));
    }
  }

  Future<void> loadMoreFriend() async {
    state.mapOrNull((value) async {
      int page = value.pageFriend + 1;
      final FriendResponseModel friendResponse =
          await _chatUseCase.getFriends(page: page, pageSize: kPageSize);
      emit(value.copyWith(
        friends: [...value.friends, ...friendResponse.friends],
        pageFriend: page,
        canLoadMoreFriend: friendResponse.friends.length == kPageSize,
      ));
    });
  }

  Future<void> loadMoreConversation() async {
    state.mapOrNull((value) async {
      int page = value.pageConversation + 1;
      final ItemsResponse<ConversationModel> conversationResponse =
          await _chatUseCase.getConversations(page: page, pageSize: kPageSize);
      emit(value.copyWith(
        conversations: [...value.conversations, ...conversationResponse.items ?? []],
        pageFriend: page,
        canLoadMoreConversation: conversationResponse.items?.length == kPageSize,
      ));
    });
  }
}
