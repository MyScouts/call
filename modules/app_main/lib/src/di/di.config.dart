// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i27;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i77;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../app_delegate.dart' as _i4;
import '../blocs/auth/auth_cubit.dart' as _i112;
import '../blocs/community/team_request/team_request_cubit.dart' as _i105;
import '../blocs/marshop/marshop_cubit.dart' as _i97;
import '../blocs/user/user_cubit.dart' as _i109;
import '../blocs/user_action/user_action_cubit.dart' as _i107;
import '../core/services/notifications/notification_service.dart' as _i14;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i24;
import '../data/data_sources/remote/auth_api.dart' as _i62;
import '../data/data_sources/remote/community_api.dart' as _i67;
import '../data/data_sources/remote/marshop_api.dart' as _i26;
import '../data/data_sources/remote/notification_api.dart' as _i31;
import '../data/data_sources/remote/open_weather_api.dart' as _i35;
import '../data/data_sources/remote/place_information_api.dart' as _i39;
import '../data/data_sources/remote/place_information_provider.dart' as _i40;
import '../data/data_sources/remote/protector_api.dart' as _i44;
import '../data/data_sources/remote/resource_api.dart' as _i48;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i52;
import '../data/data_sources/remote/user_api.dart' as _i57;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i89;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i84;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i81;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i82;
import '../data/models/responses/boss_community_status_response.dart' as _i87;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i86;
import '../data/models/responses/confirm_register_ja_response.dart' as _i83;
import '../data/models/responses/confirm_response.dart' as _i88;
import '../data/models/responses/group_request_response.dart' as _i91;
import '../data/models/responses/ja_status_response.dart' as _i80;
import '../data/models/responses/upgrade_account_response.dart' as _i78;
import '../data/repositories/auth_repository.dart' as _i63;
import '../data/repositories/impl/auth_repository_impl.dart' as _i64;
import '../data/repositories/impl/community_repository.impl.dart' as _i69;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i29;
import '../data/repositories/impl/notification_repository.impl.dart' as _i33;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i37;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i42;
import '../data/repositories/impl/protector_repository_impl.dart' as _i46;
import '../data/repositories/impl/resource_repository.impl.dart' as _i50;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i54;
import '../data/repositories/impl/user_repository_impl.dart' as _i59;
import '../data/repositories/marshop_repository.dart' as _i28;
import '../data/repositories/notification_repository.dart' as _i32;
import '../data/repositories/protector_repository.dart' as _i45;
import '../data/repositories/user_repository.dart' as _i58;
import '../domain/entities/bank.dart' as _i92;
import '../domain/entities/commity_action_type.dart' as _i85;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i79;
import '../domain/repository/community_repository.dart' as _i68;
import '../domain/repository/open_weather_repository.dart' as _i36;
import '../domain/repository/place_information_repository.dart' as _i41;
import '../domain/repository/resource_responsitory.dart' as _i49;
import '../domain/repository/upgrade_account_repository.dart' as _i53;
import '../domain/usecases/authentication_usecase.dart' as _i65;
import '../domain/usecases/community_usecase.dart' as _i70;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i23;
import '../domain/usecases/marshop_usecase.dart' as _i30;
import '../domain/usecases/notification_usecase.dart' as _i34;
import '../domain/usecases/open_weather_usecase.dart' as _i38;
import '../domain/usecases/place_information_usecase.dart' as _i43;
import '../domain/usecases/protector_usecase.dart' as _i47;
import '../domain/usecases/resource_usecase.dart' as _i51;
import '../domain/usecases/upgrade_account_usecase.dart' as _i55;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i22;
import '../domain/usecases/user_usecase.dart' as _i60;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_constants.dart' as _i90;
import '../presentation/community/community_module.dart' as _i115;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i74;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i75;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i76;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i93;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i104;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i61;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i72;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i73;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i99;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i71;
import '../presentation/dashboard/dashboard_module.dart' as _i117;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i103;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i66;
import '../presentation/general_setting/general_routes.dart' as _i9;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i95;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i25;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i102;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i11;
import '../presentation/marshop/marshop_routes.dart' as _i12;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i10;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/notification/notification_routes.dart' as _i13;
import '../presentation/notification/state/notification_bloc.dart' as _i98;
import '../presentation/profile/state/user_profile_bloc.dart' as _i110;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i96;
import '../presentation/protector/protector_router.dart' as _i15;
import '../presentation/qr_code/qr_code_route.dart' as _i16;
import '../presentation/routes.dart' as _i17;
import '../presentation/settings/setting_routes.dart' as _i18;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i111;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i108;
import '../presentation/social/profile/profile_bloc.dart' as _i116;
import '../presentation/social/social_routes.dart' as _i20;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i21;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i114;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i94;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i100;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i101;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i56;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i106;
import 'modules/data_source_module.dart' as _i113;

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
  final dashBoardModule = _$DashBoardModule();
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
  gh.factory<_i15.ProtectorModule>(() => _i15.ProtectorModule());
  gh.factory<_i16.QrCodeRoutes>(() => _i16.QrCodeRoutes());
  gh.singleton<_i17.Routes>(_i17.Routes());
  gh.factory<_i18.SettingRoutes>(() => _i18.SettingRoutes());
  await gh.singletonAsync<_i19.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i20.SocialRoutes>(() => _i20.SocialRoutes());
  gh.factory<_i21.UpgradeAccountRoutes>(() => _i21.UpgradeAccountRoutes());
  gh.factory<_i22.UserSharePreferencesUsecase>(
      () => _i22.UserSharePreferencesUsecase(gh<_i19.SharedPreferences>()));
  gh.factory<_i23.DashboardSharePreferenceUseCase>(
      () => _i23.DashboardSharePreferenceUseCase(gh<_i19.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i19.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i24.InformationPDoneSharePreferencesUsecase>(() =>
      _i24.InformationPDoneSharePreferencesUsecase(
          gh<_i19.SharedPreferences>()));
  gh.factory<_i25.InformationPdoneProfileCubit>(() =>
      _i25.InformationPdoneProfileCubit(
          gh<_i24.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i26.MarshopAPI>(() => _i26.MarshopAPI(gh<_i27.Dio>()));
  gh.factory<_i28.MarshopRepository>(
      () => _i29.MarshopRepositoryImpl(gh<_i26.MarshopAPI>()));
  gh.factory<_i30.MarshopUsecase>(
      () => _i30.MarshopUsecase(gh<_i28.MarshopRepository>()));
  gh.factory<_i31.NotificationAPI>(() => _i31.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i32.NotificationRepository>(
      () => _i33.NotificationRepositoryImpl(gh<_i31.NotificationAPI>()));
  gh.factory<_i34.NotificationUsecase>(
      () => _i34.NotificationUsecase(gh<_i32.NotificationRepository>()));
  gh.lazySingleton<_i35.OpenWeatherApi>(
      () => _i35.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i36.OpenWeatherRepository>(
      () => _i37.OpenWeatherRepositoryImpl(gh<_i35.OpenWeatherApi>()));
  gh.factory<_i38.OpenWeatherUseCase>(
      () => _i38.OpenWeatherUseCase(gh<_i36.OpenWeatherRepository>()));
  gh.factory<_i39.PlaceInformationAPI>(
      () => _i39.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i40.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i19.SharedPreferences>(),
        gh<_i40.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i41.PlaceInformationRepository>(() =>
      _i42.PlaceInformationRepositoryImpl(gh<_i39.PlaceInformationAPI>()));
  gh.factory<_i43.PlaceInformationUsecase>(() =>
      _i43.PlaceInformationUsecase(gh<_i41.PlaceInformationRepository>()));
  gh.lazySingleton<_i44.ProtectorAPI>(() => _i44.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i45.ProtectorRepository>(
      () => _i46.ProtectorRepositoryImpl(gh<_i44.ProtectorAPI>()));
  gh.factory<_i47.ProtectorUseCase>(
      () => _i47.ProtectorUseCase(gh<_i45.ProtectorRepository>()));
  gh.factory<_i48.ResourceApi>(() => _i48.ResourceApi(gh<_i27.Dio>()));
  gh.factory<_i49.ResourceRepository>(
      () => _i50.ResourceRepositoryImpl(gh<_i48.ResourceApi>()));
  gh.factory<_i51.ResourceUsecase>(
      () => _i51.ResourceUsecase(gh<_i49.ResourceRepository>()));
  gh.factory<_i52.UpgradeAccountApi>(
      () => _i52.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i53.UpgradeAccountRepository>(
      () => _i54.UpgradeAccountRepositoryImpl(
            gh<_i52.UpgradeAccountApi>(),
            gh<_i48.ResourceApi>(),
          ));
  gh.factory<_i55.UpgradeAccountUsecase>(
      () => _i55.UpgradeAccountUsecase(gh<_i53.UpgradeAccountRepository>()));
  gh.factory<_i56.UpgradeCubit>(
      () => _i56.UpgradeCubit(gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<_i57.UserApi>(() => _i57.UserApi(gh<_i3.Dio>()));
  gh.factory<_i58.UserRepository>(
      () => _i59.AuthRepositoryImpl(gh<_i57.UserApi>()));
  gh.factory<_i60.UserUsecase>(
      () => _i60.UserUsecase(gh<_i58.UserRepository>()));
  gh.factory<_i61.AddMemberChangeNotifier>(
      () => _i61.AddMemberChangeNotifier(gh<_i60.UserUsecase>()));
  gh.factory<_i62.AuthApi>(() => _i62.AuthApi(gh<_i27.Dio>()));
  gh.factory<_i63.AuthRepository>(
      () => _i64.AuthRepositoryImpl(gh<_i62.AuthApi>()));
  gh.factory<_i65.AuthenticationUsecase>(() => _i65.AuthenticationUsecase(
        gh<_i63.AuthRepository>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i58.UserRepository>(),
        gh<_i14.NotificationService>(),
        gh<_i34.NotificationUsecase>(),
      ));
  gh.factory<_i66.ChangePasswordController>(
      () => _i66.ChangePasswordController(gh<_i65.AuthenticationUsecase>()));
  gh.factory<_i67.CommunityApi>(() => _i67.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i68.CommunityRepository>(
      () => _i69.CommunityRepositoryImpl(gh<_i67.CommunityApi>()));
  gh.factory<_i70.CommunityUsecase>(() => _i70.CommunityUsecase(
        gh<_i68.CommunityRepository>(),
        gh<_i51.ResourceUsecase>(),
      ));
  gh.factory<_i71.DashBoardBgController>(() =>
      _i71.DashBoardBgController(gh<_i23.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i72.DashBoardScreenController>(() =>
      _i72.DashBoardScreenController(
          gh<_i23.DashboardSharePreferenceUseCase>()));
  gh.factory<_i73.DashboardCommunityBloc>(() =>
      _i73.DashboardCommunityBloc(gh<_i23.DashboardSharePreferenceUseCase>()));
  gh.factory<_i73.DashboardEcommerceBloc>(() =>
      _i73.DashboardEcommerceBloc(gh<_i23.DashboardSharePreferenceUseCase>()));
  gh.factory<_i73.DashboardPersonalBloc>(() =>
      _i73.DashboardPersonalBloc(gh<_i23.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i74.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i74.EditCommunityDetailBloc(
        gh<_i70.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i75.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i75.EditFanGroupBloc(
        gh<_i70.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i76.FanGroupDetailBloc>(
      () => _i76.FanGroupDetailBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<_i77.GetDetailBloc<_i78.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<_i77.GetDetailBloc<_i79.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<_i77.GetDetailBloc<_i80.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<_i77.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<
      _i77.GetDetailBlocParam1<_i79.BankAccount,
          _i81.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<_i77.GetDetailBlocParam1<dynamic, _i82.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<
      _i77.GetDetailBlocParam1<_i83.ConfirmRegisterJAResponse,
          _i84.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<
      _i77.GetDetailBlocParam1<_i78.UpgradeAccountResponse,
          _i85.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<
          _i77
          .GetDetailBlocParam1<_i86.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<
          _i77.GetDetailBlocParam1<_i87.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<_i77.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i60.UserUsecase>()));
  gh.factory<
      _i77.GetDetailBlocParam2<_i88.ConfirmResponse, String,
          _i89.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<
      _i77.GetDetailBlocParam2<_i88.ConfirmResponse, String,
          _i90.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<_i77.GetListBloc<_i91.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<_i77.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<_i77.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i70.CommunityUsecase>()));
  gh.factory<_i77.GetListBloc<_i92.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<_i77.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<_i93.GroupDetailBloc>(
      () => _i93.GroupDetailBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<_i94.GuardianPDoneBloc>(
      () => _i94.GuardianPDoneBloc(gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<_i95.InformationUpdateProfilBloc>(
      () => _i95.InformationUpdateProfilBloc(
            gh<_i60.UserUsecase>(),
            gh<_i24.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i96.ListProtectorRequestController>(
      () => _i96.ListProtectorRequestController(gh<_i47.ProtectorUseCase>()));
  gh.factory<_i96.ManageProtectController>(
      () => _i96.ManageProtectController(gh<_i47.ProtectorUseCase>()));
  gh.factory<_i97.MarshopCubit>(
      () => _i97.MarshopCubit(gh<_i30.MarshopUsecase>()));
  gh.factory<_i98.NotificationBloc>(
      () => _i98.NotificationBloc(gh<_i34.NotificationUsecase>()));
  gh.factory<_i99.OpenWeatherBloc>(
      () => _i99.OpenWeatherBloc(gh<_i38.OpenWeatherUseCase>()));
  gh.factory<_i100.PDoneInformationBloc>(
      () => _i100.PDoneInformationBloc(gh<_i55.UpgradeAccountUsecase>()));
  gh.factory<_i101.PlaceInformationBloc>(
      () => _i101.PlaceInformationBloc(gh<_i43.PlaceInformationUsecase>()));
  gh.factory<_i102.PlaceInformationBloc2>(
      () => _i102.PlaceInformationBloc2(gh<_i43.PlaceInformationUsecase>()));
  gh.factory<_i103.SearchCubit>(
      () => _i103.SearchCubit(gh<_i60.UserUsecase>()));
  gh.factory<_i104.TeamDetailBloc>(
      () => _i104.TeamDetailBloc(gh<_i70.CommunityUsecase>()));
  gh.factory<_i105.TeamRequestCubit>(
      () => _i105.TeamRequestCubit(gh<_i70.CommunityUsecase>()));
  gh.factory<_i106.UpgradePDoneBloc>(() => _i106.UpgradePDoneBloc(
        gh<_i55.UpgradeAccountUsecase>(),
        gh<_i60.UserUsecase>(),
        gh<_i22.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i107.UserActionCubit>(
      () => _i107.UserActionCubit(gh<_i60.UserUsecase>()));
  gh.factory<_i108.UserBloc>(() => _i108.UserBloc(
        gh<_i65.AuthenticationUsecase>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i60.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i109.UserCubit>(() => _i109.UserCubit(
        gh<_i65.AuthenticationUsecase>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i60.UserUsecase>(),
      ));
  gh.factory<_i110.UserProfileBloc>(
      () => _i110.UserProfileBloc(gh<_i60.UserUsecase>()));
  gh.singleton<_i111.AppSettingBloc>(
      _i111.AppSettingBloc(gh<_i65.AuthenticationUsecase>()));
  gh.factory<_i112.AuthCubit>(
      () => _i112.AuthCubit(gh<_i65.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i113.DataSourceModule {}

class _$PlaceModule extends _i40.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i114.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i115.CommunityModule {}

class _$DiaryBlocFactory extends _i116.DiaryBlocFactory {}

class _$DashBoardModule extends _i117.DashBoardModule {}
