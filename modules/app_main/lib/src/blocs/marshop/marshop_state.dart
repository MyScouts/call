part of 'marshop_cubit.dart';

@immutable
sealed class MarshopState {}

final class MarshopInitial extends MarshopState {}

final class OnRegisterCustomer extends MarshopState {}

final class RegisterCustomerSuccess extends MarshopState {}

final class RegisterCustomerFailed extends MarshopState {
  final String message;
  RegisterCustomerFailed({required this.message});
}

final class OnRegisterMarshop extends MarshopState {}

final class RegisterMarshopSuccess extends MarshopState {}

final class RegisterMarshopFail extends MarshopState {
  final String message;
  RegisterMarshopFail({required this.message});
}
