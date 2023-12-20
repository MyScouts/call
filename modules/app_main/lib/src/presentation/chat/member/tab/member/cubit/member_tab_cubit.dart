import 'package:app_main/src/domain/entities/chat/result_model.dart';
import 'package:app_main/src/domain/usecases/chat_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/chat/member/tab/member/cubit/member_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class MemberTabCubit extends Cubit<MemberTabState> {
  MemberTabCubit(this._chatUseCase, this._userUsecase) : super(const MemberTabState.loading());

  final ChatUseCase _chatUseCase;
  final UserUsecase _userUsecase;

  Future<void> getMember(conversationId) async {
    try {
      emit(const MemberTabState.loading());
      final data = await _chatUseCase.getMembers(conversationId: conversationId);
      emit(MemberTabState(data: data));
    } catch (e) {
      emit(MemberTabState.error(e));
    }
  }

  Future<void> blockUser(int userId) async {
    await _userUsecase.blockUser(userId: userId);
  }

  Future<void> setSecondAdmin(int conversationId, int memberId) async {
    final ResultModel result =
        await _chatUseCase.assignSecondBoss(conversationId: conversationId, memberId: memberId);
    if (result.result is bool && result.result) {
      getMember(conversationId);
    }
  }

  Future<void> setAdmin(int conversationId, int memberId) async {
    final ResultModel result =
    await _chatUseCase.assignBoss(conversationId: conversationId, memberId: memberId);
    if (result.result is bool && result.result) {
      getMember(conversationId);
    }
  }

  Future<void> kick(int conversationId, int memberId) async {
    final ResultModel result =
    await _chatUseCase.kickMember(conversationId: conversationId, memberId: memberId, isNotice: true);
    if (result.result is bool && result.result) {
      getMember(conversationId);
    }
  }

  Future<void> kickMute(int conversationId, int memberId) async {
    final ResultModel result =
    await _chatUseCase.kickMember(conversationId: conversationId, memberId: memberId, isNotice: false);
    if (result.result is bool && result.result) {
      getMember(conversationId);
    }
  }


  Future<void> revokeSecondAdmin(int conversationId, int memberId) async {
    final ResultModel result =
    await _chatUseCase.revokeSecondBoos(conversationId: conversationId, memberId: memberId);
    if (result.result is bool && result.result) {
      getMember(conversationId);
    }
  }
}
