// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i42;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i94;
import 'package:shared_preferences/shared_preferences.dart' as _i28;
import 'package:wallet/core/core.dart' as _i32;
import 'package:wallet/di/wallet_micro.module.dart' as _i136;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i133;
import '../blocs/auth/auth_cubit.dart' as _i135;
import '../blocs/community/team_request/team_request_cubit.dart' as _i127;
import '../blocs/marshop/marshop_cubit.dart' as _i119;
import '../blocs/user/user_cubit.dart' as _i131;
import '../blocs/user_action/user_action_cubit.dart' as _i129;
import '../core/services/live_service/impl/live_service_impl.dart' as _i16;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i18;
import '../core/services/live_service/live_service.dart' as _i15;
import '../core/services/live_service/live_socket_service.dart' as _i17;
import '../core/services/notifications/notification_service.dart' as _i23;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i35;
import '../data/data_sources/remote/auth_api.dart' as _i77;
import '../data/data_sources/remote/community_api.dart' as _i83;
import '../data/data_sources/remote/marshop_api.dart' as _i41;
import '../data/data_sources/remote/notification_api.dart' as _i46;
import '../data/data_sources/remote/open_weather_api.dart' as _i50;
import '../data/data_sources/remote/place_information_api.dart' as _i54;
import '../data/data_sources/remote/place_information_provider.dart' as _i55;
import '../data/data_sources/remote/protector_api.dart' as _i59;
import '../data/data_sources/remote/resource_api.dart' as _i63;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i67;
import '../data/data_sources/remote/user_api.dart' as _i72;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i107;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i100;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i104;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i101;
import '../data/models/responses/boss_community_status_response.dart' as _i98;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i103;
import '../data/models/responses/confirm_register_ja_response.dart' as _i99;
import '../data/models/responses/confirm_response.dart' as _i105;
import '../data/models/responses/group_request_response.dart' as _i108;
import '../data/models/responses/ja_status_response.dart' as _i95;
import '../data/models/responses/upgrade_account_response.dart' as _i97;
import '../data/repositories/auth_repository.dart' as _i78;
import '../data/repositories/impl/auth_repository_impl.dart' as _i79;
import '../data/repositories/impl/community_repository.impl.dart' as _i85;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i44;
import '../data/repositories/impl/media_picker_impl.dart' as _i21;
import '../data/repositories/impl/notification_repository.impl.dart' as _i48;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i52;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i57;
import '../data/repositories/impl/protector_repository_impl.dart' as _i61;
import '../data/repositories/impl/resource_repository.impl.dart' as _i65;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i69;
import '../data/repositories/impl/user_repository_impl.dart' as _i74;
import '../data/repositories/marshop_repository.dart' as _i43;
import '../data/repositories/media_picker.dart' as _i20;
import '../data/repositories/notification_repository.dart' as _i47;
import '../data/repositories/protector_repository.dart' as _i60;
import '../data/repositories/user_repository.dart' as _i73;
import '../domain/entities/bank.dart' as _i109;
import '../domain/entities/commity_action_type.dart' as _i102;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i96;
import '../domain/repository/community_repository.dart' as _i84;
import '../domain/repository/open_weather_repository.dart' as _i51;
import '../domain/repository/place_information_repository.dart' as _i56;
import '../domain/repository/resource_repository.dart' as _i64;
import '../domain/repository/upgrade_account_repository.dart' as _i68;
import '../domain/usecases/authentication_usecase.dart' as _i80;
import '../domain/usecases/community_usecase.dart' as _i86;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i33;
import '../domain/usecases/marshop_usecase.dart' as _i45;
import '../domain/usecases/notification_usecase.dart' as _i49;
import '../domain/usecases/open_weather_usecase.dart' as _i53;
import '../domain/usecases/place_information_usecase.dart' as _i58;
import '../domain/usecases/protector_usecase.dart' as _i62;
import '../domain/usecases/resource_usecase.dart' as _i66;
import '../domain/usecases/upgrade_account_usecase.dart' as _i70;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i31;
import '../domain/usecases/user_usecase.dart' as _i75;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_constants.dart' as _i106;
import '../presentation/community/community_module.dart' as _i140;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i90;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i91;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i93;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i111;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i126;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i76;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i88;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i89;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i121;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i87;
import '../presentation/dashboard/dashboard_module.dart' as _i142;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i125;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i82;
import '../presentation/general_setting/general_routes.dart' as _i11;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i113;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i36;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i124;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i12;
import '../presentation/live/data/data_sources/remote/live_api.dart' as _i37;
import '../presentation/live/data/repository/live_repository.dart' as _i38;
import '../presentation/live/data/repository/repository_impl/live_repository_impl.dart'
    as _i39;
import '../presentation/live/domain/usecases/gift_share_preferences_usecase.dart'
    as _i34;
import '../presentation/live/domain/usecases/live_usecases.dart' as _i40;
import '../presentation/live/live_routes.dart' as _i14;
import '../presentation/live/presentation/channel/state/live_channel_controller.dart'
    as _i116;
import '../presentation/live/presentation/channel/widget/sent_gift_page.dart'
    as _i9;
import '../presentation/live/presentation/create/state/live_create_controller.dart'
    as _i118;
import '../presentation/live/presentation/create/widget/live_category_picker.dart'
    as _i81;
import '../presentation/live/presentation/list_gift/gift_controller.dart'
    as _i110;
import '../presentation/live/presentation/live_bottom/live_bottom_controller.dart'
    as _i115;
import '../presentation/live/presentation/live_message/state/live_message_bloc.dart'
    as _i13;
import '../presentation/live/presentation/live_tab/live_controller.dart'
    as _i117;
import '../presentation/marshop/marshop_routes.dart' as _i19;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i10;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/notification/notification_routes.dart' as _i22;
import '../presentation/notification/state/notification_bloc.dart' as _i120;
import '../presentation/otp_verify/email_otp_verify.dart' as _i92;
import '../presentation/profile/state/user_profile_bloc.dart' as _i132;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i114;
import '../presentation/protector/protector_router.dart' as _i24;
import '../presentation/qr_code/qr_code_route.dart' as _i25;
import '../presentation/routes.dart' as _i26;
import '../presentation/settings/setting_routes.dart' as _i27;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i134;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i130;
import '../presentation/social/profile/profile_bloc.dart' as _i141;
import '../presentation/social/social_routes.dart' as _i29;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i30;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i139;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i112;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i122;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i123;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i71;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i128;
import 'modules/config_module.dart' as _i138;
import 'modules/data_source_module.dart' as _i137;

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
  final configModule = _$ConfigModule();
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
  gh.factory<_i9.FloatingGiftsProvider>(() => _i9.FloatingGiftsProvider());
  gh.factory<_i10.GeneralRoutes>(() => _i10.GeneralRoutes());
  gh.factory<_i11.GeneralRoutes>(() => _i11.GeneralRoutes());
  gh.factory<_i12.InfoProfileRoutes>(() => _i12.InfoProfileRoutes());
  gh.factory<_i13.LiveMessageBloc>(() => _i13.LiveMessageBloc());
  gh.factory<_i14.LiveRoutes>(() => _i14.LiveRoutes());
  gh.factory<_i15.LiveService>(() => _i16.LiveServiceImpl());
  gh.factory<_i17.LiveSocketService>(() => _i18.LiveSocketServiceImpl());
  gh.factory<_i19.MarkShopRoutes>(() => _i19.MarkShopRoutes());
  gh.lazySingleton<_i20.MediaPicker>(() => _i21.MediaPickerImpl());
  gh.factory<_i22.NotificationRoutes>(() => _i22.NotificationRoutes());
  gh.singleton<_i23.NotificationService>(
      _i23.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i24.ProtectorModule>(() => _i24.ProtectorModule());
  gh.factory<_i25.QrCodeRoutes>(() => _i25.QrCodeRoutes());
  gh.singleton<_i26.Routes>(_i26.Routes());
  gh.factory<_i27.SettingRoutes>(() => _i27.SettingRoutes());
  await gh.singletonAsync<_i28.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i29.SocialRoutes>(() => _i29.SocialRoutes());
  gh.factory<_i30.UpgradeAccountRoutes>(() => _i30.UpgradeAccountRoutes());
  gh.factory<_i31.UserSharePreferencesUsecase>(
      () => _i31.UserSharePreferencesUsecase(gh<_i28.SharedPreferences>()));
  gh.singleton<_i32.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i33.DashboardSharePreferenceUseCase>(
      () => _i33.DashboardSharePreferenceUseCase(gh<_i28.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i28.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i34.GiftSharePreferencesUseCase>(
      () => _i34.GiftSharePreferencesUseCase(gh<_i28.SharedPreferences>()));
  gh.factory<_i35.InformationPDoneSharePreferencesUsecase>(() =>
      _i35.InformationPDoneSharePreferencesUsecase(
          gh<_i28.SharedPreferences>()));
  gh.factory<_i36.InformationPdoneProfileCubit>(() =>
      _i36.InformationPdoneProfileCubit(
          gh<_i35.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i37.LiveApi>(() => _i37.LiveApi(gh<_i3.Dio>()));
  gh.factory<_i38.LiveRepository>(
      () => _i39.LiveRepositoryImpl(gh<_i37.LiveApi>()));
  gh.factory<_i40.LiveUseCase>(
      () => _i40.LiveUseCase(gh<_i38.LiveRepository>()));
  gh.factory<_i41.MarshopAPI>(() => _i41.MarshopAPI(gh<_i42.Dio>()));
  gh.factory<_i43.MarshopRepository>(
      () => _i44.MarshopRepositoryImpl(gh<_i41.MarshopAPI>()));
  gh.factory<_i45.MarshopUsecase>(
      () => _i45.MarshopUsecase(gh<_i43.MarshopRepository>()));
  gh.factory<_i46.NotificationAPI>(() => _i46.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i47.NotificationRepository>(
      () => _i48.NotificationRepositoryImpl(gh<_i46.NotificationAPI>()));
  gh.factory<_i49.NotificationUsecase>(
      () => _i49.NotificationUsecase(gh<_i47.NotificationRepository>()));
  gh.lazySingleton<_i50.OpenWeatherApi>(
      () => _i50.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i51.OpenWeatherRepository>(
      () => _i52.OpenWeatherRepositoryImpl(gh<_i50.OpenWeatherApi>()));
  gh.factory<_i53.OpenWeatherUseCase>(
      () => _i53.OpenWeatherUseCase(gh<_i51.OpenWeatherRepository>()));
  gh.factory<_i54.PlaceInformationAPI>(
      () => _i54.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i55.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i28.SharedPreferences>(),
        gh<_i55.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i56.PlaceInformationRepository>(() =>
      _i57.PlaceInformationRepositoryImpl(gh<_i54.PlaceInformationAPI>()));
  gh.factory<_i58.PlaceInformationUsecase>(() =>
      _i58.PlaceInformationUsecase(gh<_i56.PlaceInformationRepository>()));
  gh.lazySingleton<_i59.ProtectorAPI>(() => _i59.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i60.ProtectorRepository>(
      () => _i61.ProtectorRepositoryImpl(gh<_i59.ProtectorAPI>()));
  gh.factory<_i62.ProtectorUseCase>(
      () => _i62.ProtectorUseCase(gh<_i60.ProtectorRepository>()));
  gh.factory<_i63.ResourceApi>(() => _i63.ResourceApi(gh<_i42.Dio>()));
  gh.factory<_i64.ResourceRepository>(
      () => _i65.ResourceRepositoryImpl(gh<_i63.ResourceApi>()));
  gh.factory<_i66.ResourceUsecase>(
      () => _i66.ResourceUsecase(gh<_i64.ResourceRepository>()));
  gh.factory<_i67.UpgradeAccountApi>(
      () => _i67.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i68.UpgradeAccountRepository>(
      () => _i69.UpgradeAccountRepositoryImpl(
            gh<_i67.UpgradeAccountApi>(),
            gh<_i63.ResourceApi>(),
          ));
  gh.factory<_i70.UpgradeAccountUsecase>(
      () => _i70.UpgradeAccountUsecase(gh<_i68.UpgradeAccountRepository>()));
  gh.factory<_i71.UpgradeCubit>(
      () => _i71.UpgradeCubit(gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<_i72.UserApi>(() => _i72.UserApi(gh<_i3.Dio>()));
  gh.factory<_i73.UserRepository>(
      () => _i74.AuthRepositoryImpl(gh<_i72.UserApi>()));
  gh.factory<_i75.UserUsecase>(
      () => _i75.UserUsecase(gh<_i73.UserRepository>()));
  gh.factory<_i76.AddMemberChangeNotifier>(
      () => _i76.AddMemberChangeNotifier(gh<_i75.UserUsecase>()));
  gh.factory<_i77.AuthApi>(() => _i77.AuthApi(gh<_i42.Dio>()));
  gh.factory<_i78.AuthRepository>(
      () => _i79.AuthRepositoryImpl(gh<_i77.AuthApi>()));
  gh.factory<_i80.AuthenticationUsecase>(() => _i80.AuthenticationUsecase(
        gh<_i78.AuthRepository>(),
        gh<_i31.UserSharePreferencesUsecase>(),
        gh<_i73.UserRepository>(),
        gh<_i23.NotificationService>(),
        gh<_i49.NotificationUsecase>(),
      ));
  gh.factory<_i81.CategoryController>(
      () => _i81.CategoryController(gh<_i38.LiveRepository>()));
  gh.factory<_i82.ChangePasswordController>(
      () => _i82.ChangePasswordController(gh<_i80.AuthenticationUsecase>()));
  gh.factory<_i83.CommunityApi>(() => _i83.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i84.CommunityRepository>(
      () => _i85.CommunityRepositoryImpl(gh<_i83.CommunityApi>()));
  gh.factory<_i86.CommunityUsecase>(() => _i86.CommunityUsecase(
        gh<_i84.CommunityRepository>(),
        gh<_i66.ResourceUsecase>(),
      ));
  gh.factory<_i87.DashBoardBgController>(() =>
      _i87.DashBoardBgController(gh<_i33.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i88.DashBoardScreenController>(() =>
      _i88.DashBoardScreenController(
          gh<_i33.DashboardSharePreferenceUseCase>()));
  gh.factory<_i89.DashboardCommunityBloc>(() =>
      _i89.DashboardCommunityBloc(gh<_i33.DashboardSharePreferenceUseCase>()));
  gh.factory<_i89.DashboardEcommerceBloc>(() =>
      _i89.DashboardEcommerceBloc(gh<_i33.DashboardSharePreferenceUseCase>()));
  gh.factory<_i89.DashboardPersonalBloc>(() =>
      _i89.DashboardPersonalBloc(gh<_i33.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i90.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i90.EditCommunityDetailBloc(
        gh<_i86.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i91.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i91.EditFanGroupBloc(
        gh<_i86.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i92.EmailVerifyController>(
      () => _i92.EmailVerifyController(gh<_i75.UserUsecase>()));
  gh.factory<_i93.FanGroupDetailBloc>(
      () => _i93.FanGroupDetailBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<_i94.GetDetailBloc<_i95.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<_i94.GetDetailBloc<_i96.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<_i94.GetDetailBloc<_i97.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<_i94.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<_i94.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i75.UserUsecase>()));
  gh.factory<
          _i94.GetDetailBlocParam1<_i98.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<
      _i94.GetDetailBlocParam1<_i99.ConfirmRegisterJAResponse,
          _i100.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<_i94.GetDetailBlocParam1<dynamic, _i101.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<
      _i94.GetDetailBlocParam1<_i97.UpgradeAccountResponse,
          _i102.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<
          _i94
          .GetDetailBlocParam1<_i103.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<
      _i94.GetDetailBlocParam1<_i96.BankAccount,
          _i104.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<
      _i94.GetDetailBlocParam2<_i105.ConfirmResponse, String,
          _i106.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<
      _i94.GetDetailBlocParam2<_i105.ConfirmResponse, String,
          _i107.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<_i94.GetListBloc<_i108.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<_i94.GetListBloc<_i109.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<_i94.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i86.CommunityUsecase>()));
  gh.factory<_i94.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<_i94.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<_i110.GiftController>(
      () => _i110.GiftController(gh<_i40.LiveUseCase>()));
  gh.factory<_i111.GroupDetailBloc>(
      () => _i111.GroupDetailBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<_i112.GuardianPDoneBloc>(
      () => _i112.GuardianPDoneBloc(gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<_i113.InformationUpdateProfilBloc>(
      () => _i113.InformationUpdateProfilBloc(
            gh<_i75.UserUsecase>(),
            gh<_i35.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i114.ListProtectorRequestController>(
      () => _i114.ListProtectorRequestController(gh<_i62.ProtectorUseCase>()));
  gh.factory<_i115.LiveBottomController>(
      () => _i115.LiveBottomController(gh<_i40.LiveUseCase>()));
  gh.factory<_i116.LiveChannelController>(() => _i116.LiveChannelController(
        gh<_i38.LiveRepository>(),
        gh<_i31.UserSharePreferencesUsecase>(),
        gh<_i75.UserUsecase>(),
        gh<_i15.LiveService>(),
        gh<_i17.LiveSocketService>(),
        gh<_i9.FloatingGiftsProvider>(),
      ));
  gh.factory<_i117.LiveController>(
      () => _i117.LiveController(gh<_i40.LiveUseCase>()));
  gh.factory<_i118.LiveCreateController>(() => _i118.LiveCreateController(
        gh<_i38.LiveRepository>(),
        gh<_i15.LiveService>(),
      ));
  gh.factory<_i114.ManageProtectController>(
      () => _i114.ManageProtectController(gh<_i62.ProtectorUseCase>()));
  gh.factory<_i119.MarshopCubit>(
      () => _i119.MarshopCubit(gh<_i45.MarshopUsecase>()));
  gh.factory<_i120.NotificationBloc>(
      () => _i120.NotificationBloc(gh<_i49.NotificationUsecase>()));
  gh.factory<_i121.OpenWeatherBloc>(
      () => _i121.OpenWeatherBloc(gh<_i53.OpenWeatherUseCase>()));
  gh.factory<_i122.PDoneInformationBloc>(
      () => _i122.PDoneInformationBloc(gh<_i70.UpgradeAccountUsecase>()));
  gh.factory<_i123.PlaceInformationBloc>(
      () => _i123.PlaceInformationBloc(gh<_i58.PlaceInformationUsecase>()));
  gh.factory<_i124.PlaceInformationBloc2>(
      () => _i124.PlaceInformationBloc2(gh<_i58.PlaceInformationUsecase>()));
  gh.factory<_i125.SearchCubit>(
      () => _i125.SearchCubit(gh<_i75.UserUsecase>()));
  gh.factory<_i126.TeamDetailBloc>(
      () => _i126.TeamDetailBloc(gh<_i86.CommunityUsecase>()));
  gh.factory<_i127.TeamRequestCubit>(
      () => _i127.TeamRequestCubit(gh<_i86.CommunityUsecase>()));
  gh.factory<_i128.UpgradePDoneBloc>(() => _i128.UpgradePDoneBloc(
        gh<_i70.UpgradeAccountUsecase>(),
        gh<_i75.UserUsecase>(),
        gh<_i31.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i129.UserActionCubit>(
      () => _i129.UserActionCubit(gh<_i75.UserUsecase>()));
  gh.factory<_i130.UserBloc>(() => _i130.UserBloc(
        gh<_i80.AuthenticationUsecase>(),
        gh<_i31.UserSharePreferencesUsecase>(),
        gh<_i75.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i131.UserCubit>(() => _i131.UserCubit(
        gh<_i80.AuthenticationUsecase>(),
        gh<_i31.UserSharePreferencesUsecase>(),
        gh<_i75.UserUsecase>(),
      ));
  gh.factory<_i132.UserProfileBloc>(() => _i132.UserProfileBloc(
        gh<_i75.UserUsecase>(),
        gh<_i62.ProtectorUseCase>(),
        gh<_i20.MediaPicker>(),
        gh<_i70.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i133.AppCubit>(() => _i133.AppCubit(
        gh<_i66.ResourceUsecase>(),
        gh<_i31.UserSharePreferencesUsecase>(),
        gh<_i80.AuthenticationUsecase>(),
      ));
  gh.singleton<_i134.AppSettingBloc>(
      _i134.AppSettingBloc(gh<_i80.AuthenticationUsecase>()));
  gh.factory<_i135.AuthCubit>(
      () => _i135.AuthCubit(gh<_i80.AuthenticationUsecase>()));
  await _i136.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i137.DataSourceModule {}

class _$ConfigModule extends _i138.ConfigModule {}

class _$PlaceModule extends _i55.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i139.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i140.CommunityModule {}

class _$DiaryBlocFactory extends _i141.DiaryBlocFactory {}

class _$DashBoardModule extends _i142.DashBoardModule {}
