import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart';
import 'package:app_main/src/domain/entities/update_account/infomation_pdone_profile.dart';
import 'package:app_main/src/domain/entities/update_account/information_none_pdone_profile.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/generated/l10n.dart';

part 'information_pdone_profile_state.dart';

@injectable
class InformationPdoneProfileCubit extends Cubit<InformationPdoneProfileState> {
  final InformationPDoneSharePreferencesUsecase _doneSharePreferencesUsecase;
  InformationPdoneProfileCubit(this._doneSharePreferencesUsecase) : super(InformationPdoneProfileInitial());

  InformationPdoneProfile? _currentInformation;
  InformationNonePdoneProfile? _currentNoneInformation;

  InformationPdoneProfile? get currentInformation => _doneSharePreferencesUsecase.getInfoPDoneProfile();
  InformationNonePdoneProfile? get currentNoneInformation => _doneSharePreferencesUsecase.getInfoNonePDoneProfile();

  void setCurrentInformation(InformationPdoneProfile? informationPdoneProfile) =>
      _currentInformation = informationPdoneProfile;

  void setCurrentNoneInformation(InformationNonePdoneProfile? informationNonePdoneProfile) =>
      _currentNoneInformation = informationNonePdoneProfile;

  Future<void> fetchNoneInfor(InformationNonePdoneProfile informationNonePdoneProfile) async {
    _currentNoneInformation = _doneSharePreferencesUsecase.getInfoNonePDoneProfile();

    try {
      await _doneSharePreferencesUsecase.saveInfoNonePDoneProfile(informationNonePdoneProfile);
      setCurrentNoneInformation(informationNonePdoneProfile);
      emit(GetInforNoneProfileSuccess(informationNonePdoneProfile));
    } on DioException catch (error) {
      debugPrint("getInforPDone: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      emit(GetInforNoneProfileError(err));
    } catch (error) {
      debugPrint("getInforPDone: $error");
      emit(
        GetInforNoneProfileError(
          S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }

  Future<void> fetchInfor(InformationPdoneProfile informationPdoneProfile) async {
    _currentNoneInformation = _doneSharePreferencesUsecase.getInfoNonePDoneProfile();

    try {
      await _doneSharePreferencesUsecase.saveInfoPDoneProfile(informationPdoneProfile);
      setCurrentInformation(informationPdoneProfile);
      emit(GetInforProfileSuccess(informationPdoneProfile));
    } on DioException catch (error) {
      debugPrint("getInforPDone: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      emit(GetInforProfileError(err));
    } catch (error) {
      debugPrint("getInforPDone: $error");
      emit(
        GetInforProfileError(
          S.current.messages_server_internal_error.capitalize(),
        ),
      );
    }
  }
}
