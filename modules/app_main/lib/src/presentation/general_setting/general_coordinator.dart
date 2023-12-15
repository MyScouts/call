import 'package:flutter/material.dart';

import 'terms_conditions/terms_conditions_screen.dart';
import 'terms_conditions/terms_conditions_v2_screen.dart';

extension GeneralCoordinator on BuildContext {
  Future<T?> startTermsAndCondition<T>() {
    return Navigator.of(this).pushNamed(TermsAndConditionsScreen.routeName);
  }

  Future<T?> startTermsAndConditionV2<T>() {
    return Navigator.of(this).pushNamed(TeamAndCondictionV2Screen.routeName);
  }
}
