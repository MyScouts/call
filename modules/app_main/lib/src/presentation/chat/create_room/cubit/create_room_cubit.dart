import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/chat/new_conversations_payload.dart';
import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/usecases/chat_usecase.dart';
import 'package:app_main/src/presentation/chat/create_room/cubit/create_room_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateRoomCubit extends Cubit<CreateRoomState> {
  final ChatUseCase _chatUseCase;

  CreateRoomCubit(this._chatUseCase) : super(const CreateRoomState.loading());
  int kPageSize = 10;

  Future<void> init() async {
    try {
      final FriendResponseModel friendResponse =
          await _chatUseCase.getFriends(page: 1, pageSize: kPageSize);
      emit(
        CreateRoomState(
            friends: friendResponse.friends,
            listChoice: [],
            page: 1,
            canLoadMore: friendResponse.friends.length == kPageSize,
            keySearch: '',
            step: 1),
      );
    } catch (e) {
      emit(CreateRoomState.error(e));
    }
  }

  Future<void> loadMore() async {
    state.mapOrNull((value) async {
      int page = value.page + 1;
      final FriendResponseModel friendResponse =
          await _chatUseCase.getFriends(page: page, pageSize: kPageSize);
      emit(value.copyWith(
        friends: [...value.friends, ...friendResponse.friends],
        page: page,
        canLoadMore: friendResponse.friends.length == kPageSize,
      ));
    });
  }

  void updateChoice(MemberModel friend) {
    state.mapOrNull((value) {
      List<MemberModel> tempList = [...value.listChoice];
      if (tempList.contains(friend)) {
        tempList.remove(friend);
      } else {
        tempList.add(friend);
      }
      emit(value.copyWith(listChoice: tempList));
    });
  }

  void nextStep() {
    state.mapOrNull((value) {
      emit(value.copyWith(step: 2));
    });
  }

  void previousStep() {
    state.mapOrNull((value) {
      emit(value.copyWith(step: 1));
    });
  }

  Future<int> createRoom(String name) async {
    List<MemberModel> tempList = [];
    state.mapOrNull((value) {
      tempList = [...value.listChoice];
    });
    final ResultModel newConversation = await _chatUseCase.createConversations(
      payload: NewConversationsPayload(
        name: name,
        type: 2,
        memberIds: tempList.map((e) => e.id).toList(),
      ),
    );
    return newConversation.result as int;
  }
}
