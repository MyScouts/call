// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../app_delegate.dart' as _i3;
import '../core/services/notification/notification_service.dart' as _i6;
import '../data/data_sources/remote/auth_api.dart' as _i13;
import '../data/data_sources/remote/user_api.dart' as _i10;
import '../data/repositories/auth_repository.impl.dart' as _i15;
import '../data/repositories/user_repository.impl.dart' as _i12;
import '../domain/repositories/auth_repository.dart' as _i14;
import '../domain/repositories/user_repository.dart' as _i11;
import '../domain/usecases/authentication_usecase.dart' as _i16;
import '../presentation/authentication/authentication_routes.dart' as _i4;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i5;
import '../presentation/routes.dart' as _i7;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i17;
import 'modules/data_source_module.dart' as _i18;

const String _prod = 'prod';

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final datasourceModule = _$DatasourceModule();
  gh.singleton<_i3.AppDelegate>(_i3.AppDelegate());
  gh.factory<_i4.AuthenticationRoutes>(() => _i4.AuthenticationRoutes());
  gh.factory<_i5.DeeplinkBloc>(() => _i5.DeeplinkBloc());
  gh.singleton<_i6.NotificationService>(_i6.NotificationService());
  gh.singleton<_i7.Routes>(_i7.Routes());
  await gh.singletonAsync<_i8.SharedPreferences>(
    () => datasourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i9.Dio>(
    () => datasourceModule.dioProd(gh<_i8.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i10.UserApi>(() => _i10.UserApi(gh<_i9.Dio>()));
  gh.factory<_i11.UserRepository>(
      () => _i12.UserRepositoryImpl(gh<_i10.UserApi>()));
  gh.factory<_i13.AuthApi>(() => _i13.AuthApi(gh<_i9.Dio>()));
  gh.factory<_i14.AuthRepository>(
      () => _i15.AuthRepositoryImpl(gh<_i13.AuthApi>()));
  gh.factory<_i16.AuthenticationUsecase>(
      () => _i16.AuthenticationUsecase(gh<_i14.AuthRepository>()));
  gh.singleton<_i17.AppSettingBloc>(
      _i17.AppSettingBloc(gh<_i16.AuthenticationUsecase>()));
  return getIt;
}

class _$DatasourceModule extends _i18.DatasourceModule {}
