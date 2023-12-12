import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/usecases/resource_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/models/payloads/community/update_community_payload.dart';
import '../../../../domain/usecases/community_usecase.dart';

part 'edit_fan_group_event.dart';
part 'edit_fan_group_state.dart';

@injectable
class EditFanGroupBloc extends Bloc<EditFanGroupEvent, EditFanGroupState> {
  final CommunityUsecase _communityUsecase;
  final ResourceUsecase _resourceUsecase;

  EditFanGroupBloc(
    this._communityUsecase,
    this._resourceUsecase,
    @factoryParam FanGroup fanGroup,
  ) : super(EditFanGroupInitial(fanGroup)) {
    on<UserChangeAvatarEvent>(_mapUserChangeAvatarEvent);
    on<UserChangeBannerEvent>(_mapUserChangeBannerEvent);
    on<UpdateFanGroupEvent>(_mapUpdateFanGroupEvent);
  }

  FutureOr<void> _mapUserChangeAvatarEvent(
      UserChangeAvatarEvent event, Emitter<EditFanGroupState> emit) async {
    try {
      emit(UserChangeAvatar(state.fanGroup, localImg: event.localImg));
      final res =
          await _resourceUsecase.storageUploadUrl(event.localImg, "avatar");

      emit(
        UserChangeAvatarSuccess(state.fanGroup.copyWith(avatar: res),
            newUrl: res),
      );
    } catch (e) {
      emit(UserChangeAvatarFailure(state.fanGroup, e.toString()));
    }
  }

  FutureOr<void> _mapUserChangeBannerEvent(
      UserChangeBannerEvent event, Emitter<EditFanGroupState> emit) async {
    try {
      emit(UserChangeBanner(state.fanGroup, localImg: event.localImg));
      final res =
          await _resourceUsecase.storageUploadUrl(event.localImg, "banner");

      emit(
        UserChangeBannerSuccess(state.fanGroup.copyWith(banner: res),
            newUrl: res),
      );
    } catch (e) {
      emit(UserChangeBannerFailure(state.fanGroup, e.toString()));
    }
  }

  FutureOr<void> _mapUpdateFanGroupEvent(
      UpdateFanGroupEvent event, Emitter<EditFanGroupState> emit) async {
    try {
      final res =
          await _communityUsecase.updateFanGroup(event.id, event.payload);

      if (res) {
        emit(UpdateFanGroupSuccess(state.fanGroup));
      }
    } catch (e) {
      emit(UpdateInformationFailure(state.fanGroup, e));
    }
  }

  FutureOr<void> _mapGetTeamListEvent(
      UpdateFanGroupEvent event, Emitter<EditFanGroupState> emit) async {
    try {
      final res =
          await _communityUsecase.updateFanGroup(event.id, event.payload);

      if (res) {
        emit(UpdateFanGroupSuccess(state.fanGroup));
      }
    } catch (e) {
      emit(UpdateInformationFailure(state.fanGroup, e));
    }
  }
}
