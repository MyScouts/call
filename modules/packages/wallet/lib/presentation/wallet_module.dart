import 'package:app_core/app_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/core.dart';
import 'shared/bloc/wallet_bloc.dart';
import 'wallet_screen.dart';

@module
abstract class WalletModule {
  @factory
  WalletProvider walletProviderProd(SharedPreferences sharedPreferences,
          WalletConfigurations configurations) =>
      WalletProvider(configurations.baseUrl, sharedPreferences);
}

class WalletFactory {
  static Widget createWalletScreen(
      {required User user, VoidCallback? backToLive}) {
    WalletInjectedData.setUser = user;
    return BlocProvider.value(
      value: injector<WalletBloc>(),
      child: WalletScreen(
        onBackLive: backToLive,
      ),
    );
  }
}
