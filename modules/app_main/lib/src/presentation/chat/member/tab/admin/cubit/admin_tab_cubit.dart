import 'package:app_main/src/domain/entities/chat/result_model.dart';
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

  Future<void> revokeSecondAdmin(int conversationId, int memberId) async {
    final ResultModel result =
    await _chatUseCase.revokeSecondBoos(conversationId: conversationId, memberId: memberId);
    if (result.result is bool && result.result) {
      getAdmin(conversationId);
    }
  }

  Future<void> setAdmin(int conversationId, int memberId) async {
    final ResultModel result =
    await _chatUseCase.assignBoss(conversationId: conversationId, memberId: memberId);
    if (result.result is bool && result.result) {
      getAdmin(conversationId);
    }
  }

  Future<void> kick(int conversationId, int memberId) async {
    final ResultModel result =
    await _chatUseCase.kickMember(conversationId: conversationId, memberId: memberId, isNotice: true);
    if (result.result is bool && result.result) {
      getAdmin(conversationId);
    }
  }

  Future<void> kickMute(int conversationId, int memberId) async {
    final ResultModel result =
    await _chatUseCase.kickMember(conversationId: conversationId, memberId: memberId, isNotice: false);
    if (result.result is bool && result.result) {
      getAdmin(conversationId);
    }
  }
}
