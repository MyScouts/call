import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_delegate.dart';
import '../../config/enviroments/configurations.dart';
import 'networking_factory.dart';

@module
abstract class DatasourceModule {
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
