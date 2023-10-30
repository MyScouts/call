// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i18;
import 'package:dio/dio.dart' as _i29;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i37;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../app_delegate.dart' as _i3;
import '../blocs/user/user_cubit.dart' as _i43;
import '../core/services/notification/notification_service.dart' as _i8;
import '../data/data_sources/remote/auth_api.dart' as _i28;
import '../data/data_sources/remote/community_api.dart' as _i33;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i20;
import '../data/data_sources/remote/user_api.dart' as _i25;
import '../data/models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart'
    as _i41;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i40;
import '../data/models/responses/upgrade_account_response.dart' as _i38;
import '../data/repositories/auth_repository.dart' as _i30;
import '../data/repositories/impl/auth_repository_impl.dart' as _i31;
import '../data/repositories/impl/community_repository.impl.dart' as _i35;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i22;
import '../data/repositories/impl/user_repository_impl.dart' as _i27;
import '../data/repositories/user_repository.dart' as _i26;
import '../domain/entities/bank.dart' as _i42;
import '../domain/entities/commity_action_type.dart' as _i39;
import '../domain/repository/community_repository.dart' as _i34;
import '../domain/repository/place_information_repository.dart' as _i10;
import '../domain/repository/resource_responsitory.dart' as _i12;
import '../domain/repository/upgrade_account_repository.dart' as _i21;
import '../domain/usecases/authentication_usecase.dart' as _i32;
import '../domain/usecases/community_usecase.dart' as _i36;
import '../domain/usecases/place_information_usecase.dart' as _i9;
import '../domain/usecases/resource_usecase.dart' as _i11;
import '../domain/usecases/upgrade_account_usecase.dart' as _i23;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i16;
import '../domain/usecases/user_usecase.dart' as _i17;
import '../presentation/authentication/authentication_routes.dart' as _i4;
import '../presentation/community/community_module.dart' as _i46;
import '../presentation/dashboard/dashboard_routes.dart' as _i5;
import '../presentation/general_setting/general_routes.dart' as _i7;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i6;
import '../presentation/routes.dart' as _i13;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i44;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i15;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i47;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i19;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i24;
import 'modules/data_source_module.dart' as _i45;

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
  gh.factory<_i17.UserUsecase>(() => _i17.UserUsecase());
  gh.factory<_i18.Dio>(
    () => dataSourceModule.dioProd(gh<_i14.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i19.PlaceInformationBloc>(
      () => _i19.PlaceInformationBloc(gh<_i9.PlaceInformationUsecase>()));
  gh.factory<_i20.UpgradeAccountApi>(
      () => _i20.UpgradeAccountApi(gh<_i18.Dio>()));
  gh.factory<_i21.UpgradeAccountRepository>(
      () => _i22.UpgradeAccountRepositoryImpl(gh<_i20.UpgradeAccountApi>()));
  gh.factory<_i23.UpgradeAccountUsecase>(
      () => _i23.UpgradeAccountUsecase(gh<_i21.UpgradeAccountRepository>()));
  gh.factory<_i24.UpgradePDoneBloc>(() => _i24.UpgradePDoneBloc(
        gh<_i23.UpgradeAccountUsecase>(),
        gh<_i11.ResourceUsecase>(),
      ));
  gh.factory<_i25.UserApi>(() => _i25.UserApi(gh<_i18.Dio>()));
  gh.factory<_i26.UserRepository>(
      () => _i27.AuthRepositoryImpl(gh<_i25.UserApi>()));
  gh.factory<_i28.AuthApi>(() => _i28.AuthApi(gh<_i29.Dio>()));
  gh.factory<_i30.AuthRepository>(
      () => _i31.AuthRepositoryImpl(gh<_i28.AuthApi>()));
  gh.factory<_i32.AuthenticationUsecase>(() => _i32.AuthenticationUsecase(
        gh<_i30.AuthRepository>(),
        gh<_i16.UserSharePreferencesUsecase>(),
        gh<_i26.UserRepository>(),
      ));
  gh.factory<_i33.CommunityApi>(() => _i33.CommunityApi(gh<_i18.Dio>()));
  gh.factory<_i34.CommunityRepository>(
      () => _i35.CommunityRepositoryImpl(gh<_i33.CommunityApi>()));
  gh.factory<_i36.CommunityUsecase>(
      () => _i36.CommunityUsecase(gh<_i34.CommunityRepository>()));
  gh.factory<_i37.GetDetailBloc<_i18.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i36.CommunityUsecase>()));
  gh.factory<
      _i37.GetDetailBlocParam1<_i38.UpgradeAccountResponse,
          _i39.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i23.UpgradeAccountUsecase>()));
  gh.factory<_i37.GetDetailBlocParam1<_i18.GroupDetail, String>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetGroupDetailByBossIDBloc(gh<_i36.CommunityUsecase>()));
  gh.factory<
      _i37.GetDetailBlocParam2<bool, _i40.VerifyPhoneOtpPayload,
          _i39.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountVerifyPhoneBloc(gh<_i23.UpgradeAccountUsecase>()));
  gh.factory<
      _i37.GetDetailBlocParam2<
          _i38.UpgradeAccountResponse,
          _i41.UpgradeJAPayload?,
          _i39.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountBloc(gh<_i23.UpgradeAccountUsecase>()));
  gh.factory<_i37.GetListBloc<_i42.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i23.UpgradeAccountUsecase>()));
  gh.factory<_i37.GetListBloc<_i18.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i36.CommunityUsecase>()));
  gh.factory<_i37.GetListBlocParam1<_i18.Team, int>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i36.CommunityUsecase>()));
  gh.factory<_i43.UserCubit>(() => _i43.UserCubit(
        gh<_i32.AuthenticationUsecase>(),
        gh<_i16.UserSharePreferencesUsecase>(),
      ));
  gh.singleton<_i44.AppSettingBloc>(
      _i44.AppSettingBloc(gh<_i32.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i45.DataSourceModule {}

class _$CommunityModule extends _i46.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i47.UpgradeAgreePolicyBlocFactory {}
