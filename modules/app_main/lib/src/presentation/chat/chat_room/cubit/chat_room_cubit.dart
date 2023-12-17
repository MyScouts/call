import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/data/models/payloads/chat/new_message_payload.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/chat/meta_data_dto.dart';
import 'package:app_main/src/data/repositories/media_picker.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/message_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_status_model.dart';
import 'package:app_main/src/domain/usecases/chat_usecase.dart';
import 'package:app_main/src/domain/usecases/upgrade_account_usecase.dart';
import 'package:app_main/src/domain/usecases/user_share_preferences_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/chat/chat_room/cubit/chat_room_state.dart';
import 'package:app_main/src/presentation/chat/conversation/cubit/conversation_cubit.dart';
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
        final FriendStatusModel friendStatus = await _chatUseCase.getFriendStatus(userId: memberId);
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
        emit(
          ChatRoomStateData(
            messages: response.items ?? [],
            conversation: conversationIdDetail,
            friendStatus: friendStatus,
            myType: conversationIdDetail.conversation.members
                    .firstWhereOrNull((element) =>
                        getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id ==
                        element.member.id)
                    ?.type ??
                0,
            page: 1,
            canLoadMore: response.items?.length == kPageSize,
          ),
        );
      } else {
        _conversationId = conversationId!;
        FriendStatusModel? friendStatus;
        final conversationIdDetail =
            await _chatUseCase.getConversationsDetail(conversationId: _conversationId);
        if (conversationIdDetail.conversation.type == 1) {
          friendStatus = await _chatUseCase.getFriendStatus(
              userId: conversationIdDetail.conversation.membersNotMe.first.member.id);
        }
        final response = await _chatUseCase.getMessages(
            conversationId: _conversationId, page: 1, pageSize: kPageSize);
        emit(
          ChatRoomStateData(
              messages: response.items ?? [],
              conversation: conversationIdDetail,
              friendStatus: friendStatus,
              myType: conversationIdDetail.conversation.members
                      .firstWhereOrNull((element) =>
                          getIt.get<UserSharePreferencesUsecase>().getUserInfo()?.id ==
                          element.member.id)
                      ?.type ??
                  0,
              page: 1,
              canLoadMore: response.items?.length == kPageSize),
        );
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
      if (_conversationId == message.conversationId &&
          value.messages.firstWhereOrNull((element) => element.messageId == message.messageId) ==
              null) {
        if (message.type != 3 && message.type != 2 && message.type != 11) {
          final conversationDetail =
              await _chatUseCase.getConversationsDetail(conversationId: _conversationId);
          emit(value
              .copyWith(conversation: conversationDetail, messages: [message, ...value.messages]));
        } else {
          emit(value.copyWith(messages: [message, ...value.messages]));
        }
      }
    });
  }

  void readMessage() async {
    await _chatUseCase.realAllConversations(conversationId: _conversationId);
  }

  Future<void> deleteConversation() async {
    await _chatUseCase.deleteConversations(conversationId: _conversationId);
    await getIt.get<ConversationCubit>().loadNewConversation();
  }

  Future<void> blockUser(int userId) async {
    await _userUsecase.blockUser(userId: userId);
  }

  Future<void> reportUser(int userId, String content) async {
    await _userUsecase.reportUser(userId: userId, payload: ReportUserPayload(content: content));
  }

  Future<void> changeNameGroup(int conversationId, String name) async {
    final ResultModel result =
        await _chatUseCase.renameConversation(conversationId: conversationId, name: name);
    if (result.result is bool && result.result) {
      final conversation =
          await _chatUseCase.getConversationsDetail(conversationId: conversationId);
      state.mapOrNull((value) => {emit(value.copyWith(conversation: conversation))});
    }
  }

  Future<void> leave(int conversationId, bool isNotice) async {
    await _chatUseCase.leaveChat(conversationId: conversationId, isNotice: isNotice);
  }

  Future<void> sendImage() async {
    final files = await mediaPicker.pickImagesFromGallery();
    List<String> uploadImages = [];
    if (files == null) return;
    for (final file in files) {
      if (file != null) {
        final uploadImage = await upgradeAccountUsecase.uploadBirthCer(
          XFile(file.path),
          'image',
        );
        uploadImages.add(uploadImage);
      }
    }

    await _chatUseCase.newMessage(
        conversationId: _conversationId,
        payload: NewMessagePayload(metadata: MetaDataDto(images: uploadImages)));
  }

  Future<void> loadMessages() async {
    state.mapOrNull(
      (value) async {
        final response = await _chatUseCase.getMessages(
            conversationId: _conversationId, page: 1, pageSize: kPageSize);
        emit(
          value.copyWith(
            page: 1,
            messages: response.items ?? [],
            canLoadMore: response.items?.length == kPageSize,
          ),
        );
      },
    );
  }
}
