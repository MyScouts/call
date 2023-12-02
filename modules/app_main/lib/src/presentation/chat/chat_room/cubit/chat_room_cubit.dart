import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/chat/message_dto.dart';
import 'package:app_main/src/data/models/responses/chat/meta_data_dto.dart';
import 'package:app_main/src/data/repositories/media_picker.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:app_main/src/domain/usecases/chat_usecase.dart';
import 'package:app_main/src/domain/usecases/community_usecase.dart';
import 'package:app_main/src/domain/usecases/upgrade_account_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChatRoomCubit extends Cubit<ChatRoomState> {
  ChatRoomCubit(this._chatUseCase, this._userUsecase, this.upgradeAccountUsecase, this.mediaPicker)
      : super(const ChatRoomState.loading());

  final int kPageSize = 20;
  final ChatUseCase _chatUseCase;
  final UserUsecase _userUsecase;
  final MediaPicker mediaPicker;
  final UpgradeAccountUsecase upgradeAccountUsecase;
  late int _conversationId;

  Future<void> init({int? conversationId, int? memberId}) async {
    try {
      emit(const ChatRoomState.loading());
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
      _chatUseCase.newMessage(
          conversationId: _conversationId, payload: NewMessagePayload(message: message));
    } catch (e) {
      emit(ChatRoomState.error(e));
    }
  }

  void updateMessage(MessageModel message) {
    state.mapOrNull((value) async {
      if (_conversationId == message.conversationId) {
        emit(value.copyWith(messages: [message, ...value.messages]));
      }
    });
  }

  void readMessage() async {
    await _chatUseCase.realAllConversations(conversationId: _conversationId);
  }

  Future<void> deleteConversation() async {
    await _chatUseCase.deleteConversations(conversationId: _conversationId);
  }

  Future<void> blockUser(int userId) async {
    await _userUsecase.blockUser(userId: userId);
  }

  Future<void> reportUser(int userId, String content) async {
    await _userUsecase.reportUser(userId: userId, payload: ReportUserPayload(content: content));
  }

  Future<void> sendImage() async {
    final files = await mediaPicker.pickImagesFromGallery();
    if (files == null) return;
    final file = files.first;

    if (file == null) return;

    final uploadImage = await upgradeAccountUsecase.uploadBirthCer(
      XFile(file.path),
      'image',
    );
    await _chatUseCase.newMessage(
        conversationId: _conversationId,
        payload: NewMessagePayload(metadata: MetaDataDto(images: [uploadImage])));
  }
}
