import 'package:app_core/app_core.dart';
import 'package:app_main/src/blocs/user/user_cubit.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/upgrade_pdone_screen.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_ja/update_bank_account_screen.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/views/upgrade_pdone_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_bloc/mobilehub_bloc.dart';
import '../settings/contract_ja/contract_ja_screen.dart';
import '../shared/user/bloc/user_bloc.dart';
import 'upgrade_ja/upgrade_agree_policy.bloc.dart';
import 'upgrade_ja/upgrade_ja_screen.dart';
import 'upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart';
import 'upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart';
import 'upgrade_pdone/upgrade_pdone_dashboard.dart';

@injectable
class UpgradeAccountRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        UpgradeJAScreen.routeName: (context) {
          Map args = {};
          if (settings.arguments != null) {
            args = settings.arguments as Map;
          }
          return MultiBlocProvider(
            providers: [
              BlocProvider<GetDefaultBankBloc>(
                create: (context) => injector.get()..add(GetDetailDataEvent()),
              ),
              BlocProvider<UpgradeJABloc>(
                create: (context) => injector.get(),
              ),
              BlocProvider<UserCubit>.value(
                value: context.read<UserCubit>(),
              ),
            ],
            child: UpgradeJAScreen(team: args['team']),
          );
        },
        UpgradePDoneScreen.routeName: (context) {
          final args = settings.arguments as Map;
          return MultiBlocProvider(
            providers: [
              BlocProvider<UpgradePDoneBloc>(
                create: (context) => injector.get(),
              ),
              BlocProvider<UserBloc>(
                create: (context) => injector.get(),
              )
            ],
            child: UpgradePDoneScreen(
              currentStep: 0,
              isUpgrade: args['isUpgrade'] ?? false,
            ),
          );
        },
        UpgradePDoneDashboard.routeName: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<PDoneInformationBloc>(
                create: (context) => injector.get(),
              ),
              BlocProvider<UserBloc>(
                create: (context) => injector.get(),
              )
            ],
            child: const UpgradePDoneDashboard(),
          );
        },
        UpdateBankAccountScreen.routeName: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<GetListBanksBloc>(
                create: (context) => injector.get()..add(GetListDataEvent()),
              ),
              BlocProvider<UpdateBankAccountBloc>(
                create: (context) => injector.get(),
              ),
            ],
            child: const UpdateBankAccountScreen(),
          );
        },
        ContractJAScreen.routeName: (context) {
          return const ContractJAScreen();
        },
        UpgradePDoneOTPScreen.routeName: (context) {
          final args = settings.arguments as Map;
          return UpgradePDoneOTPScreen(
            payload: args['payload'],
          );
        }
      };
}
