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
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i80;
import 'package:shared_preferences/shared_preferences.dart' as _i21;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i114;
import '../blocs/auth/auth_cubit.dart' as _i116;
import '../blocs/community/team_request/team_request_cubit.dart' as _i108;
import '../blocs/marshop/marshop_cubit.dart' as _i100;
import '../blocs/user/user_cubit.dart' as _i112;
import '../blocs/user_action/user_action_cubit.dart' as _i110;
import '../core/services/notifications/notification_service.dart' as _i16;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i27;
import '../data/data_sources/remote/auth_api.dart' as _i65;
import '../data/data_sources/remote/community_api.dart' as _i70;
import '../data/data_sources/remote/marshop_api.dart' as _i29;
import '../data/data_sources/remote/notification_api.dart' as _i34;
import '../data/data_sources/remote/open_weather_api.dart' as _i38;
import '../data/data_sources/remote/place_information_api.dart' as _i42;
import '../data/data_sources/remote/place_information_provider.dart' as _i43;
import '../data/data_sources/remote/protector_api.dart' as _i47;
import '../data/data_sources/remote/resource_api.dart' as _i51;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i55;
import '../data/data_sources/remote/user_api.dart' as _i60;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i93;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i88;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i86;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i89;
import '../data/models/responses/boss_community_status_response.dart' as _i84;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i90;
import '../data/models/responses/confirm_register_ja_response.dart' as _i87;
import '../data/models/responses/confirm_response.dart' as _i91;
import '../data/models/responses/group_request_response.dart' as _i95;
import '../data/models/responses/ja_status_response.dart' as _i81;
import '../data/models/responses/upgrade_account_response.dart' as _i83;
import '../data/repositories/auth_repository.dart' as _i66;
import '../data/repositories/impl/auth_repository_impl.dart' as _i67;
import '../data/repositories/impl/community_repository.impl.dart' as _i72;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i32;
import '../data/repositories/impl/media_picker_impl.dart' as _i14;
import '../data/repositories/impl/notification_repository.impl.dart' as _i36;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i40;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i45;
import '../data/repositories/impl/protector_repository_impl.dart' as _i49;
import '../data/repositories/impl/resource_repository.impl.dart' as _i53;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i57;
import '../data/repositories/impl/user_repository_impl.dart' as _i62;
import '../data/repositories/marshop_repository.dart' as _i31;
import '../data/repositories/media_picker.dart' as _i13;
import '../data/repositories/notification_repository.dart' as _i35;
import '../data/repositories/protector_repository.dart' as _i48;
import '../data/repositories/user_repository.dart' as _i61;
import '../domain/entities/bank.dart' as _i94;
import '../domain/entities/commity_action_type.dart' as _i85;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i82;
import '../domain/repository/community_repository.dart' as _i71;
import '../domain/repository/open_weather_repository.dart' as _i39;
import '../domain/repository/place_information_repository.dart' as _i44;
import '../domain/repository/resource_repository.dart' as _i52;
import '../domain/repository/upgrade_account_repository.dart' as _i56;
import '../domain/usecases/authentication_usecase.dart' as _i68;
import '../domain/usecases/community_usecase.dart' as _i73;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i26;
import '../domain/usecases/marshop_usecase.dart' as _i33;
import '../domain/usecases/notification_usecase.dart' as _i37;
import '../domain/usecases/open_weather_usecase.dart' as _i41;
import '../domain/usecases/place_information_usecase.dart' as _i46;
import '../domain/usecases/protector_usecase.dart' as _i50;
import '../domain/usecases/resource_usecase.dart' as _i54;
import '../domain/usecases/upgrade_account_usecase.dart' as _i58;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i24;
import '../domain/usecases/user_usecase.dart' as _i63;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_constants.dart' as _i92;
import '../presentation/community/community_module.dart' as _i120;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i77;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i78;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i79;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i96;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i107;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i64;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i75;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i76;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i102;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i74;
import '../presentation/dashboard/dashboard_module.dart' as _i123;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i106;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i69;
import '../presentation/general_setting/general_routes.dart' as _i9;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i98;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i28;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i105;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i11;
import '../presentation/marshop/marshop_routes.dart' as _i12;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i10;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/notification/notification_routes.dart' as _i15;
import '../presentation/notification/state/notification_bloc.dart' as _i101;
import '../presentation/profile/state/user_profile_bloc.dart' as _i113;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i99;
import '../presentation/protector/protector_router.dart' as _i17;
import '../presentation/qr_code/qr_code_route.dart' as _i18;
import '../presentation/routes.dart' as _i19;
import '../presentation/settings/setting_routes.dart' as _i20;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i115;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i111;
import '../presentation/social/profile/profile_bloc.dart' as _i122;
import '../presentation/social/social_routes.dart' as _i22;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i23;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i121;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i97;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i103;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i104;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i59;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i109;
import 'modules/data_source_module.dart' as _i118;

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
  gh.factory<_i26.DashboardSharePreferenceUseCase>(
      () => _i26.DashboardSharePreferenceUseCase(gh<_i21.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i21.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i27.InformationPDoneSharePreferencesUsecase>(() =>
      _i27.InformationPDoneSharePreferencesUsecase(
          gh<_i21.SharedPreferences>()));
  gh.factory<_i28.InformationPdoneProfileCubit>(() =>
      _i28.InformationPdoneProfileCubit(
          gh<_i27.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i29.MarshopAPI>(() => _i29.MarshopAPI(gh<_i30.Dio>()));
  gh.factory<_i31.MarshopRepository>(
      () => _i32.MarshopRepositoryImpl(gh<_i29.MarshopAPI>()));
  gh.factory<_i33.MarshopUsecase>(
      () => _i33.MarshopUsecase(gh<_i31.MarshopRepository>()));
  gh.factory<_i34.NotificationAPI>(() => _i34.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i35.NotificationRepository>(
      () => _i36.NotificationRepositoryImpl(gh<_i34.NotificationAPI>()));
  gh.factory<_i37.NotificationUsecase>(
      () => _i37.NotificationUsecase(gh<_i35.NotificationRepository>()));
  gh.lazySingleton<_i38.OpenWeatherApi>(
      () => _i38.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i39.OpenWeatherRepository>(
      () => _i40.OpenWeatherRepositoryImpl(gh<_i38.OpenWeatherApi>()));
  gh.factory<_i41.OpenWeatherUseCase>(
      () => _i41.OpenWeatherUseCase(gh<_i39.OpenWeatherRepository>()));
  gh.factory<_i42.PlaceInformationAPI>(
      () => _i42.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i43.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i21.SharedPreferences>(),
        gh<_i43.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i44.PlaceInformationRepository>(() =>
      _i45.PlaceInformationRepositoryImpl(gh<_i42.PlaceInformationAPI>()));
  gh.factory<_i46.PlaceInformationUsecase>(() =>
      _i46.PlaceInformationUsecase(gh<_i44.PlaceInformationRepository>()));
  gh.lazySingleton<_i47.ProtectorAPI>(() => _i47.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i48.ProtectorRepository>(
      () => _i49.ProtectorRepositoryImpl(gh<_i47.ProtectorAPI>()));
  gh.factory<_i50.ProtectorUseCase>(
      () => _i50.ProtectorUseCase(gh<_i48.ProtectorRepository>()));
  gh.factory<_i51.ResourceApi>(() => _i51.ResourceApi(gh<_i30.Dio>()));
  gh.factory<_i52.ResourceRepository>(
      () => _i53.ResourceRepositoryImpl(gh<_i51.ResourceApi>()));
  gh.factory<_i54.ResourceUsecase>(
      () => _i54.ResourceUsecase(gh<_i52.ResourceRepository>()));
  gh.factory<_i55.UpgradeAccountApi>(
      () => _i55.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i56.UpgradeAccountRepository>(
      () => _i57.UpgradeAccountRepositoryImpl(
            gh<_i55.UpgradeAccountApi>(),
            gh<_i51.ResourceApi>(),
          ));
  gh.factory<_i58.UpgradeAccountUsecase>(
      () => _i58.UpgradeAccountUsecase(gh<_i56.UpgradeAccountRepository>()));
  gh.factory<_i59.UpgradeCubit>(
      () => _i59.UpgradeCubit(gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<_i60.UserApi>(() => _i60.UserApi(gh<_i3.Dio>()));
  gh.factory<_i61.UserRepository>(
      () => _i62.AuthRepositoryImpl(gh<_i60.UserApi>()));
  gh.factory<_i63.UserUsecase>(
      () => _i63.UserUsecase(gh<_i61.UserRepository>()));
  gh.factory<_i64.AddMemberChangeNotifier>(
      () => _i64.AddMemberChangeNotifier(gh<_i63.UserUsecase>()));
  gh.factory<_i65.AuthApi>(() => _i65.AuthApi(gh<_i30.Dio>()));
  gh.factory<_i66.AuthRepository>(
      () => _i67.AuthRepositoryImpl(gh<_i65.AuthApi>()));
  gh.factory<_i68.AuthenticationUsecase>(() => _i68.AuthenticationUsecase(
        gh<_i66.AuthRepository>(),
        gh<_i24.UserSharePreferencesUsecase>(),
        gh<_i61.UserRepository>(),
        gh<_i16.NotificationService>(),
        gh<_i37.NotificationUsecase>(),
      ));
  gh.factory<_i69.ChangePasswordController>(
      () => _i69.ChangePasswordController(gh<_i68.AuthenticationUsecase>()));
  gh.factory<_i70.CommunityApi>(() => _i70.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i71.CommunityRepository>(
      () => _i72.CommunityRepositoryImpl(gh<_i70.CommunityApi>()));
  gh.factory<_i73.CommunityUsecase>(() => _i73.CommunityUsecase(
        gh<_i71.CommunityRepository>(),
        gh<_i54.ResourceUsecase>(),
      ));
  gh.factory<_i74.DashBoardBgController>(() =>
      _i74.DashBoardBgController(gh<_i26.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i75.DashBoardScreenController>(() =>
      _i75.DashBoardScreenController(
          gh<_i26.DashboardSharePreferenceUseCase>()));
  gh.factory<_i76.DashboardCommunityBloc>(() =>
      _i76.DashboardCommunityBloc(gh<_i26.DashboardSharePreferenceUseCase>()));
  gh.factory<_i76.DashboardEcommerceBloc>(() =>
      _i76.DashboardEcommerceBloc(gh<_i26.DashboardSharePreferenceUseCase>()));
  gh.factory<_i76.DashboardPersonalBloc>(() =>
      _i76.DashboardPersonalBloc(gh<_i26.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i77.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i77.EditCommunityDetailBloc(
        gh<_i73.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i78.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i78.EditFanGroupBloc(
        gh<_i73.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i79.FanGroupDetailBloc>(
      () => _i79.FanGroupDetailBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<_i80.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<_i80.GetDetailBloc<_i81.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<_i80.GetDetailBloc<_i82.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<_i80.GetDetailBloc<_i83.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<
          _i80.GetDetailBlocParam1<_i84.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<
      _i80.GetDetailBlocParam1<_i83.UpgradeAccountResponse,
          _i85.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<
      _i80.GetDetailBlocParam1<_i82.BankAccount,
          _i86.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<
      _i80.GetDetailBlocParam1<_i87.ConfirmRegisterJAResponse,
          _i88.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<_i80.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i63.UserUsecase>()));
  gh.factory<_i80.GetDetailBlocParam1<dynamic, _i89.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<
          _i80
          .GetDetailBlocParam1<_i90.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<
      _i80.GetDetailBlocParam2<_i91.ConfirmResponse, String,
          _i92.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<
      _i80.GetDetailBlocParam2<_i91.ConfirmResponse, String,
          _i93.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<_i80.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i73.CommunityUsecase>()));
  gh.factory<_i80.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<_i80.GetListBloc<_i94.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<_i80.GetListBloc<_i95.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<_i80.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<_i96.GroupDetailBloc>(
      () => _i96.GroupDetailBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<_i97.GuardianPDoneBloc>(
      () => _i97.GuardianPDoneBloc(gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<_i98.InformationUpdateProfilBloc>(
      () => _i98.InformationUpdateProfilBloc(
            gh<_i63.UserUsecase>(),
            gh<_i27.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i99.ListProtectorRequestController>(
      () => _i99.ListProtectorRequestController(gh<_i50.ProtectorUseCase>()));
  gh.factory<_i99.ManageProtectController>(
      () => _i99.ManageProtectController(gh<_i50.ProtectorUseCase>()));
  gh.factory<_i100.MarshopCubit>(
      () => _i100.MarshopCubit(gh<_i33.MarshopUsecase>()));
  gh.factory<_i101.NotificationBloc>(
      () => _i101.NotificationBloc(gh<_i37.NotificationUsecase>()));
  gh.factory<_i102.OpenWeatherBloc>(
      () => _i102.OpenWeatherBloc(gh<_i41.OpenWeatherUseCase>()));
  gh.factory<_i103.PDoneInformationBloc>(
      () => _i103.PDoneInformationBloc(gh<_i58.UpgradeAccountUsecase>()));
  gh.factory<_i104.PlaceInformationBloc>(
      () => _i104.PlaceInformationBloc(gh<_i46.PlaceInformationUsecase>()));
  gh.factory<_i105.PlaceInformationBloc2>(
      () => _i105.PlaceInformationBloc2(gh<_i46.PlaceInformationUsecase>()));
  gh.factory<_i106.SearchCubit>(
      () => _i106.SearchCubit(gh<_i63.UserUsecase>()));
  gh.factory<_i107.TeamDetailBloc>(
      () => _i107.TeamDetailBloc(gh<_i73.CommunityUsecase>()));
  gh.factory<_i108.TeamRequestCubit>(
      () => _i108.TeamRequestCubit(gh<_i73.CommunityUsecase>()));
  gh.factory<_i109.UpgradePDoneBloc>(() => _i109.UpgradePDoneBloc(
        gh<_i58.UpgradeAccountUsecase>(),
        gh<_i63.UserUsecase>(),
        gh<_i24.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i110.UserActionCubit>(
      () => _i110.UserActionCubit(gh<_i63.UserUsecase>()));
  gh.factory<_i111.UserBloc>(() => _i111.UserBloc(
        gh<_i68.AuthenticationUsecase>(),
        gh<_i24.UserSharePreferencesUsecase>(),
        gh<_i63.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i112.UserCubit>(() => _i112.UserCubit(
        gh<_i68.AuthenticationUsecase>(),
        gh<_i24.UserSharePreferencesUsecase>(),
        gh<_i63.UserUsecase>(),
      ));
  gh.factory<_i113.UserProfileBloc>(() => _i113.UserProfileBloc(
        gh<_i63.UserUsecase>(),
        gh<_i50.ProtectorUseCase>(),
        gh<_i13.MediaPicker>(),
        gh<_i58.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i114.AppCubit>(() => _i114.AppCubit(
        gh<_i54.ResourceUsecase>(),
        gh<_i24.UserSharePreferencesUsecase>(),
        gh<_i68.AuthenticationUsecase>(),
      ));
  gh.singleton<_i115.AppSettingBloc>(
      _i115.AppSettingBloc(gh<_i68.AuthenticationUsecase>()));
  gh.factory<_i116.AuthCubit>(
      () => _i116.AuthCubit(gh<_i68.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i118.DataSourceModule {}

class _$PlaceModule extends _i43.PlaceModule {}

class _$CommunityModule extends _i120.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i121.UpgradeAgreePolicyBlocFactory {}

class _$DiaryBlocFactory extends _i122.DiaryBlocFactory {}

class _$DashBoardModule extends _i123.DashBoardModule {}
