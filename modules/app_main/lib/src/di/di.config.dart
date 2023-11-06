// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i23;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i62;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import '../app_delegate.dart' as _i4;
import '../blocs/auth/auth_cubit.dart' as _i84;
import '../blocs/marshop/marshop_cubit.dart' as _i77;
import '../blocs/user/user_cubit.dart' as _i82;
import '../blocs/user_action/user_action_cubit.dart' as _i80;
import '../core/services/notifications/notification_service.dart' as _i13;
import '../data/data_sources/ekyc/ekyc_viettel.dart' as _i22;
import '../data/data_sources/remote/auth_api.dart' as _i50;
import '../data/data_sources/remote/community_api.dart' as _i54;
import '../data/data_sources/remote/marshop_api.dart' as _i24;
import '../data/data_sources/remote/notification_api.dart' as _i28;
import '../data/data_sources/remote/place_information_api.dart' as _i32;
import '../data/data_sources/remote/place_information_provider.dart' as _i33;
import '../data/data_sources/remote/resource_api.dart' as _i37;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i41;
import '../data/data_sources/remote/user_api.dart' as _i46;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i73;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i71;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i72;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i68;
import '../data/models/responses/boss_community_status_response.dart' as _i66;
import '../data/models/responses/confirm_register_ja_response.dart' as _i70;
import '../data/models/responses/confirm_response.dart' as _i69;
import '../data/models/responses/group_request_response.dart' as _i74;
import '../data/models/responses/ja_status_response.dart' as _i64;
import '../data/models/responses/upgrade_account_response.dart' as _i63;
import '../data/repositories/auth_repository.dart' as _i51;
import '../data/repositories/impl/auth_repository_impl.dart' as _i52;
import '../data/repositories/impl/community_repository.impl.dart' as _i56;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i26;
import '../data/repositories/impl/notification_repository.impl.dart' as _i30;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i35;
import '../data/repositories/impl/resource_repository.impl.dart' as _i39;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i43;
import '../data/repositories/impl/user_repository_impl.dart' as _i48;
import '../data/repositories/marshop_repository.dart' as _i25;
import '../data/repositories/notification_repository.dart' as _i29;
import '../data/repositories/user_repository.dart' as _i47;
import '../domain/entities/bank.dart' as _i75;
import '../domain/entities/commity_action_type.dart' as _i67;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i65;
import '../domain/repository/community_repository.dart' as _i55;
import '../domain/repository/place_information_repository.dart' as _i34;
import '../domain/repository/resource_responsitory.dart' as _i38;
import '../domain/repository/upgrade_account_repository.dart' as _i42;
import '../domain/usecases/authentication_usecase.dart' as _i53;
import '../domain/usecases/community_usecase.dart' as _i57;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i21;
import '../domain/usecases/marshop_usecase.dart' as _i27;
import '../domain/usecases/notification_usecase.dart' as _i31;
import '../domain/usecases/place_information_usecase.dart' as _i36;
import '../domain/usecases/resource_usecase.dart' as _i40;
import '../domain/usecases/upgrade_account_usecase.dart' as _i44;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i20;
import '../domain/usecases/user_usecase.dart' as _i49;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_module.dart' as _i87;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i59;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i60;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i61;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i76;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i79;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i58;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/general_setting/general_routes.dart' as _i10;
import '../presentation/marshop/marshop_routes.dart' as _i11;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i9;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/notification/notification_routes.dart' as _i12;
import '../presentation/qr_code/qr_code_route.dart' as _i14;
import '../presentation/routes.dart' as _i15;
import '../presentation/settings/setting_routes.dart' as _i16;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i83;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i81;
import '../presentation/social/profile/profile_bloc.dart' as _i88;
import '../presentation/social/social_routes.dart' as _i18;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i19;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i86;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i78;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i45;
import 'modules/data_source_module.dart' as _i85;

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
  gh.factory<_i14.QrCodeRoutes>(() => _i14.QrCodeRoutes());
  gh.singleton<_i15.Routes>(_i15.Routes());
  gh.factory<_i16.SettingRoutes>(() => _i16.SettingRoutes());
  await gh.singletonAsync<_i17.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i18.SocialRoutes>(() => _i18.SocialRoutes());
  gh.factory<_i19.UpgradeAccountRoutes>(() => _i19.UpgradeAccountRoutes());
  gh.factory<_i20.UserSharePreferencesUsecase>(
      () => _i20.UserSharePreferencesUsecase(gh<_i17.SharedPreferences>()));
  gh.factory<_i21.DashboardSharePreferenceUseCase>(
      () => _i21.DashboardSharePreferenceUseCase(gh<_i17.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i17.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i22.EKycViettel>(() => _i22.EKycViettel(gh<_i23.Dio>()));
  gh.factory<_i24.MarshopAPI>(() => _i24.MarshopAPI(gh<_i23.Dio>()));
  gh.factory<_i25.MarshopRepository>(
      () => _i26.MarshopRepositoryImpl(gh<_i24.MarshopAPI>()));
  gh.factory<_i27.MarshopUsecase>(
      () => _i27.MarshopUsecase(gh<_i25.MarshopRepository>()));
  gh.factory<_i28.NotificationAPI>(() => _i28.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i29.NotificationRepository>(
      () => _i30.NotificationRepositoryImpl(gh<_i28.NotificationAPI>()));
  gh.factory<_i31.NotificationUsecase>(
      () => _i31.NotificationUsecase(gh<_i29.NotificationRepository>()));
  gh.factory<_i32.PlaceInformationAPI>(
      () => _i32.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i33.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i17.SharedPreferences>(),
        gh<_i33.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i34.PlaceInformationRepository>(() =>
      _i35.PlaceInformationRepositoryImpl(gh<_i32.PlaceInformationAPI>()));
  gh.factory<_i36.PlaceInformationUsecase>(() =>
      _i36.PlaceInformationUsecase(gh<_i34.PlaceInformationRepository>()));
  gh.factory<_i37.ResourceApi>(() => _i37.ResourceApi(gh<_i23.Dio>()));
  gh.factory<_i38.ResourceRepository>(
      () => _i39.ResourceRepositoryImpl(gh<_i37.ResourceApi>()));
  gh.factory<_i40.ResourceUsecase>(
      () => _i40.ResourceUsecase(gh<_i38.ResourceRepository>()));
  gh.factory<_i41.UpgradeAccountApi>(
      () => _i41.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i42.UpgradeAccountRepository>(
      () => _i43.UpgradeAccountRepositoryImpl(gh<_i41.UpgradeAccountApi>()));
  gh.factory<_i44.UpgradeAccountUsecase>(() => _i44.UpgradeAccountUsecase(
        gh<_i42.UpgradeAccountRepository>(),
        gh<_i22.EKycViettel>(),
      ));
  gh.factory<_i45.UpgradePDoneBloc>(() => _i45.UpgradePDoneBloc(
        gh<_i44.UpgradeAccountUsecase>(),
        gh<_i40.ResourceUsecase>(),
        gh<_i20.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i46.UserApi>(() => _i46.UserApi(gh<_i3.Dio>()));
  gh.factory<_i47.UserRepository>(
      () => _i48.AuthRepositoryImpl(gh<_i46.UserApi>()));
  gh.factory<_i49.UserUsecase>(
      () => _i49.UserUsecase(gh<_i47.UserRepository>()));
  gh.factory<_i50.AuthApi>(() => _i50.AuthApi(gh<_i23.Dio>()));
  gh.factory<_i51.AuthRepository>(
      () => _i52.AuthRepositoryImpl(gh<_i50.AuthApi>()));
  gh.factory<_i53.AuthenticationUsecase>(() => _i53.AuthenticationUsecase(
        gh<_i51.AuthRepository>(),
        gh<_i20.UserSharePreferencesUsecase>(),
        gh<_i47.UserRepository>(),
      ));
  gh.factory<_i54.CommunityApi>(() => _i54.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i55.CommunityRepository>(
      () => _i56.CommunityRepositoryImpl(gh<_i54.CommunityApi>()));
  gh.factory<_i57.CommunityUsecase>(() => _i57.CommunityUsecase(
        gh<_i55.CommunityRepository>(),
        gh<_i40.ResourceUsecase>(),
      ));
  gh.factory<_i58.DashboardCommunityBloc>(() =>
      _i58.DashboardCommunityBloc(gh<_i21.DashboardSharePreferenceUseCase>()));
  gh.factory<_i58.DashboardEcommerceBloc>(() =>
      _i58.DashboardEcommerceBloc(gh<_i21.DashboardSharePreferenceUseCase>()));
  gh.factory<_i58.DashboardPersonalBloc>(() =>
      _i58.DashboardPersonalBloc(gh<_i21.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i59.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i59.EditCommunityDetailBloc(
        gh<_i57.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i60.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i60.EditFanGroupBloc(
        gh<_i57.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i61.FanGroupDetailBloc>(
      () => _i61.FanGroupDetailBloc(gh<_i57.CommunityUsecase>()));
  gh.factory<_i62.GetDetailBloc<_i63.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i44.UpgradeAccountUsecase>()));
  gh.factory<_i62.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i57.CommunityUsecase>()));
  gh.factory<_i62.GetDetailBloc<_i64.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i44.UpgradeAccountUsecase>()));
  gh.factory<_i62.GetDetailBloc<_i65.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i44.UpgradeAccountUsecase>()));
  gh.factory<
          _i62.GetDetailBlocParam1<_i66.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i57.CommunityUsecase>()));
  gh.factory<
      _i62.GetDetailBlocParam1<_i63.UpgradeAccountResponse,
          _i67.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i44.UpgradeAccountUsecase>()));
  gh.factory<_i62.GetDetailBlocParam1<bool, _i68.VerifyPhoneOtpPayload>>(() =>
      upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i44.UpgradeAccountUsecase>()));
  gh.factory<_i62.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i49.UserUsecase>()));
  gh.factory<_i62.GetDetailBlocParam1<_i69.ConfirmResponse, String>>(() =>
      communityModule
          .createRelinquishBossGroupBloc(gh<_i57.CommunityUsecase>()));
  gh.factory<
      _i62.GetDetailBlocParam1<_i70.ConfirmRegisterJAResponse,
          _i71.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i44.UpgradeAccountUsecase>()));
  gh.factory<
      _i62.GetDetailBlocParam1<_i65.BankAccount,
          _i72.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i44.UpgradeAccountUsecase>()));
  gh.factory<
      _i62.GetDetailBlocParam2<_i69.ConfirmResponse, String,
          _i73.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i57.CommunityUsecase>()));
  gh.factory<_i62.GetListBloc<_i74.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i57.CommunityUsecase>()));
  gh.factory<_i62.GetListBloc<_i75.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i44.UpgradeAccountUsecase>()));
  gh.factory<_i62.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i57.CommunityUsecase>()));
  gh.factory<_i62.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i57.CommunityUsecase>()));
  gh.factory<_i76.GroupDetailBloc>(
      () => _i76.GroupDetailBloc(gh<_i57.CommunityUsecase>()));
  gh.factory<_i77.MarshopCubit>(
      () => _i77.MarshopCubit(gh<_i27.MarshopUsecase>()));
  gh.factory<_i78.PlaceInformationBloc>(
      () => _i78.PlaceInformationBloc(gh<_i36.PlaceInformationUsecase>()));
  gh.factory<_i79.TeamDetailBloc>(
      () => _i79.TeamDetailBloc(gh<_i57.CommunityUsecase>()));
  gh.factory<_i80.UserActionCubit>(
      () => _i80.UserActionCubit(gh<_i49.UserUsecase>()));
  gh.factory<_i81.UserBloc>(() => _i81.UserBloc(
        gh<_i53.AuthenticationUsecase>(),
        gh<_i20.UserSharePreferencesUsecase>(),
        gh<_i49.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i82.UserCubit>(() => _i82.UserCubit(
        gh<_i53.AuthenticationUsecase>(),
        gh<_i20.UserSharePreferencesUsecase>(),
        gh<_i49.UserUsecase>(),
      ));
  gh.singleton<_i83.AppSettingBloc>(
      _i83.AppSettingBloc(gh<_i53.AuthenticationUsecase>()));
  gh.factory<_i84.AuthCubit>(
      () => _i84.AuthCubit(gh<_i53.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i85.DataSourceModule {}

class _$PlaceModule extends _i33.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i86.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i87.CommunityModule {}

class _$DiaryBlocFactory extends _i88.DiaryBlocFactory {}
