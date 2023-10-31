import 'package:flutter/material.dart';

import 'terms_conditions/terms_conditions_screen.dart';

extension GeneralCoordinator on BuildContext {
  // Future<T?> startSettings<T>() {
  //   return Navigator.of(this).pushNamed(SettingScreen.routeName);
  // }
  //
  // Future<T?> startAccountGeneralSettings<T>() {
  //   return Navigator.of(this).pushNamed(AccountGeneralScreen.routeName);
  // }

  Future<T?> startTermsAndCondition<T>() {
    return Navigator.of(this).pushNamed(TermsAndConditionsScreen.routeName);
  }
  //
  // Future<T?> startTutorialAccount<T>() {
  //   return Navigator.of(this).pushNamed(TutorialAccountScreen.routeName);
  // }
  //
  // Future<T?> startContractJA<T>() {
  //   return Navigator.of(this).pushNamed(ContractJAScreen.routeName);
  // }
  //
  // Future<T?> startConfirmDeleteAccount<T>() {
  //   return showGeneralDialog<T>(
  //     context: this,
  //     barrierDismissible: true,
  //     barrierLabel: '',
  //     pageBuilder: (context, animation1, animation2) {
  //       return BlocProvider<DeleteAccountBloc>(
  //         create: (context) => injector.get(),
  //         child: const DialogConfirmDeleteAccountWidget(),
  //       );
  //     },
  //   );
  // }
}
