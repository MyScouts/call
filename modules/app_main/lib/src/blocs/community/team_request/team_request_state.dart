part of 'team_request_cubit.dart';

@immutable
sealed class TeamRequestState {
  final List<RequestDetail> requests;
  const TeamRequestState({required this.requests});
}

final class TeamRequestInitial extends TeamRequestState {
  const TeamRequestInitial({required super.requests});
}

final class OnGetListRequest extends TeamRequestState {
  final bool isFirst;
  const OnGetListRequest({required super.requests, required this.isFirst});
}

final class GetListRequestSuccess extends TeamRequestState {
  const GetListRequestSuccess({required super.requests});
}

final class GetListRequestFail extends TeamRequestState {
  const GetListRequestFail({required super.requests});
}

final class OnReplyJoinRequest extends TeamRequestState {
  const OnReplyJoinRequest({required super.requests});
}

final class ReplyJoinRequestSuccess extends TeamRequestState {
  final bool isApproved;
  const ReplyJoinRequestSuccess({
    required super.requests,
    required this.isApproved,
  });
}

final class ReplyJoinRequestFail extends TeamRequestState {
  final String message;
  const ReplyJoinRequestFail({required super.requests, required this.message});
}

final class OnReplyLeaveRequest extends TeamRequestState {
  const OnReplyLeaveRequest({required super.requests});
}

final class ReplyLeaveRequestSuccess extends TeamRequestState {
  final bool isApproved;
  const ReplyLeaveRequestSuccess({
    required super.requests,
    required this.isApproved,
  });
}

final class ReplyLeaveRequestFail extends TeamRequestState {
  final String message;
  const ReplyLeaveRequestFail({required super.requests, required this.message});
}
