part of 'upgrade_pdone_bloc.dart';

@immutable
abstract class UpgradePDoneEvent {}

@immutable
class GetListMasterEvent extends UpgradePDoneEvent {}

@immutable
class RegisterPDoneAccountEvent extends UpgradePDoneEvent {
  final String? phoneNumber;
  final int? countryId;
  final String? phoneCode;
  final String? email;

  RegisterPDoneAccountEvent({
    this.phoneNumber,
    this.countryId,
    this.phoneCode,
    this.email,
  });
}

@immutable
class ResendOtpEvent extends UpgradePDoneEvent {
  final String? phoneNumber;
  final String? phoneCode;
  final String? email;

  ResendOtpEvent({
    this.phoneNumber,
    this.phoneCode,
    this.email,
  });
}

@immutable
class RegisterPDoneVerifyOtpEvent extends UpgradePDoneEvent {
  final RegisterPDoneResponse response;
  final String otp;

  RegisterPDoneVerifyOtpEvent({
    required this.response,
    required this.otp,
  });
}

@immutable
class UpdatePDoneProfileEvent extends UpgradePDoneEvent {
  final UpdateProfilePayload payload;

  UpdatePDoneProfileEvent(this.payload);
}

@immutable
class UpdateKYCEvent extends UpgradePDoneEvent {
  final UpdatePDoneKYCPayload payload;

  UpdateKYCEvent(this.payload);
}

@immutable
class UploadKYCImageEvent extends UpgradePDoneEvent {
  final String image;
  final ImageKYCType type;

  UploadKYCImageEvent(this.image, this.type);
}
