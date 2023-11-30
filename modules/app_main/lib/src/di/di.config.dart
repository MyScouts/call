// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i29;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i90;
import 'package:shared_preferences/shared_preferences.dart' as _i22;
import 'package:wallet/core/core.dart' as _i26;
import 'package:wallet/di/wallet_micro.module.dart' as _i129;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i125;
import '../blocs/auth/auth_cubit.dart' as _i127;
import '../blocs/community/team_request/team_request_cubit.dart' as _i119;
import '../blocs/marshop/marshop_cubit.dart' as _i110;
import '../blocs/user/user_cubit.dart' as _i123;
import '../blocs/user_action/user_action_cubit.dart' as _i121;
import '../core/services/notifications/notification_service.dart' as _i17;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i32;
import '../data/data_sources/remote/auth_api.dart' as _i69;
import '../data/data_sources/remote/chat_api.dart' as _i74;
import '../data/data_sources/remote/community_api.dart' as _i78;
import '../data/data_sources/remote/friend_api.dart' as _i28;
import '../data/data_sources/remote/marshop_api.dart' as _i34;
import '../data/data_sources/remote/notification_api.dart' as _i38;
import '../data/data_sources/remote/open_weather_api.dart' as _i42;
import '../data/data_sources/remote/place_information_api.dart' as _i46;
import '../data/data_sources/remote/place_information_provider.dart' as _i47;
import '../data/data_sources/remote/protector_api.dart' as _i51;
import '../data/data_sources/remote/resource_api.dart' as _i55;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i59;
import '../data/data_sources/remote/user_api.dart' as _i64;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i103;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i96;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i99;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i97;
import '../data/models/responses/boss_community_status_response.dart' as _i94;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i98;
import '../data/models/responses/confirm_register_ja_response.dart' as _i95;
import '../data/models/responses/confirm_response.dart' as _i101;
import '../data/models/responses/group_request_response.dart' as _i104;
import '../data/models/responses/ja_status_response.dart' as _i91;
import '../data/models/responses/upgrade_account_response.dart' as _i93;
import '../data/repositories/auth_repository.dart' as _i70;
import '../data/repositories/impl/auth_repository_impl.dart' as _i71;
import '../data/repositories/impl/chat_repository_impl.dart' as _i76;
import '../data/repositories/impl/community_repository.impl.dart' as _i80;
import '../data/repositories/impl/friend_repository_impl.dart' as _i31;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i36;
import '../data/repositories/impl/media_picker_impl.dart' as _i15;
import '../data/repositories/impl/notification_repository.impl.dart' as _i40;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i44;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i49;
import '../data/repositories/impl/protector_repository_impl.dart' as _i53;
import '../data/repositories/impl/resource_repository.impl.dart' as _i57;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i61;
import '../data/repositories/impl/user_repository_impl.dart' as _i66;
import '../data/repositories/marshop_repository.dart' as _i35;
import '../data/repositories/media_picker.dart' as _i14;
import '../data/repositories/notification_repository.dart' as _i39;
import '../data/repositories/protector_repository.dart' as _i52;
import '../data/repositories/user_repository.dart' as _i65;
import '../domain/entities/bank.dart' as _i105;
import '../domain/entities/commity_action_type.dart' as _i100;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i92;
import '../domain/repository/chat_repository.dart' as _i75;
import '../domain/repository/community_repository.dart' as _i79;
import '../domain/repository/friend_repository.dart' as _i30;
import '../domain/repository/open_weather_repository.dart' as _i43;
import '../domain/repository/place_information_repository.dart' as _i48;
import '../domain/repository/resource_repository.dart' as _i56;
import '../domain/repository/upgrade_account_repository.dart' as _i60;
import '../domain/usecases/authentication_usecase.dart' as _i72;
import '../domain/usecases/chat_usecase.dart' as _i77;
import '../domain/usecases/community_usecase.dart' as _i81;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i27;
import '../domain/usecases/marshop_usecase.dart' as _i37;
import '../domain/usecases/notification_usecase.dart' as _i41;
import '../domain/usecases/open_weather_usecase.dart' as _i45;
import '../domain/usecases/place_information_usecase.dart' as _i50;
import '../domain/usecases/protector_usecase.dart' as _i54;
import '../domain/usecases/resource_usecase.dart' as _i58;
import '../domain/usecases/upgrade_account_usecase.dart' as _i62;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i25;
import '../domain/usecases/user_usecase.dart' as _i67;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i128;
import '../presentation/chat/chat_routes.dart' as _i6;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i82;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i111;
import '../presentation/community/community_constants.dart' as _i102;
import '../presentation/community/community_module.dart' as _i133;
import '../presentation/community/community_routes.dart' as _i7;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i86;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i87;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i89;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i106;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i118;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i68;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i84;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i85;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i113;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i83;
import '../presentation/dashboard/dashboard_module.dart' as _i135;
import '../presentation/dashboard/dashboard_routes.dart' as _i8;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i117;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i73;
import '../presentation/general_setting/general_routes.dart' as _i10;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i108;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i33;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i116;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i12;
import '../presentation/marshop/marshop_routes.dart' as _i13;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i11;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i9;
import '../presentation/notification/notification_routes.dart' as _i16;
import '../presentation/notification/state/notification_bloc.dart' as _i112;
import '../presentation/otp_verify/email_otp_verify.dart' as _i88;
import '../presentation/profile/state/user_profile_bloc.dart' as _i124;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i109;
import '../presentation/protector/protector_router.dart' as _i18;
import '../presentation/qr_code/qr_code_route.dart' as _i19;
import '../presentation/routes.dart' as _i20;
import '../presentation/settings/setting_routes.dart' as _i21;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i126;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i122;
import '../presentation/social/profile/profile_bloc.dart' as _i134;
import '../presentation/social/social_routes.dart' as _i23;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i24;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i132;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i107;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i114;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i115;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i63;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i120;
import 'modules/config_module.dart' as _i131;
import 'modules/data_source_module.dart' as _i130;

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
  gh.factory<_i6.ChatRoutes>(() => _i6.ChatRoutes());
  gh.factory<_i7.CommunityRoutes>(() => _i7.CommunityRoutes());
  gh.factory<_i8.DashboardRoutes>(() => _i8.DashboardRoutes());
  gh.factory<_i9.DeeplinkBloc>(() => _i9.DeeplinkBloc());
  gh.factory<_i10.GeneralRoutes>(() => _i10.GeneralRoutes());
  gh.factory<_i11.GeneralRoutes>(() => _i11.GeneralRoutes());
  gh.factory<_i12.InfoProfileRoutes>(() => _i12.InfoProfileRoutes());
  gh.factory<_i13.MarkShopRoutes>(() => _i13.MarkShopRoutes());
  gh.lazySingleton<_i14.MediaPicker>(() => _i15.MediaPickerImpl());
  gh.factory<_i16.NotificationRoutes>(() => _i16.NotificationRoutes());
  gh.singleton<_i17.NotificationService>(
      _i17.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i18.ProtectorModule>(() => _i18.ProtectorModule());
  gh.factory<_i19.QrCodeRoutes>(() => _i19.QrCodeRoutes());
  gh.singleton<_i20.Routes>(_i20.Routes());
  gh.factory<_i21.SettingRoutes>(() => _i21.SettingRoutes());
  await gh.singletonAsync<_i22.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i23.SocialRoutes>(() => _i23.SocialRoutes());
  gh.factory<_i24.UpgradeAccountRoutes>(() => _i24.UpgradeAccountRoutes());
  gh.factory<_i25.UserSharePreferencesUsecase>(
      () => _i25.UserSharePreferencesUsecase(gh<_i22.SharedPreferences>()));
  gh.singleton<_i26.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i27.DashboardSharePreferenceUseCase>(
      () => _i27.DashboardSharePreferenceUseCase(gh<_i22.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i22.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i28.FriendApi>(() => _i28.FriendApi(gh<_i29.Dio>()));
  gh.factory<_i30.FriendRepository>(
      () => _i31.FriendRepositoryImpl(gh<_i28.FriendApi>()));
  gh.factory<_i32.InformationPDoneSharePreferencesUsecase>(() =>
      _i32.InformationPDoneSharePreferencesUsecase(
          gh<_i22.SharedPreferences>()));
  gh.factory<_i33.InformationPdoneProfileCubit>(() =>
      _i33.InformationPdoneProfileCubit(
          gh<_i32.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i34.MarshopAPI>(() => _i34.MarshopAPI(gh<_i29.Dio>()));
  gh.factory<_i35.MarshopRepository>(
      () => _i36.MarshopRepositoryImpl(gh<_i34.MarshopAPI>()));
  gh.factory<_i37.MarshopUsecase>(
      () => _i37.MarshopUsecase(gh<_i35.MarshopRepository>()));
  gh.factory<_i38.NotificationAPI>(() => _i38.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i39.NotificationRepository>(
      () => _i40.NotificationRepositoryImpl(gh<_i38.NotificationAPI>()));
  gh.factory<_i41.NotificationUsecase>(
      () => _i41.NotificationUsecase(gh<_i39.NotificationRepository>()));
  gh.lazySingleton<_i42.OpenWeatherApi>(
      () => _i42.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i43.OpenWeatherRepository>(
      () => _i44.OpenWeatherRepositoryImpl(gh<_i42.OpenWeatherApi>()));
  gh.factory<_i45.OpenWeatherUseCase>(
      () => _i45.OpenWeatherUseCase(gh<_i43.OpenWeatherRepository>()));
  gh.factory<_i46.PlaceInformationAPI>(
      () => _i46.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i47.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i22.SharedPreferences>(),
        gh<_i47.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i48.PlaceInformationRepository>(() =>
      _i49.PlaceInformationRepositoryImpl(gh<_i46.PlaceInformationAPI>()));
  gh.factory<_i50.PlaceInformationUsecase>(() =>
      _i50.PlaceInformationUsecase(gh<_i48.PlaceInformationRepository>()));
  gh.lazySingleton<_i51.ProtectorAPI>(() => _i51.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i52.ProtectorRepository>(
      () => _i53.ProtectorRepositoryImpl(gh<_i51.ProtectorAPI>()));
  gh.factory<_i54.ProtectorUseCase>(
      () => _i54.ProtectorUseCase(gh<_i52.ProtectorRepository>()));
  gh.factory<_i55.ResourceApi>(() => _i55.ResourceApi(gh<_i29.Dio>()));
  gh.factory<_i56.ResourceRepository>(
      () => _i57.ResourceRepositoryImpl(gh<_i55.ResourceApi>()));
  gh.factory<_i58.ResourceUsecase>(
      () => _i58.ResourceUsecase(gh<_i56.ResourceRepository>()));
  gh.factory<_i59.UpgradeAccountApi>(
      () => _i59.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i60.UpgradeAccountRepository>(
      () => _i61.UpgradeAccountRepositoryImpl(
            gh<_i59.UpgradeAccountApi>(),
            gh<_i55.ResourceApi>(),
          ));
  gh.factory<_i62.UpgradeAccountUsecase>(
      () => _i62.UpgradeAccountUsecase(gh<_i60.UpgradeAccountRepository>()));
  gh.factory<_i63.UpgradeCubit>(
      () => _i63.UpgradeCubit(gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<_i64.UserApi>(() => _i64.UserApi(gh<_i3.Dio>()));
  gh.factory<_i65.UserRepository>(
      () => _i66.AuthRepositoryImpl(gh<_i64.UserApi>()));
  gh.factory<_i67.UserUsecase>(
      () => _i67.UserUsecase(gh<_i65.UserRepository>()));
  gh.factory<_i68.AddMemberChangeNotifier>(
      () => _i68.AddMemberChangeNotifier(gh<_i67.UserUsecase>()));
  gh.factory<_i69.AuthApi>(() => _i69.AuthApi(gh<_i29.Dio>()));
  gh.factory<_i70.AuthRepository>(
      () => _i71.AuthRepositoryImpl(gh<_i69.AuthApi>()));
  gh.factory<_i72.AuthenticationUsecase>(() => _i72.AuthenticationUsecase(
        gh<_i70.AuthRepository>(),
        gh<_i25.UserSharePreferencesUsecase>(),
        gh<_i65.UserRepository>(),
        gh<_i17.NotificationService>(),
        gh<_i41.NotificationUsecase>(),
      ));
  gh.factory<_i73.ChangePasswordController>(
      () => _i73.ChangePasswordController(gh<_i72.AuthenticationUsecase>()));
  gh.factory<_i74.ChatApi>(() => _i74.ChatApi(gh<_i29.Dio>()));
  gh.factory<_i75.ChatRepository>(
      () => _i76.ChatRepositoryImpl(gh<_i74.ChatApi>()));
  gh.factory<_i77.ChatUseCase>(() => _i77.ChatUseCase(
        gh<_i75.ChatRepository>(),
        gh<_i30.FriendRepository>(),
      ));
  gh.factory<_i78.CommunityApi>(() => _i78.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i79.CommunityRepository>(
      () => _i80.CommunityRepositoryImpl(gh<_i78.CommunityApi>()));
  gh.factory<_i81.CommunityUsecase>(() => _i81.CommunityUsecase(
        gh<_i79.CommunityRepository>(),
        gh<_i58.ResourceUsecase>(),
      ));
  gh.factory<_i82.ConversationCubit>(
      () => _i82.ConversationCubit(gh<_i77.ChatUseCase>()));
  gh.factory<_i83.DashBoardBgController>(() =>
      _i83.DashBoardBgController(gh<_i27.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i84.DashBoardScreenController>(() =>
      _i84.DashBoardScreenController(
          gh<_i27.DashboardSharePreferenceUseCase>()));
  gh.factory<_i85.DashboardCommunityBloc>(() =>
      _i85.DashboardCommunityBloc(gh<_i27.DashboardSharePreferenceUseCase>()));
  gh.factory<_i85.DashboardEcommerceBloc>(() =>
      _i85.DashboardEcommerceBloc(gh<_i27.DashboardSharePreferenceUseCase>()));
  gh.factory<_i85.DashboardPersonalBloc>(() =>
      _i85.DashboardPersonalBloc(gh<_i27.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i86.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i86.EditCommunityDetailBloc(
        gh<_i81.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i87.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i87.EditFanGroupBloc(
        gh<_i81.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i88.EmailVerifyController>(
      () => _i88.EmailVerifyController(gh<_i67.UserUsecase>()));
  gh.factory<_i89.FanGroupDetailBloc>(
      () => _i89.FanGroupDetailBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<_i90.GetDetailBloc<_i91.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<_i90.GetDetailBloc<_i92.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<_i90.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<_i90.GetDetailBloc<_i93.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<_i90.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i67.UserUsecase>()));
  gh.factory<
          _i90.GetDetailBlocParam1<_i94.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<
      _i90.GetDetailBlocParam1<_i95.ConfirmRegisterJAResponse,
          _i96.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<_i90.GetDetailBlocParam1<dynamic, _i97.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<
          _i90
          .GetDetailBlocParam1<_i98.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<
      _i90.GetDetailBlocParam1<_i92.BankAccount,
          _i99.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<
      _i90.GetDetailBlocParam1<_i93.UpgradeAccountResponse,
          _i100.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<
      _i90.GetDetailBlocParam2<_i101.ConfirmResponse, String,
          _i102.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<
      _i90.GetDetailBlocParam2<_i101.ConfirmResponse, String,
          _i103.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<_i90.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<_i90.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i81.CommunityUsecase>()));
  gh.factory<_i90.GetListBloc<_i104.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<_i90.GetListBloc<_i105.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<_i90.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<_i106.GroupDetailBloc>(
      () => _i106.GroupDetailBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<_i107.GuardianPDoneBloc>(
      () => _i107.GuardianPDoneBloc(gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<_i108.InformationUpdateProfilBloc>(
      () => _i108.InformationUpdateProfilBloc(
            gh<_i67.UserUsecase>(),
            gh<_i32.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i109.ListProtectorRequestController>(
      () => _i109.ListProtectorRequestController(gh<_i54.ProtectorUseCase>()));
  gh.factory<_i109.ManageProtectController>(
      () => _i109.ManageProtectController(gh<_i54.ProtectorUseCase>()));
  gh.factory<_i110.MarshopCubit>(
      () => _i110.MarshopCubit(gh<_i37.MarshopUsecase>()));
  gh.factory<_i111.NewMessageCubit>(
      () => _i111.NewMessageCubit(gh<_i77.ChatUseCase>()));
  gh.factory<_i112.NotificationBloc>(
      () => _i112.NotificationBloc(gh<_i41.NotificationUsecase>()));
  gh.factory<_i113.OpenWeatherBloc>(
      () => _i113.OpenWeatherBloc(gh<_i45.OpenWeatherUseCase>()));
  gh.factory<_i114.PDoneInformationBloc>(
      () => _i114.PDoneInformationBloc(gh<_i62.UpgradeAccountUsecase>()));
  gh.factory<_i115.PlaceInformationBloc>(
      () => _i115.PlaceInformationBloc(gh<_i50.PlaceInformationUsecase>()));
  gh.factory<_i116.PlaceInformationBloc2>(
      () => _i116.PlaceInformationBloc2(gh<_i50.PlaceInformationUsecase>()));
  gh.factory<_i117.SearchCubit>(
      () => _i117.SearchCubit(gh<_i67.UserUsecase>()));
  gh.factory<_i118.TeamDetailBloc>(
      () => _i118.TeamDetailBloc(gh<_i81.CommunityUsecase>()));
  gh.factory<_i119.TeamRequestCubit>(
      () => _i119.TeamRequestCubit(gh<_i81.CommunityUsecase>()));
  gh.factory<_i120.UpgradePDoneBloc>(() => _i120.UpgradePDoneBloc(
        gh<_i62.UpgradeAccountUsecase>(),
        gh<_i67.UserUsecase>(),
        gh<_i25.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i121.UserActionCubit>(
      () => _i121.UserActionCubit(gh<_i67.UserUsecase>()));
  gh.factory<_i122.UserBloc>(() => _i122.UserBloc(
        gh<_i72.AuthenticationUsecase>(),
        gh<_i25.UserSharePreferencesUsecase>(),
        gh<_i67.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i123.UserCubit>(() => _i123.UserCubit(
        gh<_i72.AuthenticationUsecase>(),
        gh<_i25.UserSharePreferencesUsecase>(),
        gh<_i67.UserUsecase>(),
      ));
  gh.factory<_i124.UserProfileBloc>(() => _i124.UserProfileBloc(
        gh<_i67.UserUsecase>(),
        gh<_i54.ProtectorUseCase>(),
        gh<_i14.MediaPicker>(),
        gh<_i62.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i125.AppCubit>(() => _i125.AppCubit(
        gh<_i58.ResourceUsecase>(),
        gh<_i25.UserSharePreferencesUsecase>(),
        gh<_i72.AuthenticationUsecase>(),
      ));
  gh.singleton<_i126.AppSettingBloc>(
      _i126.AppSettingBloc(gh<_i72.AuthenticationUsecase>()));
  gh.factory<_i127.AuthCubit>(
      () => _i127.AuthCubit(gh<_i72.AuthenticationUsecase>()));
  gh.factory<_i128.ChatRoomCubit>(() => _i128.ChatRoomCubit(
        gh<_i77.ChatUseCase>(),
        gh<_i67.UserUsecase>(),
      ));
  await _i129.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i130.DataSourceModule {}

class _$ConfigModule extends _i131.ConfigModule {}

class _$PlaceModule extends _i47.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i132.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i133.CommunityModule {}

class _$DiaryBlocFactory extends _i134.DiaryBlocFactory {}

class _$DashBoardModule extends _i135.DashBoardModule {}
