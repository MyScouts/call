import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/upgrade_pdone_payload.dart';
import 'package:app_main/src/domain/entities/update_account/update_profile_payload.dart';
import 'package:app_main/src/domain/usecases/upgrade_account_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:localization/localization.dart';

part 'upgrade_state.dart';

@injectable
class UpgradeCubit extends Cubit<UpgradeState> {
  final UpgradeAccountUsecase _usecase;
  UpgradeCubit(this._usecase) : super(UpgradeInitial());

  Future onUpgradeOTP(UpgradePDonePayload payload) async {
    if (state is OnUpgradePdoneOTP) return;
    try {
      emit(OnUpgradePdoneOTP());
      await _usecase.upgradePdone(payload);
      emit(UpgradePdoneOTPSuccess());
    } on DioException catch (error) {
      final data = error.response!.data;
      debugPrint("onUpgradeOTP: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      switch (data['code']) {
        case "NOT_CHILD_P_DONE":
          err = S.current.message_otp_not_match;
        case "USER_NOT_FOUND":
          break;
        default:
          err = S.current.message_otp_not_match;
          break;
      }
      emit(UpgradePdoneOTPFail(message: err));
    } catch (e) {
      emit(UpgradePdoneOTPFail(
        message: S.current.messages_server_internal_error.capitalize(),
      ));
    }
  }

  Future upgradeEkyc(UpdateProfilePayload payload) async {
    if (state is OnUpgradeEkyc) return;
    try {
      emit(OnUpgradeEkyc());
      await _usecase.upgradeEkyc(payload);
      emit(UpgradeEkycSuccess());
    } on DioException catch (error) {
      final data = error.response!.data;
      debugPrint("upgradeEkyc: $error");
      String err = S.current.messages_server_internal_error.capitalize();
      switch (data['code']) {
        default:
          err = S.current.message_otp_not_match;
          break;
      }
      emit(UpgradeEkycFail(message: err));
    } catch (e) {
      emit(UpgradeEkycFail(
        message: S.current.messages_server_internal_error.capitalize(),
      ));
    }
  }
}
