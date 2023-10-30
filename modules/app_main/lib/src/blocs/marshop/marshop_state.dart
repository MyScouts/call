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
