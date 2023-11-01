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
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i49;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../app_delegate.dart' as _i4;
import '../blocs/marshop/marshop_cubit.dart' as _i55;
import '../blocs/user/user_cubit.dart' as _i56;
import '../core/services/notifications/notification_service.dart' as _i11;
import '../data/data_sources/remote/auth_api.dart' as _i41;
import '../data/data_sources/remote/community_api.dart' as _i45;
import '../data/data_sources/remote/marshop_api.dart' as _i23;
import '../data/data_sources/remote/notification_api.dart' as _i28;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i33;
import '../data/data_sources/remote/user_api.dart' as _i38;
import '../data/models/payloads/upgrade_account/upgrade_ja/upgrade_ja_payload.dart'
    as _i52;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i53;
import '../data/models/responses/upgrade_account_response.dart' as _i50;
import '../data/repositories/auth_repository.dart' as _i42;
import '../data/repositories/impl/auth_repository_impl.dart' as _i43;
import '../data/repositories/impl/community_repository.impl.dart' as _i47;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i26;
import '../data/repositories/impl/notification_repository.impl.dart' as _i30;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i35;
import '../data/repositories/impl/user_repository_impl.dart' as _i40;
import '../data/repositories/marshop_repository.dart' as _i25;
import '../data/repositories/notification_repository.dart' as _i29;
import '../data/repositories/user_repository.dart' as _i39;
import '../domain/entities/bank.dart' as _i54;
import '../domain/entities/commity_action_type.dart' as _i51;
import '../domain/repository/community_repository.dart' as _i46;
import '../domain/repository/place_information_repository.dart' as _i13;
import '../domain/repository/resource_responsitory.dart' as _i16;
import '../domain/repository/upgrade_account_repository.dart' as _i34;
import '../domain/usecases/authentication_usecase.dart' as _i44;
import '../domain/usecases/community_usecase.dart' as _i48;
import '../domain/usecases/marshop_usecase.dart' as _i27;
import '../domain/usecases/notification_usecase.dart' as _i31;
import '../domain/usecases/place_information_usecase.dart' as _i12;
import '../domain/usecases/resource_usecase.dart' as _i15;
import '../domain/usecases/upgrade_account_usecase.dart' as _i36;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i21;
import '../domain/usecases/user_usecase.dart' as _i22;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_module.dart' as _i59;
import '../presentation/dashboard/dashboard_routes.dart' as _i6;
import '../presentation/general_setting/general_routes.dart' as _i9;
import '../presentation/marshop/marshop_routes.dart' as _i10;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i8;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i7;
import '../presentation/qr_code/qr_code_route.dart' as _i14;
import '../presentation/routes.dart' as _i17;
import '../presentation/settings/setting_routes.dart' as _i18;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i57;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i20;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i60;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i32;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i37;
import 'modules/data_source_module.dart' as _i58;

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
  gh.singleton<_i11.NotificationService>(
      _i11.NotificationService(gh<_i3.LoggerService>()));
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
  gh.factory<_i28.NotificationAPI>(() => _i28.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i29.NotificationRepository>(
      () => _i30.NotificationRepositoryImpl(gh<_i28.NotificationAPI>()));
  gh.factory<_i31.NotificationUsecase>(
      () => _i31.NotificationUsecase(gh<_i29.NotificationRepository>()));
  gh.factory<_i32.PlaceInformationBloc>(
      () => _i32.PlaceInformationBloc(gh<_i12.PlaceInformationUsecase>()));
  gh.factory<_i33.UpgradeAccountApi>(
      () => _i33.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i34.UpgradeAccountRepository>(
      () => _i35.UpgradeAccountRepositoryImpl(gh<_i33.UpgradeAccountApi>()));
  gh.factory<_i36.UpgradeAccountUsecase>(
      () => _i36.UpgradeAccountUsecase(gh<_i34.UpgradeAccountRepository>()));
  gh.factory<_i37.UpgradePDoneBloc>(() => _i37.UpgradePDoneBloc(
        gh<_i36.UpgradeAccountUsecase>(),
        gh<_i15.ResourceUsecase>(),
      ));
  gh.factory<_i38.UserApi>(() => _i38.UserApi(gh<_i3.Dio>()));
  gh.factory<_i39.UserRepository>(
      () => _i40.AuthRepositoryImpl(gh<_i38.UserApi>()));
  gh.factory<_i41.AuthApi>(() => _i41.AuthApi(gh<_i24.Dio>()));
  gh.factory<_i42.AuthRepository>(
      () => _i43.AuthRepositoryImpl(gh<_i41.AuthApi>()));
  gh.factory<_i44.AuthenticationUsecase>(() => _i44.AuthenticationUsecase(
        gh<_i42.AuthRepository>(),
        gh<_i21.UserSharePreferencesUsecase>(),
        gh<_i39.UserRepository>(),
        gh<_i11.NotificationService>(),
        gh<_i31.NotificationUsecase>(),
      ));
  gh.factory<_i45.CommunityApi>(() => _i45.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i46.CommunityRepository>(
      () => _i47.CommunityRepositoryImpl(gh<_i45.CommunityApi>()));
  gh.factory<_i48.CommunityUsecase>(
      () => _i48.CommunityUsecase(gh<_i46.CommunityRepository>()));
  gh.factory<_i49.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i48.CommunityUsecase>()));
  gh.factory<
      _i49.GetDetailBlocParam1<_i50.UpgradeAccountResponse,
          _i51.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i36.UpgradeAccountUsecase>()));
  gh.factory<_i49.GetDetailBlocParam1<_i3.GroupDetail, String>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetGroupDetailByBossIDBloc(gh<_i48.CommunityUsecase>()));
  gh.factory<
      _i49.GetDetailBlocParam2<
          _i50.UpgradeAccountResponse,
          _i52.UpgradeJAPayload?,
          _i51.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountBloc(gh<_i36.UpgradeAccountUsecase>()));
  gh.factory<
      _i49.GetDetailBlocParam2<bool, _i53.VerifyPhoneOtpPayload,
          _i51.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createUpgradeAccountVerifyPhoneBloc(gh<_i36.UpgradeAccountUsecase>()));
  gh.factory<_i49.GetListBloc<_i54.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i36.UpgradeAccountUsecase>()));
  gh.factory<_i49.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i48.CommunityUsecase>()));
  gh.factory<_i49.GetListBlocParam1<_i3.Team, int>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i48.CommunityUsecase>()));
  gh.factory<_i55.MarshopCubit>(
      () => _i55.MarshopCubit(gh<_i27.MarshopUsecase>()));
  gh.factory<_i56.UserCubit>(() => _i56.UserCubit(
        gh<_i44.AuthenticationUsecase>(),
        gh<_i21.UserSharePreferencesUsecase>(),
      ));
  gh.singleton<_i57.AppSettingBloc>(
      _i57.AppSettingBloc(gh<_i44.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i58.DataSourceModule {}

class _$CommunityModule extends _i59.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i60.UpgradeAgreePolicyBlocFactory {}
