// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i12;
import 'package:dio/dio.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../app_delegate.dart' as _i3;
import '../blocs/user/user_cubit.dart' as _i21;
import '../core/services/notification/notification_service.dart' as _i7;
import '../data/data_sources/remote/auth_api.dart' as _i16;
import '../data/data_sources/remote/user_api.dart' as _i13;
import '../data/repositories/auth_repository.dart' as _i18;
import '../data/repositories/impl/auth_repository_impl.dart' as _i19;
import '../data/repositories/impl/user_repository_impl.dart' as _i15;
import '../data/repositories/user_repository.dart' as _i14;
import '../domain/usecases/authentication_usecase.dart' as _i20;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i10;
import '../domain/usecases/user_usecase.dart' as _i11;
import '../presentation/authentication/authentication_routes.dart' as _i4;
import '../presentation/dashboard/dashboard_routes.dart' as _i5;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i6;
import '../presentation/routes.dart' as _i8;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i22;
import 'modules/data_source_module.dart' as _i23;

const String _prod = 'prod';

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
  final dataSourceModule = _$DataSourceModule();
  gh.singleton<_i3.AppDelegate>(_i3.AppDelegate());
  gh.factory<_i4.AuthenticationRoutes>(() => _i4.AuthenticationRoutes());
  gh.factory<_i5.DashboardRoutes>(() => _i5.DashboardRoutes());
  gh.factory<_i6.DeeplinkBloc>(() => _i6.DeeplinkBloc());
  gh.singleton<_i7.NotificationService>(_i7.NotificationService());
  gh.singleton<_i8.Routes>(_i8.Routes());
  await gh.singletonAsync<_i9.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i10.UserSharePreferencesUsecase>(
      () => _i10.UserSharePreferencesUsecase(gh<_i9.SharedPreferences>()));
  gh.factory<_i11.UserUsecase>(() => _i11.UserUsecase());
  gh.factory<_i12.Dio>(
    () => dataSourceModule.dioProd(gh<_i9.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i13.UserApi>(() => _i13.UserApi(gh<_i12.Dio>()));
  gh.factory<_i14.UserRepository>(
      () => _i15.AuthRepositoryImpl(gh<_i13.UserApi>()));
  gh.factory<_i16.AuthApi>(() => _i16.AuthApi(gh<_i17.Dio>()));
  gh.factory<_i18.AuthRepository>(
      () => _i19.AuthRepositoryImpl(gh<_i16.AuthApi>()));
  gh.factory<_i20.AuthenticationUsecase>(() => _i20.AuthenticationUsecase(
        gh<_i18.AuthRepository>(),
        gh<_i10.UserSharePreferencesUsecase>(),
        gh<_i14.UserRepository>(),
      ));
  gh.factory<_i21.UserCubit>(() => _i21.UserCubit(
        gh<_i20.AuthenticationUsecase>(),
        gh<_i10.UserSharePreferencesUsecase>(),
      ));
  gh.singleton<_i22.AppSettingBloc>(
      _i22.AppSettingBloc(gh<_i20.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i23.DataSourceModule {}
