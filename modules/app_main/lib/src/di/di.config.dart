// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../app_delegate.dart' as _i4;
import '../blocs/marshop/marshop_cubit.dart' as _i29;
import '../blocs/user/user_cubit.dart' as _i30;
import '../core/services/notification/notification_service.dart' as _i10;
import '../data/data_sources/remote/auth_api.dart' as _i25;
import '../data/data_sources/remote/marshop_api.dart' as _i17;
import '../data/data_sources/remote/user_api.dart' as _i22;
import '../data/repositories/auth_repository.dart' as _i26;
import '../data/repositories/impl/auth_repository_impl.dart' as _i27;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i20;
import '../data/repositories/impl/user_repository_impl.dart' as _i24;
import '../data/repositories/marshop_repository.dart' as _i19;
import '../data/repositories/user_repository.dart' as _i23;
import '../domain/usecases/authentication_usecase.dart' as _i28;
import '../domain/usecases/marshop_usecase.dart' as _i21;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i15;
import '../domain/usecases/user_usecase.dart' as _i16;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/dashboard/dashboard_routes.dart' as _i6;
import '../presentation/marshop/marshop_routes.dart' as _i9;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i8;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i7;
import '../presentation/qr_code/qr_code_route.dart' as _i11;
import '../presentation/routes.dart' as _i12;
import '../presentation/settings/setting_routes.dart' as _i13;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i31;
import 'modules/data_source_module.dart' as _i32;

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
  await _i3.AppCorePackageModule().init(gh);
  final dataSourceModule = _$DataSourceModule();
  gh.singleton<_i4.AppDelegate>(_i4.AppDelegate());
  gh.factory<_i5.AuthenticationRoutes>(() => _i5.AuthenticationRoutes());
  gh.factory<_i6.DashboardRoutes>(() => _i6.DashboardRoutes());
  gh.factory<_i7.DeeplinkBloc>(() => _i7.DeeplinkBloc());
  gh.factory<_i8.GeneralRoutes>(() => _i8.GeneralRoutes());
  gh.factory<_i9.MarkShopRoutes>(() => _i9.MarkShopRoutes());
  gh.singleton<_i10.NotificationService>(_i10.NotificationService());
  gh.factory<_i11.QrCodeRoutes>(() => _i11.QrCodeRoutes());
  gh.singleton<_i12.Routes>(_i12.Routes());
  gh.factory<_i13.SettingRoutes>(() => _i13.SettingRoutes());
  await gh.singletonAsync<_i14.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i15.UserSharePreferencesUsecase>(
      () => _i15.UserSharePreferencesUsecase(gh<_i14.SharedPreferences>()));
  gh.factory<_i16.UserUsecase>(() => _i16.UserUsecase());
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i14.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i17.MarshopAPI>(() => _i17.MarshopAPI(gh<_i18.Dio>()));
  gh.factory<_i19.MarshopRepository>(
      () => _i20.MarshopRepositoryImpl(gh<_i17.MarshopAPI>()));
  gh.factory<_i21.MarshopUsecase>(
      () => _i21.MarshopUsecase(gh<_i19.MarshopRepository>()));
  gh.factory<_i22.UserApi>(() => _i22.UserApi(gh<_i3.Dio>()));
  gh.factory<_i23.UserRepository>(
      () => _i24.AuthRepositoryImpl(gh<_i22.UserApi>()));
  gh.factory<_i25.AuthApi>(() => _i25.AuthApi(gh<_i18.Dio>()));
  gh.factory<_i26.AuthRepository>(
      () => _i27.AuthRepositoryImpl(gh<_i25.AuthApi>()));
  gh.factory<_i28.AuthenticationUsecase>(() => _i28.AuthenticationUsecase(
        gh<_i26.AuthRepository>(),
        gh<_i15.UserSharePreferencesUsecase>(),
        gh<_i23.UserRepository>(),
      ));
  gh.factory<_i29.MarshopCubit>(
      () => _i29.MarshopCubit(gh<_i21.MarshopUsecase>()));
  gh.factory<_i30.UserCubit>(() => _i30.UserCubit(
        gh<_i28.AuthenticationUsecase>(),
        gh<_i15.UserSharePreferencesUsecase>(),
      ));
  gh.singleton<_i31.AppSettingBloc>(
      _i31.AppSettingBloc(gh<_i28.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i32.DataSourceModule {}
