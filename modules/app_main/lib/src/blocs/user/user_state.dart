part of 'user_cubit.dart';

@immutable
sealed class UserState {
  User? get currentUser {
    final userState = this;
    if (userState is GetProfileSuccess) {
      return userState.userInfo;
    }
    return null;
  }
}

class GetProfileSuccess extends UserState {
  final User? userInfo;

  GetProfileSuccess(this.userInfo);
}

class GetProfileError extends UserState {
  final String message;

  GetProfileError(this.message);
}

final class UserInitial extends UserState {}

// Phone register state
final class OnPhoneRegister extends UserState {}

final class PhoneRegisterSuccess extends UserState {}

final class PhoneRegisterFail extends UserState {
  final String message;
  PhoneRegisterFail({required this.message});
}

// Phone completed register state
final class OnPhoneCompletedRegister extends UserState {}

final class PhoneCompletedRegisterSuccess extends UserState {}

final class PhoneCompletedRegisterFail extends UserState {
  final String message;
  PhoneCompletedRegisterFail({required this.message});
}

// Phone login
final class OnPhoneLogin extends UserState {}

final class PhoneLoginSuccess extends UserState {}

final class PhoneLoginFail extends UserState {
  final String message;
  PhoneLoginFail({required this.message});
}

// Resend OTP
final class OnResendOTP extends UserState {}

final class ResendOTPSuccess extends UserState {}

final class ResendOTPFail extends UserState {
  final String message;
  ResendOTPFail({required this.message});
}

// Forgot password
final class OnForgotPassword extends UserState {}

final class ForgotPasswordSuccess extends UserState {}

final class ForgotPasswordFail extends UserState {
  final String message;
  ForgotPasswordFail({required this.message});
}

// Reset password token
final class OnResetPasswordToken extends UserState {}

final class ResetPasswordTokenSuccess extends UserState {
  final String ott;
  ResetPasswordTokenSuccess({required this.ott});
}

final class ResetPasswordTokenFail extends UserState {
  final String message;
  ResetPasswordTokenFail({required this.message});
}

// Reset password
final class OnResetPassword extends UserState {}

final class ResetPasswordSuccess extends UserState {}

final class ResetPasswordFail extends UserState {
  final String message;
  ResetPasswordFail({required this.message});
}
// Get OTP

final class GetOTPLoading extends UserState {}

final class ResendUserOTPSuccess extends UserState {
  final Otp otp;

  ResendUserOTPSuccess({required this.otp});
}

final class GetOTPSuccess extends UserState {
  final Otp otp;
  GetOTPSuccess({required this.otp});
}

final class GetOTPFail extends UserState {
  final String message;
  GetOTPFail({required this.message});
}

// Logout
final class OnLogout extends UserState {}

final class LogoutSuccess extends UserState {}

final class LogoutFail extends UserState {}

// Get user info
final class OnGetUserInfo extends UserState {}

final class GetUserInfoSuccess extends UserState {
  final User? userInfo;
  GetUserInfoSuccess(this.userInfo);
}

final class GetUserInfoFail extends UserState {
  final String message;
  GetUserInfoFail({required this.message});
}

// Get user info
final class OnLoginQRCode extends UserState {}

final class LoginQRCodeSuccess extends UserState {}

final class LoginQRCodeFail extends UserState {
  final String code;
  LoginQRCodeFail({
    required this.code,
  });
}

// Delete user
final class OnDeleteUser extends UserState {}

final class DeleteUserSuccess extends UserState {}

final class DeleteUserFail extends UserState {
  final String message;
  DeleteUserFail({required this.message});
}

//Update Pdone Profile
final class UpdatePDoneProfileLoading extends UserState {}

final class UpdatePDoneProfileSuccess extends UserState {
  final UpdatePDoneProfileReponse user;
  UpdatePDoneProfileSuccess({required this.user});
}

final class UpdatePDoneProfileFailed extends UserState {
  final String message;
  UpdatePDoneProfileFailed({required this.message});
}

//Update None Pdone Profile
final class UpdateNonePDoneProfileLoading extends UserState {}

final class UpdateNonePDoneProfileSuccess extends UserState {
  final UpdateNonePDoneProfileReponse user;
  UpdateNonePDoneProfileSuccess({required this.user});
}

final class UpdateNonePDoneProfileFailed extends UserState {
  final String message;
  UpdateNonePDoneProfileFailed({required this.message});
}

// Get Onboarding
final class OnGetOnboarding extends UserState {}

final class OnboardingSuccess extends UserState {
  final OnboardingResponse onboarding;
  OnboardingSuccess({required this.onboarding});
}

final class OnboardingFail extends UserState {
  final OnboardingResponse onboarding;
  OnboardingFail({required this.onboarding});
}
