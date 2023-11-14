import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/update_none_pdone_profile_response.dart';
import 'package:app_main/src/data/models/responses/update_pdone_profile_response.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'information_update_profil_event.dart';
part 'information_update_profil_state.dart';

@injectable
class InformationUpdateProfilBloc extends Bloc<InformationEvent, InformationUpdateProfilState> {
  final UserUsecase _userUsecase;

  InformationUpdateProfilBloc(this._userUsecase) : super(InformationUpdateProfilInitial()) {
    on<InformationUpdateProfilEvent>(updatePDoneProfile);
    on<InformationNoneUpdateProfilEvent>(updateNonePDoneProfile);
  }

  Future<void> updatePDoneProfile(
      InformationUpdateProfilEvent event, Emitter<InformationUpdateProfilState> emit) async {
    if (state is InformationUpdateProfilLoading) return;
    try {
      emit(InformationUpdateProfilLoading());
      final response = await _userUsecase.updatePDoneProfile(event.updatePDoneProfilePayload!);
      emit(InformationUpdateProfilSuccess(user: response));
    } catch (error) {
      debugPrint("update pdone profile error: $error");
      emit(InformationUpdateProfilFailed(message: error.toString()));
    }
  }

  Future<void> updateNonePDoneProfile(
      InformationNoneUpdateProfilEvent event, Emitter<InformationUpdateProfilState> emit) async {
    if (state is InformationUpdateProfilLoading) return;
    try {
      emit(InformationUpdateProfilLoading());
      final response = await _userUsecase.updateNonePNoneDoneProfile(event.updateNonePDoneProfilePayload!);
      emit(InformationNoneUpdateProfilSuccess(user: response));
    } catch (error) {
      debugPrint("update pdone profile error: $error");
      emit(InformationUpdateProfilFailed(message: error.toString()));
    }
  }
}
