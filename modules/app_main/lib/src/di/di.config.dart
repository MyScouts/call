// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i17;
import 'package:dio/dio.dart' as _i25;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i34;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../app_delegate.dart' as _i3;
import '../blocs/user/user_cubit.dart' as _i40;
import '../core/services/notification/notification_service.dart' as _i8;
import '../data/data_sources/remote/auth_api.dart' as _i26;
import '../data/data_sources/remote/community_api.dart' as _i30;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i19;
import '../data/data_sources/remote/user_api.dart' as _i24;
import '../data/models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart'
    as _i38;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i37;
import '../data/models/responses/upgrade_account_response.dart' as _i35;
import '../data/repositories/auth_repository.dart' as _i27;
import '../data/repositories/impl/auth_repository_impl.dart' as _i28;
import '../data/repositories/impl/community_repository.impl.dart' as _i32;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i21;
import '../domain/entities/bank.dart' as _i39;
import '../domain/entities/commity_action_type.dart' as _i36;
import '../domain/repository/community_repository.dart' as _i31;
import '../domain/repository/place_information_repository.dart' as _i10;
import '../domain/repository/resource_responsitory.dart' as _i12;
import '../domain/repository/upgrade_account_repository.dart' as _i20;
import '../domain/usecases/authentication_usecase.dart' as _i29;
import '../domain/usecases/community_usecase.dart' as _i33;
import '../domain/usecases/place_information_usecase.dart' as _i9;
import '../domain/usecases/resource_usecase.dart' as _i11;
import '../domain/usecases/upgrade_account_usecase.dart' as _i22;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i16;
import '../presentation/authentication/authentication_routes.dart' as _i4;
import '../presentation/community/community_module.dart' as _i43;
import '../presentation/dashboard/dashboard_routes.dart' as _i5;
import '../presentation/general_setting/general_routes.dart' as _i7;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i6;
import '../presentation/routes.dart' as _i13;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i41;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i15;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i44;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i18;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i23;
import 'modules/data_source_module.dart' as _i42;

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
  gh.factory<_i9.PlaceInformationUsecase>(
      () => _i9.PlaceInformationUsecase(gh<_i10.PlaceInformationRepository>()));
  gh.factory<_i11.ResourceUsecase>(
      () => _i11.ResourceUsecase(gh<_i12.ResourceRepository>()));
  gh.singleton<_i13.Routes>(_i13.Routes());
  await gh.singletonAsync<_i14.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i15.UpgradeAccountRoutes>(() => _i15.UpgradeAccountRoutes());
  gh.factory<_i16.UserSharePreferencesUsecase>(
      () => _i16.UserSharePreferencesUsecase(gh<_i14.SharedPreferences>()));
  gh.factory<_i17.Dio>(
    () => dataSourceModule.dioProd(gh<_i14.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i18.PlaceInformationBloc>(
      () => _i18.PlaceInformationBloc(gh<_i9.PlaceInformationUsecase>()));
  gh.factory<_i19.UpgradeAccountApi>(
      () => _i19.UpgradeAccountApi(gh<_i17.Dio>()));
  gh.factory<_i20.UpgradeAccountRepository>(
      () => _i21.UpgradeAccountRepositoryImpl(gh<_i19.UpgradeAccountApi>()));
  gh.factory<_i22.UpgradeAccountUsecase>(
      () => _i22.UpgradeAccountUsecase(gh<_i20.UpgradeAccountRepository>()));
  gh.factory<_i23.UpgradePDoneBloc>(() => _i23.UpgradePDoneBloc(
        gh<_i22.UpgradeAccountUsecase>(),
        gh<_i11.ResourceUsecase>(),
      ));
  gh.factory<_i24.UserApi>(() => _i24.UserApi(gh<_i25.Dio>()));
  gh.factory<_i26.AuthApi>(() => _i26.AuthApi(gh<_i25.Dio>()));
  gh.factory<_i27.AuthRepository>(
      () => _i28.AuthRepositoryImpl(gh<_i26.AuthApi>()));
  gh.factory<_i29.AuthenticationUsecase>(() => _i29.AuthenticationUsecase(
        gh<_i27.AuthRepository>(),
        gh<_i16.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i30.CommunityApi>(() => _i30.CommunityApi(gh<_i17.Dio>()));
  gh.factory<_i31.CommunityRepository>(
      () => _i32.CommunityRepositoryImpl(gh<_i30.CommunityApi>()));
  gh.factory<_i33.CommunityUsecase>(
      () => _i33.CommunityUsecase(gh<_i31.CommunityRepository>()));
  gh.factory<_i34.GetDetailBloc<_i17.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i33.CommunityUsecase>()));
  gh.factory<
      _i34.GetDetailBlocParam1<_i35.UpgradeAccountResponse,
          _i36.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i22.UpgradeAccountUsecase>()));
  gh.factory<_i34.GetDetailBlocParam1<_i17.GroupDetail, String>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetGroupDetailByBossIDBloc(gh<_i33.CommunityUsecase>()));
  gh.factory<
      _i34.GetDetailBlocParam2<bool, _i37.VerifyPhoneOtpPayload,
          _i36.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountVerifyPhoneBloc(gh<_i22.UpgradeAccountUsecase>()));
  gh.factory<
      _i34.GetDetailBlocParam2<
          _i35.UpgradeAccountResponse,
          _i38.UpgradeJAPayload?,
          _i36.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountBloc(gh<_i22.UpgradeAccountUsecase>()));
  gh.factory<_i34.GetListBloc<_i39.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i22.UpgradeAccountUsecase>()));
  gh.factory<_i34.GetListBloc<_i17.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i33.CommunityUsecase>()));
  gh.factory<_i34.GetListBlocParam1<_i17.Team, int>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i33.CommunityUsecase>()));
  gh.factory<_i40.UserCubit>(
      () => _i40.UserCubit(gh<_i29.AuthenticationUsecase>()));
  gh.singleton<_i41.AppSettingBloc>(
      _i41.AppSettingBloc(gh<_i29.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i42.DataSourceModule {}

class _$CommunityModule extends _i43.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i44.UpgradeAgreePolicyBlocFactory {}
