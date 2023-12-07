import 'package:app_main/src/domain/entities/call/call_history_response_model.dart';
import 'package:app_main/src/domain/usecases/call_usecase.dart';
import 'package:app_main/src/presentation/call/phone_book_detail/cubit/phone_book_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PhoneBookDetailCubit extends Cubit<PhoneBookDetailState> {
  final CallUseCase _callUseCase;

  PhoneBookDetailCubit(this._callUseCase) : super(const PhoneBookDetailState.loading());

  void init(int id) async {
    try {
      final CallHistoryResponseModel data =
          await _callUseCase.getCallHistory(page: 1, pageSize: 10, receiverId: id);
      emit(PhoneBookDetailState(data: data.items, canLoadMore: data.items.length == 10, page: 1));
    } catch (e) {
      emit(PhoneBookDetailState.error(e));
    }
  }

  void loadMore(int id) async {
    state.mapOrNull((value) async {
      try {
        final CallHistoryResponseModel data =
            await _callUseCase.getCallHistory(page: value.page + 1, pageSize: 10, receiverId: id);
        emit(value.copyWith(
            data: [...value.data, ...data.items],
            page: value.page + 1,
            canLoadMore: data.items.length == 10));
      } catch (err) {
        emit(PhoneBookDetailState.error(err));
      }
    });
  }

  Future<void> deleteHistoryCall(int id) async {
    try {
      await _callUseCase.deleteHistoryCall(userId: id);
      init(id);
    } catch (e) {
      emit(PhoneBookDetailState.error(e));
    }
  }
}
