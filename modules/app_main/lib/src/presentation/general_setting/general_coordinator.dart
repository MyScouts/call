import 'package:flutter/material.dart';

import 'terms_conditions/terms_conditions_screen.dart';
import 'terms_conditions/terms_conditions_v2_screen.dart';

extension GeneralCoordinator on BuildContext {
  Future<T?> startTermsAndCondition<T>(List<Map<String, String>> data) {
    return Navigator.of(this).pushNamed(
      TermsAndConditionsScreen.routeName,
      arguments: data,
    );
  }

  Future<T?> startTermsAndConditionV2<T>() {
    return Navigator.of(this).pushNamed(TeamAndCondictionV2Screen.routeName);
  }
}
