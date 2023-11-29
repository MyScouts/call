// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i28;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i89;
import 'package:shared_preferences/shared_preferences.dart' as _i21;
import 'package:wallet/core/core.dart' as _i25;
import 'package:wallet/di/wallet_micro.module.dart' as _i126;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i123;
import '../blocs/auth/auth_cubit.dart' as _i125;
import '../blocs/community/team_request/team_request_cubit.dart' as _i117;
import '../blocs/marshop/marshop_cubit.dart' as _i109;
import '../blocs/user/user_cubit.dart' as _i121;
import '../blocs/user_action/user_action_cubit.dart' as _i119;
import '../core/services/notifications/notification_service.dart' as _i16;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i31;
import '../data/data_sources/remote/auth_api.dart' as _i68;
import '../data/data_sources/remote/chat_api.dart' as _i73;
import '../data/data_sources/remote/community_api.dart' as _i77;
import '../data/data_sources/remote/friend_api.dart' as _i27;
import '../data/data_sources/remote/marshop_api.dart' as _i33;
import '../data/data_sources/remote/notification_api.dart' as _i37;
import '../data/data_sources/remote/open_weather_api.dart' as _i41;
import '../data/data_sources/remote/place_information_api.dart' as _i45;
import '../data/data_sources/remote/place_information_provider.dart' as _i46;
import '../data/data_sources/remote/protector_api.dart' as _i50;
import '../data/data_sources/remote/resource_api.dart' as _i54;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i58;
import '../data/data_sources/remote/user_api.dart' as _i63;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i101;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i95;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i96;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i98;
import '../data/models/responses/boss_community_status_response.dart' as _i93;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i97;
import '../data/models/responses/confirm_register_ja_response.dart' as _i94;
import '../data/models/responses/confirm_response.dart' as _i100;
import '../data/models/responses/group_request_response.dart' as _i104;
import '../data/models/responses/ja_status_response.dart' as _i91;
import '../data/models/responses/upgrade_account_response.dart' as _i90;
import '../data/repositories/auth_repository.dart' as _i69;
import '../data/repositories/impl/auth_repository_impl.dart' as _i70;
import '../data/repositories/impl/chat_repository_impl.dart' as _i75;
import '../data/repositories/impl/community_repository.impl.dart' as _i79;
import '../data/repositories/impl/friend_repository_impl.dart' as _i30;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i35;
import '../data/repositories/impl/media_picker_impl.dart' as _i14;
import '../data/repositories/impl/notification_repository.impl.dart' as _i39;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i43;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i48;
import '../data/repositories/impl/protector_repository_impl.dart' as _i52;
import '../data/repositories/impl/resource_repository.impl.dart' as _i56;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i60;
import '../data/repositories/impl/user_repository_impl.dart' as _i65;
import '../data/repositories/marshop_repository.dart' as _i34;
import '../data/repositories/media_picker.dart' as _i13;
import '../data/repositories/notification_repository.dart' as _i38;
import '../data/repositories/protector_repository.dart' as _i51;
import '../data/repositories/user_repository.dart' as _i64;
import '../domain/entities/bank.dart' as _i103;
import '../domain/entities/commity_action_type.dart' as _i99;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i92;
import '../domain/repository/chat_repository.dart' as _i74;
import '../domain/repository/community_repository.dart' as _i78;
import '../domain/repository/friend_repository.dart' as _i29;
import '../domain/repository/open_weather_repository.dart' as _i42;
import '../domain/repository/place_information_repository.dart' as _i47;
import '../domain/repository/resource_repository.dart' as _i55;
import '../domain/repository/upgrade_account_repository.dart' as _i59;
import '../domain/usecases/authentication_usecase.dart' as _i71;
import '../domain/usecases/chat_usecase.dart' as _i76;
import '../domain/usecases/community_usecase.dart' as _i80;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i26;
import '../domain/usecases/marshop_usecase.dart' as _i36;
import '../domain/usecases/notification_usecase.dart' as _i40;
import '../domain/usecases/open_weather_usecase.dart' as _i44;
import '../domain/usecases/place_information_usecase.dart' as _i49;
import '../domain/usecases/protector_usecase.dart' as _i53;
import '../domain/usecases/resource_usecase.dart' as _i57;
import '../domain/usecases/upgrade_account_usecase.dart' as _i61;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i24;
import '../domain/usecases/user_usecase.dart' as _i66;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i81;
import '../presentation/community/community_constants.dart' as _i102;
import '../presentation/community/community_module.dart' as _i130;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i85;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i86;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i88;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i105;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i116;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i67;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i83;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i84;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i111;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i82;
import '../presentation/dashboard/dashboard_module.dart' as _i132;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i115;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i72;
import '../presentation/general_setting/general_routes.dart' as _i10;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i107;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i32;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i114;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i11;
import '../presentation/marshop/marshop_routes.dart' as _i12;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i9;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/notification/notification_routes.dart' as _i15;
import '../presentation/notification/state/notification_bloc.dart' as _i110;
import '../presentation/otp_verify/email_otp_verify.dart' as _i87;
import '../presentation/profile/state/user_profile_bloc.dart' as _i122;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i108;
import '../presentation/protector/protector_router.dart' as _i17;
import '../presentation/qr_code/qr_code_route.dart' as _i18;
import '../presentation/routes.dart' as _i19;
import '../presentation/settings/setting_routes.dart' as _i20;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i124;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i120;
import '../presentation/social/profile/profile_bloc.dart' as _i131;
import '../presentation/social/social_routes.dart' as _i22;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i23;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i129;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i106;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i112;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i113;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i62;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i118;
import 'modules/config_module.dart' as _i128;
import 'modules/data_source_module.dart' as _i127;

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
  gh.factory<_i12.MarkShopRoutes>(() => _i12.MarkShopRoutes());
  gh.lazySingleton<_i13.MediaPicker>(() => _i14.MediaPickerImpl());
  gh.factory<_i15.NotificationRoutes>(() => _i15.NotificationRoutes());
  gh.singleton<_i16.NotificationService>(
      _i16.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i17.ProtectorModule>(() => _i17.ProtectorModule());
  gh.factory<_i18.QrCodeRoutes>(() => _i18.QrCodeRoutes());
  gh.singleton<_i19.Routes>(_i19.Routes());
  gh.factory<_i20.SettingRoutes>(() => _i20.SettingRoutes());
  await gh.singletonAsync<_i21.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i22.SocialRoutes>(() => _i22.SocialRoutes());
  gh.factory<_i23.UpgradeAccountRoutes>(() => _i23.UpgradeAccountRoutes());
  gh.factory<_i24.UserSharePreferencesUsecase>(
      () => _i24.UserSharePreferencesUsecase(gh<_i21.SharedPreferences>()));
  gh.singleton<_i25.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i26.DashboardSharePreferenceUseCase>(
      () => _i26.DashboardSharePreferenceUseCase(gh<_i21.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i21.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i27.FriendApi>(() => _i27.FriendApi(gh<_i28.Dio>()));
  gh.factory<_i29.FriendRepository>(
      () => _i30.FriendRepositoryImpl(gh<_i27.FriendApi>()));
  gh.factory<_i31.InformationPDoneSharePreferencesUsecase>(() =>
      _i31.InformationPDoneSharePreferencesUsecase(
          gh<_i21.SharedPreferences>()));
  gh.factory<_i32.InformationPdoneProfileCubit>(() =>
      _i32.InformationPdoneProfileCubit(
          gh<_i31.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i33.MarshopAPI>(() => _i33.MarshopAPI(gh<_i28.Dio>()));
  gh.factory<_i34.MarshopRepository>(
      () => _i35.MarshopRepositoryImpl(gh<_i33.MarshopAPI>()));
  gh.factory<_i36.MarshopUsecase>(
      () => _i36.MarshopUsecase(gh<_i34.MarshopRepository>()));
  gh.factory<_i37.NotificationAPI>(() => _i37.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i38.NotificationRepository>(
      () => _i39.NotificationRepositoryImpl(gh<_i37.NotificationAPI>()));
  gh.factory<_i40.NotificationUsecase>(
      () => _i40.NotificationUsecase(gh<_i38.NotificationRepository>()));
  gh.lazySingleton<_i41.OpenWeatherApi>(
      () => _i41.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i42.OpenWeatherRepository>(
      () => _i43.OpenWeatherRepositoryImpl(gh<_i41.OpenWeatherApi>()));
  gh.factory<_i44.OpenWeatherUseCase>(
      () => _i44.OpenWeatherUseCase(gh<_i42.OpenWeatherRepository>()));
  gh.factory<_i45.PlaceInformationAPI>(
      () => _i45.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i46.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i21.SharedPreferences>(),
        gh<_i46.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i47.PlaceInformationRepository>(() =>
      _i48.PlaceInformationRepositoryImpl(gh<_i45.PlaceInformationAPI>()));
  gh.factory<_i49.PlaceInformationUsecase>(() =>
      _i49.PlaceInformationUsecase(gh<_i47.PlaceInformationRepository>()));
  gh.lazySingleton<_i50.ProtectorAPI>(() => _i50.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i51.ProtectorRepository>(
      () => _i52.ProtectorRepositoryImpl(gh<_i50.ProtectorAPI>()));
  gh.factory<_i53.ProtectorUseCase>(
      () => _i53.ProtectorUseCase(gh<_i51.ProtectorRepository>()));
  gh.factory<_i54.ResourceApi>(() => _i54.ResourceApi(gh<_i28.Dio>()));
  gh.factory<_i55.ResourceRepository>(
      () => _i56.ResourceRepositoryImpl(gh<_i54.ResourceApi>()));
  gh.factory<_i57.ResourceUsecase>(
      () => _i57.ResourceUsecase(gh<_i55.ResourceRepository>()));
  gh.factory<_i58.UpgradeAccountApi>(
      () => _i58.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i59.UpgradeAccountRepository>(
      () => _i60.UpgradeAccountRepositoryImpl(
            gh<_i58.UpgradeAccountApi>(),
            gh<_i54.ResourceApi>(),
          ));
  gh.factory<_i61.UpgradeAccountUsecase>(
      () => _i61.UpgradeAccountUsecase(gh<_i59.UpgradeAccountRepository>()));
  gh.factory<_i62.UpgradeCubit>(
      () => _i62.UpgradeCubit(gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<_i63.UserApi>(() => _i63.UserApi(gh<_i3.Dio>()));
  gh.factory<_i64.UserRepository>(
      () => _i65.AuthRepositoryImpl(gh<_i63.UserApi>()));
  gh.factory<_i66.UserUsecase>(
      () => _i66.UserUsecase(gh<_i64.UserRepository>()));
  gh.factory<_i67.AddMemberChangeNotifier>(
      () => _i67.AddMemberChangeNotifier(gh<_i66.UserUsecase>()));
  gh.factory<_i68.AuthApi>(() => _i68.AuthApi(gh<_i28.Dio>()));
  gh.factory<_i69.AuthRepository>(
      () => _i70.AuthRepositoryImpl(gh<_i68.AuthApi>()));
  gh.factory<_i71.AuthenticationUsecase>(() => _i71.AuthenticationUsecase(
        gh<_i69.AuthRepository>(),
        gh<_i24.UserSharePreferencesUsecase>(),
        gh<_i64.UserRepository>(),
        gh<_i16.NotificationService>(),
        gh<_i40.NotificationUsecase>(),
      ));
  gh.factory<_i72.ChangePasswordController>(
      () => _i72.ChangePasswordController(gh<_i71.AuthenticationUsecase>()));
  gh.factory<_i73.ChatApi>(() => _i73.ChatApi(gh<_i28.Dio>()));
  gh.factory<_i74.ChatRepository>(
      () => _i75.ChatRepositoryImpl(gh<_i73.ChatApi>()));
  gh.factory<_i76.ChatUseCase>(() => _i76.ChatUseCase(
        gh<_i74.ChatRepository>(),
        gh<_i29.FriendRepository>(),
      ));
  gh.factory<_i77.CommunityApi>(() => _i77.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i78.CommunityRepository>(
      () => _i79.CommunityRepositoryImpl(gh<_i77.CommunityApi>()));
  gh.factory<_i80.CommunityUsecase>(() => _i80.CommunityUsecase(
        gh<_i78.CommunityRepository>(),
        gh<_i57.ResourceUsecase>(),
      ));
  gh.factory<_i81.ConversationCubit>(
      () => _i81.ConversationCubit(gh<_i76.ChatUseCase>()));
  gh.factory<_i82.DashBoardBgController>(() =>
      _i82.DashBoardBgController(gh<_i26.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i83.DashBoardScreenController>(() =>
      _i83.DashBoardScreenController(
          gh<_i26.DashboardSharePreferenceUseCase>()));
  gh.factory<_i84.DashboardCommunityBloc>(() =>
      _i84.DashboardCommunityBloc(gh<_i26.DashboardSharePreferenceUseCase>()));
  gh.factory<_i84.DashboardEcommerceBloc>(() =>
      _i84.DashboardEcommerceBloc(gh<_i26.DashboardSharePreferenceUseCase>()));
  gh.factory<_i84.DashboardPersonalBloc>(() =>
      _i84.DashboardPersonalBloc(gh<_i26.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i85.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i85.EditCommunityDetailBloc(
        gh<_i80.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i86.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i86.EditFanGroupBloc(
        gh<_i80.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i87.EmailVerifyController>(
      () => _i87.EmailVerifyController(gh<_i66.UserUsecase>()));
  gh.factory<_i88.FanGroupDetailBloc>(
      () => _i88.FanGroupDetailBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<_i89.GetDetailBloc<_i90.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<_i89.GetDetailBloc<_i91.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<_i89.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<_i89.GetDetailBloc<_i92.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<
          _i89.GetDetailBlocParam1<_i93.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<
      _i89.GetDetailBlocParam1<_i94.ConfirmRegisterJAResponse,
          _i95.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<
      _i89.GetDetailBlocParam1<_i92.BankAccount,
          _i96.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<
          _i89
          .GetDetailBlocParam1<_i97.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<_i89.GetDetailBlocParam1<dynamic, _i98.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<_i89.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i66.UserUsecase>()));
  gh.factory<
      _i89.GetDetailBlocParam1<_i90.UpgradeAccountResponse,
          _i99.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<
      _i89.GetDetailBlocParam2<_i100.ConfirmResponse, String,
          _i101.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<
      _i89.GetDetailBlocParam2<_i100.ConfirmResponse, String,
          _i102.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<_i89.GetListBloc<_i103.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<_i89.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<_i89.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i80.CommunityUsecase>()));
  gh.factory<_i89.GetListBloc<_i104.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<_i89.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<_i105.GroupDetailBloc>(
      () => _i105.GroupDetailBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<_i106.GuardianPDoneBloc>(
      () => _i106.GuardianPDoneBloc(gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<_i107.InformationUpdateProfilBloc>(
      () => _i107.InformationUpdateProfilBloc(
            gh<_i66.UserUsecase>(),
            gh<_i31.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i108.ListProtectorRequestController>(
      () => _i108.ListProtectorRequestController(gh<_i53.ProtectorUseCase>()));
  gh.factory<_i108.ManageProtectController>(
      () => _i108.ManageProtectController(gh<_i53.ProtectorUseCase>()));
  gh.factory<_i109.MarshopCubit>(
      () => _i109.MarshopCubit(gh<_i36.MarshopUsecase>()));
  gh.factory<_i110.NotificationBloc>(
      () => _i110.NotificationBloc(gh<_i40.NotificationUsecase>()));
  gh.factory<_i111.OpenWeatherBloc>(
      () => _i111.OpenWeatherBloc(gh<_i44.OpenWeatherUseCase>()));
  gh.factory<_i112.PDoneInformationBloc>(
      () => _i112.PDoneInformationBloc(gh<_i61.UpgradeAccountUsecase>()));
  gh.factory<_i113.PlaceInformationBloc>(
      () => _i113.PlaceInformationBloc(gh<_i49.PlaceInformationUsecase>()));
  gh.factory<_i114.PlaceInformationBloc2>(
      () => _i114.PlaceInformationBloc2(gh<_i49.PlaceInformationUsecase>()));
  gh.factory<_i115.SearchCubit>(
      () => _i115.SearchCubit(gh<_i66.UserUsecase>()));
  gh.factory<_i116.TeamDetailBloc>(
      () => _i116.TeamDetailBloc(gh<_i80.CommunityUsecase>()));
  gh.factory<_i117.TeamRequestCubit>(
      () => _i117.TeamRequestCubit(gh<_i80.CommunityUsecase>()));
  gh.factory<_i118.UpgradePDoneBloc>(() => _i118.UpgradePDoneBloc(
        gh<_i61.UpgradeAccountUsecase>(),
        gh<_i66.UserUsecase>(),
        gh<_i24.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i119.UserActionCubit>(
      () => _i119.UserActionCubit(gh<_i66.UserUsecase>()));
  gh.factory<_i120.UserBloc>(() => _i120.UserBloc(
        gh<_i71.AuthenticationUsecase>(),
        gh<_i24.UserSharePreferencesUsecase>(),
        gh<_i66.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i121.UserCubit>(() => _i121.UserCubit(
        gh<_i71.AuthenticationUsecase>(),
        gh<_i24.UserSharePreferencesUsecase>(),
        gh<_i66.UserUsecase>(),
      ));
  gh.factory<_i122.UserProfileBloc>(() => _i122.UserProfileBloc(
        gh<_i66.UserUsecase>(),
        gh<_i53.ProtectorUseCase>(),
        gh<_i13.MediaPicker>(),
        gh<_i61.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i123.AppCubit>(() => _i123.AppCubit(
        gh<_i57.ResourceUsecase>(),
        gh<_i24.UserSharePreferencesUsecase>(),
        gh<_i71.AuthenticationUsecase>(),
      ));
  gh.singleton<_i124.AppSettingBloc>(
      _i124.AppSettingBloc(gh<_i71.AuthenticationUsecase>()));
  gh.factory<_i125.AuthCubit>(
      () => _i125.AuthCubit(gh<_i71.AuthenticationUsecase>()));
  await _i126.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i127.DataSourceModule {}

class _$ConfigModule extends _i128.ConfigModule {}

class _$PlaceModule extends _i46.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i129.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i130.CommunityModule {}

class _$DiaryBlocFactory extends _i131.DiaryBlocFactory {}

class _$DashBoardModule extends _i132.DashBoardModule {}
