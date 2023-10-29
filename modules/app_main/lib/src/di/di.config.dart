// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i13;
import 'package:dio/dio.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i28;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../app_delegate.dart' as _i3;
import '../blocs/user/user_cubit.dart' as _i34;
import '../core/services/notification/notification_service.dart' as _i8;
import '../data/data_sources/remote/auth_api.dart' as _i20;
import '../data/data_sources/remote/community_api.dart' as _i24;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i14;
import '../data/data_sources/remote/user_api.dart' as _i18;
import '../data/models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart'
    as _i31;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i32;
import '../data/models/responses/upgrade_account_response.dart' as _i29;
import '../data/repositories/auth_repository.dart' as _i21;
import '../data/repositories/impl/auth_repository_impl.dart' as _i22;
import '../data/repositories/impl/community_repository.impl.dart' as _i26;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i16;
import '../domain/entities/bank.dart' as _i33;
import '../domain/entities/commity_action_type.dart' as _i30;
import '../domain/repository/community_repository.dart' as _i25;
import '../domain/repository/upgrade_account_repository.dart' as _i15;
import '../domain/usecases/authentication_usecase.dart' as _i23;
import '../domain/usecases/community_usecase.dart' as _i27;
import '../domain/usecases/upgrade_account_usecase.dart' as _i17;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i12;
import '../presentation/authentication/authentication_routes.dart' as _i4;
import '../presentation/community/community_module.dart' as _i37;
import '../presentation/dashboard/dashboard_routes.dart' as _i5;
import '../presentation/general_setting/general_routes.dart' as _i7;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i6;
import '../presentation/routes.dart' as _i9;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i35;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i11;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i38;
import 'modules/data_source_module.dart' as _i36;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i37;
import '../domain/usecases/upgrade_account_usecase.dart' as _i38;
import '../domain/usecases/resource_usecase.dart' as _i39;

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
  final communityModule = _$CommunityModule();
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
  gh.factory<_i12.UserSharePreferencesUsecase>(
      () => _i12.UserSharePreferencesUsecase(gh<_i10.SharedPreferences>()));
  gh.factory<_i13.Dio>(
    () => dataSourceModule.dioProd(gh<_i10.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i14.UpgradeAccountApi>(
      () => _i14.UpgradeAccountApi(gh<_i13.Dio>()));
  gh.factory<_i15.UpgradeAccountRepository>(
      () => _i16.UpgradeAccountRepositoryImpl(gh<_i14.UpgradeAccountApi>()));
  gh.factory<_i17.UpgradeAccountUsecase>(
      () => _i17.UpgradeAccountUsecase(gh<_i15.UpgradeAccountRepository>()));
  gh.factory<_i18.UserApi>(() => _i18.UserApi(gh<_i19.Dio>()));
  gh.factory<_i20.AuthApi>(() => _i20.AuthApi(gh<_i19.Dio>()));
  gh.factory<_i21.AuthRepository>(
      () => _i22.AuthRepositoryImpl(gh<_i20.AuthApi>()));
  gh.factory<_i23.AuthenticationUsecase>(() => _i23.AuthenticationUsecase(
        gh<_i21.AuthRepository>(),
        gh<_i12.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i24.CommunityApi>(() => _i24.CommunityApi(gh<_i13.Dio>()));
  gh.factory<_i25.CommunityRepository>(
      () => _i26.CommunityRepositoryImpl(gh<_i24.CommunityApi>()));
  gh.factory<_i27.CommunityUsecase>(
      () => _i27.CommunityUsecase(gh<_i25.CommunityRepository>()));
  gh.factory<_i28.GetDetailBloc<_i13.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i27.CommunityUsecase>()));
  gh.factory<
      _i28.GetDetailBlocParam1<_i29.UpgradeAccountResponse,
          _i30.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i17.UpgradeAccountUsecase>()));
  gh.factory<_i28.GetDetailBlocParam1<_i13.GroupDetail, String>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetGroupDetailByBossIDBloc(gh<_i27.CommunityUsecase>()));
  gh.factory<
      _i28.GetDetailBlocParam2<
          _i29.UpgradeAccountResponse,
          _i31.UpgradeJAPayload?,
          _i30.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountBloc(gh<_i17.UpgradeAccountUsecase>()));
  gh.factory<
      _i28.GetDetailBlocParam2<bool, _i32.VerifyPhoneOtpPayload,
          _i30.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountVerifyPhoneBloc(gh<_i17.UpgradeAccountUsecase>()));
  gh.factory<_i28.GetListBloc<_i33.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i17.UpgradeAccountUsecase>()));
  gh.factory<_i28.GetListBloc<_i13.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i27.CommunityUsecase>()));
  gh.factory<_i28.GetListBlocParam1<_i13.Team, int>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i27.CommunityUsecase>()));
  gh.factory<_i34.UserCubit>(
      () => _i34.UserCubit(gh<_i23.AuthenticationUsecase>()));
  gh.singleton<_i35.AppSettingBloc>(
      _i35.AppSettingBloc(gh<_i23.AuthenticationUsecase>()));
  gh.factory<_i37.UpgradePDoneBloc>(() => _i37.UpgradePDoneBloc(
    gh<_i38.UpgradeAccountUsecase>(),
    gh<_i39.ResourceUsecase>(),
  ));

  return getIt;
}

class _$DataSourceModule extends _i36.DataSourceModule {}

class _$CommunityModule extends _i37.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i38.UpgradeAgreePolicyBlocFactory {}
