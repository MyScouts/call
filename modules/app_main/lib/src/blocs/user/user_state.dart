part of 'user_cubit.dart';

@immutable
sealed class UserState {}

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
