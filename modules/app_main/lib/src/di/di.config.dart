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
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i44;
import 'package:shared_preferences/shared_preferences.dart' as _i30;
import 'package:wallet/core/core.dart' as _i34;
import 'package:wallet/di/wallet_micro.module.dart' as _i156;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i152;
import '../blocs/approved_request/approved_request_cubit.dart' as _i88;
import '../blocs/auth/auth_cubit.dart' as _i154;
import '../blocs/community/team_request/team_request_cubit.dart' as _i146;
import '../blocs/marshop/marshop_cubit.dart' as _i137;
import '../blocs/user/user_cubit.dart' as _i150;
import '../blocs/user_action/user_action_cubit.dart' as _i148;
import '../core/services/live_service/impl/live_service_impl.dart' as _i18;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i20;
import '../core/services/live_service/live_service.dart' as _i17;
import '../core/services/live_service/live_socket_service.dart' as _i19;
import '../core/services/notifications/notification_service.dart' as _i25;
import '../core/socket/chat_socket.dart' as _i7;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i47;
import '../data/data_sources/remote/auth_api.dart' as _i89;
import '../data/data_sources/remote/chat_api.dart' as _i95;
import '../data/data_sources/remote/community_api.dart' as _i99;
import '../data/data_sources/remote/ecom_api.dart' as _i36;
import '../data/data_sources/remote/friend_api.dart' as _i41;
import '../data/data_sources/remote/marshop_api.dart' as _i53;
import '../data/data_sources/remote/notification_api.dart' as _i57;
import '../data/data_sources/remote/open_weather_api.dart' as _i61;
import '../data/data_sources/remote/place_information_api.dart' as _i65;
import '../data/data_sources/remote/place_information_provider.dart' as _i66;
import '../data/data_sources/remote/protector_api.dart' as _i70;
import '../data/data_sources/remote/resource_api.dart' as _i74;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i78;
import '../data/data_sources/remote/user_api.dart' as _i83;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i125;
import '../data/models/payloads/marshop/marshop_payload.dart' as _i115;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i120;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i117;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i118;
import '../data/models/responses/boss_community_status_response.dart' as _i122;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i121;
import '../data/models/responses/confirm_register_ja_response.dart' as _i119;
import '../data/models/responses/confirm_response.dart' as _i123;
import '../data/models/responses/ecom/product_detail_response.dart' as _i45;
import '../data/models/responses/group_request_response.dart' as _i127;
import '../data/models/responses/ja_status_response.dart' as _i112;
import '../data/models/responses/marshop_response.dart' as _i114;
import '../data/models/responses/upgrade_account_response.dart' as _i111;
import '../data/repositories/auth_repository.dart' as _i90;
import '../data/repositories/ecom_repository.dart' as _i38;
import '../data/repositories/impl/auth_repository_impl.dart' as _i91;
import '../data/repositories/impl/chat_repository_impl.dart' as _i97;
import '../data/repositories/impl/community_repository.impl.dart' as _i101;
import '../data/repositories/impl/ecom_repository_impl.dart' as _i39;
import '../data/repositories/impl/friend_repository_impl.dart' as _i43;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i55;
import '../data/repositories/impl/media_picker_impl.dart' as _i23;
import '../data/repositories/impl/notification_repository.impl.dart' as _i59;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i63;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i68;
import '../data/repositories/impl/protector_repository_impl.dart' as _i72;
import '../data/repositories/impl/resource_repository.impl.dart' as _i76;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i80;
import '../data/repositories/impl/user_repository_impl.dart' as _i85;
import '../data/repositories/marshop_repository.dart' as _i54;
import '../data/repositories/media_picker.dart' as _i22;
import '../data/repositories/notification_repository.dart' as _i58;
import '../data/repositories/protector_repository.dart' as _i71;
import '../data/repositories/user_repository.dart' as _i84;
import '../domain/entities/bank.dart' as _i126;
import '../domain/entities/commity_action_type.dart' as _i116;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i113;
import '../domain/repository/chat_repository.dart' as _i96;
import '../domain/repository/community_repository.dart' as _i100;
import '../domain/repository/friend_repository.dart' as _i42;
import '../domain/repository/open_weather_repository.dart' as _i62;
import '../domain/repository/place_information_repository.dart' as _i67;
import '../domain/repository/resource_repository.dart' as _i75;
import '../domain/repository/upgrade_account_repository.dart' as _i79;
import '../domain/usecases/authentication_usecase.dart' as _i92;
import '../domain/usecases/chat_usecase.dart' as _i98;
import '../domain/usecases/community_usecase.dart' as _i102;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i35;
import '../domain/usecases/ecom_usecase.dart' as _i40;
import '../domain/usecases/marshop_usecase.dart' as _i56;
import '../domain/usecases/notification_usecase.dart' as _i60;
import '../domain/usecases/open_weather_usecase.dart' as _i64;
import '../domain/usecases/place_information_usecase.dart' as _i69;
import '../domain/usecases/protector_usecase.dart' as _i73;
import '../domain/usecases/resource_usecase.dart' as _i77;
import '../domain/usecases/upgrade_account_usecase.dart' as _i81;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i33;
import '../domain/usecases/user_usecase.dart' as _i86;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i155;
import '../presentation/chat/chat_routes.dart' as _i6;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i103;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i138;
import '../presentation/community/community_constants.dart' as _i124;
import '../presentation/community/community_module.dart' as _i160;
import '../presentation/community/community_routes.dart' as _i8;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i107;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i108;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i110;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i129;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i145;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i87;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i105;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i106;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i140;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i104;
import '../presentation/dashboard/dashboard_module.dart' as _i163;
import '../presentation/dashboard/dashboard_routes.dart' as _i9;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i144;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i94;
import '../presentation/general_setting/general_routes.dart' as _i13;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i131;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i48;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i143;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i14;
import '../presentation/live/data/data_sources/remote/live_api.dart' as _i49;
import '../presentation/live/data/repository/live_repository.dart' as _i50;
import '../presentation/live/data/repository/repository_impl/live_repository_impl.dart'
    as _i51;
import '../presentation/live/domain/usecases/gift_share_preferences_usecase.dart'
    as _i46;
import '../presentation/live/domain/usecases/live_usecases.dart' as _i52;
import '../presentation/live/live_routes.dart' as _i16;
import '../presentation/live/presentation/channel/state/live_channel_controller.dart'
    as _i134;
import '../presentation/live/presentation/channel/widget/sent_gift_page.dart'
    as _i11;
import '../presentation/live/presentation/create/state/live_create_controller.dart'
    as _i136;
import '../presentation/live/presentation/create/widget/live_category_picker.dart'
    as _i93;
import '../presentation/live/presentation/list_gift/gift_controller.dart'
    as _i128;
import '../presentation/live/presentation/live_bottom/live_bottom_controller.dart'
    as _i133;
import '../presentation/live/presentation/live_message/state/live_message_bloc.dart'
    as _i15;
import '../presentation/live/presentation/live_tab/live_controller.dart'
    as _i135;
import '../presentation/marshop/marshop_bloc.dart' as _i159;
import '../presentation/marshop/marshop_routes.dart' as _i21;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i12;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i10;
import '../presentation/notification/notification_routes.dart' as _i24;
import '../presentation/notification/state/notification_bloc.dart' as _i139;
import '../presentation/otp_verify/email_otp_verify.dart' as _i109;
import '../presentation/profile/state/user_profile_bloc.dart' as _i151;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i132;
import '../presentation/protector/protector_router.dart' as _i26;
import '../presentation/qr_code/qr_code_route.dart' as _i27;
import '../presentation/routes.dart' as _i28;
import '../presentation/settings/setting_routes.dart' as _i29;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i153;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i149;
import '../presentation/social/profile/profile_bloc.dart' as _i162;
import '../presentation/social/social_routes.dart' as _i31;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i32;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i161;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i130;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i141;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i142;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i82;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i147;
import 'modules/config_module.dart' as _i158;
import 'modules/data_source_module.dart' as _i157;

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
  final marshopBlocFactory = _$MarshopBlocFactory();
  final placeModule = _$PlaceModule();
  final communityModule = _$CommunityModule();
  final upgradeAgreePolicyBlocFactory = _$UpgradeAgreePolicyBlocFactory();
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
  gh.factory<_i36.EcomAPI>(() => _i36.EcomAPI(gh<_i37.Dio>()));
  gh.factory<_i38.EcomRepository>(
      () => _i39.EcomRepositoryImpl(gh<_i36.EcomAPI>()));
  gh.factory<_i40.EcomUsecase>(
      () => _i40.EcomUsecase(gh<_i38.EcomRepository>()));
  gh.factory<_i41.FriendApi>(() => _i41.FriendApi(gh<_i37.Dio>()));
  gh.factory<_i42.FriendRepository>(
      () => _i43.FriendRepositoryImpl(gh<_i41.FriendApi>()));
  gh.factory<_i44.GetListBlocParam1<_i45.ProductDetailResponse, List<String>>>(
      () => marshopBlocFactory.getProducts(gh<_i40.EcomUsecase>()));
  gh.factory<_i46.GiftSharePreferencesUseCase>(
      () => _i46.GiftSharePreferencesUseCase(gh<_i30.SharedPreferences>()));
  gh.factory<_i47.InformationPDoneSharePreferencesUsecase>(() =>
      _i47.InformationPDoneSharePreferencesUsecase(
          gh<_i30.SharedPreferences>()));
  gh.factory<_i48.InformationPdoneProfileCubit>(() =>
      _i48.InformationPdoneProfileCubit(
          gh<_i47.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i49.LiveApi>(() => _i49.LiveApi(gh<_i3.Dio>()));
  gh.factory<_i50.LiveRepository>(
      () => _i51.LiveRepositoryImpl(gh<_i49.LiveApi>()));
  gh.factory<_i52.LiveUseCase>(
      () => _i52.LiveUseCase(gh<_i50.LiveRepository>()));
  gh.factory<_i53.MarshopAPI>(() => _i53.MarshopAPI(gh<_i37.Dio>()));
  gh.factory<_i54.MarshopRepository>(
      () => _i55.MarshopRepositoryImpl(gh<_i53.MarshopAPI>()));
  gh.factory<_i56.MarshopUsecase>(
      () => _i56.MarshopUsecase(gh<_i54.MarshopRepository>()));
  gh.factory<_i57.NotificationAPI>(() => _i57.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i58.NotificationRepository>(
      () => _i59.NotificationRepositoryImpl(gh<_i57.NotificationAPI>()));
  gh.factory<_i60.NotificationUsecase>(
      () => _i60.NotificationUsecase(gh<_i58.NotificationRepository>()));
  gh.lazySingleton<_i61.OpenWeatherApi>(
      () => _i61.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i62.OpenWeatherRepository>(
      () => _i63.OpenWeatherRepositoryImpl(gh<_i61.OpenWeatherApi>()));
  gh.factory<_i64.OpenWeatherUseCase>(
      () => _i64.OpenWeatherUseCase(gh<_i62.OpenWeatherRepository>()));
  gh.factory<_i65.PlaceInformationAPI>(
      () => _i65.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i66.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i30.SharedPreferences>(),
        gh<_i66.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i67.PlaceInformationRepository>(() =>
      _i68.PlaceInformationRepositoryImpl(gh<_i65.PlaceInformationAPI>()));
  gh.factory<_i69.PlaceInformationUsecase>(() =>
      _i69.PlaceInformationUsecase(gh<_i67.PlaceInformationRepository>()));
  gh.lazySingleton<_i70.ProtectorAPI>(() => _i70.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i71.ProtectorRepository>(
      () => _i72.ProtectorRepositoryImpl(gh<_i70.ProtectorAPI>()));
  gh.factory<_i73.ProtectorUseCase>(
      () => _i73.ProtectorUseCase(gh<_i71.ProtectorRepository>()));
  gh.factory<_i74.ResourceApi>(() => _i74.ResourceApi(gh<_i37.Dio>()));
  gh.factory<_i75.ResourceRepository>(
      () => _i76.ResourceRepositoryImpl(gh<_i74.ResourceApi>()));
  gh.factory<_i77.ResourceUsecase>(
      () => _i77.ResourceUsecase(gh<_i75.ResourceRepository>()));
  gh.factory<_i78.UpgradeAccountApi>(
      () => _i78.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i79.UpgradeAccountRepository>(
      () => _i80.UpgradeAccountRepositoryImpl(
            gh<_i78.UpgradeAccountApi>(),
            gh<_i74.ResourceApi>(),
          ));
  gh.factory<_i81.UpgradeAccountUsecase>(
      () => _i81.UpgradeAccountUsecase(gh<_i79.UpgradeAccountRepository>()));
  gh.factory<_i82.UpgradeCubit>(
      () => _i82.UpgradeCubit(gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<_i83.UserApi>(() => _i83.UserApi(gh<_i3.Dio>()));
  gh.factory<_i84.UserRepository>(
      () => _i85.AuthRepositoryImpl(gh<_i83.UserApi>()));
  gh.factory<_i86.UserUsecase>(
      () => _i86.UserUsecase(gh<_i84.UserRepository>()));
  gh.factory<_i87.AddMemberChangeNotifier>(
      () => _i87.AddMemberChangeNotifier(gh<_i86.UserUsecase>()));
  gh.factory<_i88.ApprovedRequestCubit>(
      () => _i88.ApprovedRequestCubit(gh<_i86.UserUsecase>()));
  gh.factory<_i89.AuthApi>(() => _i89.AuthApi(gh<_i37.Dio>()));
  gh.factory<_i90.AuthRepository>(
      () => _i91.AuthRepositoryImpl(gh<_i89.AuthApi>()));
  gh.factory<_i92.AuthenticationUsecase>(() => _i92.AuthenticationUsecase(
        gh<_i90.AuthRepository>(),
        gh<_i33.UserSharePreferencesUsecase>(),
        gh<_i84.UserRepository>(),
        gh<_i25.NotificationService>(),
        gh<_i7.ChatSocket>(),
      ));
  gh.factory<_i93.CategoryController>(
      () => _i93.CategoryController(gh<_i50.LiveRepository>()));
  gh.factory<_i94.ChangePasswordController>(
      () => _i94.ChangePasswordController(gh<_i92.AuthenticationUsecase>()));
  gh.factory<_i95.ChatApi>(() => _i95.ChatApi(gh<_i37.Dio>()));
  gh.factory<_i96.ChatRepository>(
      () => _i97.ChatRepositoryImpl(gh<_i95.ChatApi>()));
  gh.factory<_i98.ChatUseCase>(() => _i98.ChatUseCase(
        gh<_i96.ChatRepository>(),
        gh<_i42.FriendRepository>(),
      ));
  gh.factory<_i99.CommunityApi>(() => _i99.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i100.CommunityRepository>(
      () => _i101.CommunityRepositoryImpl(gh<_i99.CommunityApi>()));
  gh.factory<_i102.CommunityUsecase>(() => _i102.CommunityUsecase(
        gh<_i100.CommunityRepository>(),
        gh<_i77.ResourceUsecase>(),
      ));
  gh.singleton<_i103.ConversationCubit>(
      _i103.ConversationCubit(gh<_i98.ChatUseCase>()));
  gh.factory<_i104.DashBoardBgController>(() =>
      _i104.DashBoardBgController(gh<_i35.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i105.DashBoardScreenController>(() =>
      _i105.DashBoardScreenController(
          gh<_i35.DashboardSharePreferenceUseCase>()));
  gh.factory<_i106.DashboardCommunityBloc>(() =>
      _i106.DashboardCommunityBloc(gh<_i35.DashboardSharePreferenceUseCase>()));
  gh.factory<_i106.DashboardEcommerceBloc>(() =>
      _i106.DashboardEcommerceBloc(gh<_i35.DashboardSharePreferenceUseCase>()));
  gh.factory<_i106.DashboardPersonalBloc>(() =>
      _i106.DashboardPersonalBloc(gh<_i35.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i107.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i107.EditCommunityDetailBloc(
        gh<_i102.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i108.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i108.EditFanGroupBloc(
        gh<_i102.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i109.EmailVerifyController>(
      () => _i109.EmailVerifyController(gh<_i86.UserUsecase>()));
  gh.factory<_i110.FanGroupDetailBloc>(
      () => _i110.FanGroupDetailBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<_i44.GetDetailBloc<_i3.FanGroup>>(() =>
      communityModule.createGetFanGroupBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<_i44.GetDetailBloc<_i111.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<_i44.GetDetailBloc<_i112.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<_i44.GetDetailBloc<_i113.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<
          _i44.GetDetailBlocParam1<_i114.MarshopResponse,
              _i115.GetMarshopInfoPayload>>(
      () => marshopBlocFactory.getMarshopInfo(gh<_i56.MarshopUsecase>()));
  gh.factory<
      _i44.GetDetailBlocParam1<_i111.UpgradeAccountResponse,
          _i116.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<
      _i44.GetDetailBlocParam1<_i113.BankAccount,
          _i117.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<_i44.GetDetailBlocParam1<dynamic, _i118.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<_i44.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i86.UserUsecase>()));
  gh.factory<
      _i44.GetDetailBlocParam1<_i119.ConfirmRegisterJAResponse,
          _i120.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<
          _i44
          .GetDetailBlocParam1<_i121.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<
          _i44.GetDetailBlocParam1<_i122.BossCommunityStatusResponse, String>>(
      () => communityModule
          .createGetBossStatusBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<
      _i44.GetDetailBlocParam2<_i123.ConfirmResponse, String,
          _i124.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<
      _i44.GetDetailBlocParam2<_i123.ConfirmResponse, String,
          _i125.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<_i44.GetListBloc<_i126.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<_i44.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<_i44.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i102.CommunityUsecase>()));
  gh.factory<_i44.GetListBloc<_i127.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<_i44.GetListBloc<_i114.MarshopRegisterPackResponse>>(
      () => marshopBlocFactory.getMarshopPack(gh<_i56.MarshopUsecase>()));
  gh.factory<
          _i44.GetListBlocParam1<_i114.MarshopResponse,
              _i115.GetListMarshopPayload>>(
      () => marshopBlocFactory.listMarshopBloc(gh<_i56.MarshopUsecase>()));
  gh.factory<_i44.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<_i128.GiftController>(
      () => _i128.GiftController(gh<_i52.LiveUseCase>()));
  gh.factory<_i129.GroupDetailBloc>(
      () => _i129.GroupDetailBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<_i130.GuardianPDoneBloc>(
      () => _i130.GuardianPDoneBloc(gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<_i131.InformationUpdateProfilBloc>(
      () => _i131.InformationUpdateProfilBloc(
            gh<_i86.UserUsecase>(),
            gh<_i47.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i132.ListProtectorRequestController>(
      () => _i132.ListProtectorRequestController(gh<_i73.ProtectorUseCase>()));
  gh.factory<_i133.LiveBottomController>(() => _i133.LiveBottomController(
        gh<_i52.LiveUseCase>(),
        gh<_i86.UserUsecase>(),
      ));
  gh.factory<_i134.LiveChannelController>(() => _i134.LiveChannelController(
        gh<_i50.LiveRepository>(),
        gh<_i33.UserSharePreferencesUsecase>(),
        gh<_i86.UserUsecase>(),
        gh<_i17.LiveService>(),
        gh<_i19.LiveSocketService>(),
        gh<_i11.FloatingGiftsProvider>(),
      ));
  gh.factory<_i135.LiveController>(
      () => _i135.LiveController(gh<_i52.LiveUseCase>()));
  gh.factory<_i136.LiveCreateController>(() => _i136.LiveCreateController(
        gh<_i50.LiveRepository>(),
        gh<_i17.LiveService>(),
      ));
  gh.factory<_i132.ManageProtectController>(
      () => _i132.ManageProtectController(gh<_i73.ProtectorUseCase>()));
  gh.factory<_i137.MarshopCubit>(
      () => _i137.MarshopCubit(gh<_i56.MarshopUsecase>()));
  gh.factory<_i138.NewMessageCubit>(
      () => _i138.NewMessageCubit(gh<_i98.ChatUseCase>()));
  gh.factory<_i139.NotificationBloc>(
      () => _i139.NotificationBloc(gh<_i60.NotificationUsecase>()));
  gh.factory<_i140.OpenWeatherBloc>(
      () => _i140.OpenWeatherBloc(gh<_i64.OpenWeatherUseCase>()));
  gh.factory<_i141.PDoneInformationBloc>(
      () => _i141.PDoneInformationBloc(gh<_i81.UpgradeAccountUsecase>()));
  gh.factory<_i142.PlaceInformationBloc>(
      () => _i142.PlaceInformationBloc(gh<_i69.PlaceInformationUsecase>()));
  gh.factory<_i143.PlaceInformationBloc2>(
      () => _i143.PlaceInformationBloc2(gh<_i69.PlaceInformationUsecase>()));
  gh.factory<_i144.SearchCubit>(
      () => _i144.SearchCubit(gh<_i86.UserUsecase>()));
  gh.factory<_i145.TeamDetailBloc>(
      () => _i145.TeamDetailBloc(gh<_i102.CommunityUsecase>()));
  gh.factory<_i146.TeamRequestCubit>(
      () => _i146.TeamRequestCubit(gh<_i102.CommunityUsecase>()));
  gh.factory<_i147.UpgradePDoneBloc>(() => _i147.UpgradePDoneBloc(
        gh<_i81.UpgradeAccountUsecase>(),
        gh<_i86.UserUsecase>(),
        gh<_i33.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i148.UserActionCubit>(
      () => _i148.UserActionCubit(gh<_i86.UserUsecase>()));
  gh.factory<_i149.UserBloc>(() => _i149.UserBloc(
        gh<_i92.AuthenticationUsecase>(),
        gh<_i33.UserSharePreferencesUsecase>(),
        gh<_i86.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i150.UserCubit>(() => _i150.UserCubit(
        gh<_i92.AuthenticationUsecase>(),
        gh<_i33.UserSharePreferencesUsecase>(),
        gh<_i86.UserUsecase>(),
      ));
  gh.factory<_i151.UserProfileBloc>(() => _i151.UserProfileBloc(
        gh<_i86.UserUsecase>(),
        gh<_i73.ProtectorUseCase>(),
        gh<_i22.MediaPicker>(),
        gh<_i81.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i152.AppCubit>(() => _i152.AppCubit(
        gh<_i77.ResourceUsecase>(),
        gh<_i33.UserSharePreferencesUsecase>(),
        gh<_i92.AuthenticationUsecase>(),
      ));
  gh.singleton<_i153.AppSettingBloc>(
      _i153.AppSettingBloc(gh<_i92.AuthenticationUsecase>()));
  gh.factory<_i154.AuthCubit>(
      () => _i154.AuthCubit(gh<_i92.AuthenticationUsecase>()));
  gh.singleton<_i155.ChatRoomCubit>(_i155.ChatRoomCubit(
    gh<_i98.ChatUseCase>(),
    gh<_i86.UserUsecase>(),
  ));
  await _i156.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i157.DataSourceModule {}

class _$ConfigModule extends _i158.ConfigModule {}

class _$MarshopBlocFactory extends _i159.MarshopBlocFactory {}

class _$PlaceModule extends _i66.PlaceModule {}

class _$CommunityModule extends _i160.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i161.UpgradeAgreePolicyBlocFactory {}

class _$DiaryBlocFactory extends _i162.DiaryBlocFactory {}

class _$DashBoardModule extends _i163.DashBoardModule {}
