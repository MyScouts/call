import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/general_setting/contracts/bloc/contract_bloc_cubit.dart';
import 'package:app_main/src/presentation/general_setting/contracts/contract_view_screen.dart';
import 'package:app_main/src/presentation/general_setting/terms_conditions/terms_conditions_v2_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'terms_conditions/terms_conditions_screen.dart';

@injectable
class GeneralRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        TermsAndConditionsScreen.routeName: (context) {
          final param = settings.arguments as List<Map<String, String>>;
          return TermsAndConditionsScreen(data: param);
        },
        TeamAndCondictionV2Screen.routeName: (context) {
          return const TeamAndCondictionV2Screen();
        },
        ContractViewScreen.routeName: (context) {
          final param = settings.arguments as Map<String, dynamic>;
          return BlocProvider(
            create: (context) => injector.get<ContractBlocCubit>(),
            child: ContractViewScreen(
              type: param['type'],
            ),
          );
        },
      };
}
