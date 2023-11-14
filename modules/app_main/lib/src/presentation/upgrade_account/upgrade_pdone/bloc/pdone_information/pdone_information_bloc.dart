import 'dart:async';

import 'package:app_core/app_core.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/responses/pdone/pdone_information_response.dart';
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
      if (res.profile.type == 0) {
        emit(PDoneNotYetRegisterState());
      } else {
        emit(PDoneLoadedSuccessInformation(data: res.profile));
      }
    } catch (e) {
      emit(PDoneLoadedFailureInformation(errorMessage: e.toString()));
    }
  }
}
