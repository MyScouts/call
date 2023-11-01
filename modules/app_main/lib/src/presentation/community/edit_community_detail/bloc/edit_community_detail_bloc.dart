import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/community/update_community_payload.dart';
import '../../../../domain/usecases/community_usecase.dart';

part 'edit_community_detail_event.dart';
part 'edit_community_detail_state.dart';

@injectable
class EditCommunityDetailBloc
    extends Bloc<EditCommunityDetailEvent, EditCommunityDetailState> {
  final CommunityUsecase _communityUsecase;

  EditCommunityDetailBloc(
    this._communityUsecase,
    @factoryParam Community community,
  ) : super(EditCommunityDetailInitial(community)) {
    on<UserChangeAvatarEvent>(_mapUserChangeAvatarEvent);
    on<UserChangeBannerEvent>(_mapUserChangeBannerEvent);
    on<UpdateGroupEvent>(_mapUpdateGroupEvent);
    on<UpdateTeamEvent>(_mapUpdateTeamEvent);
  }

  FutureOr<void> _mapUserChangeAvatarEvent(UserChangeAvatarEvent event,
      Emitter<EditCommunityDetailState> emit) async {
    try {
      emit(UserChangeAvatar(state.community, localImg: event.localImg));
      final res = await _communityUsecase.uploadNewImage(event.localImg);

      emit(
        UserChangeAvatarSuccess(state.community.copyWith(avatar: res),
            newUrl: res),
      );
    } catch (e) {
      emit(UserChangeAvatarFailure(state.community, e.toString()));
    }
  }

  FutureOr<void> _mapUserChangeBannerEvent(UserChangeBannerEvent event,
      Emitter<EditCommunityDetailState> emit) async {
    try {
      emit(UserChangeBanner(state.community, localImg: event.localImg));
      final res = await _communityUsecase.uploadNewImage(event.localImg);

      emit(
        UserChangeBannerSuccess(state.community.copyWith(banner: res),
            newUrl: res),
      );
    } catch (e) {
      emit(UserChangeBannerFailure(state.community, e.toString()));
    }
  }

  FutureOr<void> _mapUpdateGroupEvent(
      UpdateGroupEvent event, Emitter<EditCommunityDetailState> emit) async {
    try {
      final res = await _communityUsecase.updateGroup(event.id, event.payload);

      emit(UpdateGroupSuccess(state.community, res));
    } catch (e) {
      emit(UpdateInformationFailure(state.community, e.toString()));
    }
  }

  FutureOr<void> _mapUpdateTeamEvent(
      UpdateTeamEvent event, Emitter<EditCommunityDetailState> emit) async {
    try {
      final res = await _communityUsecase.updateTeam(event.id, event.payload);

      emit(UpdateTeamSuccess(state.community, res));
    } catch (e) {
      emit(UpdateInformationFailure(state.community, e.toString()));
    }
  }
}
