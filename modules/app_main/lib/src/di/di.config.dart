// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i30;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i93;
import 'package:shared_preferences/shared_preferences.dart' as _i23;
import 'package:wallet/core/core.dart' as _i27;
import 'package:wallet/di/wallet_micro.module.dart' as _i132;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i128;
import '../blocs/approved_request/approved_request_cubit.dart' as _i72;
import '../blocs/auth/auth_cubit.dart' as _i130;
import '../blocs/community/team_request/team_request_cubit.dart' as _i122;
import '../blocs/marshop/marshop_cubit.dart' as _i113;
import '../blocs/user/user_cubit.dart' as _i126;
import '../blocs/user_action/user_action_cubit.dart' as _i124;
import '../core/services/notifications/notification_service.dart' as _i18;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i34;
import '../data/data_sources/remote/auth_api.dart' as _i73;
import '../data/data_sources/remote/call_api.dart' as _i77;
import '../data/data_sources/remote/community_api.dart' as _i82;
import '../data/data_sources/remote/friend_api.dart' as _i29;
import '../data/data_sources/remote/marshop_api.dart' as _i36;
import '../data/data_sources/remote/notification_api.dart' as _i40;
import '../data/data_sources/remote/open_weather_api.dart' as _i44;
import '../data/data_sources/remote/place_information_api.dart' as _i48;
import '../data/data_sources/remote/place_information_provider.dart' as _i49;
import '../data/data_sources/remote/protector_api.dart' as _i53;
import '../data/data_sources/remote/resource_api.dart' as _i57;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i61;
import '../data/data_sources/remote/user_api.dart' as _i66;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i106;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i100;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i103;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i101;
import '../data/models/responses/boss_community_status_response.dart' as _i98;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i97;
import '../data/models/responses/confirm_register_ja_response.dart' as _i99;
import '../data/models/responses/confirm_response.dart' as _i104;
import '../data/models/responses/group_request_response.dart' as _i107;
import '../data/models/responses/ja_status_response.dart' as _i96;
import '../data/models/responses/upgrade_account_response.dart' as _i94;
import '../data/repositories/auth_repository.dart' as _i74;
import '../data/repositories/impl/auth_repository_impl.dart' as _i75;
import '../data/repositories/impl/call_repository_impl.dart' as _i79;
import '../data/repositories/impl/community_repository.impl.dart' as _i84;
import '../data/repositories/impl/friend_repository_impl.dart' as _i32;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i38;
import '../data/repositories/impl/media_picker_impl.dart' as _i16;
import '../data/repositories/impl/notification_repository.impl.dart' as _i42;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i46;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i51;
import '../data/repositories/impl/protector_repository_impl.dart' as _i55;
import '../data/repositories/impl/resource_repository.impl.dart' as _i59;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i63;
import '../data/repositories/impl/user_repository_impl.dart' as _i68;
import '../data/repositories/marshop_repository.dart' as _i37;
import '../data/repositories/media_picker.dart' as _i15;
import '../data/repositories/notification_repository.dart' as _i41;
import '../data/repositories/protector_repository.dart' as _i54;
import '../data/repositories/user_repository.dart' as _i67;
import '../domain/entities/bank.dart' as _i108;
import '../domain/entities/commity_action_type.dart' as _i102;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i95;
import '../domain/repository/call_repository.dart' as _i78;
import '../domain/repository/community_repository.dart' as _i83;
import '../domain/repository/friend_repository.dart' as _i31;
import '../domain/repository/open_weather_repository.dart' as _i45;
import '../domain/repository/place_information_repository.dart' as _i50;
import '../domain/repository/resource_repository.dart' as _i58;
import '../domain/repository/upgrade_account_repository.dart' as _i62;
import '../domain/usecases/authentication_usecase.dart' as _i76;
import '../domain/usecases/call_usecase.dart' as _i80;
import '../domain/usecases/community_usecase.dart' as _i85;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i28;
import '../domain/usecases/friend_usecase.dart' as _i33;
import '../domain/usecases/marshop_usecase.dart' as _i39;
import '../domain/usecases/notification_usecase.dart' as _i43;
import '../domain/usecases/open_weather_usecase.dart' as _i47;
import '../domain/usecases/place_information_usecase.dart' as _i52;
import '../domain/usecases/protector_usecase.dart' as _i56;
import '../domain/usecases/resource_usecase.dart' as _i60;
import '../domain/usecases/upgrade_account_usecase.dart' as _i64;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i26;
import '../domain/usecases/user_usecase.dart' as _i69;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/call/call_1v1/cubit/call_cubit.dart' as _i6;
import '../presentation/call/call_routes.dart' as _i7;
import '../presentation/call/phone_book/tabs/all_friends/cubit/all_friends_cubit.dart'
    as _i71;
import '../presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart'
    as _i131;
import '../presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart'
    as _i117;
import '../presentation/community/community_constants.dart' as _i105;
import '../presentation/community/community_module.dart' as _i136;
import '../presentation/community/community_routes.dart' as _i8;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i89;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i90;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i92;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i109;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i121;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i70;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i87;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i88;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i115;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i86;
import '../presentation/dashboard/dashboard_module.dart' as _i138;
import '../presentation/dashboard/dashboard_routes.dart' as _i9;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i120;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i81;
import '../presentation/general_setting/general_routes.dart' as _i12;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i111;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i35;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i119;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i13;
import '../presentation/marshop/marshop_routes.dart' as _i14;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i11;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i10;
import '../presentation/notification/notification_routes.dart' as _i17;
import '../presentation/notification/state/notification_bloc.dart' as _i114;
import '../presentation/otp_verify/email_otp_verify.dart' as _i91;
import '../presentation/profile/state/user_profile_bloc.dart' as _i127;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i112;
import '../presentation/protector/protector_router.dart' as _i19;
import '../presentation/qr_code/qr_code_route.dart' as _i20;
import '../presentation/routes.dart' as _i21;
import '../presentation/settings/setting_routes.dart' as _i22;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i129;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i125;
import '../presentation/social/profile/profile_bloc.dart' as _i137;
import '../presentation/social/social_routes.dart' as _i24;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i25;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i135;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i110;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i116;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i118;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i65;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i123;
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
  gh.factory<_i6.CallCubit>(() => _i6.CallCubit());
  gh.factory<_i7.CallRoutes>(() => _i7.CallRoutes());
  gh.factory<_i8.CommunityRoutes>(() => _i8.CommunityRoutes());
  gh.factory<_i9.DashboardRoutes>(() => _i9.DashboardRoutes());
  gh.factory<_i10.DeeplinkBloc>(() => _i10.DeeplinkBloc());
  gh.factory<_i11.GeneralRoutes>(() => _i11.GeneralRoutes());
  gh.factory<_i12.GeneralRoutes>(() => _i12.GeneralRoutes());
  gh.factory<_i13.InfoProfileRoutes>(() => _i13.InfoProfileRoutes());
  gh.factory<_i14.MarkShopRoutes>(() => _i14.MarkShopRoutes());
  gh.lazySingleton<_i15.MediaPicker>(() => _i16.MediaPickerImpl());
  gh.factory<_i17.NotificationRoutes>(() => _i17.NotificationRoutes());
  gh.singleton<_i18.NotificationService>(
      _i18.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i19.ProtectorModule>(() => _i19.ProtectorModule());
  gh.factory<_i20.QrCodeRoutes>(() => _i20.QrCodeRoutes());
  gh.singleton<_i21.Routes>(_i21.Routes());
  gh.factory<_i22.SettingRoutes>(() => _i22.SettingRoutes());
  await gh.singletonAsync<_i23.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i24.SocialRoutes>(() => _i24.SocialRoutes());
  gh.factory<_i25.UpgradeAccountRoutes>(() => _i25.UpgradeAccountRoutes());
  gh.factory<_i26.UserSharePreferencesUsecase>(
      () => _i26.UserSharePreferencesUsecase(gh<_i23.SharedPreferences>()));
  gh.singleton<_i27.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i28.DashboardSharePreferenceUseCase>(
      () => _i28.DashboardSharePreferenceUseCase(gh<_i23.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i23.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i29.FriendApi>(() => _i29.FriendApi(gh<_i30.Dio>()));
  gh.factory<_i31.FriendRepository>(
      () => _i32.FriendRepositoryImpl(gh<_i29.FriendApi>()));
  gh.factory<_i33.FriendUsecase>(
      () => _i33.FriendUsecase(gh<_i31.FriendRepository>()));
  gh.factory<_i34.InformationPDoneSharePreferencesUsecase>(() =>
      _i34.InformationPDoneSharePreferencesUsecase(
          gh<_i23.SharedPreferences>()));
  gh.factory<_i35.InformationPdoneProfileCubit>(() =>
      _i35.InformationPdoneProfileCubit(
          gh<_i34.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i36.MarshopAPI>(() => _i36.MarshopAPI(gh<_i30.Dio>()));
  gh.factory<_i37.MarshopRepository>(
      () => _i38.MarshopRepositoryImpl(gh<_i36.MarshopAPI>()));
  gh.factory<_i39.MarshopUsecase>(
      () => _i39.MarshopUsecase(gh<_i37.MarshopRepository>()));
  gh.factory<_i40.NotificationAPI>(() => _i40.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i41.NotificationRepository>(
      () => _i42.NotificationRepositoryImpl(gh<_i40.NotificationAPI>()));
  gh.factory<_i43.NotificationUsecase>(
      () => _i43.NotificationUsecase(gh<_i41.NotificationRepository>()));
  gh.lazySingleton<_i44.OpenWeatherApi>(
      () => _i44.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i45.OpenWeatherRepository>(
      () => _i46.OpenWeatherRepositoryImpl(gh<_i44.OpenWeatherApi>()));
  gh.factory<_i47.OpenWeatherUseCase>(
      () => _i47.OpenWeatherUseCase(gh<_i45.OpenWeatherRepository>()));
  gh.factory<_i48.PlaceInformationAPI>(
      () => _i48.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i49.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i23.SharedPreferences>(),
        gh<_i49.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i50.PlaceInformationRepository>(() =>
      _i51.PlaceInformationRepositoryImpl(gh<_i48.PlaceInformationAPI>()));
  gh.factory<_i52.PlaceInformationUsecase>(() =>
      _i52.PlaceInformationUsecase(gh<_i50.PlaceInformationRepository>()));
  gh.lazySingleton<_i53.ProtectorAPI>(() => _i53.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i54.ProtectorRepository>(
      () => _i55.ProtectorRepositoryImpl(gh<_i53.ProtectorAPI>()));
  gh.factory<_i56.ProtectorUseCase>(
      () => _i56.ProtectorUseCase(gh<_i54.ProtectorRepository>()));
  gh.factory<_i57.ResourceApi>(() => _i57.ResourceApi(gh<_i30.Dio>()));
  gh.factory<_i58.ResourceRepository>(
      () => _i59.ResourceRepositoryImpl(gh<_i57.ResourceApi>()));
  gh.factory<_i60.ResourceUsecase>(
      () => _i60.ResourceUsecase(gh<_i58.ResourceRepository>()));
  gh.factory<_i61.UpgradeAccountApi>(
      () => _i61.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i62.UpgradeAccountRepository>(
      () => _i63.UpgradeAccountRepositoryImpl(
            gh<_i61.UpgradeAccountApi>(),
            gh<_i57.ResourceApi>(),
          ));
  gh.factory<_i64.UpgradeAccountUsecase>(
      () => _i64.UpgradeAccountUsecase(gh<_i62.UpgradeAccountRepository>()));
  gh.factory<_i65.UpgradeCubit>(
      () => _i65.UpgradeCubit(gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<_i66.UserApi>(() => _i66.UserApi(gh<_i3.Dio>()));
  gh.factory<_i67.UserRepository>(
      () => _i68.AuthRepositoryImpl(gh<_i66.UserApi>()));
  gh.factory<_i69.UserUsecase>(
      () => _i69.UserUsecase(gh<_i67.UserRepository>()));
  gh.factory<_i70.AddMemberChangeNotifier>(
      () => _i70.AddMemberChangeNotifier(gh<_i69.UserUsecase>()));
  gh.factory<_i71.AllFriendsCubit>(
      () => _i71.AllFriendsCubit(gh<_i33.FriendUsecase>()));
  gh.factory<_i72.ApprovedRequestCubit>(
      () => _i72.ApprovedRequestCubit(gh<_i69.UserUsecase>()));
  gh.factory<_i73.AuthApi>(() => _i73.AuthApi(gh<_i30.Dio>()));
  gh.factory<_i74.AuthRepository>(
      () => _i75.AuthRepositoryImpl(gh<_i73.AuthApi>()));
  gh.factory<_i76.AuthenticationUsecase>(() => _i76.AuthenticationUsecase(
        gh<_i74.AuthRepository>(),
        gh<_i26.UserSharePreferencesUsecase>(),
        gh<_i67.UserRepository>(),
        gh<_i18.NotificationService>(),
      ));
  gh.factory<_i77.CallApi>(() => _i77.CallApi(gh<_i30.Dio>()));
  gh.factory<_i78.CallRepository>(
      () => _i79.CallRepositoryImpl(gh<_i77.CallApi>()));
  gh.factory<_i80.CallUseCase>(
      () => _i80.CallUseCase(gh<_i78.CallRepository>()));
  gh.factory<_i81.ChangePasswordController>(
      () => _i81.ChangePasswordController(gh<_i76.AuthenticationUsecase>()));
  gh.factory<_i82.CommunityApi>(() => _i82.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i83.CommunityRepository>(
      () => _i84.CommunityRepositoryImpl(gh<_i82.CommunityApi>()));
  gh.factory<_i85.CommunityUsecase>(() => _i85.CommunityUsecase(
        gh<_i83.CommunityRepository>(),
        gh<_i60.ResourceUsecase>(),
      ));
  gh.factory<_i86.DashBoardBgController>(() =>
      _i86.DashBoardBgController(gh<_i28.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i87.DashBoardScreenController>(() =>
      _i87.DashBoardScreenController(
          gh<_i28.DashboardSharePreferenceUseCase>()));
  gh.factory<_i88.DashboardCommunityBloc>(() =>
      _i88.DashboardCommunityBloc(gh<_i28.DashboardSharePreferenceUseCase>()));
  gh.factory<_i88.DashboardEcommerceBloc>(() =>
      _i88.DashboardEcommerceBloc(gh<_i28.DashboardSharePreferenceUseCase>()));
  gh.factory<_i88.DashboardPersonalBloc>(() =>
      _i88.DashboardPersonalBloc(gh<_i28.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i89.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i89.EditCommunityDetailBloc(
        gh<_i85.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i90.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i90.EditFanGroupBloc(
        gh<_i85.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i91.EmailVerifyController>(
      () => _i91.EmailVerifyController(gh<_i69.UserUsecase>()));
  gh.factory<_i92.FanGroupDetailBloc>(
      () => _i92.FanGroupDetailBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<_i93.GetDetailBloc<_i94.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<_i93.GetDetailBloc<_i95.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<_i93.GetDetailBloc<_i96.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<_i93.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<
          _i93
          .GetDetailBlocParam1<_i97.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<
          _i93.GetDetailBlocParam1<_i98.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<_i93.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i69.UserUsecase>()));
  gh.factory<
      _i93.GetDetailBlocParam1<_i99.ConfirmRegisterJAResponse,
          _i100.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<_i93.GetDetailBlocParam1<dynamic, _i101.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<
      _i93.GetDetailBlocParam1<_i94.UpgradeAccountResponse,
          _i102.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<
      _i93.GetDetailBlocParam1<_i95.BankAccount,
          _i103.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<
      _i93.GetDetailBlocParam2<_i104.ConfirmResponse, String,
          _i105.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<
      _i93.GetDetailBlocParam2<_i104.ConfirmResponse, String,
          _i106.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<_i93.GetListBloc<_i107.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<_i93.GetListBloc<_i108.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<_i93.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i85.CommunityUsecase>()));
  gh.factory<_i93.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<_i93.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<_i109.GroupDetailBloc>(
      () => _i109.GroupDetailBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<_i110.GuardianPDoneBloc>(
      () => _i110.GuardianPDoneBloc(gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<_i111.InformationUpdateProfilBloc>(
      () => _i111.InformationUpdateProfilBloc(
            gh<_i69.UserUsecase>(),
            gh<_i34.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i112.ListProtectorRequestController>(
      () => _i112.ListProtectorRequestController(gh<_i56.ProtectorUseCase>()));
  gh.factory<_i112.ManageProtectController>(
      () => _i112.ManageProtectController(gh<_i56.ProtectorUseCase>()));
  gh.factory<_i113.MarshopCubit>(
      () => _i113.MarshopCubit(gh<_i39.MarshopUsecase>()));
  gh.factory<_i114.NotificationBloc>(
      () => _i114.NotificationBloc(gh<_i43.NotificationUsecase>()));
  gh.factory<_i115.OpenWeatherBloc>(
      () => _i115.OpenWeatherBloc(gh<_i47.OpenWeatherUseCase>()));
  gh.factory<_i116.PDoneInformationBloc>(
      () => _i116.PDoneInformationBloc(gh<_i64.UpgradeAccountUsecase>()));
  gh.factory<_i117.PhoneBookDetailCubit>(
      () => _i117.PhoneBookDetailCubit(gh<_i80.CallUseCase>()));
  gh.factory<_i118.PlaceInformationBloc>(
      () => _i118.PlaceInformationBloc(gh<_i52.PlaceInformationUsecase>()));
  gh.factory<_i119.PlaceInformationBloc2>(
      () => _i119.PlaceInformationBloc2(gh<_i52.PlaceInformationUsecase>()));
  gh.factory<_i120.SearchCubit>(
      () => _i120.SearchCubit(gh<_i69.UserUsecase>()));
  gh.factory<_i121.TeamDetailBloc>(
      () => _i121.TeamDetailBloc(gh<_i85.CommunityUsecase>()));
  gh.factory<_i122.TeamRequestCubit>(
      () => _i122.TeamRequestCubit(gh<_i85.CommunityUsecase>()));
  gh.factory<_i123.UpgradePDoneBloc>(() => _i123.UpgradePDoneBloc(
        gh<_i64.UpgradeAccountUsecase>(),
        gh<_i69.UserUsecase>(),
        gh<_i26.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i124.UserActionCubit>(
      () => _i124.UserActionCubit(gh<_i69.UserUsecase>()));
  gh.factory<_i125.UserBloc>(() => _i125.UserBloc(
        gh<_i76.AuthenticationUsecase>(),
        gh<_i26.UserSharePreferencesUsecase>(),
        gh<_i69.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i126.UserCubit>(() => _i126.UserCubit(
        gh<_i76.AuthenticationUsecase>(),
        gh<_i26.UserSharePreferencesUsecase>(),
        gh<_i69.UserUsecase>(),
      ));
  gh.factory<_i127.UserProfileBloc>(() => _i127.UserProfileBloc(
        gh<_i69.UserUsecase>(),
        gh<_i56.ProtectorUseCase>(),
        gh<_i15.MediaPicker>(),
        gh<_i64.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i128.AppCubit>(() => _i128.AppCubit(
        gh<_i60.ResourceUsecase>(),
        gh<_i26.UserSharePreferencesUsecase>(),
        gh<_i76.AuthenticationUsecase>(),
      ));
  gh.singleton<_i129.AppSettingBloc>(
      _i129.AppSettingBloc(gh<_i76.AuthenticationUsecase>()));
  gh.factory<_i130.AuthCubit>(
      () => _i130.AuthCubit(gh<_i76.AuthenticationUsecase>()));
  gh.factory<_i131.CallHistoryCubit>(
      () => _i131.CallHistoryCubit(gh<_i80.CallUseCase>()));
  await _i132.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i133.DataSourceModule {}

class _$ConfigModule extends _i134.ConfigModule {}

class _$PlaceModule extends _i49.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i135.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i136.CommunityModule {}

class _$DiaryBlocFactory extends _i137.DiaryBlocFactory {}

class _$DashBoardModule extends _i138.DashBoardModule {}
