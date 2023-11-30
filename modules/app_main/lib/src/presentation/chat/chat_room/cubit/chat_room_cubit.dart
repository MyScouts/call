import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:app_main/src/domain/usecases/chat_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatRoomCubit extends Cubit<ChatRoomState> {
  ChatRoomCubit(this._chatUseCase, this._userUsecase) : super(const ChatRoomState.loading());

  final int kPageSize = 10;
  final ChatUseCase _chatUseCase;
  final UserUsecase _userUsecase;
  late final int _conversationId;

  Future<void> init({int? conversationId, int? memberId}) async {
    try {
      if (conversationId == null && memberId != null) {
        final User? user = await _userUsecase.geSynctUserById(memberId);
        final ResultModel newConversation = await _chatUseCase.createConversations(
          payload: NewConversationsPayload(
            name: user.getdisplayName,
            type: 1,
            memberIds: [memberId],
          ),
        );
        final conversationIdDetail =
            await _chatUseCase.getConversationsDetail(conversationId: newConversation.result);
        _conversationId = newConversation.result;
        final response = await _chatUseCase.getMessages(
            conversationId: newConversation.result as int, page: 1, pageSize: kPageSize);
        emit(ChatRoomStateData(
          messages: response.items ?? [],
          conversation: conversationIdDetail,
          page: 1,
          canLoadMore: response.items?.length == kPageSize,
        ));
      } else {
        _conversationId = conversationId!;
        final conversationIdDetail =
            await _chatUseCase.getConversationsDetail(conversationId: _conversationId);
        final response = await _chatUseCase.getMessages(
            conversationId: conversationId, page: 1, pageSize: kPageSize);
        emit(ChatRoomStateData(
            messages: response.items ?? [],
            conversation: conversationIdDetail,
            page: 1,
            canLoadMore: response.items?.length == kPageSize));
      }
    } catch (e) {
      emit(ChatRoomState.error(e));
    }
  }

  Future<void> loadMore() async {
    state.mapOrNull((value) async {
      int page = value.page + 1;
      final response = await _chatUseCase.getMessages(
          conversationId: _conversationId, page: page, pageSize: kPageSize);
      emit(value.copyWith(
        messages: [...value.messages, ...response.items ?? []],
        page: page,
        canLoadMore: response.items?.length == kPageSize,
      ));
    });
  }

  Future<void> sendMessage(String message) async {
    try {
      final MessageModel messageModel = await _chatUseCase.newMessage(
          conversationId: _conversationId, payload: NewMessagePayload(message: message));
      state.mapOrNull((value) async {
        emit(value.copyWith(
          messages: [...value.messages, messageModel]
        ));
        // emit(ChatRoomStateData(
        //     messages: [...value.messages, _message],
        //     conversation: value.conversation,
        //     page: value.page,
        //     loadMoreError: value.loadMoreError,
        //     canLoadMore: value.canLoadMore));
      });
    } catch (e) {
      emit(ChatRoomState.error(e));
    }
  }
}
