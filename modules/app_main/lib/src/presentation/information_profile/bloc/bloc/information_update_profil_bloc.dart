import 'package:app_main/src/data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/update_none_pdone_profile_response.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'information_update_profil_event.dart';
part 'information_update_profil_state.dart';

@injectable
class InformationUpdateProfilBloc extends Bloc<InformationEvent, InformationUpdateProfilState> {
  final UserUsecase _userUsecase;
  final InformationPDoneSharePreferencesUsecase _informationPDoneSharePreferencesUsecase;

  InformationUpdateProfilBloc(this._userUsecase, this._informationPDoneSharePreferencesUsecase)
      : super(InformationUpdateProfilInitial()) {
    on<InformationUpdateProfilEvent>(updatePDoneProfile);
    on<InformationNoneUpdateProfilEvent>(updateNonePDoneProfile);
    on<GetInformationPDoneProfileEvent>(getPDoneProfile);
  }

  Future<void> updatePDoneProfile(
      InformationUpdateProfilEvent event, Emitter<InformationUpdateProfilState> emit) async {
    if (state is InformationUpdateProfilLoading) return;
    try {
      emit(InformationUpdateProfilLoading());
      final response = await _userUsecase.updatePDoneProfile(event.updatePDoneProfilePayload!);
      debugPrint("updatePDoneProfile response: ${response.profile}");
      await _informationPDoneSharePreferencesUsecase.saveInfoPDoneProfile(response.profile);
      emit(InformationUpdateProfilSuccess());
    } catch (error) {
      debugPrint("updatePDoneProfile error: $error");
      emit(InformationUpdateProfilFailed(message: error.toString()));
    }
  }

  Future<void> updateNonePDoneProfile(
      InformationNoneUpdateProfilEvent event, Emitter<InformationUpdateProfilState> emit) async {
    if (state is InformationUpdateProfilLoading) return;
    try {
      emit(InformationUpdateProfilLoading());
      final response = await _userUsecase.updateNonePNoneDoneProfile(event.updateNonePDoneProfilePayload!);
      await _informationPDoneSharePreferencesUsecase.saveInfoNonePDoneProfile(response.profile);
      final values = _informationPDoneSharePreferencesUsecase.getInfoNonePDoneProfile();
      debugPrint("updateNonePDoneProfile values: $values");
      emit(InformationNoneUpdateProfilSuccess());
    } catch (error) {
      debugPrint("updateNonePDoneProfile error: $error");
      emit(InformationUpdateProfilFailed(message: error.toString()));
    }
  }

  Future<void> getPDoneProfile(
      GetInformationPDoneProfileEvent event, Emitter<InformationUpdateProfilState> emit) async {
    try {
      final response = await _userUsecase.getPDoneProfile();
      emit(GetInformationPDoneProfileSuccess(user: response));
    } catch (error) {
      debugPrint("getPDoneProfile error: $error");
    }
  }
}
