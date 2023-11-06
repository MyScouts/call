import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/community_usecase.dart';

part 'fan_group_detail_event.dart';
part 'fan_group_detail_state.dart';

@injectable
class FanGroupDetailBloc
    extends Bloc<FanGroupDetailEvent, FanGroupDetailState> {
  final CommunityUsecase _communityUsecase;

  FanGroupDetailBloc(this._communityUsecase) : super(FanGroupDetailInitial()) {
    on<FetchFanGroupDetailEvent>(_onFetchFanGroupDetailEvent);
    on<RegisterFanGroupEvent>(_onRegisterFanGroupEvent);
    on<UpdateFanGroupEvent>(_onUpdateFanGroupEvent);
  }

  FutureOr<void> _onFetchFanGroupDetailEvent(
      FetchFanGroupDetailEvent event, Emitter<FanGroupDetailState> emit) async {
    try {
      emit(LoadingFanGroupDetail());

      final fanGroup = await _communityUsecase.getFanGroupById(event.id);

      emit(FetchFanGroupSuccess(fanGroup));

      final boss = await _communityUsecase.getMembersOfFanGroup(event.id, 1);

      emit(FetchBossGroupSuccess(boss, fanGroup));

      final bossTeams =
          await _communityUsecase.getMembersOfFanGroup(event.id, 2);

      emit(FetchBossTeamSuccess(bossTeams, boss, fanGroup));

      final members = await _communityUsecase.getMembersOfFanGroup(event.id, 0);

      emit(FetchTeamsMemberSuccess(members, bossTeams, boss, fanGroup));
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> _onRegisterFanGroupEvent(
      RegisterFanGroupEvent event, Emitter<FanGroupDetailState> emit) async {
    try {
      final currentState = state;
      if (currentState is FetchTeamsMemberSuccess) {
        final isSuccess = await _communityUsecase.joinFanGroup(event.id);

        if (isSuccess) {
          emit(
            RegisterTeamSuccess(currentState.members, currentState.bossTeams,
                currentState.boss, currentState.fanGroup),
          );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> _onUpdateFanGroupEvent(
      UpdateFanGroupEvent event, Emitter<FanGroupDetailState> emit) {
    final currentState = state;
    if (currentState is RegisterTeamSuccess) {
      emit(
        UpdateFanGroupSucccess(
          currentState.members,
          currentState.bossTeams,
          currentState.boss,
          event.newData,
        ),
      );
    }
  }
}
