// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i39;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i91;
import 'package:shared_preferences/shared_preferences.dart' as _i26;
import 'package:wallet/core/core.dart' as _i30;
import 'package:wallet/di/wallet_micro.module.dart' as _i132;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i129;
import '../blocs/auth/auth_cubit.dart' as _i131;
import '../blocs/community/team_request/team_request_cubit.dart' as _i123;
import '../blocs/marshop/marshop_cubit.dart' as _i115;
import '../blocs/user/user_cubit.dart' as _i127;
import '../blocs/user_action/user_action_cubit.dart' as _i125;
import '../core/services/live_service/impl/live_service_impl.dart' as _i14;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i16;
import '../core/services/live_service/live_service.dart' as _i13;
import '../core/services/live_service/live_socket_service.dart' as _i15;
import '../core/services/notifications/notification_service.dart' as _i21;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i32;
import '../data/data_sources/remote/auth_api.dart' as _i74;
import '../data/data_sources/remote/community_api.dart' as _i80;
import '../data/data_sources/remote/marshop_api.dart' as _i38;
import '../data/data_sources/remote/notification_api.dart' as _i43;
import '../data/data_sources/remote/open_weather_api.dart' as _i47;
import '../data/data_sources/remote/place_information_api.dart' as _i51;
import '../data/data_sources/remote/place_information_provider.dart' as _i52;
import '../data/data_sources/remote/protector_api.dart' as _i56;
import '../data/data_sources/remote/resource_api.dart' as _i60;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i64;
import '../data/data_sources/remote/user_api.dart' as _i69;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i103;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i100;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i98;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i97;
import '../data/models/responses/boss_community_status_response.dart' as _i95;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i101;
import '../data/models/responses/confirm_register_ja_response.dart' as _i99;
import '../data/models/responses/confirm_response.dart' as _i102;
import '../data/models/responses/group_request_response.dart' as _i106;
import '../data/models/responses/ja_status_response.dart' as _i93;
import '../data/models/responses/upgrade_account_response.dart' as _i94;
import '../data/repositories/auth_repository.dart' as _i75;
import '../data/repositories/impl/auth_repository_impl.dart' as _i76;
import '../data/repositories/impl/community_repository.impl.dart' as _i82;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i41;
import '../data/repositories/impl/media_picker_impl.dart' as _i19;
import '../data/repositories/impl/notification_repository.impl.dart' as _i45;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i49;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i54;
import '../data/repositories/impl/protector_repository_impl.dart' as _i58;
import '../data/repositories/impl/resource_repository.impl.dart' as _i62;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i66;
import '../data/repositories/impl/user_repository_impl.dart' as _i71;
import '../data/repositories/marshop_repository.dart' as _i40;
import '../data/repositories/media_picker.dart' as _i18;
import '../data/repositories/notification_repository.dart' as _i44;
import '../data/repositories/protector_repository.dart' as _i57;
import '../data/repositories/user_repository.dart' as _i70;
import '../domain/entities/bank.dart' as _i105;
import '../domain/entities/commity_action_type.dart' as _i96;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i92;
import '../domain/repository/community_repository.dart' as _i81;
import '../domain/repository/open_weather_repository.dart' as _i48;
import '../domain/repository/place_information_repository.dart' as _i53;
import '../domain/repository/resource_repository.dart' as _i61;
import '../domain/repository/upgrade_account_repository.dart' as _i65;
import '../domain/usecases/authentication_usecase.dart' as _i77;
import '../domain/usecases/community_usecase.dart' as _i83;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i31;
import '../domain/usecases/marshop_usecase.dart' as _i42;
import '../domain/usecases/notification_usecase.dart' as _i46;
import '../domain/usecases/open_weather_usecase.dart' as _i50;
import '../domain/usecases/place_information_usecase.dart' as _i55;
import '../domain/usecases/protector_usecase.dart' as _i59;
import '../domain/usecases/resource_usecase.dart' as _i63;
import '../domain/usecases/upgrade_account_usecase.dart' as _i67;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i29;
import '../domain/usecases/user_usecase.dart' as _i72;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_constants.dart' as _i104;
import '../presentation/community/community_module.dart' as _i136;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i87;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i88;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i90;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i108;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i122;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i73;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i85;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i86;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i117;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i84;
import '../presentation/dashboard/dashboard_module.dart' as _i138;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i121;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i79;
import '../presentation/general_setting/general_routes.dart' as _i9;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i110;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i33;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i120;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i11;
import '../presentation/live/data/data_sources/remote/live_api.dart' as _i34;
import '../presentation/live/data/repository/live_repository.dart' as _i35;
import '../presentation/live/data/repository/repository_impl/live_repository_impl.dart'
    as _i36;
import '../presentation/live/domain/usecases/live_usecases.dart' as _i37;
import '../presentation/live/live_routes.dart' as _i12;
import '../presentation/live/presentation/channel/state/live_channel_controller.dart'
    as _i112;
import '../presentation/live/presentation/create/state/live_create_controller.dart'
    as _i114;
import '../presentation/live/presentation/create/widget/live_category_picker.dart'
    as _i78;
import '../presentation/live/presentation/list_gift/gift_controller.dart'
    as _i107;
import '../presentation/live/presentation/live_tab/live_controller.dart'
    as _i113;
import '../presentation/marshop/marshop_routes.dart' as _i17;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i10;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/notification/notification_routes.dart' as _i20;
import '../presentation/notification/state/notification_bloc.dart' as _i116;
import '../presentation/otp_verify/email_otp_verify.dart' as _i89;
import '../presentation/profile/state/user_profile_bloc.dart' as _i128;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i111;
import '../presentation/protector/protector_router.dart' as _i22;
import '../presentation/qr_code/qr_code_route.dart' as _i23;
import '../presentation/routes.dart' as _i24;
import '../presentation/settings/setting_routes.dart' as _i25;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i130;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i126;
import '../presentation/social/profile/profile_bloc.dart' as _i137;
import '../presentation/social/social_routes.dart' as _i27;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i28;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i135;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i109;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i118;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i119;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i68;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i124;
import 'modules/config_module.dart' as _i134;
import 'modules/data_source_module.dart' as _i133;

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
  gh.singleton<_i30.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i31.DashboardSharePreferenceUseCase>(
      () => _i31.DashboardSharePreferenceUseCase(gh<_i26.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i26.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i32.InformationPDoneSharePreferencesUsecase>(() =>
      _i32.InformationPDoneSharePreferencesUsecase(
          gh<_i26.SharedPreferences>()));
  gh.factory<_i33.InformationPdoneProfileCubit>(() =>
      _i33.InformationPdoneProfileCubit(
          gh<_i32.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i34.LiveApi>(() => _i34.LiveApi(gh<_i3.Dio>()));
  gh.factory<_i35.LiveRepository>(
      () => _i36.LiveRepositoryImpl(gh<_i34.LiveApi>()));
  gh.factory<_i37.LiveUseCase>(
      () => _i37.LiveUseCase(gh<_i35.LiveRepository>()));
  gh.factory<_i38.MarshopAPI>(() => _i38.MarshopAPI(gh<_i39.Dio>()));
  gh.factory<_i40.MarshopRepository>(
      () => _i41.MarshopRepositoryImpl(gh<_i38.MarshopAPI>()));
  gh.factory<_i42.MarshopUsecase>(
      () => _i42.MarshopUsecase(gh<_i40.MarshopRepository>()));
  gh.factory<_i43.NotificationAPI>(() => _i43.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i44.NotificationRepository>(
      () => _i45.NotificationRepositoryImpl(gh<_i43.NotificationAPI>()));
  gh.factory<_i46.NotificationUsecase>(
      () => _i46.NotificationUsecase(gh<_i44.NotificationRepository>()));
  gh.lazySingleton<_i47.OpenWeatherApi>(
      () => _i47.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i48.OpenWeatherRepository>(
      () => _i49.OpenWeatherRepositoryImpl(gh<_i47.OpenWeatherApi>()));
  gh.factory<_i50.OpenWeatherUseCase>(
      () => _i50.OpenWeatherUseCase(gh<_i48.OpenWeatherRepository>()));
  gh.factory<_i51.PlaceInformationAPI>(
      () => _i51.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i52.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i26.SharedPreferences>(),
        gh<_i52.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i53.PlaceInformationRepository>(() =>
      _i54.PlaceInformationRepositoryImpl(gh<_i51.PlaceInformationAPI>()));
  gh.factory<_i55.PlaceInformationUsecase>(() =>
      _i55.PlaceInformationUsecase(gh<_i53.PlaceInformationRepository>()));
  gh.lazySingleton<_i56.ProtectorAPI>(() => _i56.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i57.ProtectorRepository>(
      () => _i58.ProtectorRepositoryImpl(gh<_i56.ProtectorAPI>()));
  gh.factory<_i59.ProtectorUseCase>(
      () => _i59.ProtectorUseCase(gh<_i57.ProtectorRepository>()));
  gh.factory<_i60.ResourceApi>(() => _i60.ResourceApi(gh<_i39.Dio>()));
  gh.factory<_i61.ResourceRepository>(
      () => _i62.ResourceRepositoryImpl(gh<_i60.ResourceApi>()));
  gh.factory<_i63.ResourceUsecase>(
      () => _i63.ResourceUsecase(gh<_i61.ResourceRepository>()));
  gh.factory<_i64.UpgradeAccountApi>(
      () => _i64.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i65.UpgradeAccountRepository>(
      () => _i66.UpgradeAccountRepositoryImpl(
            gh<_i64.UpgradeAccountApi>(),
            gh<_i60.ResourceApi>(),
          ));
  gh.factory<_i67.UpgradeAccountUsecase>(
      () => _i67.UpgradeAccountUsecase(gh<_i65.UpgradeAccountRepository>()));
  gh.factory<_i68.UpgradeCubit>(
      () => _i68.UpgradeCubit(gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<_i69.UserApi>(() => _i69.UserApi(gh<_i3.Dio>()));
  gh.factory<_i70.UserRepository>(
      () => _i71.AuthRepositoryImpl(gh<_i69.UserApi>()));
  gh.factory<_i72.UserUsecase>(
      () => _i72.UserUsecase(gh<_i70.UserRepository>()));
  gh.factory<_i73.AddMemberChangeNotifier>(
      () => _i73.AddMemberChangeNotifier(gh<_i72.UserUsecase>()));
  gh.factory<_i74.AuthApi>(() => _i74.AuthApi(gh<_i39.Dio>()));
  gh.factory<_i75.AuthRepository>(
      () => _i76.AuthRepositoryImpl(gh<_i74.AuthApi>()));
  gh.factory<_i77.AuthenticationUsecase>(() => _i77.AuthenticationUsecase(
        gh<_i75.AuthRepository>(),
        gh<_i29.UserSharePreferencesUsecase>(),
        gh<_i70.UserRepository>(),
        gh<_i21.NotificationService>(),
        gh<_i46.NotificationUsecase>(),
      ));
  gh.factory<_i78.CategoryController>(
      () => _i78.CategoryController(gh<_i35.LiveRepository>()));
  gh.factory<_i79.ChangePasswordController>(
      () => _i79.ChangePasswordController(gh<_i77.AuthenticationUsecase>()));
  gh.factory<_i80.CommunityApi>(() => _i80.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i81.CommunityRepository>(
      () => _i82.CommunityRepositoryImpl(gh<_i80.CommunityApi>()));
  gh.factory<_i83.CommunityUsecase>(() => _i83.CommunityUsecase(
        gh<_i81.CommunityRepository>(),
        gh<_i63.ResourceUsecase>(),
      ));
  gh.factory<_i84.DashBoardBgController>(() =>
      _i84.DashBoardBgController(gh<_i31.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i85.DashBoardScreenController>(() =>
      _i85.DashBoardScreenController(
          gh<_i31.DashboardSharePreferenceUseCase>()));
  gh.factory<_i86.DashboardCommunityBloc>(() =>
      _i86.DashboardCommunityBloc(gh<_i31.DashboardSharePreferenceUseCase>()));
  gh.factory<_i86.DashboardEcommerceBloc>(() =>
      _i86.DashboardEcommerceBloc(gh<_i31.DashboardSharePreferenceUseCase>()));
  gh.factory<_i86.DashboardPersonalBloc>(() =>
      _i86.DashboardPersonalBloc(gh<_i31.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i87.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i87.EditCommunityDetailBloc(
        gh<_i83.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i88.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i88.EditFanGroupBloc(
        gh<_i83.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i89.EmailVerifyController>(
      () => _i89.EmailVerifyController(gh<_i72.UserUsecase>()));
  gh.factory<_i90.FanGroupDetailBloc>(
      () => _i90.FanGroupDetailBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<_i91.GetDetailBloc<_i92.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<_i91.GetDetailBloc<_i93.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<_i91.GetDetailBloc<_i94.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<_i91.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<
          _i91.GetDetailBlocParam1<_i95.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<
      _i91.GetDetailBlocParam1<_i94.UpgradeAccountResponse,
          _i96.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<_i91.GetDetailBlocParam1<dynamic, _i97.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<
      _i91.GetDetailBlocParam1<_i92.BankAccount,
          _i98.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<_i91.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i72.UserUsecase>()));
  gh.factory<
      _i91.GetDetailBlocParam1<_i99.ConfirmRegisterJAResponse,
          _i100.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<
          _i91
          .GetDetailBlocParam1<_i101.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<
      _i91.GetDetailBlocParam2<_i102.ConfirmResponse, String,
          _i103.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<
      _i91.GetDetailBlocParam2<_i102.ConfirmResponse, String,
          _i104.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<_i91.GetListBloc<_i105.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<_i91.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<_i91.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i83.CommunityUsecase>()));
  gh.factory<_i91.GetListBloc<_i106.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<_i91.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<_i107.GiftController>(
      () => _i107.GiftController(gh<_i37.LiveUseCase>()));
  gh.factory<_i108.GroupDetailBloc>(
      () => _i108.GroupDetailBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<_i109.GuardianPDoneBloc>(
      () => _i109.GuardianPDoneBloc(gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<_i110.InformationUpdateProfilBloc>(
      () => _i110.InformationUpdateProfilBloc(
            gh<_i72.UserUsecase>(),
            gh<_i32.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i111.ListProtectorRequestController>(
      () => _i111.ListProtectorRequestController(gh<_i59.ProtectorUseCase>()));
  gh.factory<_i112.LiveChannelController>(() => _i112.LiveChannelController(
        gh<_i35.LiveRepository>(),
        gh<_i29.UserSharePreferencesUsecase>(),
        gh<_i72.UserUsecase>(),
        gh<_i13.LiveService>(),
        gh<_i15.LiveSocketService>(),
      ));
  gh.factory<_i113.LiveController>(
      () => _i113.LiveController(gh<_i37.LiveUseCase>()));
  gh.factory<_i114.LiveCreateController>(() => _i114.LiveCreateController(
        gh<_i35.LiveRepository>(),
        gh<_i13.LiveService>(),
      ));
  gh.factory<_i111.ManageProtectController>(
      () => _i111.ManageProtectController(gh<_i59.ProtectorUseCase>()));
  gh.factory<_i115.MarshopCubit>(
      () => _i115.MarshopCubit(gh<_i42.MarshopUsecase>()));
  gh.factory<_i116.NotificationBloc>(
      () => _i116.NotificationBloc(gh<_i46.NotificationUsecase>()));
  gh.factory<_i117.OpenWeatherBloc>(
      () => _i117.OpenWeatherBloc(gh<_i50.OpenWeatherUseCase>()));
  gh.factory<_i118.PDoneInformationBloc>(
      () => _i118.PDoneInformationBloc(gh<_i67.UpgradeAccountUsecase>()));
  gh.factory<_i119.PlaceInformationBloc>(
      () => _i119.PlaceInformationBloc(gh<_i55.PlaceInformationUsecase>()));
  gh.factory<_i120.PlaceInformationBloc2>(
      () => _i120.PlaceInformationBloc2(gh<_i55.PlaceInformationUsecase>()));
  gh.factory<_i121.SearchCubit>(
      () => _i121.SearchCubit(gh<_i72.UserUsecase>()));
  gh.factory<_i122.TeamDetailBloc>(
      () => _i122.TeamDetailBloc(gh<_i83.CommunityUsecase>()));
  gh.factory<_i123.TeamRequestCubit>(
      () => _i123.TeamRequestCubit(gh<_i83.CommunityUsecase>()));
  gh.factory<_i124.UpgradePDoneBloc>(() => _i124.UpgradePDoneBloc(
        gh<_i67.UpgradeAccountUsecase>(),
        gh<_i72.UserUsecase>(),
        gh<_i29.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i125.UserActionCubit>(
      () => _i125.UserActionCubit(gh<_i72.UserUsecase>()));
  gh.factory<_i126.UserBloc>(() => _i126.UserBloc(
        gh<_i77.AuthenticationUsecase>(),
        gh<_i29.UserSharePreferencesUsecase>(),
        gh<_i72.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i127.UserCubit>(() => _i127.UserCubit(
        gh<_i77.AuthenticationUsecase>(),
        gh<_i29.UserSharePreferencesUsecase>(),
        gh<_i72.UserUsecase>(),
      ));
  gh.factory<_i128.UserProfileBloc>(() => _i128.UserProfileBloc(
        gh<_i72.UserUsecase>(),
        gh<_i59.ProtectorUseCase>(),
        gh<_i18.MediaPicker>(),
        gh<_i67.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i129.AppCubit>(() => _i129.AppCubit(
        gh<_i63.ResourceUsecase>(),
        gh<_i29.UserSharePreferencesUsecase>(),
        gh<_i77.AuthenticationUsecase>(),
      ));
  gh.singleton<_i130.AppSettingBloc>(
      _i130.AppSettingBloc(gh<_i77.AuthenticationUsecase>()));
  gh.factory<_i131.AuthCubit>(
      () => _i131.AuthCubit(gh<_i77.AuthenticationUsecase>()));
  await _i132.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i133.DataSourceModule {}

class _$ConfigModule extends _i134.ConfigModule {}

class _$PlaceModule extends _i52.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i135.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i136.CommunityModule {}

class _$DiaryBlocFactory extends _i137.DiaryBlocFactory {}

class _$DashBoardModule extends _i138.DashBoardModule {}
