import 'package:app_main/src/domain/usecases/chat_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/chat/member/tab/admin/cubit/admin_tab_state.dart';
import 'package:app_main/src/presentation/chat/member/tab/member/cubit/member_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
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
}
