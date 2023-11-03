part of 'upgrade_pdone_bloc.dart';

@immutable
abstract class UpgradePDoneState {}

@immutable
class UpgradePDoneInitial extends UpgradePDoneState {}

class GetListMasterLoading extends UpgradePDoneState {}

class GetListMasterSuccess extends UpgradePDoneState {
  final UpgradeAccount upgradeAccount;

  GetListMasterSuccess(this.upgradeAccount);
}

class GetListMasterFailure extends UpgradePDoneState {
  final String errorMessage;

  GetListMasterFailure(this.errorMessage);
}

class RegisterPDoneAccountSuccess extends UpgradePDoneState {
  final RegisterPDoneResponse response;

  RegisterPDoneAccountSuccess(this.response);
}

class RegisterPDoneAccountFailure extends UpgradePDoneState {
  final String errorMessage;
  final dynamic error;

  RegisterPDoneAccountFailure(
    this.errorMessage,
    this.error,
  );
}

class VerifyOtpLoading extends UpgradePDoneState {}

class VerifyOtpSuccess extends UpgradePDoneState {}

class VerifyOtpFailure extends UpgradePDoneState {
  final String errorMessage;

  VerifyOtpFailure(this.errorMessage);
}

class UpdateProfileLoading extends UpgradePDoneState {}

class UpdateProfileSuccess extends UpgradePDoneState {}

class UpdateProfileFailure extends UpgradePDoneState {
  final String errorMessage;

  UpdateProfileFailure(this.errorMessage);
}

class UpdateKYCLoading extends UpgradePDoneState {}

class UpdateKYCSuccess extends UpgradePDoneState {}

class UpdateKYCFailure extends UpgradePDoneState {
  final String errorMessage;

  UpdateKYCFailure(this.errorMessage);
}

class UploadKYCImageUploading extends UpgradePDoneState {
  final String localImage;
  final ImageKYCType type;

  UploadKYCImageUploading(this.localImage, this.type);
}

class UploadKYCImageSuccess extends UpgradePDoneState {
  final String image;
  final ImageKYCType type;

  UploadKYCImageSuccess(this.image, this.type);
}

class UploadKYCImageFailure extends UpgradePDoneState {
  final String errorMessage;
  final ImageKYCType type;

  UploadKYCImageFailure(this.errorMessage, this.type);
}

class ResendOtpSuccess extends UpgradePDoneState {
  final RegisterPDoneResponse response;

  ResendOtpSuccess(this.response);
}

class ResendOtpFailure extends UpgradePDoneState {
  final String errorMessage;

  ResendOtpFailure(this.errorMessage);
}

class GetMyProfileSuccess extends UpgradePDoneState {
  final PDoneAccount user;

  GetMyProfileSuccess(this.user);
}

class GetMyProfileSuccessFailure extends UpgradePDoneState {
  final String errorMessage;

  GetMyProfileSuccessFailure(this.errorMessage);
}

class ExtractingEKycIdCard extends UpgradePDoneState {
}

class ExtractedEKycIdCardSuccess extends UpgradePDoneState {
  final dynamic data;

  ExtractedEKycIdCardSuccess(this.data);
}

class ExtractedEKycIdCardFailure extends UpgradePDoneState {
  final String errorMessage;

  ExtractedEKycIdCardFailure(this.errorMessage);
}
