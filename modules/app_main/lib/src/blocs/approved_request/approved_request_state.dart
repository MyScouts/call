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
