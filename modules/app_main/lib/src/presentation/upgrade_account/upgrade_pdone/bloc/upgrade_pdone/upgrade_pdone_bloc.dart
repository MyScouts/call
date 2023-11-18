import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:app_core/app_core.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/models/payloads/upgrade_account/upgrade_pdone/pdone_request_protector_req.dart';
import '../../../../../data/models/payloads/upgrade_account/upgrade_pdone/pdone_verify_protector.dart';
import '../../../../../data/models/responses/pdone/pdone_my_protector_information_response.dart';
import '../../../../../data/models/responses/register_pdone_response.dart';
import '../../../../../domain/entities/update_account/check_protector_payload.dart';
import '../../../../../domain/entities/update_account/pdone_account.dart';
import '../../../../../domain/entities/update_account/register_pdone_with_phone_payload.dart';
import '../../../../../domain/entities/update_account/update_pdone_kyc_payload.dart';
import '../../../../../domain/entities/update_account/update_profile_payload.dart';
import '../../../../../domain/entities/update_account/upgrade_account.dart';
import '../../../../../domain/entities/update_account/verify_phone_register_pdone_payload.dart';
import '../../../../../domain/usecases/upgrade_account_usecase.dart';
import '../../../../../domain/usecases/user_share_preferences_usecase.dart';
import '../../../../../domain/usecases/user_usecase.dart';
import '../../../upgrade_account_constants.dart';

part 'upgrade_pdone_event.dart';

part 'upgrade_pdone_state.dart';

@injectable
class UpgradePDoneBloc extends Bloc<UpgradePDoneEvent, UpgradePDoneState> {
  final UpgradeAccountUsecase _upgradeAccountUsecase;
  final UserSharePreferencesUsecase _userSharePreferencesUsecase;

  // final ResourceUsecase _resourceUsecase;
  final UserUsecase _userUsecase;

  // final UserSharePreferencesUsecase _userSharePreferencesUsecase;

  UpgradePDoneBloc(this._upgradeAccountUsecase, this._userUsecase,
      this._userSharePreferencesUsecase)
      : super(UpgradePDoneInitial()) {
    on<GetListMasterEvent>(_mapGetListMasterEvent);
    on<RegisterPDoneAccountEvent>(_mapRegisterPDoneAccountEvent);
    on<RegisterPDoneVerifyOtpEvent>(_mapRegisterPDoneVerifyOtpEvent);
    on<UpdatePDoneProfileEvent>(_mapUpdatePDoneProfileEvent);
    on<UpdateKYCEvent>(_mapUpdateKYCEvent);
    on<UploadKYCImageEvent>(_mapUploadKYCImageEvent);
    on<ResendOtpEvent>(_mapResendOtpEvent);
    on<ExtractingIdCardEvent>(_mapExtractingIdCardEvent);
    on<UpdatePDoneSendOTPEvent>(_mapSendOTPVerifyUpdatePdoneEvent);
    on<VerifyProtectorEvent>(_mapVerifyProtectorEvent);
    on<UploadImageBirthCerEvent>(_mapUploadImageBirthCerEvent);
    on<RequestProtectorEvent>(_mapRequestProtectorEvent);
    on<ProtectorApprovedEvent>(_mapProtectorApprovedEvent);
    on<ProtectorRejectedEvent>(_mapProtectorRejectedEvent);
  }

  FutureOr<void> _mapExtractingIdCardEvent(
      ExtractingIdCardEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(ExtractingEKycIdCard());
    log('event.eKycData : ${event.eKycData}');
    log('event.IMAGE_EKYC : ${event.eKycData['IMAGE_EKYC']}');
    log('event.INFO_RESULT : ${event.eKycData['INFO_RESULT']}');
    var infoResult = event.eKycData['INFO_RESULT'];
    var imageEKyc = event.eKycData["IMAGE_EKYC"];

    try {
      if (infoResult == null || infoResult == '') {
        // only verify face
        emit(

          ExtractedEKycIdCardSuccess(const {}, imageEKyc, event.meta),
        );
      } else {
        infoResult = jsonDecode(infoResult);
        if (infoResult['statusCode'] == 200) {
          final compareResult = jsonDecode(event.eKycData['COMPARE_RESULT']);
          if (compareResult['object']['prob'] > 90) {
            emit(
              ExtractedEKycIdCardSuccess(infoResult, imageEKyc, const {}),
            );
          } else {
            emit(ExtractedEKycIdCardFailure(
                'Khuôn mặt không trùng khớp với giấy tờ, vui lòng thử lại!'));
          }
        } else {
          emit(ExtractedEKycIdCardFailure(
              'Có lỗi xảy ra trong quá trình EKyc, vui lòng liên hệ admin để được hỗ trợ!'));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        emit(ExtractedEKycIdCardFailure(e.toString()));
      }
    }
  }

  FutureOr<void> _mapGetListMasterEvent(
      GetListMasterEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(GetListMasterLoading());
    try {
      final res = await _upgradeAccountUsecase.getListData();
      final protectorRequested =
          await _upgradeAccountUsecase.protectorRequested();

      emit(GetListMasterSuccess(
          upgradeAccount: res,
          protector: protectorRequested.requests.isEmpty
              ? null
              : protectorRequested.requests[0]));
    } catch (e) {
      emit(GetListMasterFailure(e.toString()));
    }
  }

  FutureOr<void> _mapSendOTPVerifyUpdatePdoneEvent(
      UpdatePDoneSendOTPEvent event, Emitter<UpgradePDoneState> emit) async {
    try {
      final res = await _userUsecase.genOtp();

      if (res) {
        emit(UpdatePDoneSendOTPSuccessState(
            currentPhoneNumber:
                '(+${_userSharePreferencesUsecase.getUserInfo()!.phoneCode})${_userSharePreferencesUsecase.getUserInfo()!.phone}'));
      } else {
        emit(UpdatePDoneSendOTPFailureState(
            errorMessage: 'Có lỗi xảy ra, vui lòng thử lại!'));
      }
    } catch (e) {
      emit(UpdatePDoneSendOTPFailureState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _mapVerifyProtectorEvent(
      VerifyProtectorEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(VerifyingProtectorState());
    try {
      final res = await _upgradeAccountUsecase.verifyProtector(event.req);
      emit(VerifyProtectorSuccessState(userId: res));
    } catch (e) {
      // emit(VerifyProtectorFailureState(errorMessage: e.toString()));
      emit(VerifyProtectorFailureState(
          errorMessage: 'Không tìm thấy người bảo hộ'));
      // if (e is DioException) {
      //   final data = e.response!.data;
      //   if (data['code'] == 'USER_NOT_FOUND') {
      //     emit(VerifyProtectorFailureState(
      //         errorMessage: 'Không tìm thấy người bảo hộ'));
      //   }
      // } else {
      //   emit(VerifyProtectorFailureState(errorMessage: e.toString()));
      // }
    }
  }

  FutureOr<void> _mapUploadImageBirthCerEvent(
      UploadImageBirthCerEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(UploadingImageBirthCer());

    try {
      final res =
          await _upgradeAccountUsecase.uploadBirthCer(event.xFile, 'gks');

      emit(UploadedSuccessImageBirthCer(imageBirthCerUrl: res));
    } catch (e) {
      emit(UploadedFailureImageBirthCer(errorMessage: e.toString()));
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
    emit(UpdatePDoneProfileLoading());

    try {
      bool res;
      switch (event.pDoneAPICaller) {
        case PDoneAPICaller.adult:
          res = await _upgradeAccountUsecase
              .updatePDoneProfileOver18(event.payload);
          if (res) {
            emit(UpdatePdoneAdultProfileSuccess());
          }
        case PDoneAPICaller.teenager:
          res = await _upgradeAccountUsecase
              .updatePDoneProfileRange15To18(event.payload);
          emit(UpdatePdoneTeenagerProfileSuccess());
        case PDoneAPICaller.children:
          res = await _upgradeAccountUsecase
              .updatePDoneProfileBirthCer(event.payload);
          emit(UpdatePdoneChildrenProfileSuccess());
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 409) {
          emit(UpdatePDoneProfileFailure('Tài khoản của bạn đã là PDone'));
        }
        if (e.response?.data['code'] == 'OTP_NOT_MATCH') {
          emit(UpdatePDoneProfileFailure('Bạn nhập mã OTP không chính xác!'));
        }
      } else {
        emit(UpdatePDoneProfileFailure('Có lỗi xảy ra, vui lòng thử lại!'));
      }
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

  FutureOr<void> _mapRequestProtectorEvent(
      RequestProtectorEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(RequestingProtectorState());

    try {
      final userId = await _upgradeAccountUsecase.verifyProtector(event.req);
      final reqProtectorRequest = PDoneRequestProtectorReq(
          relation: event.req.protector, protectorId: userId);
      await _upgradeAccountUsecase.requestProtector(req: reqProtectorRequest);

      emit(RequestedSuccessProtectorState());
    } catch (e) {
      if (e is DioException) {
        if (e.response?.data['code'] == "INVALID_P_DONE_ID") {
          emit(RequestedFailureProtectorState(
              errorMessage: 'Người bảo hộ không tồn tại'));
        }

        if (e.response?.data['code'] == 'ALREADY_REQUESTED') {
          emit(RequestedFailureProtectorState(
              errorMessage:
                  'Đã có yêu cầu gửi trước đó, vui lòng chờ người bảo hộ xét duyệt!'));
        }
      } else {
        emit(RequestedFailureProtectorState(
            errorMessage: 'Có lỗi xảy ra, vui lòng thử lại!'));
      }
    }
  }

  FutureOr<void> _mapProtectorApprovedEvent(
      ProtectorApprovedEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(ApproveProtectorState());
  }

  FutureOr<void> _mapProtectorRejectedEvent(
      ProtectorRejectedEvent event, Emitter<UpgradePDoneState> emit) async {
    emit(RejectProtectorState());
  }
}
