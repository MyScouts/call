// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i22;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i58;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../app_delegate.dart' as _i4;
import '../blocs/auth/auth_cubit.dart' as _i74;
import '../blocs/marshop/marshop_cubit.dart' as _i68;
import '../blocs/user/user_cubit.dart' as _i72;
import '../blocs/user_action/user_action_cubit.dart' as _i70;
import '../core/services/notifications/notification_service.dart' as _i12;
import '../data/data_sources/ekyc/ekyc_viettel.dart' as _i21;
import '../data/data_sources/remote/auth_api.dart' as _i49;
import '../data/data_sources/remote/community_api.dart' as _i53;
import '../data/data_sources/remote/marshop_api.dart' as _i23;
import '../data/data_sources/remote/notification_api.dart' as _i27;
import '../data/data_sources/remote/place_information_api.dart' as _i31;
import '../data/data_sources/remote/place_information_provider.dart' as _i32;
import '../data/data_sources/remote/resource_api.dart' as _i36;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i40;
import '../data/data_sources/remote/user_api.dart' as _i45;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i65;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i66;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i63;
import '../data/models/responses/confirm_register_ja_response.dart' as _i64;
import '../data/models/responses/ja_status_response.dart' as _i59;
import '../data/models/responses/upgrade_account_response.dart' as _i61;
import '../data/repositories/auth_repository.dart' as _i50;
import '../data/repositories/impl/auth_repository_impl.dart' as _i51;
import '../data/repositories/impl/community_repository.impl.dart' as _i55;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i25;
import '../data/repositories/impl/notification_repository.impl.dart' as _i29;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i34;
import '../data/repositories/impl/resource_repository.impl.dart' as _i38;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i42;
import '../data/repositories/impl/user_repository_impl.dart' as _i47;
import '../data/repositories/marshop_repository.dart' as _i24;
import '../data/repositories/notification_repository.dart' as _i28;
import '../data/repositories/user_repository.dart' as _i46;
import '../domain/entities/bank.dart' as _i67;
import '../domain/entities/commity_action_type.dart' as _i62;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i60;
import '../domain/repository/community_repository.dart' as _i54;
import '../domain/repository/place_information_repository.dart' as _i33;
import '../domain/repository/resource_responsitory.dart' as _i37;
import '../domain/repository/upgrade_account_repository.dart' as _i41;
import '../domain/usecases/authentication_usecase.dart' as _i52;
import '../domain/usecases/community_usecase.dart' as _i56;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i20;
import '../domain/usecases/marshop_usecase.dart' as _i26;
import '../domain/usecases/notification_usecase.dart' as _i30;
import '../domain/usecases/place_information_usecase.dart' as _i35;
import '../domain/usecases/resource_usecase.dart' as _i39;
import '../domain/usecases/upgrade_account_usecase.dart' as _i43;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i19;
import '../domain/usecases/user_usecase.dart' as _i48;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_module.dart' as _i76;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i57;
import '../presentation/dashboard/dashboard_routes.dart' as _i6;
import '../presentation/general_setting/general_routes.dart' as _i9;
import '../presentation/marshop/marshop_routes.dart' as _i10;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i8;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i7;
import '../presentation/notification/notification_routes.dart' as _i11;
import '../presentation/qr_code/qr_code_route.dart' as _i13;
import '../presentation/routes.dart' as _i14;
import '../presentation/settings/setting_routes.dart' as _i15;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i73;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i71;
import '../presentation/social/profile/profile_bloc.dart' as _i78;
import '../presentation/social/social_routes.dart' as _i17;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i18;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i77;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i69;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i44;
import 'modules/data_source_module.dart' as _i75;

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
  gh.singleton<_i4.AppDelegate>(_i4.AppDelegate());
  gh.factory<_i5.AuthenticationRoutes>(() => _i5.AuthenticationRoutes());
  gh.factory<_i6.DashboardRoutes>(() => _i6.DashboardRoutes());
  gh.factory<_i7.DeeplinkBloc>(() => _i7.DeeplinkBloc());
  gh.factory<_i8.GeneralRoutes>(() => _i8.GeneralRoutes());
  gh.factory<_i9.GeneralRoutes>(() => _i9.GeneralRoutes());
  gh.factory<_i10.MarkShopRoutes>(() => _i10.MarkShopRoutes());
  gh.factory<_i11.NotificationRoutes>(() => _i11.NotificationRoutes());
  gh.singleton<_i12.NotificationService>(
      _i12.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i13.QrCodeRoutes>(() => _i13.QrCodeRoutes());
  gh.singleton<_i14.Routes>(_i14.Routes());
  gh.factory<_i15.SettingRoutes>(() => _i15.SettingRoutes());
  await gh.singletonAsync<_i16.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i17.SocialRoutes>(() => _i17.SocialRoutes());
  gh.factory<_i18.UpgradeAccountRoutes>(() => _i18.UpgradeAccountRoutes());
  gh.factory<_i19.UserSharePreferencesUsecase>(
      () => _i19.UserSharePreferencesUsecase(gh<_i16.SharedPreferences>()));
  gh.factory<_i20.DashboardSharePreferenceUseCase>(
      () => _i20.DashboardSharePreferenceUseCase(gh<_i16.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i16.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i21.EKycViettel>(() => _i21.EKycViettel(gh<_i22.Dio>()));
  gh.factory<_i23.MarshopAPI>(() => _i23.MarshopAPI(gh<_i22.Dio>()));
  gh.factory<_i24.MarshopRepository>(
      () => _i25.MarshopRepositoryImpl(gh<_i23.MarshopAPI>()));
  gh.factory<_i26.MarshopUsecase>(
      () => _i26.MarshopUsecase(gh<_i24.MarshopRepository>()));
  gh.factory<_i27.NotificationAPI>(() => _i27.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i28.NotificationRepository>(
      () => _i29.NotificationRepositoryImpl(gh<_i27.NotificationAPI>()));
  gh.factory<_i30.NotificationUsecase>(
      () => _i30.NotificationUsecase(gh<_i28.NotificationRepository>()));
  gh.factory<_i31.PlaceInformationAPI>(
      () => _i31.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i32.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i16.SharedPreferences>(),
        gh<_i32.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i33.PlaceInformationRepository>(() =>
      _i34.PlaceInformationRepositoryImpl(gh<_i31.PlaceInformationAPI>()));
  gh.factory<_i35.PlaceInformationUsecase>(() =>
      _i35.PlaceInformationUsecase(gh<_i33.PlaceInformationRepository>()));
  gh.factory<_i36.ResourceApi>(() => _i36.ResourceApi(gh<_i22.Dio>()));
  gh.factory<_i37.ResourceRepository>(
      () => _i38.ResourceRepositoryImpl(gh<_i36.ResourceApi>()));
  gh.factory<_i39.ResourceUsecase>(
      () => _i39.ResourceUsecase(gh<_i37.ResourceRepository>()));
  gh.factory<_i40.UpgradeAccountApi>(
      () => _i40.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i41.UpgradeAccountRepository>(
      () => _i42.UpgradeAccountRepositoryImpl(gh<_i40.UpgradeAccountApi>()));
  gh.factory<_i43.UpgradeAccountUsecase>(() => _i43.UpgradeAccountUsecase(
        gh<_i41.UpgradeAccountRepository>(),
        gh<_i21.EKycViettel>(),
      ));
  gh.factory<_i44.UpgradePDoneBloc>(() => _i44.UpgradePDoneBloc(
        gh<_i43.UpgradeAccountUsecase>(),
        gh<_i39.ResourceUsecase>(),
        gh<_i19.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i45.UserApi>(() => _i45.UserApi(gh<_i3.Dio>()));
  gh.factory<_i46.UserRepository>(
      () => _i47.AuthRepositoryImpl(gh<_i45.UserApi>()));
  gh.factory<_i48.UserUsecase>(
      () => _i48.UserUsecase(gh<_i46.UserRepository>()));
  gh.factory<_i49.AuthApi>(() => _i49.AuthApi(gh<_i22.Dio>()));
  gh.factory<_i50.AuthRepository>(
      () => _i51.AuthRepositoryImpl(gh<_i49.AuthApi>()));
  gh.factory<_i52.AuthenticationUsecase>(() => _i52.AuthenticationUsecase(
        gh<_i50.AuthRepository>(),
        gh<_i19.UserSharePreferencesUsecase>(),
        gh<_i46.UserRepository>(),
      ));
  gh.factory<_i53.CommunityApi>(() => _i53.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i54.CommunityRepository>(
      () => _i55.CommunityRepositoryImpl(gh<_i53.CommunityApi>()));
  gh.factory<_i56.CommunityUsecase>(
      () => _i56.CommunityUsecase(gh<_i54.CommunityRepository>()));
  gh.factory<_i57.DashboardCommunityBloc>(() =>
      _i57.DashboardCommunityBloc(gh<_i20.DashboardSharePreferenceUseCase>()));
  gh.factory<_i57.DashboardEcommerceBloc>(() =>
      _i57.DashboardEcommerceBloc(gh<_i20.DashboardSharePreferenceUseCase>()));
  gh.factory<_i57.DashboardPersonalBloc>(() =>
      _i57.DashboardPersonalBloc(gh<_i20.DashboardSharePreferenceUseCase>()));
  gh.factory<_i58.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i56.CommunityUsecase>()));
  gh.factory<_i58.GetDetailBloc<_i59.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i43.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetDetailBloc<_i60.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i43.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetDetailBloc<_i61.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i43.UpgradeAccountUsecase>()));
  gh.factory<
      _i58.GetDetailBlocParam1<_i61.UpgradeAccountResponse,
          _i62.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i43.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetDetailBlocParam1<bool, _i63.VerifyPhoneOtpPayload>>(() =>
      upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i43.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i48.UserUsecase>()));
  gh.factory<
      _i58.GetDetailBlocParam1<_i64.ConfirmRegisterJAResponse,
          _i65.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i43.UpgradeAccountUsecase>()));
  gh.factory<
      _i58.GetDetailBlocParam1<_i60.BankAccount,
          _i66.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i43.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetListBloc<_i67.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i43.UpgradeAccountUsecase>()));
  gh.factory<_i58.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i56.CommunityUsecase>()));
  gh.factory<_i58.GetListBlocParam1<_i3.Team, int>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i56.CommunityUsecase>()));
  gh.factory<_i68.MarshopCubit>(
      () => _i68.MarshopCubit(gh<_i26.MarshopUsecase>()));
  gh.factory<_i69.PlaceInformationBloc>(
      () => _i69.PlaceInformationBloc(gh<_i35.PlaceInformationUsecase>()));
  gh.factory<_i70.UserActionCubit>(
      () => _i70.UserActionCubit(gh<_i48.UserUsecase>()));
  gh.factory<_i71.UserBloc>(() => _i71.UserBloc(
        gh<_i52.AuthenticationUsecase>(),
        gh<_i19.UserSharePreferencesUsecase>(),
        gh<_i48.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i72.UserCubit>(() => _i72.UserCubit(
        gh<_i52.AuthenticationUsecase>(),
        gh<_i19.UserSharePreferencesUsecase>(),
        gh<_i48.UserUsecase>(),
      ));
  gh.singleton<_i73.AppSettingBloc>(
      _i73.AppSettingBloc(gh<_i52.AuthenticationUsecase>()));
  gh.factory<_i74.AuthCubit>(
      () => _i74.AuthCubit(gh<_i52.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i75.DataSourceModule {}

class _$PlaceModule extends _i32.PlaceModule {}

class _$CommunityModule extends _i76.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i77.UpgradeAgreePolicyBlocFactory {}

class _$DiaryBlocFactory extends _i78.DiaryBlocFactory {}
