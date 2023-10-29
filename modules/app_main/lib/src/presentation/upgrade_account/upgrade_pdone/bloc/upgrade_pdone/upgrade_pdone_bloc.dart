import 'dart:async';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/responses/register_pdone_response.dart';
import '../../../../../domain/entities/update_account/check_protector_payload.dart';
import '../../../../../domain/entities/update_account/pdone_account.dart';
import '../../../../../domain/entities/update_account/register_pdone_with_phone_payload.dart';
import '../../../../../domain/entities/update_account/update_pdone_kyc_payload.dart';
import '../../../../../domain/entities/update_account/update_profile_payload.dart';
import '../../../../../domain/entities/update_account/upgrade_account.dart';
import '../../../../../domain/entities/update_account/verify_phone_register_pdone_payload.dart';
import '../../../../../domain/usecases/resource_usecase.dart';
import '../../../../../domain/usecases/upgrade_account_usecase.dart';
import '../../../upgrade_account_constants.dart';

part 'upgrade_pdone_event.dart';
part 'upgrade_pdone_state.dart';

@injectable
class UpgradePDoneBloc extends Bloc<UpgradePDoneEvent, UpgradePDoneState> {
  final UpgradeAccountUsecase _upgradeAccountUsecase;
  final ResourceUsecase _resourceUsecase;

  UpgradePDoneBloc(this._upgradeAccountUsecase, this._resourceUsecase)
      : super(UpgradePDoneInitial()) {
    on<GetListMasterEvent>(_mapGetListMasterEvent);
    on<RegisterPDoneAccountEvent>(_mapRegisterPDoneAccountEvent);
    on<RegisterPDoneVerifyOtpEvent>(_mapRegisterPDoneVerifyOtpEvent);
    on<UpdatePDoneProfileEvent>(_mapUpdatePDoneProfileEvent);
    on<UpdateKYCEvent>(_mapUpdateKYCEvent);
    on<UploadKYCImageEvent>(_mapUploadKYCImageEvent);
    on<ResendOtpEvent>(_mapResendOtpEvent);
  }

  FutureOr<void> _mapGetListMasterEvent(
      GetListMasterEvent event, Emitter<UpgradePDoneState> emit) async {
    try {
      final res = await _upgradeAccountUsecase.getListData();

      emit(GetListMasterSuccess(res));
    } catch (e) {
      if (kDebugMode) {
        emit(GetListMasterFailure(e.toString()));
      }
    }
  }

  FutureOr<void> _mapRegisterPDoneAccountEvent(
      RegisterPDoneAccountEvent event, Emitter<UpgradePDoneState> emit) async {
    try {
      final res = await _upgradeAccountUsecase.registerPDoneAccount(
        RegisterPDoneAccountPayload(
          countryId: event.countryId,
          phoneCode: event.phoneCode,
          phoneNumber: event.phoneNumber,
          email: event.email,
        ),
      );

      emit(RegisterPDoneAccountSuccess(res));
    } catch (e) {
      emit(RegisterPDoneAccountFailure(e.toString(), e));
    }
  }

  FutureOr<void> _mapRegisterPDoneVerifyOtpEvent(
      RegisterPDoneVerifyOtpEvent event,
      Emitter<UpgradePDoneState> emit) async {
    emit(VerifyOtpLoading());

    try {
      final res = await _upgradeAccountUsecase.verifyOtpRegisterPDone(
        VerifyOtpPDonePayload(
          phoneCode: event.response.phoneCode,
          phone: event.response.phone,
          otp: event.otp,
          token: event.response.token,
          email: event.response.email,
        ),
      );

      if (res) {
        emit(VerifyOtpSuccess());
      }
    } catch (e) {
      emit(VerifyOtpFailure(e.toString()));
    }
  }

  FutureOr<void> _mapUpdatePDoneProfileEvent(
      UpdatePDoneProfileEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(UpdateProfileLoading());

    try {
      final res =
          await _upgradeAccountUsecase.updatePDoneProfile(event.payload);

      if (res) {
        emit(UpdateProfileSuccess());
      }
    } catch (e) {
      emit(UpdateProfileFailure(e.toString()));
    }
  }

  FutureOr<void> _mapUpdateKYCEvent(
      UpdateKYCEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(UpdateKYCLoading());

    try {
      final res = await _upgradeAccountUsecase.updateKYC(event.payload);

      if (res) {
        emit(UpdateKYCSuccess());
      }
    } catch (e) {
      emit(UpdateKYCFailure(e.toString()));
    }
  }

  FutureOr<void> _mapUploadKYCImageEvent(
      UploadKYCImageEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(UploadKYCImageUploading(event.image, event.type));

    try {
      final res = await _resourceUsecase.uploadImage(File(event.image));

      emit(UploadKYCImageSuccess(res, event.type));
    } catch (e) {
      emit(UpdateKYCFailure(e.toString()));
    }
  }

  FutureOr<void> _mapResendOtpEvent(
      ResendOtpEvent event, Emitter<UpgradePDoneState> emit) async {
    try {
      final payload = RegisterPDoneAccountPayload(
        phoneCode: event.phoneCode,
        phoneNumber: event.phoneNumber,
        email: event.email,
      );

      final res = event.phoneNumber != null
          ? await _upgradeAccountUsecase.resendOtpPhone(payload)
          : await _upgradeAccountUsecase.resendOtpEmail(payload);

      emit(ResendOtpSuccess(res));
    } catch (e) {
      emit(ResendOtpFailure(e.toString()));
    }
  }

  Future<bool> checkPDoneAccountEvent(String text) async {
    try {
      return _upgradeAccountUsecase.checkIsPDone(text);
    } catch (e) {
      return false;
    }
  }

  Future<RegisterPDoneResponse> checkProtector(
      CheckProtectorPayload payload) async {
    try {
      return _upgradeAccountUsecase.checkProtector(payload);
    } catch (e) {
      rethrow;
    }
  }
}
