import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/responses/follow_response.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:app_main/src/core/bloc/core_state.dart';

class MyProfileState extends CoreState with EquatableMixin {
  final User? userInfo;
  final PostType currentPostType;
  final GetUserFollowDetailResponse? userFollowDetail;

  MyProfileState({
    this.userInfo,
    this.currentPostType = PostType.text,
    this.userFollowDetail,
    super.status,
  });

  MyProfileState copyWith({
    User? userInfo,
    PostType? currentPostType,
    GetUserFollowDetailResponse? userFollowDetail,
  }) {
    return MyProfileState(
      userInfo: userInfo ?? this.userInfo,
      currentPostType: currentPostType ?? this.currentPostType,
      userFollowDetail: userFollowDetail ?? this.userFollowDetail,
    );
  }

  bool isNotExistUser() {
    return userInfo == null;
  }

  @override
  List<Object?> get props => [
        userFollowDetail,
        currentPostType,
        userInfo,
      ];
}
