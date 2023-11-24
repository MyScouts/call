import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:wallet/core/core.dart';

@module
abstract class ConfigModule {
  @singleton
  WalletConfigurations createWalletConfigurations() => WalletConfigurations(
        Configurations.baseUrl,
        Configurations.isProduction,
      );
}
