// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i35;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i85;
import 'package:shared_preferences/shared_preferences.dart' as _i26;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i119;
import '../blocs/auth/auth_cubit.dart' as _i121;
import '../blocs/community/team_request/team_request_cubit.dart' as _i113;
import '../blocs/marshop/marshop_cubit.dart' as _i105;
import '../blocs/user/user_cubit.dart' as _i117;
import '../blocs/user_action/user_action_cubit.dart' as _i115;
import '../core/services/live_service/impl/live_service_impl.dart' as _i14;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i16;
import '../core/services/live_service/live_service.dart' as _i13;
import '../core/services/live_service/live_socket_service.dart' as _i15;
import '../core/services/notifications/notification_service.dart' as _i21;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i31;
import '../data/data_sources/remote/auth_api.dart' as _i70;
import '../data/data_sources/remote/community_api.dart' as _i75;
import '../data/data_sources/remote/marshop_api.dart' as _i34;
import '../data/data_sources/remote/notification_api.dart' as _i39;
import '../data/data_sources/remote/open_weather_api.dart' as _i43;
import '../data/data_sources/remote/place_information_api.dart' as _i47;
import '../data/data_sources/remote/place_information_provider.dart' as _i48;
import '../data/data_sources/remote/protector_api.dart' as _i52;
import '../data/data_sources/remote/resource_api.dart' as _i56;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i60;
import '../data/data_sources/remote/user_api.dart' as _i65;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i97;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i91;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i93;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i95;
import '../data/models/responses/boss_community_status_response.dart' as _i94;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i92;
import '../data/models/responses/confirm_register_ja_response.dart' as _i90;
import '../data/models/responses/confirm_response.dart' as _i96;
import '../data/models/responses/group_request_response.dart' as _i100;
import '../data/models/responses/ja_status_response.dart' as _i86;
import '../data/models/responses/upgrade_account_response.dart' as _i88;
import '../data/repositories/auth_repository.dart' as _i71;
import '../data/repositories/impl/auth_repository_impl.dart' as _i72;
import '../data/repositories/impl/community_repository.impl.dart' as _i77;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i37;
import '../data/repositories/impl/media_picker_impl.dart' as _i19;
import '../data/repositories/impl/notification_repository.impl.dart' as _i41;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i45;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i50;
import '../data/repositories/impl/protector_repository_impl.dart' as _i54;
import '../data/repositories/impl/resource_repository.impl.dart' as _i58;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i62;
import '../data/repositories/impl/user_repository_impl.dart' as _i67;
import '../data/repositories/marshop_repository.dart' as _i36;
import '../data/repositories/media_picker.dart' as _i18;
import '../data/repositories/notification_repository.dart' as _i40;
import '../data/repositories/protector_repository.dart' as _i53;
import '../data/repositories/user_repository.dart' as _i66;
import '../domain/entities/bank.dart' as _i99;
import '../domain/entities/commity_action_type.dart' as _i89;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i87;
import '../domain/repository/community_repository.dart' as _i76;
import '../domain/repository/open_weather_repository.dart' as _i44;
import '../domain/repository/place_information_repository.dart' as _i49;
import '../domain/repository/resource_repository.dart' as _i57;
import '../domain/repository/upgrade_account_repository.dart' as _i61;
import '../domain/usecases/authentication_usecase.dart' as _i73;
import '../domain/usecases/community_usecase.dart' as _i78;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i30;
import '../domain/usecases/marshop_usecase.dart' as _i38;
import '../domain/usecases/notification_usecase.dart' as _i42;
import '../domain/usecases/open_weather_usecase.dart' as _i46;
import '../domain/usecases/place_information_usecase.dart' as _i51;
import '../domain/usecases/protector_usecase.dart' as _i55;
import '../domain/usecases/resource_usecase.dart' as _i59;
import '../domain/usecases/upgrade_account_usecase.dart' as _i63;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i29;
import '../domain/usecases/user_usecase.dart' as _i68;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_constants.dart' as _i98;
import '../presentation/community/community_module.dart' as _i123;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i82;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i83;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i84;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i101;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i112;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i69;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i80;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i81;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i107;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i79;
import '../presentation/dashboard/dashboard_module.dart' as _i126;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i111;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i74;
import '../presentation/general_setting/general_routes.dart' as _i10;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i103;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i32;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i110;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i11;
import '../presentation/live/channel/state/live_channel_controller.dart'
    as _i33;
import '../presentation/live/live_routes.dart' as _i12;
import '../presentation/marshop/marshop_routes.dart' as _i17;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i9;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/notification/notification_routes.dart' as _i20;
import '../presentation/notification/state/notification_bloc.dart' as _i106;
import '../presentation/profile/state/user_profile_bloc.dart' as _i118;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i104;
import '../presentation/protector/protector_router.dart' as _i22;
import '../presentation/qr_code/qr_code_route.dart' as _i23;
import '../presentation/routes.dart' as _i24;
import '../presentation/settings/setting_routes.dart' as _i25;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i120;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i116;
import '../presentation/social/profile/profile_bloc.dart' as _i125;
import '../presentation/social/social_routes.dart' as _i27;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i28;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i124;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i102;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i108;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i109;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i64;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i114;
import 'modules/data_source_module.dart' as _i122;

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
  final communityModule = _$CommunityModule();
  final upgradeAgreePolicyBlocFactory = _$UpgradeAgreePolicyBlocFactory();
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
  gh.factory<_i12.LiveRoutes>(() => _i12.LiveRoutes());
  gh.factory<_i13.LiveService>(() => _i14.LiveServiceImpl());
  gh.factory<_i15.LiveSocketService>(() => _i16.LiveSocketServiceImpl());
  gh.factory<_i17.MarkShopRoutes>(() => _i17.MarkShopRoutes());
  gh.lazySingleton<_i18.MediaPicker>(() => _i19.MediaPickerImpl());
  gh.factory<_i20.NotificationRoutes>(() => _i20.NotificationRoutes());
  gh.singleton<_i21.NotificationService>(
      _i21.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i22.ProtectorModule>(() => _i22.ProtectorModule());
  gh.factory<_i23.QrCodeRoutes>(() => _i23.QrCodeRoutes());
  gh.singleton<_i24.Routes>(_i24.Routes());
  gh.factory<_i25.SettingRoutes>(() => _i25.SettingRoutes());
  await gh.singletonAsync<_i26.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i27.SocialRoutes>(() => _i27.SocialRoutes());
  gh.factory<_i28.UpgradeAccountRoutes>(() => _i28.UpgradeAccountRoutes());
  gh.factory<_i29.UserSharePreferencesUsecase>(
      () => _i29.UserSharePreferencesUsecase(gh<_i26.SharedPreferences>()));
  gh.factory<_i30.DashboardSharePreferenceUseCase>(
      () => _i30.DashboardSharePreferenceUseCase(gh<_i26.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i26.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i31.InformationPDoneSharePreferencesUsecase>(() =>
      _i31.InformationPDoneSharePreferencesUsecase(
          gh<_i26.SharedPreferences>()));
  gh.factory<_i32.InformationPdoneProfileCubit>(() =>
      _i32.InformationPdoneProfileCubit(
          gh<_i31.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i33.LiveChannelController>(() => _i33.LiveChannelController(
        gh<_i13.LiveService>(),
        gh<_i15.LiveSocketService>(),
      ));
  gh.factory<_i34.MarshopAPI>(() => _i34.MarshopAPI(gh<_i35.Dio>()));
  gh.factory<_i36.MarshopRepository>(
      () => _i37.MarshopRepositoryImpl(gh<_i34.MarshopAPI>()));
  gh.factory<_i38.MarshopUsecase>(
      () => _i38.MarshopUsecase(gh<_i36.MarshopRepository>()));
  gh.factory<_i39.NotificationAPI>(() => _i39.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i40.NotificationRepository>(
      () => _i41.NotificationRepositoryImpl(gh<_i39.NotificationAPI>()));
  gh.factory<_i42.NotificationUsecase>(
      () => _i42.NotificationUsecase(gh<_i40.NotificationRepository>()));
  gh.lazySingleton<_i43.OpenWeatherApi>(
      () => _i43.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i44.OpenWeatherRepository>(
      () => _i45.OpenWeatherRepositoryImpl(gh<_i43.OpenWeatherApi>()));
  gh.factory<_i46.OpenWeatherUseCase>(
      () => _i46.OpenWeatherUseCase(gh<_i44.OpenWeatherRepository>()));
  gh.factory<_i47.PlaceInformationAPI>(
      () => _i47.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i48.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i26.SharedPreferences>(),
        gh<_i48.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i49.PlaceInformationRepository>(() =>
      _i50.PlaceInformationRepositoryImpl(gh<_i47.PlaceInformationAPI>()));
  gh.factory<_i51.PlaceInformationUsecase>(() =>
      _i51.PlaceInformationUsecase(gh<_i49.PlaceInformationRepository>()));
  gh.lazySingleton<_i52.ProtectorAPI>(() => _i52.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i53.ProtectorRepository>(
      () => _i54.ProtectorRepositoryImpl(gh<_i52.ProtectorAPI>()));
  gh.factory<_i55.ProtectorUseCase>(
      () => _i55.ProtectorUseCase(gh<_i53.ProtectorRepository>()));
  gh.factory<_i56.ResourceApi>(() => _i56.ResourceApi(gh<_i35.Dio>()));
  gh.factory<_i57.ResourceRepository>(
      () => _i58.ResourceRepositoryImpl(gh<_i56.ResourceApi>()));
  gh.factory<_i59.ResourceUsecase>(
      () => _i59.ResourceUsecase(gh<_i57.ResourceRepository>()));
  gh.factory<_i60.UpgradeAccountApi>(
      () => _i60.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i61.UpgradeAccountRepository>(
      () => _i62.UpgradeAccountRepositoryImpl(
            gh<_i60.UpgradeAccountApi>(),
            gh<_i56.ResourceApi>(),
          ));
  gh.factory<_i63.UpgradeAccountUsecase>(
      () => _i63.UpgradeAccountUsecase(gh<_i61.UpgradeAccountRepository>()));
  gh.factory<_i64.UpgradeCubit>(
      () => _i64.UpgradeCubit(gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<_i65.UserApi>(() => _i65.UserApi(gh<_i3.Dio>()));
  gh.factory<_i66.UserRepository>(
      () => _i67.AuthRepositoryImpl(gh<_i65.UserApi>()));
  gh.factory<_i68.UserUsecase>(
      () => _i68.UserUsecase(gh<_i66.UserRepository>()));
  gh.factory<_i69.AddMemberChangeNotifier>(
      () => _i69.AddMemberChangeNotifier(gh<_i68.UserUsecase>()));
  gh.factory<_i70.AuthApi>(() => _i70.AuthApi(gh<_i35.Dio>()));
  gh.factory<_i71.AuthRepository>(
      () => _i72.AuthRepositoryImpl(gh<_i70.AuthApi>()));
  gh.factory<_i73.AuthenticationUsecase>(() => _i73.AuthenticationUsecase(
        gh<_i71.AuthRepository>(),
        gh<_i29.UserSharePreferencesUsecase>(),
        gh<_i66.UserRepository>(),
        gh<_i21.NotificationService>(),
        gh<_i42.NotificationUsecase>(),
      ));
  gh.factory<_i74.ChangePasswordController>(
      () => _i74.ChangePasswordController(gh<_i73.AuthenticationUsecase>()));
  gh.factory<_i75.CommunityApi>(() => _i75.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i76.CommunityRepository>(
      () => _i77.CommunityRepositoryImpl(gh<_i75.CommunityApi>()));
  gh.factory<_i78.CommunityUsecase>(() => _i78.CommunityUsecase(
        gh<_i76.CommunityRepository>(),
        gh<_i59.ResourceUsecase>(),
      ));
  gh.factory<_i79.DashBoardBgController>(() =>
      _i79.DashBoardBgController(gh<_i30.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i80.DashBoardScreenController>(() =>
      _i80.DashBoardScreenController(
          gh<_i30.DashboardSharePreferenceUseCase>()));
  gh.factory<_i81.DashboardCommunityBloc>(() =>
      _i81.DashboardCommunityBloc(gh<_i30.DashboardSharePreferenceUseCase>()));
  gh.factory<_i81.DashboardEcommerceBloc>(() =>
      _i81.DashboardEcommerceBloc(gh<_i30.DashboardSharePreferenceUseCase>()));
  gh.factory<_i81.DashboardPersonalBloc>(() =>
      _i81.DashboardPersonalBloc(gh<_i30.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i82.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i82.EditCommunityDetailBloc(
        gh<_i78.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i83.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i83.EditFanGroupBloc(
        gh<_i78.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i84.FanGroupDetailBloc>(
      () => _i84.FanGroupDetailBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<_i85.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<_i85.GetDetailBloc<_i86.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<_i85.GetDetailBloc<_i87.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<_i85.GetDetailBloc<_i88.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<
      _i85.GetDetailBlocParam1<_i88.UpgradeAccountResponse,
          _i89.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<
      _i85.GetDetailBlocParam1<_i90.ConfirmRegisterJAResponse,
          _i91.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<
          _i85
          .GetDetailBlocParam1<_i92.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<
      _i85.GetDetailBlocParam1<_i87.BankAccount,
          _i93.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<_i85.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i68.UserUsecase>()));
  gh.factory<
          _i85.GetDetailBlocParam1<_i94.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<_i85.GetDetailBlocParam1<dynamic, _i95.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<
      _i85.GetDetailBlocParam2<_i96.ConfirmResponse, String,
          _i97.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<
      _i85.GetDetailBlocParam2<_i96.ConfirmResponse, String,
          _i98.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<_i85.GetListBloc<_i99.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<_i85.GetListBloc<_i100.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<_i85.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i78.CommunityUsecase>()));
  gh.factory<_i85.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<_i85.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<_i101.GroupDetailBloc>(
      () => _i101.GroupDetailBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<_i102.GuardianPDoneBloc>(
      () => _i102.GuardianPDoneBloc(gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<_i103.InformationUpdateProfilBloc>(
      () => _i103.InformationUpdateProfilBloc(
            gh<_i68.UserUsecase>(),
            gh<_i31.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i104.ListProtectorRequestController>(
      () => _i104.ListProtectorRequestController(gh<_i55.ProtectorUseCase>()));
  gh.factory<_i104.ManageProtectController>(
      () => _i104.ManageProtectController(gh<_i55.ProtectorUseCase>()));
  gh.factory<_i105.MarshopCubit>(
      () => _i105.MarshopCubit(gh<_i38.MarshopUsecase>()));
  gh.factory<_i106.NotificationBloc>(
      () => _i106.NotificationBloc(gh<_i42.NotificationUsecase>()));
  gh.factory<_i107.OpenWeatherBloc>(
      () => _i107.OpenWeatherBloc(gh<_i46.OpenWeatherUseCase>()));
  gh.factory<_i108.PDoneInformationBloc>(
      () => _i108.PDoneInformationBloc(gh<_i63.UpgradeAccountUsecase>()));
  gh.factory<_i109.PlaceInformationBloc>(
      () => _i109.PlaceInformationBloc(gh<_i51.PlaceInformationUsecase>()));
  gh.factory<_i110.PlaceInformationBloc2>(
      () => _i110.PlaceInformationBloc2(gh<_i51.PlaceInformationUsecase>()));
  gh.factory<_i111.SearchCubit>(
      () => _i111.SearchCubit(gh<_i68.UserUsecase>()));
  gh.factory<_i112.TeamDetailBloc>(
      () => _i112.TeamDetailBloc(gh<_i78.CommunityUsecase>()));
  gh.factory<_i113.TeamRequestCubit>(
      () => _i113.TeamRequestCubit(gh<_i78.CommunityUsecase>()));
  gh.factory<_i114.UpgradePDoneBloc>(() => _i114.UpgradePDoneBloc(
        gh<_i63.UpgradeAccountUsecase>(),
        gh<_i68.UserUsecase>(),
        gh<_i29.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i115.UserActionCubit>(
      () => _i115.UserActionCubit(gh<_i68.UserUsecase>()));
  gh.factory<_i116.UserBloc>(() => _i116.UserBloc(
        gh<_i73.AuthenticationUsecase>(),
        gh<_i29.UserSharePreferencesUsecase>(),
        gh<_i68.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i117.UserCubit>(() => _i117.UserCubit(
        gh<_i73.AuthenticationUsecase>(),
        gh<_i29.UserSharePreferencesUsecase>(),
        gh<_i68.UserUsecase>(),
      ));
  gh.factory<_i118.UserProfileBloc>(() => _i118.UserProfileBloc(
        gh<_i68.UserUsecase>(),
        gh<_i55.ProtectorUseCase>(),
        gh<_i18.MediaPicker>(),
        gh<_i63.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i119.AppCubit>(() => _i119.AppCubit(
        gh<_i59.ResourceUsecase>(),
        gh<_i29.UserSharePreferencesUsecase>(),
        gh<_i73.AuthenticationUsecase>(),
      ));
  gh.singleton<_i120.AppSettingBloc>(
      _i120.AppSettingBloc(gh<_i73.AuthenticationUsecase>()));
  gh.factory<_i121.AuthCubit>(
      () => _i121.AuthCubit(gh<_i73.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i122.DataSourceModule {}

class _$PlaceModule extends _i48.PlaceModule {}

class _$CommunityModule extends _i123.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i124.UpgradeAgreePolicyBlocFactory {}

class _$DiaryBlocFactory extends _i125.DiaryBlocFactory {}

class _$DashBoardModule extends _i126.DashBoardModule {}
