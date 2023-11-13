import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/marshop/register_customer/register_customer_screen.dart';
import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_screen.dart';
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
          return BlocProvider.value(
            value: injector.get<UserCubit>(),
            child: const RegisterMarshopScreen(),
          );
        },
      };
}
