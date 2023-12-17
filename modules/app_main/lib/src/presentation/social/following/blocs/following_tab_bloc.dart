import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/core/coordinator/app_coordinator.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/domain/usecases/following_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/social/following/following_coordinator.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/localization.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wallet/presentation/shared/widgets/toast_message/toast_message.dart';

import 'following_tab_event.dart';
import 'following_tab_state.dart';

@injectable
class FollowingTabBloc extends CoreBloc<FollowingTabEvent, FollowingTabState> {
  final FollowingUsecase _followingUsecase;
  final UserUsecase _userUsecase;

  FollowingTabBloc(
    this._followingUsecase,
    this._userUsecase,
  ) : super(FollowingTabState()) {
    on<FollowingTabInitiated>(onFollowingTabInitiated);
    on<FollowingTabLoadMore>(onFollowingTabLoadMore);
    on<FollowingTabRefreshed>(onFollowingTabRefreshed);
    on<FollowUserTapped>(onFollowUserTapped);
    on<UnfollowUserTapped>(onUnfollowUserTapped);
    on<UnfriendUserTapped>(onUnfriendUserTapped);
    on<FollowingUserSearch>(
      onFollowingUserSearch,
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 300))
          .switchMap(mapper),
    );
  }

  int _page = 1;

  final RefreshController _controller = RefreshController();
  RefreshController get controller => _controller;

  void onFollowingTabInitiated(
      FollowingTabInitiated event, Emitter<FollowingTabState> emit) async {
    await _handleInitiated(
      emit: emit,
      followingType: event.followingType,
      userId: event.userId,
    );
  }

  Future<void> _handleInitiated({
    required Emitter<FollowingTabState> emit,
    required FollowingType followingType,
    required int? userId,
  }) async {
    _page = 1;

    emit(state.copyWith(
      followingType: followingType,
      hasLoadMore: true,
      userId: userId,
    ));
    await _getFollowingUsers(
      emit: emit,
      page: _page,
      isInitial: true,
    );
  }

  void onFollowingTabLoadMore(_, Emitter<FollowingTabState> emit) async {
    if (state.hasLoadMore) {
      _page++;
      await _getFollowingUsers(
        emit: emit,
        page: _page,
        isInitial: false,
      );
      _controller.loadComplete();
    } else {
      _controller.loadNoData();
    }
  }

  void onFollowingTabRefreshed(_, Emitter<FollowingTabState> emit) async {
    _controller.resetNoData();
    add(FollowingTabInitiated(
      userId: state.userId,
      followingType: state.followingType,
    ));
    _controller.refreshCompleted();
  }

  void onFollowUserTapped(
    FollowUserTapped event,
    Emitter<FollowingTabState> emit,
  ) async {
    try {
      AppCoordinator.rootNavigator.currentContext?.showLoading();

      final input = FollowUserPayload(
        followeeId: event.followingUser.getUserId,
      );
      final output = await _userUsecase.followUser(payload: input);
      if (output.isFriend != null && output.isFriend!) {
        _updateInfo(
          emit: emit,
          relation: state.relationFriend,
          userId: event.followingUser.getUserId,
        );
      } else if (output.approvalRequired) {
        _updateInfo(
          emit: emit,
          relation: state.relationPendingApproval,
          userId: event.followingUser.getUserId,
        );
      }else{
        _updateInfo(
          emit: emit,
          relation: state.relationFollowee,
          userId: event.followingUser.getUserId,
        );
      }
    } on DioException catch (error) {
      String err = _getErrorMessageUnfollow(error);

      if (err == 'REQUEST_ALREADY_SENT') {
        AppCoordinator.rootNavigator.currentContext?.followerInfor(
          textSpan1: 'Yêu cầu theo dõi ',
          textSpanName: event.followingUser.getDisplayName,
          textSpan2: ' của bạn đã được thông báo đến người bảo hộ',
        );

        _updateInfo(
          emit: emit,
          relation: state.relationPendingApproval,
          userId: event.followingUser.getUserId,
        );
      } else {
        AppCoordinator.rootNavigator.currentContext?.followerInfor(
          textSpan1: err,
        );
      }
    } catch (e) {
      AppCoordinator.rootNavigator.currentContext?.followerInfor(
        textSpan1: S.current.messages_server_internal_error.capitalize(),
      );
    } finally {
      AppCoordinator.rootNavigator.currentContext?.hideLoading();
    }
  }

  void onUnfollowUserTapped(
    UnfollowUserTapped event,
    Emitter<FollowingTabState> emit,
  ) async {
    final isSuccessed = await _handleUnfriendOrUnfollowUser(
      followingUser: event.followingUser,
      isUnfriend: false,
    );

    if (isSuccessed) {
      _updateInfo(
        emit: emit,
        relation: state.relationFollower,
        userId: event.followingUser.getUserId,
      );
    }
  }

  void onUnfriendUserTapped(
    UnfriendUserTapped event,
    Emitter<FollowingTabState> emit,
  ) async {
    final isSuccessed = await _handleUnfriendOrUnfollowUser(
      followingUser: event.followingUser,
      isUnfriend: true,
    );

    if (isSuccessed) {
      _updateInfo(
        emit: emit,
        relation: state.relationFollower,
        userId: event.followingUser.getUserId,
      );
    }
  }

  void onFollowingUserSearch(
    FollowingUserSearch event,
    Emitter<FollowingTabState> emit,
  ) async {
    emit(state.copyWith(query: event.query));

    add(FollowingTabRefreshed());
  }

  Future<bool> _handleUnfriendOrUnfollowUser({
    required FollowingUser followingUser,
    required bool isUnfriend,
  }) async {
    bool isSuccessed = false;
    final data =
        await AppCoordinator.rootNavigator.currentContext?.unconnection(
      name: followingUser.getDisplayName,
      avatar: followingUser.getAvatar,
      content:
          isUnfriend ? 'Bạn muốn huỷ kết bạn với ' : 'Bạn muốn bỏ theo dõi ',
      connectionTitle: isUnfriend ? 'Huỷ kết bạn' : 'Bỏ theo dõi',
    );

    if (data != null) {
      try {
        AppCoordinator.rootNavigator.currentContext?.showLoading();

        final intput = UnFollowPayload(followeeId: followingUser.getUserId);
        await _userUsecase.unFollow(payload: intput);

        isSuccessed = true;
      } on DioException catch (error) {
        String err = _getErrorMessageUnfollow(error);
        if (err == 'CHILD_FOLLOWEE') {
          AppCoordinator.rootNavigator.currentContext?.followerInfor(
            textSpan1: 'Bạn không thể theo dõi người này!\n',
            textSpanName: followingUser.getDisplayName,
            textSpan2: ' hiện đang là user Pdone dưới 15 tuổi',
          );
        } else {
          AppCoordinator.rootNavigator.currentContext?.followerInfor(
            textSpan1: err,
          );
        }
      } catch (e) {
        AppCoordinator.rootNavigator.currentContext?.followerInfor(
          textSpan1: S.current.messages_server_internal_error.capitalize(),
        );
      } finally {
        AppCoordinator.rootNavigator.currentContext?.hideLoading();
      }
    }

    return isSuccessed;
  }

  String _getErrorMessageUnfollow(DioException error) {
    final data = error.response!.data;
    String err = S.current.messages_server_internal_error.capitalize();
    switch (data['code']) {
      case "REQUEST_ALREADY_SENT":
        err = "REQUEST_ALREADY_SENT";
      case "NOT_PDONE_FOLLOWEE":
        err = "Người theo dõi không phải là P-Done";
      case "PROTECTOR_NOT_FOUND":
        err = "Không tìm thấy thông tin người bảo hộ để xác nhận.";
      case "ALREADY_FOLLOWED":
        err = "Bạn đã theo dõi người dùng trước đó.";
      case "CHILD_FOLLOWEE":
        err = "CHILD_FOLLOWEE";
      case "FOLLOW_NOT_FOUND":
        err = "Bạn đang không theo dõi người này";
      default:
        break;
    }
    return err;
  }

  void _updateInfo({
    required int userId,
    required FollowingRelation relation,
    required Emitter<FollowingTabState> emit,
  }) {
    if (state.followingInfo != null && state.followingInfo!.info != null) {
      final infos = state.followingInfo!.info!;
      final index =
          infos.indexWhere((element) => element.user.getUserId == userId);

      if (index != -1) {
        final newInfos = infos.toList();
        newInfos[index] = newInfos[index].copyWith(relation: relation);

        final newFollowingInfo = state.followingInfo!.copyWith(
          info: newInfos,
        );

        emit(
          state.copyWith(followingInfo: newFollowingInfo),
        );
      }
    }
  }

  Future<void> _getFollowingUsers({
    required Emitter<FollowingTabState> emit,
    required int page,
    required bool isInitial,
  }) async {
    FollowingInfo? followingInfo;
    final query = state.query.isNullOrEmpty ? null : state.query;

    switch (state.followingType) {
      case FollowingType.friend:
        followingInfo = await _followingUsecase.getFriends(
          page: page,
          userId: state.userId,
          query: query,
        );
      case FollowingType.follower:
        followingInfo = await _followingUsecase.getFollowers(
          page: page,
          userId: state.userId,
          query: query,
        );

      case FollowingType.followee:
        followingInfo = await _followingUsecase.getFollowees(
          page: page,
          userId: state.userId,
          query: query,
        );
    }
    if (isInitial) {
      emit(state.copyWith(
        followingInfo: followingInfo,
      ));
    } else {
      if (state.followingInfo != null && state.followingInfo!.info != null) {
        final currentFollowingInfo = state.followingInfo!;
        final newFollowingInfo = currentFollowingInfo.copyWith(info: [
          ...currentFollowingInfo.info!,
          ...(followingInfo.info ?? []),
        ]);

        final hasLoadMore =
            newFollowingInfo.info!.length < newFollowingInfo.total!;

        emit(state.copyWith(
          followingInfo: newFollowingInfo,
          hasLoadMore: hasLoadMore,
        ));
      }
    }
  }
}
