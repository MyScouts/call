import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:app_core/app_core.dart';
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
    final res = await _upgradeAccountUsecase.pDoneProfile();
    final eKycBase64 = await _upgradeAccountUsecase.getEKycKey();
    final decoded = utf8.decode(base64.decode(eKycBase64));
    ekycInfo = json.decode(decoded);
    ekycInfo = {
      "access_token":
          "bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5NmRmZWU1OS05NDRiLTExZWUtOTRjZC0wMTczNjY3ZTMxMWIiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoiZHVjZG90cm9uZzIwMDBAZ21haWwuY29tIiwic2NvcGUiOlsicmVhZCJdLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdCIsIm5hbWUiOiJkdWNkb3Ryb25nMjAwMEBnbWFpbC5jb20iLCJleHAiOjE3MDQ0NjgzNjMsInV1aWRfYWNjb3VudCI6Ijk2ZGZlZTU5LTk0NGItMTFlZS05NGNkLTAxNzM2NjdlMzExYiIsImF1dGhvcml0aWVzIjpbIlVTRVIiXSwianRpIjoiZDEzNTYwYjQtZGZjYy00MmE1LWFiNjQtMzU2MzFlNGYyYzNiIiwiY2xpZW50X2lkIjoiY2xpZW50YXBwIn0.C_cQGPGp2BsGAlx4ZCES1Et3ULm1U7da2qNVDedCGu8HaYCqDtmycxfjYNFj4SLGAlAcc68IZEeelrZ-XjyhQX4T0uT19CJSmtg4wU5hMZf3_zKXkVCkxr-totAHj8qeUE8lyomEpMJCX7pWhwmGWuUpwxrLIVDcW1A-QM8halqB50Vys6NDfhr79YXRBZbuTe-EL4BcHQ7FkEx6bHe5aBxrNR6twvhC3yDBuWX68b389-5bpVBg6BGGlMFXDMIWmStF8X8aOVBXEan43S_8O0-xDuFE5UMgs3gFa-7gRuj1v-FYkPxhsjJATSKQh_gvYcxhNyjEk__QyHaAUlDOyw",
      "token_id": "0bd9f38d-5604-4618-e063-62199f0ac4bb",
      "token_key":
          "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKz7ZQo75lWAf2vZirvnNPlHPDnimBchljVDWbMS/EPdbVQeM5UMn1FC/UemnM6mJIc9+KrGwodZBV6LA1YaqeECAwEAAQ==",
    };
    final registeringProfile =
        await _upgradeAccountUsecase.getRegisteringProfile();
    if (res.profile.type == 0 && registeringProfile == null) {
      emit(PDoneNotYetRegisterState());
    } else {
      emit(PDoneLoadedSuccessInformation(
          data: res.profile, registeringProfile: registeringProfile));
    }
  }
}
