part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class OnSendOTP extends AuthState {}

final class SendOTPSuccess extends AuthState {}

final class SendOTPFail extends AuthState {
  final String message;
  SendOTPFail({required this.message});
}

final class OnResendOTP extends AuthState {}

final class ResendOTPSuccess extends AuthState {}

final class ResendOTPFail extends AuthState {
  final String message;
  ResendOTPFail({required this.message});
}
