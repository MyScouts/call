import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/extensions/string_extension.dart';
import 'package:app_main/src/presentation/upgrade_account/place_information_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/responses/pdone/pdone_information_response.dart';
import '../../../../../data/models/responses/pdone/pdone_registering_profile.dart';
import '../../../../../domain/usecases/upgrade_account_usecase.dart';

part 'pdone_information_event.dart';

part 'pdone_information_state.dart';

@injectable
class PDoneInformationBloc
    extends Bloc<PDoneInformationEvent, PDoneInformationState> {
  final UpgradeAccountUsecase _upgradeAccountUsecase;

  PDoneInformationBloc(this._upgradeAccountUsecase)
      : super(PDoneInformationInitial()) {
    on<PDoneGetInformationEvent>(_mapPDoneGetInformationEvent);
  }

  FutureOr<void> _mapPDoneGetInformationEvent(PDoneGetInformationEvent event,
      Emitter<PDoneInformationState> emit) async {
    emit(PDoneLoadingInformation());
    try {
      final res = await _upgradeAccountUsecase.pDoneProfile();
      final eKycBase64 = await _upgradeAccountUsecase.getEKycKey();
      final decoded = utf8.decode(base64Url.decode(eKycBase64));
      ekycInfo = jsonDecode(jsonEncode(decoded));
      final registeringProfile =
          await _upgradeAccountUsecase.getRegisteringProfile();
      if (res.profile.type == 0 && registeringProfile == null) {
        emit(PDoneNotYetRegisterState());
      } else {
        emit(PDoneLoadedSuccessInformation(
            data: res.profile, registeringProfile: registeringProfile));
      }
    } catch (e) {
      emit(PDoneLoadedFailureInformation(errorMessage: e.toString()));
    }
  }
}
