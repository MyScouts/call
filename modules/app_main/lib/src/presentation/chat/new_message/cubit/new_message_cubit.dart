import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/friend/friend_response_model.dart';
import 'package:app_main/src/domain/usecases/chat_usecase.dart';
import 'package:app_main/src/presentation/chat/new_message/cubit/new_message_state.dart';
import 'package:injectable/injectable.dart';


@injectable
class NewMessageCubit extends Cubit<NewMessageState> {
  final ChatUseCase _chatUseCase;

  NewMessageCubit(this._chatUseCase) : super(const NewMessageState.loading());
  int kPageSize = 10;

  Future<void> init() async {
    try {
      final FriendResponseModel friendResponse =
          await _chatUseCase.getFriends(page: 1, pageSize: kPageSize);
      emit(
        NewMessageStateData(
          friends: friendResponse.friends,
          page: 1,
          canLoadMore: friendResponse.friends.length == kPageSize,
          keySearch: '',
        ),
      );
    } catch (e) {
      emit(NewMessageState.error(e));
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
}
