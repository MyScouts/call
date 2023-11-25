import 'package:app_core/app_core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
  externalPackageModulesBefore: [
    ExternalModule(AppCorePackageModule),
  ],
  externalPackageModulesAfter: [
  ],
)
Future<void> configureDependencies({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async =>
    init(getIt, environment: environment, environmentFilter: environmentFilter);
