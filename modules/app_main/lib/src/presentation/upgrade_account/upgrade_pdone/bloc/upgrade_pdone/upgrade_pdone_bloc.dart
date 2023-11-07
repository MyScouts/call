import 'dart:async';
import 'dart:convert';
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
import '../../../../../domain/usecases/upgrade_account_usecase.dart';
import '../../../../../domain/usecases/user_usecase.dart';
import '../../../upgrade_account_constants.dart';

part 'upgrade_pdone_event.dart';

part 'upgrade_pdone_state.dart';

@injectable
class UpgradePDoneBloc extends Bloc<UpgradePDoneEvent, UpgradePDoneState> {
  final UpgradeAccountUsecase _upgradeAccountUsecase;

  // final ResourceUsecase _resourceUsecase;
  final UserUsecase _userUsecase;

  // final UserSharePreferencesUsecase _userSharePreferencesUsecase;

  UpgradePDoneBloc(this._upgradeAccountUsecase, this._userUsecase)
      : super(UpgradePDoneInitial()) {
    on<GetListMasterEvent>(_mapGetListMasterEvent);
    on<RegisterPDoneAccountEvent>(_mapRegisterPDoneAccountEvent);
    on<RegisterPDoneVerifyOtpEvent>(_mapRegisterPDoneVerifyOtpEvent);
    on<UpdatePDoneProfileEvent>(_mapUpdatePDoneProfileEvent);
    on<UpdateKYCEvent>(_mapUpdateKYCEvent);
    on<UploadKYCImageEvent>(_mapUploadKYCImageEvent);
    on<ResendOtpEvent>(_mapResendOtpEvent);
    on<ExtractingIdCardEvent>(_mapExtractingIdCardEvent);
    on<UpdatePDoneSendOTP>(_mapSendOTPVerifyUpdatePdoneEvent);
  }

  FutureOr<void> _mapExtractingIdCardEvent(
      ExtractingIdCardEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(ExtractingEKycIdCard());
    final infoResult = jsonDecode(event.eKycData['INFO_RESULT']);
    final imageEKyc = event.eKycData["IMAGE_EKYC"];

    try {
      if (infoResult['statusCode'] == 200) {
        emit(
          ExtractedEKycIdCardSuccess(infoResult, imageEKyc),
        );
      } else {
        emit(ExtractedEKycIdCardFailure(
            'Có lỗi xảy ra trong quá trình EKyc, vui lòng liên hệ admin để được hỗ trợ!'));
      }
    } catch (e) {
      if (kDebugMode) {
        emit(ExtractedEKycIdCardFailure(e.toString()));
      }
    }
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

  FutureOr<void> _mapSendOTPVerifyUpdatePdoneEvent(
      UpdatePDoneSendOTP event, Emitter<UpgradePDoneState> emit) async {
    try {
      final res = await _userUsecase.genOtp();

      if (res) {
        emit(UpdatePDoneSendOTPSuccessState());
      } else {
        emit(UpdatePDoneSendOTPFailureState(
            errorMessage: 'Có lỗi xảy ra, vui lòng thử lại!'));
      }
    } catch (e) {
      emit(UpdatePDoneSendOTPFailureState(errorMessage: e.toString()));
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
      // if (res) {
      //   emit(
      //     RegisterPDoneAccountSuccess(
      //       RegisterPDoneResponse(
      //           token: _userSharePreferencesUsecase.getToken() ?? '',
      //           phoneCode: event.phoneCode,
      //           phone: event.phoneNumber,
      //           email: event.email),
      //     ),
      //   );
      // } else {
      //   emit(RegisterPDoneAccountFailure('Something wrong', null));
      // }
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
      if (e is DioException) {
        if (e.response?.statusCode == 409) {
          emit(UpdateProfileFailure('Tài khoản của bạn đã là PDone'));
        }
        if (e.response?.data['code'] == 'OTP_NOT_MATCH') {
          emit(UpdateProfileFailure('Bạn nhập mã OTP không chính xác!'));
        }
      }
      emit(UpdateProfileFailure('Có lỗi xảy ra, vui lòng thử lại!'));
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
      // final res = await _resourceUsecase.uploadImage(File(event.image));

      emit(UploadKYCImageSuccess(event.image, event.type));
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
          countryId: 240);

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
