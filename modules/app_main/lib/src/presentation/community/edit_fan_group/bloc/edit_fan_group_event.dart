part of 'edit_fan_group_bloc.dart';

abstract class EditFanGroupEvent {}

class UserChangeAvatarEvent extends EditFanGroupEvent {
  final String localImg;

  UserChangeAvatarEvent({required this.localImg});
}

class UserChangeBannerEvent extends EditFanGroupEvent {
  final String localImg;

  UserChangeBannerEvent({required this.localImg});
}

class UpdateFanGroupEvent extends EditFanGroupEvent {
  final int id;
  final UpdateCommunityPayload payload;

  UpdateFanGroupEvent(this.payload, this.id);
}
