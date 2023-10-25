import 'package:app_core/app_core.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_delegate.dart';
import 'networking_factory.dart';

@module
abstract class DataSourceModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @prod
  Dio dioProd(SharedPreferences sharedPreferences) =>
      NetworkingFactory.createDio(
        Configurations.baseUrl,
        sharedPreferences,
        onLogout,
        Configurations.isStudio,
      );
}
