import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/follow_response.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'approved_request_state.dart';

@injectable
class ApprovedRequestCubit extends Cubit<ApprovedRequestState> {
  final UserUsecase _usecase;
  final List<ApprovedRequestDetail> _approvedRequest = [];
  ApprovedRequestCubit(this._usecase)
      : super(const ApprovedRequestInitial(approvedRequest: []));

  getApprovedRequest() async {
    if (state is OnGetApprovedRequest) return;
    try {
      emit(OnGetApprovedRequest(approvedRequest: _approvedRequest));
      final response = await _usecase.approvedRequests();
      _approvedRequest.addAll(response);
      emit(GetApprovedRequestSuccess(approvedRequest: _approvedRequest));
    } catch (e) {
      emit(GetApprovedRequestFail(approvedRequest: _approvedRequest));
    }
  }

  replyFollow({required int requestId, required bool isApproved}) async {
    if (state is OnReplyRequest) return;
    try {
      emit(OnReplyRequest(approvedRequest: _approvedRequest));
      await _usecase.replyFollow(
        ReplyFollowPayload(requestId: requestId, isApproved: isApproved),
      );
      _approvedRequest.removeWhere((element) => element.id == requestId);
      emit(ReplyRequestSuccess(
          approvedRequest: _approvedRequest, isApproved: isApproved));
    } catch (e) {
      emit(ReplyRequestFail(approvedRequest: _approvedRequest));
    }
  }
}
