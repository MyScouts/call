part of 'edit_community_detail_bloc.dart';

abstract class EditCommunityDetailEvent {}

class UserChangeAvatarEvent extends EditCommunityDetailEvent {
  final String localImg;

  UserChangeAvatarEvent({required this.localImg});
}

class UserChangeBannerEvent extends EditCommunityDetailEvent {
  final String localImg;

  UserChangeBannerEvent({required this.localImg});
}

class UpdateGroupEvent extends EditCommunityDetailEvent {
  final int id;
  final UpdateCommunityPayload payload;

  UpdateGroupEvent(this.payload, this.id);
}

class UpdateTeamEvent extends EditCommunityDetailEvent {
  final int id;
  final UpdateCommunityPayload payload;

  UpdateTeamEvent(this.payload, this.id);
}
