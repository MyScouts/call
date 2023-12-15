import 'package:app_main/src/domain/usecases/chat_usecase.dart';
import 'package:app_main/src/presentation/chat/member/tab/admin/cubit/admin_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AdminTabCubit extends Cubit<AdminTabState> {
  AdminTabCubit(this._chatUseCase) : super(const AdminTabState.loading());

  final ChatUseCase _chatUseCase;

  Future<void> getAdmin(conversationId) async {
    try {
      emit(const AdminTabState.loading());
      final data = await _chatUseCase.getAdmins(conversationId: conversationId);
      emit(AdminTabState(data: data));
    } catch (e) {
      emit(AdminTabState.error(e));
    }
  }
}
