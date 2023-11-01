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
  final User userInfo;

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

