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

final class OnGetMarShopInfo extends MarshopState {}

final class GetMarShopInfoSuccess extends MarshopState {
  final MarshopResponse marshop;
  GetMarShopInfoSuccess({required this.marshop});
}

final class GetMarShopInfoFail extends MarshopState {
  final String message;
  final String code;
  GetMarShopInfoFail({required this.message, required this.code});
}
