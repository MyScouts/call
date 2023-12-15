import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/general_setting/terms_conditions/terms_conditions_v2_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'terms_conditions/terms_conditions_screen.dart';

@injectable
class GeneralRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        TermsAndConditionsScreen.routeName: (context) {
          return const TermsAndConditionsScreen();
        },
        TeamAndCondictionV2Screen.routeName: (context) {
          return const TeamAndCondictionV2Screen();
        },
      };
}
