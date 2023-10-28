// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i15;
import 'package:dio/dio.dart' as _i23;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i16;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../app_delegate.dart' as _i3;
import '../blocs/user/user_cubit.dart' as _i32;
import '../core/services/notification/notification_service.dart' as _i8;
import '../data/data_sources/remote/auth_api.dart' as _i24;
import '../data/data_sources/remote/community_api.dart' as _i28;
import '../data/data_sources/remote/user_api.dart' as _i22;
import '../data/models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart'
    as _i19;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i20;
import '../data/models/responses/upgrade_account_response.dart' as _i17;
import '../data/repositories/auth_repository.dart' as _i25;
import '../data/repositories/impl/auth_repository_impl.dart' as _i26;
import '../data/repositories/impl/community_repository.impl.dart' as _i30;
import '../domain/entities/bank.dart' as _i21;
import '../domain/entities/commity_action_type.dart' as _i18;
import '../domain/repository/community_repository.dart' as _i29;
import '../domain/repository/upgrade_account_repository.dart' as _i13;
import '../domain/usecases/authentication_usecase.dart' as _i27;
import '../domain/usecases/community_usecase.dart' as _i31;
import '../domain/usecases/upgrade_account_usecase.dart' as _i12;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i14;
import '../presentation/authentication/authentication_routes.dart' as _i4;
import '../presentation/dashboard/dashboard_routes.dart' as _i5;
import '../presentation/general_setting/general_routes.dart' as _i7;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i6;
import '../presentation/routes.dart' as _i9;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i33;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i11;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i35;
import 'modules/data_source_module.dart' as _i34;

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
  final upgradeAgreePolicyBlocFactory = _$UpgradeAgreePolicyBlocFactory();
  gh.singleton<_i3.AppDelegate>(_i3.AppDelegate());
  gh.factory<_i4.AuthenticationRoutes>(() => _i4.AuthenticationRoutes());
  gh.factory<_i5.DashboardRoutes>(() => _i5.DashboardRoutes());
  gh.factory<_i6.DeeplinkBloc>(() => _i6.DeeplinkBloc());
  gh.factory<_i7.GeneralRoutes>(() => _i7.GeneralRoutes());
  gh.singleton<_i8.NotificationService>(_i8.NotificationService());
  gh.singleton<_i9.Routes>(_i9.Routes());
  await gh.singletonAsync<_i10.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i11.UpgradeAccountRoutes>(() => _i11.UpgradeAccountRoutes());
  gh.factory<_i12.UpgradeAccountUsecase>(
      () => _i12.UpgradeAccountUsecase(gh<_i13.UpgradeAccountRepository>()));
  gh.factory<_i14.UserSharePreferencesUsecase>(
      () => _i14.UserSharePreferencesUsecase(gh<_i10.SharedPreferences>()));
  gh.factory<_i15.Dio>(
    () => dataSourceModule.dioProd(gh<_i10.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<
      _i16.GetDetailBlocParam1<_i17.UpgradeAccountResponse,
          _i18.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i12.UpgradeAccountUsecase>()));
  gh.factory<
      _i16.GetDetailBlocParam2<
          _i17.UpgradeAccountResponse,
          _i19.UpgradeJAPayload?,
          _i18.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountBloc(gh<_i12.UpgradeAccountUsecase>()));
  gh.factory<
      _i16.GetDetailBlocParam2<bool, _i20.VerifyPhoneOtpPayload,
          _i18.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountVerifyPhoneBloc(gh<_i12.UpgradeAccountUsecase>()));
  gh.factory<_i16.GetListBloc<_i21.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i12.UpgradeAccountUsecase>()));
  gh.factory<_i22.UserApi>(() => _i22.UserApi(gh<_i23.Dio>()));
  gh.factory<_i24.AuthApi>(() => _i24.AuthApi(gh<_i23.Dio>()));
  gh.factory<_i25.AuthRepository>(
      () => _i26.AuthRepositoryImpl(gh<_i24.AuthApi>()));
  gh.factory<_i27.AuthenticationUsecase>(() => _i27.AuthenticationUsecase(
        gh<_i25.AuthRepository>(),
        gh<_i14.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i28.CommunityApi>(() => _i28.CommunityApi(gh<_i15.Dio>()));
  gh.factory<_i29.CommunityRepository>(
      () => _i30.CommunityRepositoryImpl(gh<_i28.CommunityApi>()));
  gh.factory<_i31.CommunityUsecase>(
      () => _i31.CommunityUsecase(gh<_i29.CommunityRepository>()));
  gh.factory<_i16.GetDetailBlocParam1<_i15.GroupDetail, String>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetGroupDetailByBossIDBloc(gh<_i31.CommunityUsecase>()));
  gh.factory<_i32.UserCubit>(
      () => _i32.UserCubit(gh<_i27.AuthenticationUsecase>()));
  gh.singleton<_i33.AppSettingBloc>(
      _i33.AppSettingBloc(gh<_i27.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i34.DataSourceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i35.UpgradeAgreePolicyBlocFactory {}
