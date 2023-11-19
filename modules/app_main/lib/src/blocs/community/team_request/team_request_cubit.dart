import 'package:app_main/src/data/models/payloads/community/community_payload.dart';
import 'package:app_main/src/data/models/responses/member_join_request.dart';
import 'package:app_main/src/domain/usecases/community_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'team_request_state.dart';

@injectable
class TeamRequestCubit extends Cubit<TeamRequestState> {
  final CommunityUsecase _usecase;
  final List<RequestDetail> _request = [];
  TeamRequestCubit(this._usecase)
      : super(const TeamRequestInitial(requests: []));

  Future getRequests({
    bool? isReset,
    bool isJoinRequest = true,
    required String teamId,
  }) async {
    if (state is OnGetListRequest) return;
    try {
      emit(OnGetListRequest(requests: _request, isFirst: true));
      if (isJoinRequest) {
        final response = await _usecase
            .memberJoinRequest(GetCommunityPayload(teamId: teamId));
        _request.addAll(response.requests);
      } else {
        final response = await _usecase.memberLeaveRequest(
          GetCommunityPayload(teamId: teamId),
        );
        _request.addAll(response.requests);
      }
      emit(GetListRequestSuccess(requests: _request));
    } catch (e) {
      emit(GetListRequestFail(requests: _request));
    }
  }

  Future replyJoinRequest({
    required String teamId,
    required ReplyJoinRequestPayload payload,
  }) async {
    if (state is OnReplyJoinRequest) return;
    try {
      emit(OnReplyJoinRequest(requests: _request));
      await _usecase.replyJoinRequest(teamId, payload);
      _request.removeWhere((element) => element.user?.id == payload.userId);
      emit(ReplyJoinRequestSuccess(
        requests: _request,
        isApproved: payload.isApproved,
      ));
    } catch (e) {
      emit(ReplyJoinRequestFail(
        requests: _request,
        message: "Thao tác không thành công",
      ));
    }
  }

  Future replyLeaveRequest({
    required String teamId,
    required ReplyJoinRequestPayload payload,
  }) async {
    if (state is OnReplyLeaveRequest) return;
    try {
      emit(OnReplyLeaveRequest(requests: _request));
      await _usecase.replyLeaveRequest(teamId, payload);
      _request.removeWhere((element) => element.user?.id == payload.userId);
      emit(ReplyLeaveRequestSuccess(
        requests: _request,
        isApproved: payload.isApproved,
      ));
    } catch (e) {
      emit(ReplyLeaveRequestFail(
        requests: _request,
        message: "Thao tác không thành công",
      ));
    }
  }
}
