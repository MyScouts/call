// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i37;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i105;
import 'package:shared_preferences/shared_preferences.dart' as _i30;
import 'package:wallet/core/core.dart' as _i34;
import 'package:wallet/di/wallet_micro.module.dart' as _i149;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i145;
import '../blocs/approved_request/approved_request_cubit.dart' as _i82;
import '../blocs/auth/auth_cubit.dart' as _i147;
import '../blocs/community/team_request/team_request_cubit.dart' as _i139;
import '../blocs/marshop/marshop_cubit.dart' as _i130;
import '../blocs/user/user_cubit.dart' as _i143;
import '../blocs/user_action/user_action_cubit.dart' as _i141;
import '../core/services/live_service/impl/live_service_impl.dart' as _i18;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i20;
import '../core/services/live_service/live_service.dart' as _i17;
import '../core/services/live_service/live_socket_service.dart' as _i19;
import '../core/services/notifications/notification_service.dart' as _i25;
import '../core/socket/chat_socket.dart' as _i7;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i41;
import '../data/data_sources/remote/auth_api.dart' as _i83;
import '../data/data_sources/remote/chat_api.dart' as _i89;
import '../data/data_sources/remote/community_api.dart' as _i93;
import '../data/data_sources/remote/friend_api.dart' as _i36;
import '../data/data_sources/remote/marshop_api.dart' as _i47;
import '../data/data_sources/remote/notification_api.dart' as _i51;
import '../data/data_sources/remote/open_weather_api.dart' as _i55;
import '../data/data_sources/remote/place_information_api.dart' as _i59;
import '../data/data_sources/remote/place_information_provider.dart' as _i60;
import '../data/data_sources/remote/protector_api.dart' as _i64;
import '../data/data_sources/remote/resource_api.dart' as _i68;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i72;
import '../data/data_sources/remote/user_api.dart' as _i77;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i117;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i114;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i110;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i112;
import '../data/models/responses/boss_community_status_response.dart' as _i109;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i115;
import '../data/models/responses/confirm_register_ja_response.dart' as _i113;
import '../data/models/responses/confirm_response.dart' as _i116;
import '../data/models/responses/group_request_response.dart' as _i120;
import '../data/models/responses/ja_status_response.dart' as _i106;
import '../data/models/responses/upgrade_account_response.dart' as _i108;
import '../data/repositories/auth_repository.dart' as _i84;
import '../data/repositories/impl/auth_repository_impl.dart' as _i85;
import '../data/repositories/impl/chat_repository_impl.dart' as _i91;
import '../data/repositories/impl/community_repository.impl.dart' as _i95;
import '../data/repositories/impl/friend_repository_impl.dart' as _i39;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i49;
import '../data/repositories/impl/media_picker_impl.dart' as _i23;
import '../data/repositories/impl/notification_repository.impl.dart' as _i53;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i57;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i62;
import '../data/repositories/impl/protector_repository_impl.dart' as _i66;
import '../data/repositories/impl/resource_repository.impl.dart' as _i70;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i74;
import '../data/repositories/impl/user_repository_impl.dart' as _i79;
import '../data/repositories/marshop_repository.dart' as _i48;
import '../data/repositories/media_picker.dart' as _i22;
import '../data/repositories/notification_repository.dart' as _i52;
import '../data/repositories/protector_repository.dart' as _i65;
import '../data/repositories/user_repository.dart' as _i78;
import '../domain/entities/bank.dart' as _i119;
import '../domain/entities/commity_action_type.dart' as _i111;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i107;
import '../domain/repository/chat_repository.dart' as _i90;
import '../domain/repository/community_repository.dart' as _i94;
import '../domain/repository/friend_repository.dart' as _i38;
import '../domain/repository/open_weather_repository.dart' as _i56;
import '../domain/repository/place_information_repository.dart' as _i61;
import '../domain/repository/resource_repository.dart' as _i69;
import '../domain/repository/upgrade_account_repository.dart' as _i73;
import '../domain/usecases/authentication_usecase.dart' as _i86;
import '../domain/usecases/chat_usecase.dart' as _i92;
import '../domain/usecases/community_usecase.dart' as _i96;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i35;
import '../domain/usecases/marshop_usecase.dart' as _i50;
import '../domain/usecases/notification_usecase.dart' as _i54;
import '../domain/usecases/open_weather_usecase.dart' as _i58;
import '../domain/usecases/place_information_usecase.dart' as _i63;
import '../domain/usecases/protector_usecase.dart' as _i67;
import '../domain/usecases/resource_usecase.dart' as _i71;
import '../domain/usecases/upgrade_account_usecase.dart' as _i75;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i33;
import '../domain/usecases/user_usecase.dart' as _i80;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i148;
import '../presentation/chat/chat_routes.dart' as _i6;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i97;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i131;
import '../presentation/community/community_constants.dart' as _i118;
import '../presentation/community/community_module.dart' as _i153;
import '../presentation/community/community_routes.dart' as _i8;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i101;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i102;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i104;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i122;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i138;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i81;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i99;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i100;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i133;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i98;
import '../presentation/dashboard/dashboard_module.dart' as _i155;
import '../presentation/dashboard/dashboard_routes.dart' as _i9;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i137;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i88;
import '../presentation/general_setting/general_routes.dart' as _i13;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i124;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i42;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i136;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i14;
import '../presentation/live/data/data_sources/remote/live_api.dart' as _i43;
import '../presentation/live/data/repository/live_repository.dart' as _i44;
import '../presentation/live/data/repository/repository_impl/live_repository_impl.dart'
    as _i45;
import '../presentation/live/domain/usecases/gift_share_preferences_usecase.dart'
    as _i40;
import '../presentation/live/domain/usecases/live_usecases.dart' as _i46;
import '../presentation/live/live_routes.dart' as _i16;
import '../presentation/live/presentation/channel/state/live_channel_controller.dart'
    as _i127;
import '../presentation/live/presentation/channel/widget/sent_gift_page.dart'
    as _i11;
import '../presentation/live/presentation/create/state/live_create_controller.dart'
    as _i129;
import '../presentation/live/presentation/create/widget/live_category_picker.dart'
    as _i87;
import '../presentation/live/presentation/list_gift/gift_controller.dart'
    as _i121;
import '../presentation/live/presentation/live_bottom/live_bottom_controller.dart'
    as _i126;
import '../presentation/live/presentation/live_message/state/live_message_bloc.dart'
    as _i15;
import '../presentation/live/presentation/live_tab/live_controller.dart'
    as _i128;
import '../presentation/marshop/marshop_routes.dart' as _i21;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i12;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i10;
import '../presentation/notification/notification_routes.dart' as _i24;
import '../presentation/notification/state/notification_bloc.dart' as _i132;
import '../presentation/otp_verify/email_otp_verify.dart' as _i103;
import '../presentation/profile/state/user_profile_bloc.dart' as _i144;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i125;
import '../presentation/protector/protector_router.dart' as _i26;
import '../presentation/qr_code/qr_code_route.dart' as _i27;
import '../presentation/routes.dart' as _i28;
import '../presentation/settings/setting_routes.dart' as _i29;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i146;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i142;
import '../presentation/social/profile/profile_bloc.dart' as _i154;
import '../presentation/social/social_routes.dart' as _i31;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i32;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i152;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i123;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i134;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i135;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i76;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i140;
import 'modules/config_module.dart' as _i151;
import 'modules/data_source_module.dart' as _i150;

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
  gh.factory<_i7.ChatSocket>(() => _i7.ChatSocket());
  gh.factory<_i8.CommunityRoutes>(() => _i8.CommunityRoutes());
  gh.factory<_i9.DashboardRoutes>(() => _i9.DashboardRoutes());
  gh.factory<_i10.DeeplinkBloc>(() => _i10.DeeplinkBloc());
  gh.factory<_i11.FloatingGiftsProvider>(() => _i11.FloatingGiftsProvider());
  gh.factory<_i12.GeneralRoutes>(() => _i12.GeneralRoutes());
  gh.factory<_i13.GeneralRoutes>(() => _i13.GeneralRoutes());
  gh.factory<_i14.InfoProfileRoutes>(() => _i14.InfoProfileRoutes());
  gh.factory<_i15.LiveMessageBloc>(() => _i15.LiveMessageBloc());
  gh.factory<_i16.LiveRoutes>(() => _i16.LiveRoutes());
  gh.factory<_i17.LiveService>(() => _i18.LiveServiceImpl());
  gh.factory<_i19.LiveSocketService>(() => _i20.LiveSocketServiceImpl());
  gh.factory<_i21.MarkShopRoutes>(() => _i21.MarkShopRoutes());
  gh.lazySingleton<_i22.MediaPicker>(() => _i23.MediaPickerImpl());
  gh.factory<_i24.NotificationRoutes>(() => _i24.NotificationRoutes());
  gh.singleton<_i25.NotificationService>(
      _i25.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i26.ProtectorModule>(() => _i26.ProtectorModule());
  gh.factory<_i27.QrCodeRoutes>(() => _i27.QrCodeRoutes());
  gh.singleton<_i28.Routes>(_i28.Routes());
  gh.factory<_i29.SettingRoutes>(() => _i29.SettingRoutes());
  await gh.singletonAsync<_i30.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i31.SocialRoutes>(() => _i31.SocialRoutes());
  gh.factory<_i32.UpgradeAccountRoutes>(() => _i32.UpgradeAccountRoutes());
  gh.factory<_i33.UserSharePreferencesUsecase>(
      () => _i33.UserSharePreferencesUsecase(gh<_i30.SharedPreferences>()));
  gh.singleton<_i34.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i35.DashboardSharePreferenceUseCase>(
      () => _i35.DashboardSharePreferenceUseCase(gh<_i30.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i30.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i36.FriendApi>(() => _i36.FriendApi(gh<_i37.Dio>()));
  gh.factory<_i38.FriendRepository>(
      () => _i39.FriendRepositoryImpl(gh<_i36.FriendApi>()));
  gh.factory<_i40.GiftSharePreferencesUseCase>(
      () => _i40.GiftSharePreferencesUseCase(gh<_i30.SharedPreferences>()));
  gh.factory<_i41.InformationPDoneSharePreferencesUsecase>(() =>
      _i41.InformationPDoneSharePreferencesUsecase(
          gh<_i30.SharedPreferences>()));
  gh.factory<_i42.InformationPdoneProfileCubit>(() =>
      _i42.InformationPdoneProfileCubit(
          gh<_i41.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i43.LiveApi>(() => _i43.LiveApi(gh<_i3.Dio>()));
  gh.factory<_i44.LiveRepository>(
      () => _i45.LiveRepositoryImpl(gh<_i43.LiveApi>()));
  gh.factory<_i46.LiveUseCase>(
      () => _i46.LiveUseCase(gh<_i44.LiveRepository>()));
  gh.factory<_i47.MarshopAPI>(() => _i47.MarshopAPI(gh<_i37.Dio>()));
  gh.factory<_i48.MarshopRepository>(
      () => _i49.MarshopRepositoryImpl(gh<_i47.MarshopAPI>()));
  gh.factory<_i50.MarshopUsecase>(
      () => _i50.MarshopUsecase(gh<_i48.MarshopRepository>()));
  gh.factory<_i51.NotificationAPI>(() => _i51.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i52.NotificationRepository>(
      () => _i53.NotificationRepositoryImpl(gh<_i51.NotificationAPI>()));
  gh.factory<_i54.NotificationUsecase>(
      () => _i54.NotificationUsecase(gh<_i52.NotificationRepository>()));
  gh.lazySingleton<_i55.OpenWeatherApi>(
      () => _i55.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i56.OpenWeatherRepository>(
      () => _i57.OpenWeatherRepositoryImpl(gh<_i55.OpenWeatherApi>()));
  gh.factory<_i58.OpenWeatherUseCase>(
      () => _i58.OpenWeatherUseCase(gh<_i56.OpenWeatherRepository>()));
  gh.factory<_i59.PlaceInformationAPI>(
      () => _i59.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i60.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i30.SharedPreferences>(),
        gh<_i60.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i61.PlaceInformationRepository>(() =>
      _i62.PlaceInformationRepositoryImpl(gh<_i59.PlaceInformationAPI>()));
  gh.factory<_i63.PlaceInformationUsecase>(() =>
      _i63.PlaceInformationUsecase(gh<_i61.PlaceInformationRepository>()));
  gh.lazySingleton<_i64.ProtectorAPI>(() => _i64.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i65.ProtectorRepository>(
      () => _i66.ProtectorRepositoryImpl(gh<_i64.ProtectorAPI>()));
  gh.factory<_i67.ProtectorUseCase>(
      () => _i67.ProtectorUseCase(gh<_i65.ProtectorRepository>()));
  gh.factory<_i68.ResourceApi>(() => _i68.ResourceApi(gh<_i37.Dio>()));
  gh.factory<_i69.ResourceRepository>(
      () => _i70.ResourceRepositoryImpl(gh<_i68.ResourceApi>()));
  gh.factory<_i71.ResourceUsecase>(
      () => _i71.ResourceUsecase(gh<_i69.ResourceRepository>()));
  gh.factory<_i72.UpgradeAccountApi>(
      () => _i72.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i73.UpgradeAccountRepository>(
      () => _i74.UpgradeAccountRepositoryImpl(
            gh<_i72.UpgradeAccountApi>(),
            gh<_i68.ResourceApi>(),
          ));
  gh.factory<_i75.UpgradeAccountUsecase>(
      () => _i75.UpgradeAccountUsecase(gh<_i73.UpgradeAccountRepository>()));
  gh.factory<_i76.UpgradeCubit>(
      () => _i76.UpgradeCubit(gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<_i77.UserApi>(() => _i77.UserApi(gh<_i3.Dio>()));
  gh.factory<_i78.UserRepository>(
      () => _i79.AuthRepositoryImpl(gh<_i77.UserApi>()));
  gh.factory<_i80.UserUsecase>(
      () => _i80.UserUsecase(gh<_i78.UserRepository>()));
  gh.factory<_i81.AddMemberChangeNotifier>(
      () => _i81.AddMemberChangeNotifier(gh<_i80.UserUsecase>()));
  gh.factory<_i82.ApprovedRequestCubit>(
      () => _i82.ApprovedRequestCubit(gh<_i80.UserUsecase>()));
  gh.factory<_i83.AuthApi>(() => _i83.AuthApi(gh<_i37.Dio>()));
  gh.factory<_i84.AuthRepository>(
      () => _i85.AuthRepositoryImpl(gh<_i83.AuthApi>()));
  gh.factory<_i86.AuthenticationUsecase>(() => _i86.AuthenticationUsecase(
        gh<_i84.AuthRepository>(),
        gh<_i33.UserSharePreferencesUsecase>(),
        gh<_i78.UserRepository>(),
        gh<_i25.NotificationService>(),
        gh<_i7.ChatSocket>(),
      ));
  gh.factory<_i87.CategoryController>(
      () => _i87.CategoryController(gh<_i44.LiveRepository>()));
  gh.factory<_i88.ChangePasswordController>(
      () => _i88.ChangePasswordController(gh<_i86.AuthenticationUsecase>()));
  gh.factory<_i89.ChatApi>(() => _i89.ChatApi(gh<_i37.Dio>()));
  gh.factory<_i90.ChatRepository>(
      () => _i91.ChatRepositoryImpl(gh<_i89.ChatApi>()));
  gh.factory<_i92.ChatUseCase>(() => _i92.ChatUseCase(
        gh<_i90.ChatRepository>(),
        gh<_i38.FriendRepository>(),
      ));
  gh.factory<_i93.CommunityApi>(() => _i93.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i94.CommunityRepository>(
      () => _i95.CommunityRepositoryImpl(gh<_i93.CommunityApi>()));
  gh.factory<_i96.CommunityUsecase>(() => _i96.CommunityUsecase(
        gh<_i94.CommunityRepository>(),
        gh<_i71.ResourceUsecase>(),
      ));
  gh.singleton<_i97.ConversationCubit>(
      _i97.ConversationCubit(gh<_i92.ChatUseCase>()));
  gh.factory<_i98.DashBoardBgController>(() =>
      _i98.DashBoardBgController(gh<_i35.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i99.DashBoardScreenController>(() =>
      _i99.DashBoardScreenController(
          gh<_i35.DashboardSharePreferenceUseCase>()));
  gh.factory<_i100.DashboardCommunityBloc>(() =>
      _i100.DashboardCommunityBloc(gh<_i35.DashboardSharePreferenceUseCase>()));
  gh.factory<_i100.DashboardEcommerceBloc>(() =>
      _i100.DashboardEcommerceBloc(gh<_i35.DashboardSharePreferenceUseCase>()));
  gh.factory<_i100.DashboardPersonalBloc>(() =>
      _i100.DashboardPersonalBloc(gh<_i35.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i101.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i101.EditCommunityDetailBloc(
        gh<_i96.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i102.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i102.EditFanGroupBloc(
        gh<_i96.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i103.EmailVerifyController>(
      () => _i103.EmailVerifyController(gh<_i80.UserUsecase>()));
  gh.factory<_i104.FanGroupDetailBloc>(
      () => _i104.FanGroupDetailBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<_i105.GetDetailBloc<_i106.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<_i105.GetDetailBloc<_i107.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<_i105.GetDetailBloc<_i108.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<_i105.GetDetailBloc<_i3.FanGroup>>(
      () => communityModule.createGetFanGroupBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<
          _i105.GetDetailBlocParam1<_i109.BossCommunityStatusResponse, String>>(
      () =>
          communityModule.createGetBossStatusBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<
      _i105.GetDetailBlocParam1<_i107.BankAccount,
          _i110.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<
      _i105.GetDetailBlocParam1<_i108.UpgradeAccountResponse,
          _i111.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<_i105.GetDetailBlocParam1<dynamic, _i112.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<_i105.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i80.UserUsecase>()));
  gh.factory<
      _i105.GetDetailBlocParam1<_i113.ConfirmRegisterJAResponse,
          _i114.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<
          _i105
          .GetDetailBlocParam1<_i115.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<
      _i105.GetDetailBlocParam2<_i116.ConfirmResponse, String,
          _i117.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<
      _i105.GetDetailBlocParam2<_i116.ConfirmResponse, String,
          _i118.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<_i105.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i96.CommunityUsecase>()));
  gh.factory<_i105.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<_i105.GetListBloc<_i119.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<_i105.GetListBloc<_i120.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<_i105.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<_i121.GiftController>(
      () => _i121.GiftController(gh<_i46.LiveUseCase>()));
  gh.factory<_i122.GroupDetailBloc>(
      () => _i122.GroupDetailBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<_i123.GuardianPDoneBloc>(
      () => _i123.GuardianPDoneBloc(gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<_i124.InformationUpdateProfilBloc>(
      () => _i124.InformationUpdateProfilBloc(
            gh<_i80.UserUsecase>(),
            gh<_i41.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i125.ListProtectorRequestController>(
      () => _i125.ListProtectorRequestController(gh<_i67.ProtectorUseCase>()));
  gh.factory<_i126.LiveBottomController>(() => _i126.LiveBottomController(
        gh<_i46.LiveUseCase>(),
        gh<_i80.UserUsecase>(),
      ));
  gh.factory<_i127.LiveChannelController>(() => _i127.LiveChannelController(
        gh<_i44.LiveRepository>(),
        gh<_i33.UserSharePreferencesUsecase>(),
        gh<_i80.UserUsecase>(),
        gh<_i17.LiveService>(),
        gh<_i19.LiveSocketService>(),
        gh<_i11.FloatingGiftsProvider>(),
      ));
  gh.factory<_i128.LiveController>(
      () => _i128.LiveController(gh<_i46.LiveUseCase>()));
  gh.factory<_i129.LiveCreateController>(() => _i129.LiveCreateController(
        gh<_i44.LiveRepository>(),
        gh<_i17.LiveService>(),
      ));
  gh.factory<_i125.ManageProtectController>(
      () => _i125.ManageProtectController(gh<_i67.ProtectorUseCase>()));
  gh.factory<_i130.MarshopCubit>(
      () => _i130.MarshopCubit(gh<_i50.MarshopUsecase>()));
  gh.factory<_i131.NewMessageCubit>(
      () => _i131.NewMessageCubit(gh<_i92.ChatUseCase>()));
  gh.factory<_i132.NotificationBloc>(
      () => _i132.NotificationBloc(gh<_i54.NotificationUsecase>()));
  gh.factory<_i133.OpenWeatherBloc>(
      () => _i133.OpenWeatherBloc(gh<_i58.OpenWeatherUseCase>()));
  gh.factory<_i134.PDoneInformationBloc>(
      () => _i134.PDoneInformationBloc(gh<_i75.UpgradeAccountUsecase>()));
  gh.factory<_i135.PlaceInformationBloc>(
      () => _i135.PlaceInformationBloc(gh<_i63.PlaceInformationUsecase>()));
  gh.factory<_i136.PlaceInformationBloc2>(
      () => _i136.PlaceInformationBloc2(gh<_i63.PlaceInformationUsecase>()));
  gh.factory<_i137.SearchCubit>(
      () => _i137.SearchCubit(gh<_i80.UserUsecase>()));
  gh.factory<_i138.TeamDetailBloc>(
      () => _i138.TeamDetailBloc(gh<_i96.CommunityUsecase>()));
  gh.factory<_i139.TeamRequestCubit>(
      () => _i139.TeamRequestCubit(gh<_i96.CommunityUsecase>()));
  gh.factory<_i140.UpgradePDoneBloc>(() => _i140.UpgradePDoneBloc(
        gh<_i75.UpgradeAccountUsecase>(),
        gh<_i80.UserUsecase>(),
        gh<_i33.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i141.UserActionCubit>(
      () => _i141.UserActionCubit(gh<_i80.UserUsecase>()));
  gh.factory<_i142.UserBloc>(() => _i142.UserBloc(
        gh<_i86.AuthenticationUsecase>(),
        gh<_i33.UserSharePreferencesUsecase>(),
        gh<_i80.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i143.UserCubit>(() => _i143.UserCubit(
        gh<_i86.AuthenticationUsecase>(),
        gh<_i33.UserSharePreferencesUsecase>(),
        gh<_i80.UserUsecase>(),
      ));
  gh.factory<_i144.UserProfileBloc>(() => _i144.UserProfileBloc(
        gh<_i80.UserUsecase>(),
        gh<_i67.ProtectorUseCase>(),
        gh<_i22.MediaPicker>(),
        gh<_i75.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i145.AppCubit>(() => _i145.AppCubit(
        gh<_i71.ResourceUsecase>(),
        gh<_i33.UserSharePreferencesUsecase>(),
        gh<_i86.AuthenticationUsecase>(),
      ));
  gh.singleton<_i146.AppSettingBloc>(
      _i146.AppSettingBloc(gh<_i86.AuthenticationUsecase>()));
  gh.factory<_i147.AuthCubit>(
      () => _i147.AuthCubit(gh<_i86.AuthenticationUsecase>()));
  gh.singleton<_i148.ChatRoomCubit>(_i148.ChatRoomCubit(
    gh<_i92.ChatUseCase>(),
    gh<_i80.UserUsecase>(),
  ));
  await _i149.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i150.DataSourceModule {}

class _$ConfigModule extends _i151.ConfigModule {}

class _$PlaceModule extends _i60.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i152.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i153.CommunityModule {}

class _$DiaryBlocFactory extends _i154.DiaryBlocFactory {}

class _$DashBoardModule extends _i155.DashBoardModule {}
