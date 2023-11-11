import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/payloads/upgrade_account/upgrade_pdone/pdone_verify_protector.dart';
import '../../../../../domain/usecases/upgrade_account_usecase.dart';

part 'guardian_pdone_event.dart';

part 'guardian_pdone_state.dart';

@injectable
class GuardianPDoneBloc extends Bloc<GuardianPDoneEvent, GuardianPDoneState> {
  final UpgradeAccountUsecase _upgradeAccountUsecase;

  GuardianPDoneBloc(this._upgradeAccountUsecase)
      : super(GuardianPDoneInitialState()) {
    on<GuardianPDoneCheckProtectorInfoEvent>(
        _mapGuardianPDoneCheckProtectorInfoEvent);
    // on<GetDistrictsByProvinceEvent>(_mapGetDistrictsByProvinceEvent);
    // on<GetWardsByDistrictEvent>(_mapGetWardsByDistrictEvent);
    // on<UserClearCountryEvent>(_mapUserClearCountryEvent);
  }

  FutureOr<void> _mapGuardianPDoneCheckProtectorInfoEvent(
      GuardianPDoneCheckProtectorInfoEvent event,
      Emitter<GuardianPDoneState> emit) async {
    try {
      emit(GuardianPDoneCheckingProtectorInfoState());
      final res = await _upgradeAccountUsecase.verifyProtector(event.payload);

      if (res) {
        emit(GuardianPDoneCheckSuccessProtectorInfoState());
      } else {
        emit(GuardianPDoneCheckFailureProtectorInfoState(
            errorMessage: 'Không tồn tại người bảo hộ'));
      }
    } catch (e) {
      emit(GuardianPDoneCheckFailureProtectorInfoState(
          errorMessage: e.toString()));
    }
  }
}
