import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/data/models/payloads/social/create_post_payload.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'my_profile_event.dart';
import 'my_profile_state.dart';

@injectable
class MyProfileBloc extends CoreBloc<MyProfileEvent, MyProfileState> {
  final UserUsecase _userUsecase;

  MyProfileBloc(
    this._userUsecase,
  ) : super(MyProfileState()) {
    on<MyProfileInitiated>(onMyProfileInitiated);
    on<MyProfileRefreshed>(onMyProfileRefreshed);
    on<IndividualSwitchTab>(onIndividualSwitchTab);
    on<CreateNewPost>(onCreateNewPost);
  }

  // variable
  late StreamController<bool> isScrolledController =
      StreamController.broadcast();
  late StreamController<int> switchTabController = StreamController.broadcast();

  final ValueNotifier<bool> postTabRefresh = ValueNotifier<bool>(false);
  final ValueNotifier<CreatePostPayload?> createTextPostPayload =
      ValueNotifier<CreatePostPayload?>(null);
  final ValueNotifier<CreatePostPayload?> createVideoPostPayload =
      ValueNotifier<CreatePostPayload?>(null);

  final ValueNotifier<bool> videoTabRefresh = ValueNotifier<bool>(false);
  final ValueNotifier<bool> reelsTabRefresh = ValueNotifier<bool>(false);

  // function

  void onMyProfileInitiated(
      MyProfileInitiated event, Emitter<MyProfileState> emit) async {
    await getProfile(emit);
  }

  FutureOr<void> getProfile(Emitter<MyProfileState> emit) async {
    final userInfo = await _userUsecase.getProfile();
    emit(state.copyWith(
      userInfo: userInfo,
    ));
    if (userInfo != null) {
      final userFollowDetail = await _userUsecase.getFollowUser(userInfo.id!);
      emit(state.copyWith(
        userInfo: userInfo,
        userFollowDetail: userFollowDetail,
      ));
    }
  }

  void onMyProfileRefreshed(_, Emitter<MyProfileState> emit) async {
    await getProfile(emit);
  }

  Future<void> onIndividualSwitchTab(
      IndividualSwitchTab event, Emitter<MyProfileState> emit) async {
    PostType postType = PostType.getTypeByIndex(event.index);

    emit(state.copyWith(currentPostType: postType));
  }

  Future<void> onCreateNewPost(
      CreateNewPost event, Emitter<MyProfileState> emit) async {
    switch (state.currentPostType) {
      case PostType.text:
        createTextPostPayload.value = event.createPostPayload;
        break;
      case PostType.video:
        createVideoPostPayload.value = event.createPostPayload;
        break;
      default:
        break;
    }
  }
}
