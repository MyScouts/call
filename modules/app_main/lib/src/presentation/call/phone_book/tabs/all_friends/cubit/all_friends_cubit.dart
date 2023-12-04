import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/friend/friend_response_dto.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/usecases/friend_usecase.dart';
import 'package:injectable/injectable.dart';

import 'all_friends_state.dart';

@injectable
class AllFriendsCubit extends Cubit<AllFriendsState> {
  final FriendUsecase _friendUsecase;

  AllFriendsCubit(this._friendUsecase) : super(const AllFriendsState.loading());

  void init() async {
    try{
      final FriendResponseModel data = await _friendUsecase.getListFriend(page: 1, pageSize: 10);
      emit(AllFriendsState(
          data: data.friends, canLoadMore: data.friends.length == 10, page: 1));
    } catch (e) {
      emit(AllFriendsState.error(e));
    }
  }

  void loadMore() async {
    state.mapOrNull((value) async {
      try {
        final FriendResponseModel data = await _friendUsecase.getListFriend(page: value.page +1, pageSize: 10);
        emit(value.copyWith(
            data: [...value.data, ...data.friends],
            page: value.page +1,
            canLoadMore: data.friends.length == 10
        ));
      } catch (err) {
        emit(AllFriendsState.error(err));
      }
    });
  }
}
