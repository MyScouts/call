
import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/chat/member_model.dart';
import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/usecases/chat_usecase.dart';
import 'package:app_main/src/presentation/chat/add_member/cubit/add_member_state.dart';
import 'package:app_main/src/presentation/chat/member/tab/member/cubit/member_tab_cubit.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddMemberCubit extends Cubit<AddMemberState> {
  AddMemberCubit(this._chatUseCase) : super(const AddMemberState.loading());

  final ChatUseCase _chatUseCase;

  int kPageSize = 10;

  Future<void> init() async {
    try {
      final FriendResponseModel friendResponse =
      await _chatUseCase.getFriends(page: 1, pageSize: kPageSize);
      getIt.get<MemberTabCubit>().state.mapOrNull((value) {
        for (var member in value.data.members) {
          friendResponse.friends.removeWhere((friend) => friend.id == member.member.id);
        }});
      emit(
        AddMemberState(
            friends: friendResponse.friends,
            listChoice: [],
            page: 1,
            canLoadMore: friendResponse.friends.length == kPageSize,
            keySearch: '',),
      );
    } catch (e) {
      emit(AddMemberState.error(e));
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

  Future<bool> addMember(int conversationId) async {
    bool _result = false;
    List<int> userIds = [];
    state.mapOrNull((value) async {
      for (var element in value.listChoice) {
        userIds.add(element.id);
      }
    });
    final ResultModel result =
    await _chatUseCase.addMember(conversationId: conversationId, userIds: userIds);
    _result = result.result;
    if(_result) {
      getIt.get<MemberTabCubit>().getMember(conversationId);
    }
    return _result;

  }
}
