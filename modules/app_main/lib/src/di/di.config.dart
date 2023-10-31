// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i24;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i45;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../app_delegate.dart' as _i4;
import '../blocs/marshop/marshop_cubit.dart' as _i51;
import '../blocs/user/user_cubit.dart' as _i52;
import '../core/services/notification/notification_service.dart' as _i11;
import '../data/data_sources/remote/auth_api.dart' as _i37;
import '../data/data_sources/remote/community_api.dart' as _i41;
import '../data/data_sources/remote/marshop_api.dart' as _i23;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i29;
import '../data/data_sources/remote/user_api.dart' as _i34;
import '../data/models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart'
    as _i48;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i49;
import '../data/models/responses/upgrade_account_response.dart' as _i46;
import '../data/repositories/auth_repository.dart' as _i38;
import '../data/repositories/impl/auth_repository_impl.dart' as _i39;
import '../data/repositories/impl/community_repository.impl.dart' as _i43;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i26;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i31;
import '../data/repositories/impl/user_repository_impl.dart' as _i36;
import '../data/repositories/marshop_repository.dart' as _i25;
import '../data/repositories/user_repository.dart' as _i35;
import '../domain/entities/bank.dart' as _i50;
import '../domain/entities/commity_action_type.dart' as _i47;
import '../domain/repository/community_repository.dart' as _i42;
import '../domain/repository/place_information_repository.dart' as _i13;
import '../domain/repository/resource_responsitory.dart' as _i16;
import '../domain/repository/upgrade_account_repository.dart' as _i30;
import '../domain/usecases/authentication_usecase.dart' as _i40;
import '../domain/usecases/community_usecase.dart' as _i44;
import '../domain/usecases/marshop_usecase.dart' as _i27;
import '../domain/usecases/place_information_usecase.dart' as _i12;
import '../domain/usecases/resource_usecase.dart' as _i15;
import '../domain/usecases/upgrade_account_usecase.dart' as _i32;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i21;
import '../domain/usecases/user_usecase.dart' as _i22;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_module.dart' as _i55;
import '../presentation/dashboard/dashboard_routes.dart' as _i6;
import '../presentation/general_setting/general_routes.dart' as _i9;
import '../presentation/marshop/marshop_routes.dart' as _i10;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i8;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i7;
import '../presentation/qr_code/qr_code_route.dart' as _i14;
import '../presentation/routes.dart' as _i17;
import '../presentation/settings/setting_routes.dart' as _i18;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i53;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i20;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i56;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i28;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i33;
import 'modules/data_source_module.dart' as _i54;

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
  final communityModule = _$CommunityModule();
  final upgradeAgreePolicyBlocFactory = _$UpgradeAgreePolicyBlocFactory();
  gh.singleton<_i4.AppDelegate>(_i4.AppDelegate());
  gh.factory<_i5.AuthenticationRoutes>(() => _i5.AuthenticationRoutes());
  gh.factory<_i6.DashboardRoutes>(() => _i6.DashboardRoutes());
  gh.factory<_i7.DeeplinkBloc>(() => _i7.DeeplinkBloc());
  gh.factory<_i8.GeneralRoutes>(() => _i8.GeneralRoutes());
  gh.factory<_i9.GeneralRoutes>(() => _i9.GeneralRoutes());
  gh.factory<_i10.MarkShopRoutes>(() => _i10.MarkShopRoutes());
  gh.singleton<_i11.NotificationService>(_i11.NotificationService());
  gh.factory<_i12.PlaceInformationUsecase>(() =>
      _i12.PlaceInformationUsecase(gh<_i13.PlaceInformationRepository>()));
  gh.factory<_i14.QrCodeRoutes>(() => _i14.QrCodeRoutes());
  gh.factory<_i15.ResourceUsecase>(
      () => _i15.ResourceUsecase(gh<_i16.ResourceRepository>()));
  gh.singleton<_i17.Routes>(_i17.Routes());
  gh.factory<_i18.SettingRoutes>(() => _i18.SettingRoutes());
  await gh.singletonAsync<_i19.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i20.UpgradeAccountRoutes>(() => _i20.UpgradeAccountRoutes());
  gh.factory<_i21.UserSharePreferencesUsecase>(
      () => _i21.UserSharePreferencesUsecase(gh<_i19.SharedPreferences>()));
  gh.factory<_i22.UserUsecase>(() => _i22.UserUsecase());
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i19.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i23.MarshopAPI>(() => _i23.MarshopAPI(gh<_i24.Dio>()));
  gh.factory<_i25.MarshopRepository>(
      () => _i26.MarshopRepositoryImpl(gh<_i23.MarshopAPI>()));
  gh.factory<_i27.MarshopUsecase>(
      () => _i27.MarshopUsecase(gh<_i25.MarshopRepository>()));
  gh.factory<_i28.PlaceInformationBloc>(
      () => _i28.PlaceInformationBloc(gh<_i12.PlaceInformationUsecase>()));
  gh.factory<_i29.UpgradeAccountApi>(
      () => _i29.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i30.UpgradeAccountRepository>(
      () => _i31.UpgradeAccountRepositoryImpl(gh<_i29.UpgradeAccountApi>()));
  gh.factory<_i32.UpgradeAccountUsecase>(
      () => _i32.UpgradeAccountUsecase(gh<_i30.UpgradeAccountRepository>()));
  gh.factory<_i33.UpgradePDoneBloc>(() => _i33.UpgradePDoneBloc(
        gh<_i32.UpgradeAccountUsecase>(),
        gh<_i15.ResourceUsecase>(),
      ));
  gh.factory<_i34.UserApi>(() => _i34.UserApi(gh<_i3.Dio>()));
  gh.factory<_i35.UserRepository>(
      () => _i36.AuthRepositoryImpl(gh<_i34.UserApi>()));
  gh.factory<_i37.AuthApi>(() => _i37.AuthApi(gh<_i24.Dio>()));
  gh.factory<_i38.AuthRepository>(
      () => _i39.AuthRepositoryImpl(gh<_i37.AuthApi>()));
  gh.factory<_i40.AuthenticationUsecase>(() => _i40.AuthenticationUsecase(
        gh<_i38.AuthRepository>(),
        gh<_i21.UserSharePreferencesUsecase>(),
        gh<_i35.UserRepository>(),
      ));
  gh.factory<_i41.CommunityApi>(() => _i41.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i42.CommunityRepository>(
      () => _i43.CommunityRepositoryImpl(gh<_i41.CommunityApi>()));
  gh.factory<_i44.CommunityUsecase>(
      () => _i44.CommunityUsecase(gh<_i42.CommunityRepository>()));
  gh.factory<_i45.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i44.CommunityUsecase>()));
  gh.factory<
      _i45.GetDetailBlocParam1<_i46.UpgradeAccountResponse,
          _i47.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i32.UpgradeAccountUsecase>()));
  gh.factory<_i45.GetDetailBlocParam1<_i3.GroupDetail, String>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetGroupDetailByBossIDBloc(gh<_i44.CommunityUsecase>()));
  gh.factory<
      _i45.GetDetailBlocParam2<
          _i46.UpgradeAccountResponse,
          _i48.UpgradeJAPayload?,
          _i47.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountBloc(gh<_i32.UpgradeAccountUsecase>()));
  gh.factory<
      _i45.GetDetailBlocParam2<bool, _i49.VerifyPhoneOtpPayload,
          _i47.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountVerifyPhoneBloc(gh<_i32.UpgradeAccountUsecase>()));
  gh.factory<_i45.GetListBloc<_i50.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i32.UpgradeAccountUsecase>()));
  gh.factory<_i45.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i44.CommunityUsecase>()));
  gh.factory<_i45.GetListBlocParam1<_i3.Team, int>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i44.CommunityUsecase>()));
  gh.factory<_i51.MarshopCubit>(
      () => _i51.MarshopCubit(gh<_i27.MarshopUsecase>()));
  gh.factory<_i52.UserCubit>(() => _i52.UserCubit(
        gh<_i40.AuthenticationUsecase>(),
        gh<_i21.UserSharePreferencesUsecase>(),
      ));
  gh.singleton<_i53.AppSettingBloc>(
      _i53.AppSettingBloc(gh<_i40.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i54.DataSourceModule {}

class _$CommunityModule extends _i55.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i56.UpgradeAgreePolicyBlocFactory {}
