part of 'edit_fan_group_bloc.dart';

abstract class EditFanGroupState {
  final FanGroup fanGroup;

  const EditFanGroupState(this.fanGroup);
}

class EditFanGroupInitial extends EditFanGroupState {
  const EditFanGroupInitial(super.fanGroup);
}

class UserChangeAvatar extends EditFanGroupState {
  final String localImg;

  const UserChangeAvatar(super.fanGroup, {required this.localImg});
}

class UserChangeAvatarSuccess extends EditFanGroupState {
  final String newUrl;

  const UserChangeAvatarSuccess(super.fanGroup, {required this.newUrl});
}

class UserChangeAvatarFailure extends EditFanGroupState {
  final String errMsg;

  const UserChangeAvatarFailure(super.fanGroup, this.errMsg);
}

class UserChangeBanner extends EditFanGroupState {
  final String localImg;

  const UserChangeBanner(super.fanGroup, {required this.localImg});
}

class UserChangeBannerSuccess extends EditFanGroupState {
  final String newUrl;

  const UserChangeBannerSuccess(super.fanGroup, {required this.newUrl});
}

class UserChangeBannerFailure extends EditFanGroupState {
  final String errMsg;

  const UserChangeBannerFailure(super.fanGroup, this.errMsg);
}

class UpdateFanGroupSuccess extends EditFanGroupState {
  const UpdateFanGroupSuccess(super.fanGroup);
}

class UpdateInformationFailure extends EditFanGroupState {
  final dynamic err;

  const UpdateInformationFailure(super.fanGroup, this.err);
}
