// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i20;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i58;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../app_delegate.dart' as _i4;
import '../blocs/auth/auth_cubit.dart' as _i75;
import '../blocs/marshop/marshop_cubit.dart' as _i69;
import '../blocs/user/user_cubit.dart' as _i73;
import '../core/services/notifications/notification_service.dart' as _i12;
import '../data/data_sources/ekyc/ekyc_viettel.dart' as _i19;
import '../data/data_sources/remote/auth_api.dart' as _i47;
import '../data/data_sources/remote/community_api.dart' as _i51;
import '../data/data_sources/remote/marshop_api.dart' as _i21;
import '../data/data_sources/remote/notification_api.dart' as _i25;
import '../data/data_sources/remote/place_information_api.dart' as _i29;
import '../data/data_sources/remote/place_information_provider.dart' as _i30;
import '../data/data_sources/remote/resource_api.dart' as _i34;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i38;
import '../data/data_sources/remote/user_api.dart' as _i43;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i66;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i63;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i64;
import '../data/models/responses/confirm_register_ja_response.dart' as _i65;
import '../data/models/responses/ja_status_response.dart' as _i61;
import '../data/models/responses/upgrade_account_response.dart' as _i60;
import '../data/repositories/auth_repository.dart' as _i48;
import '../data/repositories/impl/auth_repository_impl.dart' as _i49;
import '../data/repositories/impl/community_repository.impl.dart' as _i53;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i23;
import '../data/repositories/impl/notification_repository.impl.dart' as _i27;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i32;
import '../data/repositories/impl/resource_repository.impl.dart' as _i36;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i40;
import '../data/repositories/impl/user_repository_impl.dart' as _i45;
import '../data/repositories/marshop_repository.dart' as _i22;
import '../data/repositories/notification_repository.dart' as _i26;
import '../data/repositories/user_repository.dart' as _i44;
import '../domain/entities/bank.dart' as _i67;
import '../domain/entities/commity_action_type.dart' as _i62;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i59;
import '../domain/repository/community_repository.dart' as _i52;
import '../domain/repository/place_information_repository.dart' as _i31;
import '../domain/repository/resource_responsitory.dart' as _i35;
import '../domain/repository/upgrade_account_repository.dart' as _i39;
import '../domain/usecases/authentication_usecase.dart' as _i50;
import '../domain/usecases/community_usecase.dart' as _i54;
import '../domain/usecases/marshop_usecase.dart' as _i24;
import '../domain/usecases/notification_usecase.dart' as _i28;
import '../domain/usecases/place_information_usecase.dart' as _i33;
import '../domain/usecases/resource_usecase.dart' as _i37;
import '../domain/usecases/upgrade_account_usecase.dart' as _i41;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i18;
import '../domain/usecases/user_usecase.dart' as _i46;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_module.dart' as _i78;
import '../presentation/community/community_routes.dart' as _i6;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i55;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i56;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i57;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i68;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i71;
import '../presentation/dashboard/dashboard_routes.dart' as _i7;
import '../presentation/general_setting/general_routes.dart' as _i9;
import '../presentation/marshop/marshop_routes.dart' as _i11;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i10;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i8;
import '../presentation/qr_code/qr_code_route.dart' as _i13;
import '../presentation/routes.dart' as _i14;
import '../presentation/settings/setting_routes.dart' as _i15;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i74;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i72;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i17;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i77;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i70;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i42;
import 'modules/data_source_module.dart' as _i76;

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
  gh.singleton<_i4.AppDelegate>(_i4.AppDelegate());
  gh.factory<_i5.AuthenticationRoutes>(() => _i5.AuthenticationRoutes());
  gh.factory<_i6.CommunityRoutes>(() => _i6.CommunityRoutes());
  gh.factory<_i7.DashboardRoutes>(() => _i7.DashboardRoutes());
  gh.factory<_i8.DeeplinkBloc>(() => _i8.DeeplinkBloc());
  gh.factory<_i9.GeneralRoutes>(() => _i9.GeneralRoutes());
  gh.factory<_i10.GeneralRoutes>(() => _i10.GeneralRoutes());
  gh.factory<_i11.MarkShopRoutes>(() => _i11.MarkShopRoutes());
  gh.singleton<_i12.NotificationService>(
      _i12.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i13.QrCodeRoutes>(() => _i13.QrCodeRoutes());
  gh.singleton<_i14.Routes>(_i14.Routes());
  gh.factory<_i15.SettingRoutes>(() => _i15.SettingRoutes());
  await gh.singletonAsync<_i16.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i17.UpgradeAccountRoutes>(() => _i17.UpgradeAccountRoutes());
  gh.factory<_i18.UserSharePreferencesUsecase>(
      () => _i18.UserSharePreferencesUsecase(gh<_i16.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i16.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i19.EKycViettel>(() => _i19.EKycViettel(gh<_i20.Dio>()));
  gh.factory<_i21.MarshopAPI>(() => _i21.MarshopAPI(gh<_i20.Dio>()));
  gh.factory<_i22.MarshopRepository>(
      () => _i23.MarshopRepositoryImpl(gh<_i21.MarshopAPI>()));
  gh.factory<_i24.MarshopUsecase>(
      () => _i24.MarshopUsecase(gh<_i22.MarshopRepository>()));
  gh.factory<_i25.NotificationAPI>(() => _i25.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i26.NotificationRepository>(
      () => _i27.NotificationRepositoryImpl(gh<_i25.NotificationAPI>()));
  gh.factory<_i28.NotificationUsecase>(
      () => _i28.NotificationUsecase(gh<_i26.NotificationRepository>()));
  gh.factory<_i29.PlaceInformationAPI>(
      () => _i29.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i30.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i16.SharedPreferences>(),
        gh<_i30.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i31.PlaceInformationRepository>(() =>
      _i32.PlaceInformationRepositoryImpl(gh<_i29.PlaceInformationAPI>()));
  gh.factory<_i33.PlaceInformationUsecase>(() =>
      _i33.PlaceInformationUsecase(gh<_i31.PlaceInformationRepository>()));
  gh.factory<_i34.ResourceApi>(() => _i34.ResourceApi(gh<_i20.Dio>()));
  gh.factory<_i35.ResourceRepository>(
      () => _i36.ResourceRepositoryImpl(gh<_i34.ResourceApi>()));
  gh.factory<_i37.ResourceUsecase>(
      () => _i37.ResourceUsecase(gh<_i35.ResourceRepository>()));
  gh.factory<_i38.UpgradeAccountApi>(
      () => _i38.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i39.UpgradeAccountRepository>(
      () => _i40.UpgradeAccountRepositoryImpl(gh<_i38.UpgradeAccountApi>()));
  gh.factory<_i41.UpgradeAccountUsecase>(() => _i41.UpgradeAccountUsecase(
        gh<_i39.UpgradeAccountRepository>(),
        gh<_i19.EKycViettel>(),
      ));
  gh.factory<_i42.UpgradePDoneBloc>(() => _i42.UpgradePDoneBloc(
        gh<_i41.UpgradeAccountUsecase>(),
        gh<_i37.ResourceUsecase>(),
        gh<_i18.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i43.UserApi>(() => _i43.UserApi(gh<_i3.Dio>()));
  gh.factory<_i44.UserRepository>(
      () => _i45.AuthRepositoryImpl(gh<_i43.UserApi>()));
  gh.factory<_i46.UserUsecase>(
      () => _i46.UserUsecase(gh<_i44.UserRepository>()));
  gh.factory<_i47.AuthApi>(() => _i47.AuthApi(gh<_i20.Dio>()));
  gh.factory<_i48.AuthRepository>(
      () => _i49.AuthRepositoryImpl(gh<_i47.AuthApi>()));
  gh.factory<_i50.AuthenticationUsecase>(() => _i50.AuthenticationUsecase(
        gh<_i48.AuthRepository>(),
        gh<_i18.UserSharePreferencesUsecase>(),
        gh<_i44.UserRepository>(),
      ));
  gh.factory<_i51.CommunityApi>(() => _i51.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i52.CommunityRepository>(
      () => _i53.CommunityRepositoryImpl(gh<_i51.CommunityApi>()));
  gh.factory<_i54.CommunityUsecase>(() => _i54.CommunityUsecase(
        gh<_i52.CommunityRepository>(),
        gh<_i37.ResourceUsecase>(),
      ));
  gh.factoryParam<_i55.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i55.EditCommunityDetailBloc(
        gh<_i54.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i56.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i56.EditFanGroupBloc(
        gh<_i54.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i57.FanGroupDetailBloc>(
      () => _i57.FanGroupDetailBloc(gh<_i54.CommunityUsecase>()));
  gh.factory<_i58.GetDetailBloc<_i59.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i41.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i54.CommunityUsecase>()));
  gh.factory<_i58.GetDetailBloc<_i60.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i41.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetDetailBloc<_i61.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i41.UpgradeAccountUsecase>()));
  gh.factory<
      _i58.GetDetailBlocParam1<_i60.UpgradeAccountResponse,
          _i62.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i41.UpgradeAccountUsecase>()));
  gh.factory<
      _i58.GetDetailBlocParam1<_i59.BankAccount,
          _i63.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i41.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetDetailBlocParam1<bool, _i64.VerifyPhoneOtpPayload>>(() =>
      upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i41.UpgradeAccountUsecase>()));
  gh.factory<
      _i58.GetDetailBlocParam1<_i65.ConfirmRegisterJAResponse,
          _i66.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i41.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetListBloc<_i67.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i41.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i54.CommunityUsecase>()));
  gh.factory<_i58.GetListBlocParam1<_i3.Team, int>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i54.CommunityUsecase>()));
  gh.factory<_i68.GroupDetailBloc>(
      () => _i68.GroupDetailBloc(gh<_i54.CommunityUsecase>()));
  gh.factory<_i69.MarshopCubit>(
      () => _i69.MarshopCubit(gh<_i24.MarshopUsecase>()));
  gh.factory<_i70.PlaceInformationBloc>(
      () => _i70.PlaceInformationBloc(gh<_i33.PlaceInformationUsecase>()));
  gh.factory<_i71.TeamDetailBloc>(
      () => _i71.TeamDetailBloc(gh<_i54.CommunityUsecase>()));
  gh.factory<_i72.UserBloc>(() => _i72.UserBloc(
        gh<_i50.AuthenticationUsecase>(),
        gh<_i18.UserSharePreferencesUsecase>(),
        gh<_i46.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i73.UserCubit>(() => _i73.UserCubit(
        gh<_i50.AuthenticationUsecase>(),
        gh<_i18.UserSharePreferencesUsecase>(),
        gh<_i46.UserUsecase>(),
      ));
  gh.singleton<_i74.AppSettingBloc>(
      _i74.AppSettingBloc(gh<_i50.AuthenticationUsecase>()));
  gh.factory<_i75.AuthCubit>(
      () => _i75.AuthCubit(gh<_i50.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i76.DataSourceModule {}

class _$PlaceModule extends _i30.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i77.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i78.CommunityModule {}
