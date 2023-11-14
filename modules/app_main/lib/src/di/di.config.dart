// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i24;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i72;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../app_delegate.dart' as _i4;
import '../blocs/auth/auth_cubit.dart' as _i104;
import '../blocs/community/team_request/team_request_cubit.dart' as _i98;
import '../blocs/marshop/marshop_cubit.dart' as _i91;
import '../blocs/user/user_cubit.dart' as _i102;
import '../blocs/user_action/user_action_cubit.dart' as _i100;
import '../core/services/notifications/notification_service.dart' as _i13;
import '../data/data_sources/remote/auth_api.dart' as _i58;
import '../data/data_sources/remote/community_api.dart' as _i63;
import '../data/data_sources/remote/marshop_api.dart' as _i23;
import '../data/data_sources/remote/notification_api.dart' as _i28;
import '../data/data_sources/remote/open_weather_api.dart' as _i32;
import '../data/data_sources/remote/place_information_api.dart' as _i36;
import '../data/data_sources/remote/place_information_provider.dart' as _i37;
import '../data/data_sources/remote/protector_api.dart' as _i41;
import '../data/data_sources/remote/resource_api.dart' as _i45;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i49;
import '../data/data_sources/remote/user_api.dart' as _i53;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i85;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i79;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i81;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i77;
import '../data/models/responses/boss_community_status_response.dart' as _i80;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i82;
import '../data/models/responses/confirm_register_ja_response.dart' as _i78;
import '../data/models/responses/confirm_response.dart' as _i83;
import '../data/models/responses/group_request_response.dart' as _i87;
import '../data/models/responses/ja_status_response.dart' as _i73;
import '../data/models/responses/upgrade_account_response.dart' as _i74;
import '../data/repositories/auth_repository.dart' as _i59;
import '../data/repositories/impl/auth_repository_impl.dart' as _i60;
import '../data/repositories/impl/community_repository.impl.dart' as _i65;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i26;
import '../data/repositories/impl/notification_repository.impl.dart' as _i30;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i34;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i39;
import '../data/repositories/impl/protector_repository_impl.dart' as _i43;
import '../data/repositories/impl/resource_repository.impl.dart' as _i47;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i51;
import '../data/repositories/impl/user_repository_impl.dart' as _i55;
import '../data/repositories/marshop_repository.dart' as _i25;
import '../data/repositories/notification_repository.dart' as _i29;
import '../data/repositories/protector_repository.dart' as _i42;
import '../data/repositories/user_repository.dart' as _i54;
import '../domain/entities/bank.dart' as _i86;
import '../domain/entities/commity_action_type.dart' as _i76;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i75;
import '../domain/repository/community_repository.dart' as _i64;
import '../domain/repository/open_weather_repository.dart' as _i33;
import '../domain/repository/place_information_repository.dart' as _i38;
import '../domain/repository/resource_responsitory.dart' as _i46;
import '../domain/repository/upgrade_account_repository.dart' as _i50;
import '../domain/usecases/authentication_usecase.dart' as _i61;
import '../domain/usecases/community_usecase.dart' as _i66;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i22;
import '../domain/usecases/marshop_usecase.dart' as _i27;
import '../domain/usecases/notification_usecase.dart' as _i31;
import '../domain/usecases/open_weather_usecase.dart' as _i35;
import '../domain/usecases/place_information_usecase.dart' as _i40;
import '../domain/usecases/protector_usecase.dart' as _i44;
import '../domain/usecases/resource_usecase.dart' as _i48;
import '../domain/usecases/upgrade_account_usecase.dart' as _i52;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i21;
import '../domain/usecases/user_usecase.dart' as _i56;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_constants.dart' as _i84;
import '../presentation/community/community_module.dart' as _i107;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i69;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i70;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i71;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i88;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i97;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i57;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i68;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i93;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i67;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i96;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i62;
import '../presentation/general_setting/general_routes.dart' as _i9;
import '../presentation/marshop/marshop_routes.dart' as _i11;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i10;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/notification/notification_routes.dart' as _i12;
import '../presentation/notification/state/notification_bloc.dart' as _i92;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i90;
import '../presentation/protector/protector_router.dart' as _i14;
import '../presentation/qr_code/qr_code_route.dart' as _i15;
import '../presentation/routes.dart' as _i16;
import '../presentation/settings/setting_routes.dart' as _i17;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i103;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i101;
import '../presentation/social/profile/profile_bloc.dart' as _i108;
import '../presentation/social/social_routes.dart' as _i19;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i20;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i106;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i89;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i94;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i95;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i99;
import 'modules/data_source_module.dart' as _i105;

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
  gh.factory<_i14.ProtectorModule>(() => _i14.ProtectorModule());
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
  gh.factory<_i23.MarshopAPI>(() => _i23.MarshopAPI(gh<_i24.Dio>()));
  gh.factory<_i25.MarshopRepository>(
      () => _i26.MarshopRepositoryImpl(gh<_i23.MarshopAPI>()));
  gh.factory<_i27.MarshopUsecase>(
      () => _i27.MarshopUsecase(gh<_i25.MarshopRepository>()));
  gh.factory<_i28.NotificationAPI>(() => _i28.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i29.NotificationRepository>(
      () => _i30.NotificationRepositoryImpl(gh<_i28.NotificationAPI>()));
  gh.factory<_i31.NotificationUsecase>(
      () => _i31.NotificationUsecase(gh<_i29.NotificationRepository>()));
  gh.lazySingleton<_i32.OpenWeatherApi>(
      () => _i32.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i33.OpenWeatherRepository>(
      () => _i34.OpenWeatherRepositoryImpl(gh<_i32.OpenWeatherApi>()));
  gh.factory<_i35.OpenWeatherUseCase>(
      () => _i35.OpenWeatherUseCase(gh<_i33.OpenWeatherRepository>()));
  gh.factory<_i36.PlaceInformationAPI>(
      () => _i36.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i37.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i18.SharedPreferences>(),
        gh<_i37.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i38.PlaceInformationRepository>(() =>
      _i39.PlaceInformationRepositoryImpl(gh<_i36.PlaceInformationAPI>()));
  gh.factory<_i40.PlaceInformationUsecase>(() =>
      _i40.PlaceInformationUsecase(gh<_i38.PlaceInformationRepository>()));
  gh.lazySingleton<_i41.ProtectorAPI>(() => _i41.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i42.ProtectorRepository>(
      () => _i43.ProtectorRepositoryImpl(gh<_i41.ProtectorAPI>()));
  gh.factory<_i44.ProtectorUseCase>(
      () => _i44.ProtectorUseCase(gh<_i42.ProtectorRepository>()));
  gh.factory<_i45.ResourceApi>(() => _i45.ResourceApi(gh<_i24.Dio>()));
  gh.factory<_i46.ResourceRepository>(
      () => _i47.ResourceRepositoryImpl(gh<_i45.ResourceApi>()));
  gh.factory<_i48.ResourceUsecase>(
      () => _i48.ResourceUsecase(gh<_i46.ResourceRepository>()));
  gh.factory<_i49.UpgradeAccountApi>(
      () => _i49.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i50.UpgradeAccountRepository>(
      () => _i51.UpgradeAccountRepositoryImpl(
            gh<_i49.UpgradeAccountApi>(),
            gh<_i45.ResourceApi>(),
          ));
  gh.factory<_i52.UpgradeAccountUsecase>(
      () => _i52.UpgradeAccountUsecase(gh<_i50.UpgradeAccountRepository>()));
  gh.factory<_i53.UserApi>(() => _i53.UserApi(gh<_i3.Dio>()));
  gh.factory<_i54.UserRepository>(
      () => _i55.AuthRepositoryImpl(gh<_i53.UserApi>()));
  gh.factory<_i56.UserUsecase>(
      () => _i56.UserUsecase(gh<_i54.UserRepository>()));
  gh.factory<_i57.AddMemberChangeNotifier>(
      () => _i57.AddMemberChangeNotifier(gh<_i56.UserUsecase>()));
  gh.factory<_i58.AuthApi>(() => _i58.AuthApi(gh<_i24.Dio>()));
  gh.factory<_i59.AuthRepository>(
      () => _i60.AuthRepositoryImpl(gh<_i58.AuthApi>()));
  gh.factory<_i61.AuthenticationUsecase>(() => _i61.AuthenticationUsecase(
        gh<_i59.AuthRepository>(),
        gh<_i21.UserSharePreferencesUsecase>(),
        gh<_i54.UserRepository>(),
        gh<_i13.NotificationService>(),
        gh<_i31.NotificationUsecase>(),
      ));
  gh.factory<_i62.ChangePasswordController>(
      () => _i62.ChangePasswordController(gh<_i61.AuthenticationUsecase>()));
  gh.factory<_i63.CommunityApi>(() => _i63.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i64.CommunityRepository>(
      () => _i65.CommunityRepositoryImpl(gh<_i63.CommunityApi>()));
  gh.factory<_i66.CommunityUsecase>(() => _i66.CommunityUsecase(
        gh<_i64.CommunityRepository>(),
        gh<_i48.ResourceUsecase>(),
      ));
  gh.factory<_i67.DashBoardBgController>(() =>
      _i67.DashBoardBgController(gh<_i22.DashboardSharePreferenceUseCase>()));
  gh.factory<_i68.DashboardCommunityBloc>(() =>
      _i68.DashboardCommunityBloc(gh<_i22.DashboardSharePreferenceUseCase>()));
  gh.factory<_i68.DashboardEcommerceBloc>(() =>
      _i68.DashboardEcommerceBloc(gh<_i22.DashboardSharePreferenceUseCase>()));
  gh.factory<_i68.DashboardPersonalBloc>(() =>
      _i68.DashboardPersonalBloc(gh<_i22.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i69.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i69.EditCommunityDetailBloc(
        gh<_i66.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i70.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i70.EditFanGroupBloc(
        gh<_i66.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i71.FanGroupDetailBloc>(
      () => _i71.FanGroupDetailBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<_i72.GetDetailBloc<_i73.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i52.UpgradeAccountUsecase>()));
  gh.factory<_i72.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<_i72.GetDetailBloc<_i74.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i52.UpgradeAccountUsecase>()));
  gh.factory<_i72.GetDetailBloc<_i75.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i52.UpgradeAccountUsecase>()));
  gh.factory<
      _i72.GetDetailBlocParam1<_i74.UpgradeAccountResponse,
          _i76.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i52.UpgradeAccountUsecase>()));
  gh.factory<_i72.GetDetailBlocParam1<bool, _i77.VerifyPhoneOtpPayload>>(() =>
      upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i52.UpgradeAccountUsecase>()));
  gh.factory<
      _i72.GetDetailBlocParam1<_i78.ConfirmRegisterJAResponse,
          _i79.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i52.UpgradeAccountUsecase>()));
  gh.factory<_i72.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i56.UserUsecase>()));
  gh.factory<
          _i72.GetDetailBlocParam1<_i80.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<
      _i72.GetDetailBlocParam1<_i75.BankAccount,
          _i81.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i52.UpgradeAccountUsecase>()));
  gh.factory<
          _i72
          .GetDetailBlocParam1<_i82.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<
      _i72.GetDetailBlocParam2<_i83.ConfirmResponse, String,
          _i84.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<
      _i72.GetDetailBlocParam2<_i83.ConfirmResponse, String,
          _i85.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<_i72.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<_i72.GetListBloc<_i86.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i52.UpgradeAccountUsecase>()));
  gh.factory<_i72.GetListBloc<_i87.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<_i72.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<_i88.GroupDetailBloc>(
      () => _i88.GroupDetailBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<_i89.GuardianPDoneBloc>(
      () => _i89.GuardianPDoneBloc(gh<_i52.UpgradeAccountUsecase>()));
  gh.factory<_i90.ListProtectorRequestController>(
      () => _i90.ListProtectorRequestController(gh<_i44.ProtectorUseCase>()));
  gh.factory<_i90.ManageProtectController>(
      () => _i90.ManageProtectController(gh<_i44.ProtectorUseCase>()));
  gh.factory<_i91.MarshopCubit>(
      () => _i91.MarshopCubit(gh<_i27.MarshopUsecase>()));
  gh.factory<_i92.NotificationBloc>(
      () => _i92.NotificationBloc(gh<_i31.NotificationUsecase>()));
  gh.factory<_i93.OpenWeatherBloc>(
      () => _i93.OpenWeatherBloc(gh<_i35.OpenWeatherUseCase>()));
  gh.factory<_i94.PDoneInformationBloc>(
      () => _i94.PDoneInformationBloc(gh<_i52.UpgradeAccountUsecase>()));
  gh.factory<_i95.PlaceInformationBloc>(
      () => _i95.PlaceInformationBloc(gh<_i40.PlaceInformationUsecase>()));
  gh.factory<_i96.SearchCubit>(() => _i96.SearchCubit(gh<_i56.UserUsecase>()));
  gh.factory<_i97.TeamDetailBloc>(
      () => _i97.TeamDetailBloc(gh<_i66.CommunityUsecase>()));
  gh.factory<_i98.TeamRequestCubit>(
      () => _i98.TeamRequestCubit(gh<_i66.CommunityUsecase>()));
  gh.factory<_i99.UpgradePDoneBloc>(() => _i99.UpgradePDoneBloc(
        gh<_i52.UpgradeAccountUsecase>(),
        gh<_i56.UserUsecase>(),
        gh<_i21.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i100.UserActionCubit>(
      () => _i100.UserActionCubit(gh<_i56.UserUsecase>()));
  gh.factory<_i101.UserBloc>(() => _i101.UserBloc(
        gh<_i61.AuthenticationUsecase>(),
        gh<_i21.UserSharePreferencesUsecase>(),
        gh<_i56.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i102.UserCubit>(() => _i102.UserCubit(
        gh<_i61.AuthenticationUsecase>(),
        gh<_i21.UserSharePreferencesUsecase>(),
        gh<_i56.UserUsecase>(),
      ));
  gh.singleton<_i103.AppSettingBloc>(
      _i103.AppSettingBloc(gh<_i61.AuthenticationUsecase>()));
  gh.factory<_i104.AuthCubit>(
      () => _i104.AuthCubit(gh<_i61.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i105.DataSourceModule {}

class _$PlaceModule extends _i37.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i106.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i107.CommunityModule {}

class _$DiaryBlocFactory extends _i108.DiaryBlocFactory {}
