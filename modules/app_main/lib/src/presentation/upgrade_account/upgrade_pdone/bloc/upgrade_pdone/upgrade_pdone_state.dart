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

class UpdatePDoneProfileLoading extends UpgradePDoneState {}

class UpdatePdoneAdultProfileSuccess extends UpgradePDoneState {

  UpdatePdoneAdultProfileSuccess();
}

class UpdatePdoneTeenagerProfileSuccess extends UpgradePDoneState {

  UpdatePdoneTeenagerProfileSuccess();
}

class UpdatePdoneChildrenProfileSuccess extends UpgradePDoneState {

  UpdatePdoneChildrenProfileSuccess();
}

class UpdatePDoneProfileFailure extends UpgradePDoneState {
  final String errorMessage;

  UpdatePDoneProfileFailure(this.errorMessage);
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

class ExtractingEKycIdCard extends UpgradePDoneState {}

class ExtractedEKycIdCardSuccess extends UpgradePDoneState {
  final dynamic dataEKyc;
  final dynamic imageEKyc;
  final dynamic metaData; // cái này có thể là url ảnh giấy khai sinh từ những bước trước

  ExtractedEKycIdCardSuccess(this.dataEKyc, this.imageEKyc, this.metaData);
}

class ExtractedEKycIdCardFailure extends UpgradePDoneState {
  final String errorMessage;

  ExtractedEKycIdCardFailure(this.errorMessage);
}

class UpdatePDoneSendOTPSuccessState extends UpgradePDoneState {
  UpdatePDoneSendOTPSuccessState();
}

class UpdatePDoneSendOTPFailureState extends UpgradePDoneState {
  final String errorMessage;

  UpdatePDoneSendOTPFailureState({required this.errorMessage});
}

// verify protector
class VerifyingProtectorState extends UpgradePDoneState {}

class VerifyProtectorSuccessState extends UpgradePDoneState {
  final int userId;
  VerifyProtectorSuccessState({required this.userId});
}

class VerifyProtectorFailureState extends UpgradePDoneState {
  final String errorMessage;

  VerifyProtectorFailureState({required this.errorMessage});
}

class UploadingImageBirthCer extends UpgradePDoneState {}

class UploadedSuccessImageBirthCer extends UpgradePDoneState {
  final String imageBirthCerUrl;
  UploadedSuccessImageBirthCer({required this.imageBirthCerUrl});
}

class UploadedFailureImageBirthCer extends UpgradePDoneState {
  final String errorMessage;

  UploadedFailureImageBirthCer({required this.errorMessage});
}


class RequestingProtectorState extends UpgradePDoneState {
  RequestingProtectorState();
}


class RequestedSuccessProtectorState extends UpgradePDoneState {
  RequestedSuccessProtectorState();
}

class ApproveProtectorState extends UpgradePDoneState {
  ApproveProtectorState();
}

class RejectProtectorState extends UpgradePDoneState {
  RejectProtectorState();
}

class RequestedFailureProtectorState extends UpgradePDoneState {
  final String errorMessage;
  RequestedFailureProtectorState({required this.errorMessage});
}
