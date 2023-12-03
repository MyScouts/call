import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/marshop/marshop_cubit.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/marshop/marshop_bloc.dart';
import 'package:app_main/src/presentation/marshop/register_customer/register_customer_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/%20marshop_referral_code_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/confirm_infomation_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/confirm_information_address_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_pack_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_pack_detail_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/transaction_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class MarkShopRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        RegisterCustomerScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return RegisterCustomerScreen(
            marshopId: args['marshopId'],
          );
        },
        RegisterMarshopScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return BlocProvider.value(
            value: injector.get<UserCubit>(),
            child: BlocProvider(
              create: (context) => injector.get<MarshopDetailBloc>(),
              child: RegisterMarshopScreen(
                marshopId: args['marshopId'],
              ),
            ),
          );
        },
        MarshopReferralCodeScreen.routeName: (context) {
          return const MarshopReferralCodeScreen();
        },
        RegisterMarshopPackScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return BlocProvider(
            create: (context) => injector.get<ListMarshopRegisterPackBloc>(),
            child: RegisterMarshopPackScreen(
              authInfo: args['authInfo'],
              marshop: args['marshop'],
            ),
          );
        },
        RegisterPackDetailScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return RegisterPackDetailScreen(pack: args['pack']);
        },
        ConfirmInfomationScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return BlocProvider(
            create: (context) => injector.get<ListProductBloc>(),
            child: ConfirmInfomationScreen(
              pack: args['pack'],
              authInfo: args['authInfo'],
              marshop: args['marshop'],
            ),
          );
        },
        ConfirmInfomationAddressScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return BlocProvider(
            create: (context) => injector.get<MarshopCubit>(),
            child: ConfirmInfomationAddressScreen(
              pack: args['pack'],
              authInfo: args['authInfo'],
              marshop: args['marshop'],
            ),
          );
        },
        TransactionDetailScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return TransactionDetailScreen(
            pack: args['pack'],
            authInfo: args['authInfo'],
            marshop: args['marshop'],
            address: args['address'],
          );
        },
      };
}
