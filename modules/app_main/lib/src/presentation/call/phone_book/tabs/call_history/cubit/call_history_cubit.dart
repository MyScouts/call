import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/friend/friend_response_dto.dart';
import 'package:app_main/src/domain/entities/call/call_history_response_model.dart';
import 'package:app_main/src/domain/usecases/call_usecase.dart';
import 'package:app_main/src/presentation/call/phone_book/tabs/call_history/cubit/call_history_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CallHistoryCubit extends Cubit<CallHistoryState> {
  final CallUseCase _callUseCase;

  CallHistoryCubit(this._callUseCase) : super(const CallHistoryState.loading());

  void init() async {
    try {
      final CallHistoryResponseModel data =
          await _callUseCase.getCallHistory(page: 1, pageSize: 10);
      emit(CallHistoryState(data: data.items, canLoadMore: data.items.length == 10, page: 1));
    } catch (e,s) {
      emit(CallHistoryState.error(e));
    }
  }

  void loadMore() async {
    state.mapOrNull((value) async {
      try {
          final CallHistoryResponseModel data =
          await _callUseCase.getCallHistory(page: value.page +1, pageSize: 10);
          emit(value.copyWith(
            data: [...value.data, ...data.items],
            page: value.page +1,
            canLoadMore: data.items.length == 10
          ));
      } catch (err) {
        emit(CallHistoryState.error(err));
      }
    });
  }
}
