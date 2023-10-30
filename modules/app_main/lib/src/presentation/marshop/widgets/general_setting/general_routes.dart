import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

import 'terms_conditions/terms_conditions_screen.dart';

@injectable
class GeneralRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        // AccountGeneralScreen.routeName: (context) {
        //   return const AccountGeneralScreen();
        // },
        TermsAndConditionsScreen.routeName: (context) {
          return const TermsAndConditionsScreen();
        },
        // TutorialAccountScreen.routeName: (context) {
        //   return const TutorialAccountScreen();
        // },
        // ContractJAScreen.routeName: (context) {
        //   return const ContractJAScreen();
        // },
      };
}
