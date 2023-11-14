// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i26;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i69;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../app_delegate.dart' as _i4;
import '../blocs/auth/auth_cubit.dart' as _i101;
import '../blocs/community/team_request/team_request_cubit.dart' as _i95;
import '../blocs/marshop/marshop_cubit.dart' as _i88;
import '../blocs/user/user_cubit.dart' as _i99;
import '../blocs/user_action/user_action_cubit.dart' as _i97;
import '../core/services/notifications/notification_service.dart' as _i14;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i23;
import '../data/data_sources/remote/auth_api.dart' as _i55;
import '../data/data_sources/remote/community_api.dart' as _i60;
import '../data/data_sources/remote/marshop_api.dart' as _i25;
import '../data/data_sources/remote/notification_api.dart' as _i30;
import '../data/data_sources/remote/open_weather_api.dart' as _i34;
import '../data/data_sources/remote/place_information_api.dart' as _i38;
import '../data/data_sources/remote/place_information_provider.dart' as _i39;
import '../data/data_sources/remote/resource_api.dart' as _i43;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i47;
import '../data/data_sources/remote/user_api.dart' as _i51;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i81;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i75;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i76;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i78;
import '../data/models/responses/boss_community_status_response.dart' as _i77;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i73;
import '../data/models/responses/confirm_register_ja_response.dart' as _i74;
import '../data/models/responses/confirm_response.dart' as _i80;
import '../data/models/responses/group_request_response.dart' as _i84;
import '../data/models/responses/ja_status_response.dart' as _i70;
import '../data/models/responses/upgrade_account_response.dart' as _i72;
import '../data/repositories/auth_repository.dart' as _i56;
import '../data/repositories/impl/auth_repository_impl.dart' as _i57;
import '../data/repositories/impl/community_repository.impl.dart' as _i62;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i28;
import '../data/repositories/impl/notification_repository.impl.dart' as _i32;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i36;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i41;
import '../data/repositories/impl/resource_repository.impl.dart' as _i45;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i49;
import '../data/repositories/impl/user_repository_impl.dart' as _i53;
import '../data/repositories/marshop_repository.dart' as _i27;
import '../data/repositories/notification_repository.dart' as _i31;
import '../data/repositories/user_repository.dart' as _i52;
import '../domain/entities/bank.dart' as _i83;
import '../domain/entities/commity_action_type.dart' as _i79;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i71;
import '../domain/repository/community_repository.dart' as _i61;
import '../domain/repository/open_weather_repository.dart' as _i35;
import '../domain/repository/place_information_repository.dart' as _i40;
import '../domain/repository/resource_responsitory.dart' as _i44;
import '../domain/repository/upgrade_account_repository.dart' as _i48;
import '../domain/usecases/authentication_usecase.dart' as _i58;
import '../domain/usecases/community_usecase.dart' as _i63;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i22;
import '../domain/usecases/marshop_usecase.dart' as _i29;
import '../domain/usecases/notification_usecase.dart' as _i33;
import '../domain/usecases/open_weather_usecase.dart' as _i37;
import '../domain/usecases/place_information_usecase.dart' as _i42;
import '../domain/usecases/resource_usecase.dart' as _i46;
import '../domain/usecases/upgrade_account_usecase.dart' as _i50;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i21;
import '../domain/usecases/user_usecase.dart' as _i54;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_constants.dart' as _i82;
import '../presentation/community/community_module.dart' as _i104;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i66;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i67;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i68;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i85;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i94;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i65;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i90;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i64;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i93;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i59;
import '../presentation/general_setting/general_routes.dart' as _i10;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i87;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i24;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i92;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i11;
import '../presentation/marshop/marshop_routes.dart' as _i12;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i9;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/notification/notification_routes.dart' as _i13;
import '../presentation/notification/state/notification_bloc.dart' as _i89;
import '../presentation/qr_code/qr_code_route.dart' as _i15;
import '../presentation/routes.dart' as _i16;
import '../presentation/settings/setting_routes.dart' as _i17;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i100;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i98;
import '../presentation/social/profile/profile_bloc.dart' as _i105;
import '../presentation/social/social_routes.dart' as _i19;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i20;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i103;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i86;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i91;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i96;
import 'modules/data_source_module.dart' as _i102;

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
  gh.factory<_i11.InfoProfileRoutes>(() => _i11.InfoProfileRoutes());
  gh.factory<_i12.MarkShopRoutes>(() => _i12.MarkShopRoutes());
  gh.factory<_i13.NotificationRoutes>(() => _i13.NotificationRoutes());
  gh.singleton<_i14.NotificationService>(
      _i14.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i15.QrCodeRoutes>(() => _i15.QrCodeRoutes());
  gh.singleton<_i16.Routes>(_i16.Routes());
  gh.factory<_i17.SettingRoutes>(() => _i17.SettingRoutes());
  await gh.singletonAsync<_i18.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i19.SocialRoutes>(() => _i19.SocialRoutes());
  gh.factory<_i20.UpgradeAccountRoutes>(() => _i20.UpgradeAccountRoutes());
  gh.factory<_i21.UserSharePreferencesUsecase>(
      () => _i21.UserSharePreferencesUsecase(gh<_i18.SharedPreferences>()));
  gh.factory<_i22.DashboardSharePreferenceUseCase>(
      () => _i22.DashboardSharePreferenceUseCase(gh<_i18.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i18.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i23.InformationPDoneSharePreferencesUsecase>(() =>
      _i23.InformationPDoneSharePreferencesUsecase(
          gh<_i18.SharedPreferences>()));
  gh.factory<_i24.InformationPdoneProfileCubit>(() =>
      _i24.InformationPdoneProfileCubit(
          gh<_i23.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i25.MarshopAPI>(() => _i25.MarshopAPI(gh<_i26.Dio>()));
  gh.factory<_i27.MarshopRepository>(
      () => _i28.MarshopRepositoryImpl(gh<_i25.MarshopAPI>()));
  gh.factory<_i29.MarshopUsecase>(
      () => _i29.MarshopUsecase(gh<_i27.MarshopRepository>()));
  gh.factory<_i30.NotificationAPI>(() => _i30.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i31.NotificationRepository>(
      () => _i32.NotificationRepositoryImpl(gh<_i30.NotificationAPI>()));
  gh.factory<_i33.NotificationUsecase>(
      () => _i33.NotificationUsecase(gh<_i31.NotificationRepository>()));
  gh.lazySingleton<_i34.OpenWeatherApi>(
      () => _i34.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i35.OpenWeatherRepository>(
      () => _i36.OpenWeatherRepositoryImpl(gh<_i34.OpenWeatherApi>()));
  gh.factory<_i37.OpenWeatherUseCase>(
      () => _i37.OpenWeatherUseCase(gh<_i35.OpenWeatherRepository>()));
  gh.factory<_i38.PlaceInformationAPI>(
      () => _i38.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i39.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i18.SharedPreferences>(),
        gh<_i39.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i40.PlaceInformationRepository>(() =>
      _i41.PlaceInformationRepositoryImpl(gh<_i38.PlaceInformationAPI>()));
  gh.factory<_i42.PlaceInformationUsecase>(() =>
      _i42.PlaceInformationUsecase(gh<_i40.PlaceInformationRepository>()));
  gh.factory<_i43.ResourceApi>(() => _i43.ResourceApi(gh<_i26.Dio>()));
  gh.factory<_i44.ResourceRepository>(
      () => _i45.ResourceRepositoryImpl(gh<_i43.ResourceApi>()));
  gh.factory<_i46.ResourceUsecase>(
      () => _i46.ResourceUsecase(gh<_i44.ResourceRepository>()));
  gh.factory<_i47.UpgradeAccountApi>(
      () => _i47.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i48.UpgradeAccountRepository>(
      () => _i49.UpgradeAccountRepositoryImpl(gh<_i47.UpgradeAccountApi>()));
  gh.factory<_i50.UpgradeAccountUsecase>(
      () => _i50.UpgradeAccountUsecase(gh<_i48.UpgradeAccountRepository>()));
  gh.factory<_i51.UserApi>(() => _i51.UserApi(gh<_i3.Dio>()));
  gh.factory<_i52.UserRepository>(
      () => _i53.AuthRepositoryImpl(gh<_i51.UserApi>()));
  gh.factory<_i54.UserUsecase>(
      () => _i54.UserUsecase(gh<_i52.UserRepository>()));
  gh.factory<_i55.AuthApi>(() => _i55.AuthApi(gh<_i26.Dio>()));
  gh.factory<_i56.AuthRepository>(
      () => _i57.AuthRepositoryImpl(gh<_i55.AuthApi>()));
  gh.factory<_i58.AuthenticationUsecase>(() => _i58.AuthenticationUsecase(
        gh<_i56.AuthRepository>(),
        gh<_i21.UserSharePreferencesUsecase>(),
        gh<_i52.UserRepository>(),
        gh<_i14.NotificationService>(),
        gh<_i33.NotificationUsecase>(),
      ));
  gh.factory<_i59.ChangePasswordController>(
      () => _i59.ChangePasswordController(gh<_i58.AuthenticationUsecase>()));
  gh.factory<_i60.CommunityApi>(() => _i60.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i61.CommunityRepository>(
      () => _i62.CommunityRepositoryImpl(gh<_i60.CommunityApi>()));
  gh.factory<_i63.CommunityUsecase>(() => _i63.CommunityUsecase(
        gh<_i61.CommunityRepository>(),
        gh<_i46.ResourceUsecase>(),
      ));
  gh.factory<_i64.DashBoardBgController>(() =>
      _i64.DashBoardBgController(gh<_i22.DashboardSharePreferenceUseCase>()));
  gh.factory<_i65.DashboardCommunityBloc>(() =>
      _i65.DashboardCommunityBloc(gh<_i22.DashboardSharePreferenceUseCase>()));
  gh.factory<_i65.DashboardEcommerceBloc>(() =>
      _i65.DashboardEcommerceBloc(gh<_i22.DashboardSharePreferenceUseCase>()));
  gh.factory<_i65.DashboardPersonalBloc>(() =>
      _i65.DashboardPersonalBloc(gh<_i22.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i66.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i66.EditCommunityDetailBloc(
        gh<_i63.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i67.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i67.EditFanGroupBloc(
        gh<_i63.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i68.FanGroupDetailBloc>(
      () => _i68.FanGroupDetailBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<_i69.GetDetailBloc<_i70.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i50.UpgradeAccountUsecase>()));
  gh.factory<_i69.GetDetailBloc<_i71.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i50.UpgradeAccountUsecase>()));
  gh.factory<_i69.GetDetailBloc<_i72.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i50.UpgradeAccountUsecase>()));
  gh.factory<_i69.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<
          _i69
          .GetDetailBlocParam1<_i73.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<_i69.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i54.UserUsecase>()));
  gh.factory<
      _i69.GetDetailBlocParam1<_i74.ConfirmRegisterJAResponse,
          _i75.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i50.UpgradeAccountUsecase>()));
  gh.factory<
      _i69.GetDetailBlocParam1<_i71.BankAccount,
          _i76.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i50.UpgradeAccountUsecase>()));
  gh.factory<
          _i69.GetDetailBlocParam1<_i77.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<_i69.GetDetailBlocParam1<bool, _i78.VerifyPhoneOtpPayload>>(() =>
      upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i50.UpgradeAccountUsecase>()));
  gh.factory<
      _i69.GetDetailBlocParam1<_i72.UpgradeAccountResponse,
          _i79.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i50.UpgradeAccountUsecase>()));
  gh.factory<
      _i69.GetDetailBlocParam2<_i80.ConfirmResponse, String,
          _i81.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<
      _i69.GetDetailBlocParam2<_i80.ConfirmResponse, String,
          _i82.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<_i69.GetListBloc<_i83.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i50.UpgradeAccountUsecase>()));
  gh.factory<_i69.GetListBloc<_i84.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<_i69.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<_i69.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<_i85.GroupDetailBloc>(
      () => _i85.GroupDetailBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<_i86.GuardianPDoneBloc>(
      () => _i86.GuardianPDoneBloc(gh<_i50.UpgradeAccountUsecase>()));
  gh.factory<_i87.InformationUpdateProfilBloc>(
      () => _i87.InformationUpdateProfilBloc(
            gh<_i54.UserUsecase>(),
            gh<_i23.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i88.MarshopCubit>(
      () => _i88.MarshopCubit(gh<_i29.MarshopUsecase>()));
  gh.factory<_i89.NotificationBloc>(
      () => _i89.NotificationBloc(gh<_i33.NotificationUsecase>()));
  gh.factory<_i90.OpenWeatherBloc>(
      () => _i90.OpenWeatherBloc(gh<_i37.OpenWeatherUseCase>()));
  gh.factory<_i91.PlaceInformationBloc>(
      () => _i91.PlaceInformationBloc(gh<_i42.PlaceInformationUsecase>()));
  gh.factory<_i92.PlaceInformationBloc2>(
      () => _i92.PlaceInformationBloc2(gh<_i42.PlaceInformationUsecase>()));
  gh.factory<_i93.SearchCubit>(() => _i93.SearchCubit(gh<_i54.UserUsecase>()));
  gh.factory<_i94.TeamDetailBloc>(
      () => _i94.TeamDetailBloc(gh<_i63.CommunityUsecase>()));
  gh.factory<_i95.TeamRequestCubit>(
      () => _i95.TeamRequestCubit(gh<_i63.CommunityUsecase>()));
  gh.factory<_i96.UpgradePDoneBloc>(() => _i96.UpgradePDoneBloc(
        gh<_i50.UpgradeAccountUsecase>(),
        gh<_i54.UserUsecase>(),
      ));
  gh.factory<_i97.UserActionCubit>(
      () => _i97.UserActionCubit(gh<_i54.UserUsecase>()));
  gh.factory<_i98.UserBloc>(() => _i98.UserBloc(
        gh<_i58.AuthenticationUsecase>(),
        gh<_i21.UserSharePreferencesUsecase>(),
        gh<_i54.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i99.UserCubit>(() => _i99.UserCubit(
        gh<_i58.AuthenticationUsecase>(),
        gh<_i21.UserSharePreferencesUsecase>(),
        gh<_i54.UserUsecase>(),
      ));
  gh.singleton<_i100.AppSettingBloc>(
      _i100.AppSettingBloc(gh<_i58.AuthenticationUsecase>()));
  gh.factory<_i101.AuthCubit>(
      () => _i101.AuthCubit(gh<_i58.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i102.DataSourceModule {}

class _$PlaceModule extends _i39.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i103.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i104.CommunityModule {}

class _$DiaryBlocFactory extends _i105.DiaryBlocFactory {}
