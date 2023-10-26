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
