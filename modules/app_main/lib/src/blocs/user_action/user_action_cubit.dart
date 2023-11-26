import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/follow_response.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/localization.dart';

part 'user_action_state.dart';

@Injectable()
class UserActionCubit extends Cubit<UserActionState> {
  final UserUsecase _userUsecase;
  UserActionCubit(this._userUsecase) : super(UserActionInitial());

  Future reportUser({
    required String userId,
    required ReportUserPayload payload,
  }) async {
    if (state is OnReportUser) return;
    try {
      emit(OnReportUser());
      await _userUsecase.reportUser(
        userId: int.parse(userId),
        payload: payload,
      );
      emit(ReportUserSuccess());
      getFollowUser(userId: int.parse(userId));
    } catch (e) {
      emit(
        ReportUserFail(
          message: S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }

  Future followUser({
    required FollowUserPayload payload,
  }) async {
    if (state is OnFollowUser) return;
    try {
      emit(OnFollowUser());
      await _userUsecase.followUser(payload: payload);
      emit(FollowUserSuccess());
      getFollowUser(userId: payload.followeeId);
    } on DioException catch (error) {
      final data = error.response!.data;
      debugPrint("phoneRegister: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      switch (data['code']) {
        case "REQUEST_ALREADY_SENT":
          err =
              "Bạn đã gởi yêu cầu theo dõi đến người bảo hộ, vui lòng chờ xác nhận.";
        default:
          err = S.current.message_otp_not_match;
          break;
      }
      emit(FollowUserFail(message: err));
      // REQUEST_ALREADY_SENT
    } catch (e) {
      emit(
        FollowUserFail(
          message: S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }

  Future unFollow({
    required UnFollowPayload payload,
  }) async {
    if (state is OnUnFollow) return;
    try {
      emit(OnUnFollow());
      await _userUsecase.unFollow(
        payload: payload,
      );
      emit(UnFollowSuccess());
      getFollowUser(userId: payload.followeeId);
    } catch (e) {
      emit(
        UnFollowFail(
          message: S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }

  Future blockUser({
    required int userId,
  }) async {
    if (state is OnBlockUser) return;
    try {
      emit(OnBlockUser());
      await _userUsecase.blockUser(userId: userId);
      emit(BlockUserSuccess());
      getFollowUser(userId: userId);
    } catch (e) {
      emit(
        BlockUserFail(
          message: S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }

  Future getFollowUser({
    required int userId,
  }) async {
    if (state is OnGetFollowUser) return;
    try {
      emit(OnGetFollowUser());
      final response = await _userUsecase.getFollowUser(userId);
      emit(GetFollowUserSuccess(followDetail: response));
    } catch (e) {
      emit(
        GetFollowUserFail(
          message: S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }
}
