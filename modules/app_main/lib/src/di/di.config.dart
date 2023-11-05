// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i21;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i56;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../app_delegate.dart' as _i4;
import '../blocs/auth/auth_cubit.dart' as _i72;
import '../blocs/marshop/marshop_cubit.dart' as _i66;
import '../blocs/user/user_cubit.dart' as _i70;
import '../blocs/user_action/user_action_cubit.dart' as _i68;
import '../core/services/notifications/notification_service.dart' as _i12;
import '../data/data_sources/ekyc/ekyc_viettel.dart' as _i20;
import '../data/data_sources/remote/auth_api.dart' as _i48;
import '../data/data_sources/remote/community_api.dart' as _i52;
import '../data/data_sources/remote/marshop_api.dart' as _i22;
import '../data/data_sources/remote/notification_api.dart' as _i26;
import '../data/data_sources/remote/place_information_api.dart' as _i30;
import '../data/data_sources/remote/place_information_provider.dart' as _i31;
import '../data/data_sources/remote/resource_api.dart' as _i35;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i39;
import '../data/data_sources/remote/user_api.dart' as _i44;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i64;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i62;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i60;
import '../data/models/responses/confirm_register_ja_response.dart' as _i63;
import '../data/models/responses/ja_status_response.dart' as _i58;
import '../data/models/responses/upgrade_account_response.dart' as _i57;
import '../data/repositories/auth_repository.dart' as _i49;
import '../data/repositories/impl/auth_repository_impl.dart' as _i50;
import '../data/repositories/impl/community_repository.impl.dart' as _i54;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i24;
import '../data/repositories/impl/notification_repository.impl.dart' as _i28;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i33;
import '../data/repositories/impl/resource_repository.impl.dart' as _i37;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i41;
import '../data/repositories/impl/user_repository_impl.dart' as _i46;
import '../data/repositories/marshop_repository.dart' as _i23;
import '../data/repositories/notification_repository.dart' as _i27;
import '../data/repositories/user_repository.dart' as _i45;
import '../domain/entities/bank.dart' as _i65;
import '../domain/entities/commity_action_type.dart' as _i61;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i59;
import '../domain/repository/community_repository.dart' as _i53;
import '../domain/repository/place_information_repository.dart' as _i32;
import '../domain/repository/resource_responsitory.dart' as _i36;
import '../domain/repository/upgrade_account_repository.dart' as _i40;
import '../domain/usecases/authentication_usecase.dart' as _i51;
import '../domain/usecases/community_usecase.dart' as _i55;
import '../domain/usecases/marshop_usecase.dart' as _i25;
import '../domain/usecases/notification_usecase.dart' as _i29;
import '../domain/usecases/place_information_usecase.dart' as _i34;
import '../domain/usecases/resource_usecase.dart' as _i38;
import '../domain/usecases/upgrade_account_usecase.dart' as _i42;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i19;
import '../domain/usecases/user_usecase.dart' as _i47;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/community/community_module.dart' as _i75;
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
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i71;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i69;
import '../presentation/social/profile/profile_bloc.dart' as _i76;
import '../presentation/social/social_routes.dart' as _i17;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i18;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i74;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i67;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i43;
import 'modules/data_source_module.dart' as _i73;

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
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i16.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i20.EKycViettel>(() => _i20.EKycViettel(gh<_i21.Dio>()));
  gh.factory<_i22.MarshopAPI>(() => _i22.MarshopAPI(gh<_i21.Dio>()));
  gh.factory<_i23.MarshopRepository>(
      () => _i24.MarshopRepositoryImpl(gh<_i22.MarshopAPI>()));
  gh.factory<_i25.MarshopUsecase>(
      () => _i25.MarshopUsecase(gh<_i23.MarshopRepository>()));
  gh.factory<_i26.NotificationAPI>(() => _i26.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i27.NotificationRepository>(
      () => _i28.NotificationRepositoryImpl(gh<_i26.NotificationAPI>()));
  gh.factory<_i29.NotificationUsecase>(
      () => _i29.NotificationUsecase(gh<_i27.NotificationRepository>()));
  gh.factory<_i30.PlaceInformationAPI>(
      () => _i30.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i31.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i16.SharedPreferences>(),
        gh<_i31.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i32.PlaceInformationRepository>(() =>
      _i33.PlaceInformationRepositoryImpl(gh<_i30.PlaceInformationAPI>()));
  gh.factory<_i34.PlaceInformationUsecase>(() =>
      _i34.PlaceInformationUsecase(gh<_i32.PlaceInformationRepository>()));
  gh.factory<_i35.ResourceApi>(() => _i35.ResourceApi(gh<_i21.Dio>()));
  gh.factory<_i36.ResourceRepository>(
      () => _i37.ResourceRepositoryImpl(gh<_i35.ResourceApi>()));
  gh.factory<_i38.ResourceUsecase>(
      () => _i38.ResourceUsecase(gh<_i36.ResourceRepository>()));
  gh.factory<_i39.UpgradeAccountApi>(
      () => _i39.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i40.UpgradeAccountRepository>(
      () => _i41.UpgradeAccountRepositoryImpl(gh<_i39.UpgradeAccountApi>()));
  gh.factory<_i42.UpgradeAccountUsecase>(() => _i42.UpgradeAccountUsecase(
        gh<_i40.UpgradeAccountRepository>(),
        gh<_i20.EKycViettel>(),
      ));
  gh.factory<_i43.UpgradePDoneBloc>(() => _i43.UpgradePDoneBloc(
        gh<_i42.UpgradeAccountUsecase>(),
        gh<_i38.ResourceUsecase>(),
        gh<_i19.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i44.UserApi>(() => _i44.UserApi(gh<_i3.Dio>()));
  gh.factory<_i45.UserRepository>(
      () => _i46.AuthRepositoryImpl(gh<_i44.UserApi>()));
  gh.factory<_i47.UserUsecase>(
      () => _i47.UserUsecase(gh<_i45.UserRepository>()));
  gh.factory<_i48.AuthApi>(() => _i48.AuthApi(gh<_i21.Dio>()));
  gh.factory<_i49.AuthRepository>(
      () => _i50.AuthRepositoryImpl(gh<_i48.AuthApi>()));
  gh.factory<_i51.AuthenticationUsecase>(() => _i51.AuthenticationUsecase(
        gh<_i49.AuthRepository>(),
        gh<_i19.UserSharePreferencesUsecase>(),
        gh<_i45.UserRepository>(),
      ));
  gh.factory<_i52.CommunityApi>(() => _i52.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i53.CommunityRepository>(
      () => _i54.CommunityRepositoryImpl(gh<_i52.CommunityApi>()));
  gh.factory<_i55.CommunityUsecase>(
      () => _i55.CommunityUsecase(gh<_i53.CommunityRepository>()));
  gh.factory<_i56.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i55.CommunityUsecase>()));
  gh.factory<_i56.GetDetailBloc<_i57.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i42.UpgradeAccountUsecase>()));
  gh.factory<_i56.GetDetailBloc<_i58.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i42.UpgradeAccountUsecase>()));
  gh.factory<_i56.GetDetailBloc<_i59.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i42.UpgradeAccountUsecase>()));
  gh.factory<_i56.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i47.UserUsecase>()));
  gh.factory<_i56.GetDetailBlocParam1<bool, _i60.VerifyPhoneOtpPayload>>(() =>
      upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i42.UpgradeAccountUsecase>()));
  gh.factory<
      _i56.GetDetailBlocParam1<_i57.UpgradeAccountResponse,
          _i61.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i42.UpgradeAccountUsecase>()));
  gh.factory<
      _i56.GetDetailBlocParam1<_i59.BankAccount,
          _i62.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i42.UpgradeAccountUsecase>()));
  gh.factory<
      _i56.GetDetailBlocParam1<_i63.ConfirmRegisterJAResponse,
          _i64.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i42.UpgradeAccountUsecase>()));
  gh.factory<_i56.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i55.CommunityUsecase>()));
  gh.factory<_i56.GetListBloc<_i65.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i42.UpgradeAccountUsecase>()));
  gh.factory<_i56.GetListBlocParam1<_i3.Team, int>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i55.CommunityUsecase>()));
  gh.factory<_i66.MarshopCubit>(
      () => _i66.MarshopCubit(gh<_i25.MarshopUsecase>()));
  gh.factory<_i67.PlaceInformationBloc>(
      () => _i67.PlaceInformationBloc(gh<_i34.PlaceInformationUsecase>()));
  gh.factory<_i68.UserActionCubit>(
      () => _i68.UserActionCubit(gh<_i47.UserUsecase>()));
  gh.factory<_i69.UserBloc>(() => _i69.UserBloc(
        gh<_i51.AuthenticationUsecase>(),
        gh<_i19.UserSharePreferencesUsecase>(),
        gh<_i47.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i70.UserCubit>(() => _i70.UserCubit(
        gh<_i51.AuthenticationUsecase>(),
        gh<_i19.UserSharePreferencesUsecase>(),
        gh<_i47.UserUsecase>(),
      ));
  gh.singleton<_i71.AppSettingBloc>(
      _i71.AppSettingBloc(gh<_i51.AuthenticationUsecase>()));
  gh.factory<_i72.AuthCubit>(
      () => _i72.AuthCubit(gh<_i51.AuthenticationUsecase>()));
  return getIt;
}

class _$DataSourceModule extends _i73.DataSourceModule {}

class _$PlaceModule extends _i31.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i74.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i75.CommunityModule {}

class _$DiaryBlocFactory extends _i76.DiaryBlocFactory {}
