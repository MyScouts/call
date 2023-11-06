part of 'edit_community_detail_bloc.dart';

abstract class EditCommunityDetailState {
  final Community community;

  EditCommunityDetailState(this.community);
}

class EditCommunityDetailInitial extends EditCommunityDetailState {
  EditCommunityDetailInitial(super.community);
}

class UserChangeAvatar extends EditCommunityDetailState {
  final String localImg;

  UserChangeAvatar(super.community, {required this.localImg});
}

class UserChangeAvatarSuccess extends EditCommunityDetailState {
  final String newUrl;

  UserChangeAvatarSuccess(super.community, {required this.newUrl});
}

class UserChangeAvatarFailure extends EditCommunityDetailState {
  final String errMsg;

  UserChangeAvatarFailure(super.community, this.errMsg);
}

class UserChangeBanner extends EditCommunityDetailState {
  final String localImg;

  UserChangeBanner(super.community, {required this.localImg});
}

class UserChangeBannerSuccess extends EditCommunityDetailState {
  final String newUrl;

  UserChangeBannerSuccess(super.community, {required this.newUrl});
}

class UserChangeBannerFailure extends EditCommunityDetailState {
  final String errMsg;

  UserChangeBannerFailure(super.community, this.errMsg);
}

class UpdateGroupSuccess extends EditCommunityDetailState {
  final Group group;

  UpdateGroupSuccess(super.community, this.group);
}

class UpdateTeamSuccess extends EditCommunityDetailState {
  final Team team;

  UpdateTeamSuccess(super.community, this.team);
}

class UpdateInformationFailure extends EditCommunityDetailState {
  final String errMsg;

  UpdateInformationFailure(super.community, this.errMsg);
}
