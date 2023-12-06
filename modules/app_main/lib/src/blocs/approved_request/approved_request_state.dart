part of 'approved_request_cubit.dart';

@immutable
sealed class ApprovedRequestState {
  final List<ApprovedRequestDetail> approvedRequest;
  const ApprovedRequestState({
    required this.approvedRequest,
  });
}

final class ApprovedRequestInitial extends ApprovedRequestState {
  const ApprovedRequestInitial({required super.approvedRequest});
}

final class OnGetApprovedRequest extends ApprovedRequestState {
  const OnGetApprovedRequest({required super.approvedRequest});
}

final class GetApprovedRequestSuccess extends ApprovedRequestState {
  const GetApprovedRequestSuccess({required super.approvedRequest});
}

final class GetApprovedRequestFail extends ApprovedRequestState {
  const GetApprovedRequestFail({required super.approvedRequest});
}

final class OnReplyRequest extends ApprovedRequestState {
  const OnReplyRequest({required super.approvedRequest});
}

final class ReplyRequestSuccess extends ApprovedRequestState {
  final bool isApproved;
  const ReplyRequestSuccess({
    required super.approvedRequest,
    required this.isApproved,
  });
}

final class ReplyRequestFail extends ApprovedRequestState {
  const ReplyRequestFail({required super.approvedRequest});
}
