import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/upgrade_account/upgrade_pdone/upgrade_pdone_payload.dart';
import 'package:app_main/src/domain/entities/update_account/update_profile_payload.dart';
import 'package:app_main/src/domain/usecases/upgrade_account_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

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
      emit(UpgradePdoneOTPFail(code: data['code']));
    } catch (e) {
      emit(UpgradePdoneOTPFail(code: "INTERNAL_SERVER_ERROR"));
    }
  }

  Future upgradeEkyc(UpdateProfilePayload payload) async {
    print(payload);
    if (state is OnUpgradeEkyc) return;
    try {
      emit(OnUpgradeEkyc());
      await _usecase.upgradeEkyc(payload);
      emit(UpgradeEkycSuccess());
    } on DioException catch (error) {
      final data = error.response!.data;
      emit(UpgradeEkycFail(code: data['code']));
    } catch (e) {
      emit(UpgradeEkycFail(code: "INTERNAL_SERVER_ERROR"));
    }
  }
}
