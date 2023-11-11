// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i23;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i66;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import '../app_delegate.dart' as _i4;
import '../blocs/auth/auth_cubit.dart' as _i92;
import '../blocs/marshop/marshop_cubit.dart' as _i82;
import '../blocs/user/user_cubit.dart' as _i90;
import '../blocs/user_action/user_action_cubit.dart' as _i88;
import '../core/services/notifications/notification_service.dart' as _i13;
import '../data/data_sources/remote/auth_api.dart' as _i52;
import '../data/data_sources/remote/community_api.dart' as _i57;
import '../data/data_sources/remote/marshop_api.dart' as _i22;
import '../data/data_sources/remote/notification_api.dart' as _i27;
import '../data/data_sources/remote/open_weather_api.dart' as _i31;
import '../data/data_sources/remote/place_information_api.dart' as _i35;
import '../data/data_sources/remote/place_information_provider.dart' as _i36;
import '../data/data_sources/remote/resource_api.dart' as _i40;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i44;
import '../data/data_sources/remote/user_api.dart' as _i48;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i77;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i74;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i70;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i72;
import '../data/models/responses/boss_community_status_response.dart' as _i75;
import '../data/models/responses/confirm_register_ja_response.dart' as _i73;
import '../data/models/responses/confirm_response.dart' as _i76;
import '../data/models/responses/group_request_response.dart' as _i79;
import '../data/models/responses/ja_status_response.dart' as _i68;
import '../data/models/responses/upgrade_account_response.dart' as _i67;
import '../data/repositories/auth_repository.dart' as _i53;
import '../data/repositories/impl/auth_repository_impl.dart' as _i54;
import '../data/repositories/impl/community_repository.impl.dart' as _i59;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i25;
import '../data/repositories/impl/notification_repository.impl.dart' as _i29;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i33;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i38;
import '../data/repositories/impl/resource_repository.impl.dart' as _i42;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i46;
import '../data/repositories/impl/user_repository_impl.dart' as _i50;
import '../data/repositories/marshop_repository.dart' as _i24;
import '../data/repositories/notification_repository.dart' as _i28;
import '../data/repositories/user_repository.dart' as _i49;
import '../domain/entities/bank.dart' as _i78;
import '../domain/entities/commity_action_type.dart' as _i71;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i69;
import '../domain/repository/community_repository.dart' as _i58;
import '../domain/repository/open_weather_repository.dart' as _i32;
import '../domain/repository/place_information_repository.dart' as _i37;
import '../domain/repository/resource_responsitory.dart' as _i41;
import '../domain/repository/upgrade_account_repository.dart' as _i45;
import '../domain/usecases/authentication_usecase.dart' as _i55;
import '../domain/usecases/community_usecase.dart' as _i60;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i21;
import '../domain/usecases/marshop_usecase.dart' as _i26;
import '../domain/usecases/notification_usecase.dart' as _i30;
import '../domain/usecases/open_weather_usecase.dart' as _i34;
import '../domain/usecases/place_information_usecase.dart' as _i39;
import '../domain/usecases/resource_usecase.dart' as _i43;
import '../domain/usecases/upgrade_account_usecase.dart' as _i47;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i20;
import '../domain/usecases/user_usecase.dart' as _i51;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_module.dart' as _i94;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i63;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i64;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i65;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i80;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i86;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i62;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i83;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i61;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i85;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i56;
import '../presentation/general_setting/general_routes.dart' as _i9;
import '../presentation/marshop/marshop_routes.dart' as _i11;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i10;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/notification/notification_routes.dart' as _i12;
import '../presentation/qr_code/qr_code_route.dart' as _i14;
import '../presentation/routes.dart' as _i15;
import '../presentation/settings/setting_routes.dart' as _i16;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i91;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i89;
import '../presentation/social/profile/profile_bloc.dart' as _i96;
import '../presentation/social/social_routes.dart' as _i18;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i19;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i95;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i81;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i84;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i87;
import 'modules/data_source_module.dart' as _i93;

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
  final placeModule = _$PlaceModule();
  final upgradeAgreePolicyBlocFactory = _$UpgradeAgreePolicyBlocFactory();
  final communityModule = _$CommunityModule();
  final diaryBlocFactory = _$DiaryBlocFactory();
  gh.singleton<_i4.AppDelegate>(_i4.AppDelegate());
  gh.factory<_i5.AuthenticationRoutes>(() => _i5.AuthenticationRoutes());
  gh.factory<_i6.CommunityRoutes>(() => _i6.CommunityRoutes());
  gh.factory<_i7.DashboardRoutes>(() => _i7.DashboardRoutes());
  gh.factory<_i8.DeeplinkBloc>(() => _i8.DeeplinkBloc());
  gh.factory<_i9.GeneralRoutes>(() => _i9.GeneralRoutes());
  gh.factory<_i10.GeneralRoutes>(() => _i10.GeneralRoutes());
  gh.factory<_i11.MarkShopRoutes>(() => _i11.MarkShopRoutes());
  gh.factory<_i12.NotificationRoutes>(() => _i12.NotificationRoutes());
  gh.singleton<_i13.NotificationService>(
      _i13.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i14.QrCodeRoutes>(() => _i14.QrCodeRoutes());
  gh.singleton<_i15.Routes>(_i15.Routes());
  gh.factory<_i16.SettingRoutes>(() => _i16.SettingRoutes());
  await gh.singletonAsync<_i17.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i18.SocialRoutes>(() => _i18.SocialRoutes());
  gh.factory<_i19.UpgradeAccountRoutes>(() => _i19.UpgradeAccountRoutes());
  gh.factory<_i20.UserSharePreferencesUsecase>(
      () => _i20.UserSharePreferencesUsecase(gh<_i17.SharedPreferences>()));
  gh.factory<_i21.DashboardSharePreferenceUseCase>(
      () => _i21.DashboardSharePreferenceUseCase(gh<_i17.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i17.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i22.MarshopAPI>(() => _i22.MarshopAPI(gh<_i23.Dio>()));
  gh.factory<_i24.MarshopRepository>(
      () => _i25.MarshopRepositoryImpl(gh<_i22.MarshopAPI>()));
  gh.factory<_i26.MarshopUsecase>(
      () => _i26.MarshopUsecase(gh<_i24.MarshopRepository>()));
  gh.factory<_i27.NotificationAPI>(() => _i27.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i28.NotificationRepository>(
      () => _i29.NotificationRepositoryImpl(gh<_i27.NotificationAPI>()));
  gh.factory<_i30.NotificationUsecase>(
      () => _i30.NotificationUsecase(gh<_i28.NotificationRepository>()));
  gh.lazySingleton<_i31.OpenWeatherApi>(
      () => _i31.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i32.OpenWeatherRepository>(
      () => _i33.OpenWeatherRepositoryImpl(gh<_i31.OpenWeatherApi>()));
  gh.factory<_i34.OpenWeatherUseCase>(
      () => _i34.OpenWeatherUseCase(gh<_i32.OpenWeatherRepository>()));
  gh.factory<_i35.PlaceInformationAPI>(
      () => _i35.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i36.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i17.SharedPreferences>(),
        gh<_i36.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i37.PlaceInformationRepository>(() =>
      _i38.PlaceInformationRepositoryImpl(gh<_i35.PlaceInformationAPI>()));
  gh.factory<_i39.PlaceInformationUsecase>(() =>
      _i39.PlaceInformationUsecase(gh<_i37.PlaceInformationRepository>()));
  gh.factory<_i40.ResourceApi>(() => _i40.ResourceApi(gh<_i23.Dio>()));
  gh.factory<_i41.ResourceRepository>(
      () => _i42.ResourceRepositoryImpl(gh<_i40.ResourceApi>()));
  gh.factory<_i43.ResourceUsecase>(
      () => _i43.ResourceUsecase(gh<_i41.ResourceRepository>()));
  gh.factory<_i44.UpgradeAccountApi>(
      () => _i44.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i45.UpgradeAccountRepository>(
      () => _i46.UpgradeAccountRepositoryImpl(gh<_i44.UpgradeAccountApi>()));
  gh.factory<_i47.UpgradeAccountUsecase>(
      () => _i47.UpgradeAccountUsecase(gh<_i45.UpgradeAccountRepository>()));
  gh.factory<_i48.UserApi>(() => _i48.UserApi(gh<_i3.Dio>()));
  gh.factory<_i49.UserRepository>(
      () => _i50.AuthRepositoryImpl(gh<_i48.UserApi>()));
  gh.factory<_i51.UserUsecase>(
      () => _i51.UserUsecase(gh<_i49.UserRepository>()));
  gh.factory<_i52.AuthApi>(() => _i52.AuthApi(gh<_i23.Dio>()));
  gh.factory<_i53.AuthRepository>(
      () => _i54.AuthRepositoryImpl(gh<_i52.AuthApi>()));
  gh.factory<_i55.AuthenticationUsecase>(() => _i55.AuthenticationUsecase(
        gh<_i53.AuthRepository>(),
        gh<_i20.UserSharePreferencesUsecase>(),
        gh<_i49.UserRepository>(),
      ));
  gh.factory<_i56.ChangePasswordController>(
      () => _i56.ChangePasswordController(gh<_i55.AuthenticationUsecase>()));
  gh.factory<_i57.CommunityApi>(() => _i57.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i58.CommunityRepository>(
      () => _i59.CommunityRepositoryImpl(gh<_i57.CommunityApi>()));
  gh.factory<_i60.CommunityUsecase>(() => _i60.CommunityUsecase(
        gh<_i58.CommunityRepository>(),
        gh<_i43.ResourceUsecase>(),
      ));
  gh.factory<_i61.DashBoardBgController>(() =>
      _i61.DashBoardBgController(gh<_i21.DashboardSharePreferenceUseCase>()));
  gh.factory<_i62.DashboardCommunityBloc>(() =>
      _i62.DashboardCommunityBloc(gh<_i21.DashboardSharePreferenceUseCase>()));
  gh.factory<_i62.DashboardEcommerceBloc>(() =>
      _i62.DashboardEcommerceBloc(gh<_i21.DashboardSharePreferenceUseCase>()));
  gh.factory<_i62.DashboardPersonalBloc>(() =>
      _i62.DashboardPersonalBloc(gh<_i21.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i63.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i63.EditCommunityDetailBloc(
        gh<_i60.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i64.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i64.EditFanGroupBloc(
        gh<_i60.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i65.FanGroupDetailBloc>(
      () => _i65.FanGroupDetailBloc(gh<_i60.CommunityUsecase>()));
  gh.factory<_i66.GetDetailBloc<_i67.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i47.UpgradeAccountUsecase>()));
  gh.factory<_i66.GetDetailBloc<_i68.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i47.UpgradeAccountUsecase>()));
  gh.factory<_i66.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i60.CommunityUsecase>()));
  gh.factory<_i66.GetDetailBloc<_i69.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i47.UpgradeAccountUsecase>()));
  gh.factory<
      _i66.GetDetailBlocParam1<_i69.BankAccount,
          _i70.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i47.UpgradeAccountUsecase>()));
  gh.factory<
      _i66.GetDetailBlocParam1<_i67.UpgradeAccountResponse,
          _i71.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i47.UpgradeAccountUsecase>()));
  gh.factory<_i66.GetDetailBlocParam1<bool, _i72.VerifyPhoneOtpPayload>>(() =>
      upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i47.UpgradeAccountUsecase>()));
  gh.factory<
      _i66.GetDetailBlocParam1<_i73.ConfirmRegisterJAResponse,
          _i74.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i47.UpgradeAccountUsecase>()));
  gh.factory<
          _i66.GetDetailBlocParam1<_i75.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i60.CommunityUsecase>()));
  gh.factory<_i66.GetDetailBlocParam1<_i76.ConfirmResponse, String>>(() =>
      communityModule
          .createRelinquishBossGroupBloc(gh<_i60.CommunityUsecase>()));
  gh.factory<_i66.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i51.UserUsecase>()));
  gh.factory<
      _i66.GetDetailBlocParam2<_i76.ConfirmResponse, String,
          _i77.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i60.CommunityUsecase>()));
  gh.factory<_i66.GetListBloc<_i78.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i47.UpgradeAccountUsecase>()));
  gh.factory<_i66.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i60.CommunityUsecase>()));
  gh.factory<_i66.GetListBloc<_i79.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i60.CommunityUsecase>()));
  gh.factory<_i66.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i60.CommunityUsecase>()));
  gh.factory<_i80.GroupDetailBloc>(
      () => _i80.GroupDetailBloc(gh<_i60.CommunityUsecase>()));
  gh.factory<_i81.GuardianPDoneBloc>(
      () => _i81.GuardianPDoneBloc(gh<_i47.UpgradeAccountUsecase>()));
  gh.factory<_i82.MarshopCubit>(
      () => _i82.MarshopCubit(gh<_i26.MarshopUsecase>()));
  gh.factory<_i83.OpenWeatherBloc>(
      () => _i83.OpenWeatherBloc(gh<_i34.OpenWeatherUseCase>()));
  gh.factory<_i84.PlaceInformationBloc>(
      () => _i84.PlaceInformationBloc(gh<_i39.PlaceInformationUsecase>()));
  gh.factory<_i85.SearchCubit>(() => _i85.SearchCubit(gh<_i51.UserUsecase>()));
  gh.factory<_i86.TeamDetailBloc>(
      () => _i86.TeamDetailBloc(gh<_i60.CommunityUsecase>()));
  gh.factory<_i87.UpgradePDoneBloc>(() => _i87.UpgradePDoneBloc(
        gh<_i47.UpgradeAccountUsecase>(),
        gh<_i51.UserUsecase>(),
      ));
  gh.factory<_i88.UserActionCubit>(
      () => _i88.UserActionCubit(gh<_i51.UserUsecase>()));
  gh.factory<_i89.UserBloc>(() => _i89.UserBloc(
        gh<_i55.AuthenticationUsecase>(),
        gh<_i20.UserSharePreferencesUsecase>(),
        gh<_i51.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i90.UserCubit>(() => _i90.UserCubit(
        gh<_i55.AuthenticationUsecase>(),
        gh<_i20.UserSharePreferencesUsecase>(),
        gh<_i51.UserUsecase>(),
      ));
  gh.singleton<_i91.AppSettingBloc>(
      _i91.AppSettingBloc(gh<_i55.AuthenticationUsecase>()));
  gh.factory<_i92.AuthCubit>(
      () => _i92.AuthCubit(gh<_i55.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i93.DataSourceModule {}

class _$PlaceModule extends _i36.PlaceModule {}

class _$CommunityModule extends _i94.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i95.UpgradeAgreePolicyBlocFactory {}

class _$DiaryBlocFactory extends _i96.DiaryBlocFactory {}
