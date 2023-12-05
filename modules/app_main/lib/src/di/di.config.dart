// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i39;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i47;
import 'package:shared_preferences/shared_preferences.dart' as _i32;
import 'package:wallet/core/core.dart' as _i36;
import 'package:wallet/di/wallet_micro.module.dart' as _i167;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i162;
import '../blocs/approved_request/approved_request_cubit.dart' as _i92;
import '../blocs/auth/auth_cubit.dart' as _i164;
import '../blocs/community/team_request/team_request_cubit.dart' as _i156;
import '../blocs/marshop/marshop_cubit.dart' as _i146;
import '../blocs/user/user_cubit.dart' as _i160;
import '../blocs/user_action/user_action_cubit.dart' as _i158;
import '../core/services/live_service/impl/live_service_impl.dart' as _i20;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i22;
import '../core/services/live_service/live_service.dart' as _i19;
import '../core/services/live_service/live_socket_service.dart' as _i21;
import '../core/services/notifications/notification_service.dart' as _i27;
import '../core/socket/chat_socket.dart' as _i9;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i50;
import '../data/data_sources/remote/auth_api.dart' as _i93;
import '../data/data_sources/remote/call_api.dart' as _i97;
import '../data/data_sources/remote/chat_api.dart' as _i103;
import '../data/data_sources/remote/community_api.dart' as _i107;
import '../data/data_sources/remote/ecom_api.dart' as _i38;
import '../data/data_sources/remote/friend_api.dart' as _i43;
import '../data/data_sources/remote/marshop_api.dart' as _i56;
import '../data/data_sources/remote/notification_api.dart' as _i60;
import '../data/data_sources/remote/open_weather_api.dart' as _i64;
import '../data/data_sources/remote/place_information_api.dart' as _i68;
import '../data/data_sources/remote/place_information_provider.dart' as _i69;
import '../data/data_sources/remote/protector_api.dart' as _i73;
import '../data/data_sources/remote/resource_api.dart' as _i77;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i81;
import '../data/data_sources/remote/user_api.dart' as _i86;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i132;
import '../data/models/payloads/marshop/marshop_payload.dart' as _i123;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i125;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i126;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i128;
import '../data/models/responses/boss_community_status_response.dart' as _i129;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i130;
import '../data/models/responses/confirm_register_ja_response.dart' as _i124;
import '../data/models/responses/confirm_response.dart' as _i131;
import '../data/models/responses/ecom/product_detail_response.dart' as _i48;
import '../data/models/responses/group_request_response.dart' as _i134;
import '../data/models/responses/ja_status_response.dart' as _i121;
import '../data/models/responses/marshop_response.dart' as _i122;
import '../data/models/responses/upgrade_account_response.dart' as _i120;
import '../data/repositories/auth_repository.dart' as _i94;
import '../data/repositories/ecom_repository.dart' as _i40;
import '../data/repositories/impl/auth_repository_impl.dart' as _i95;
import '../data/repositories/impl/call_repository_impl.dart' as _i99;
import '../data/repositories/impl/chat_repository_impl.dart' as _i105;
import '../data/repositories/impl/community_repository.impl.dart' as _i109;
import '../data/repositories/impl/ecom_repository_impl.dart' as _i41;
import '../data/repositories/impl/friend_repository_impl.dart' as _i45;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i58;
import '../data/repositories/impl/media_picker_impl.dart' as _i25;
import '../data/repositories/impl/notification_repository.impl.dart' as _i62;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i66;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i71;
import '../data/repositories/impl/protector_repository_impl.dart' as _i75;
import '../data/repositories/impl/resource_repository.impl.dart' as _i79;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i83;
import '../data/repositories/impl/user_repository_impl.dart' as _i88;
import '../data/repositories/marshop_repository.dart' as _i57;
import '../data/repositories/media_picker.dart' as _i24;
import '../data/repositories/notification_repository.dart' as _i61;
import '../data/repositories/protector_repository.dart' as _i74;
import '../data/repositories/user_repository.dart' as _i87;
import '../domain/entities/bank.dart' as _i135;
import '../domain/entities/commity_action_type.dart' as _i127;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i119;
import '../domain/repository/call_repository.dart' as _i98;
import '../domain/repository/chat_repository.dart' as _i104;
import '../domain/repository/community_repository.dart' as _i108;
import '../domain/repository/friend_repository.dart' as _i44;
import '../domain/repository/open_weather_repository.dart' as _i65;
import '../domain/repository/place_information_repository.dart' as _i70;
import '../domain/repository/resource_repository.dart' as _i78;
import '../domain/repository/upgrade_account_repository.dart' as _i82;
import '../domain/usecases/authentication_usecase.dart' as _i96;
import '../domain/usecases/call_usecase.dart' as _i100;
import '../domain/usecases/chat_usecase.dart' as _i106;
import '../domain/usecases/community_usecase.dart' as _i110;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i37;
import '../domain/usecases/ecom_usecase.dart' as _i42;
import '../domain/usecases/friend_usecase.dart' as _i46;
import '../domain/usecases/marshop_usecase.dart' as _i59;
import '../domain/usecases/notification_usecase.dart' as _i63;
import '../domain/usecases/open_weather_usecase.dart' as _i67;
import '../domain/usecases/place_information_usecase.dart' as _i72;
import '../domain/usecases/protector_usecase.dart' as _i76;
import '../domain/usecases/resource_usecase.dart' as _i80;
import '../domain/usecases/upgrade_account_usecase.dart' as _i84;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i35;
import '../domain/usecases/user_usecase.dart' as _i89;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/call/call_1v1/cubit/call_cubit.dart' as _i6;
import '../presentation/call/call_routes.dart' as _i7;
import '../presentation/call/phone_book/tabs/all_friends/cubit/all_friends_cubit.dart'
    as _i91;
import '../presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart'
    as _i165;
import '../presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart'
    as _i151;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i166;
import '../presentation/chat/chat_routes.dart' as _i8;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i111;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i147;
import '../presentation/community/community_constants.dart' as _i133;
import '../presentation/community/community_module.dart' as _i172;
import '../presentation/community/community_routes.dart' as _i10;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i115;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i116;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i118;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i137;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i155;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i90;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i113;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i114;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i149;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i112;
import '../presentation/dashboard/dashboard_module.dart' as _i174;
import '../presentation/dashboard/dashboard_routes.dart' as _i11;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i154;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i102;
import '../presentation/general_setting/general_routes.dart' as _i14;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i139;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i51;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i153;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i16;
import '../presentation/live/data/data_sources/remote/live_api.dart' as _i52;
import '../presentation/live/data/repository/live_repository.dart' as _i53;
import '../presentation/live/data/repository/repository_impl/live_repository_impl.dart'
    as _i54;
import '../presentation/live/domain/usecases/gift_share_preferences_usecase.dart'
    as _i49;
import '../presentation/live/domain/usecases/live_usecases.dart' as _i55;
import '../presentation/live/live_routes.dart' as _i18;
import '../presentation/live/presentation/channel/state/live_channel_controller.dart'
    as _i142;
import '../presentation/live/presentation/channel/widget/sent_gift_page.dart'
    as _i13;
import '../presentation/live/presentation/create/state/live_create_controller.dart'
    as _i145;
import '../presentation/live/presentation/create/widget/live_category_picker.dart'
    as _i101;
import '../presentation/live/presentation/list_gift/gift_controller.dart'
    as _i136;
import '../presentation/live/presentation/live_bottom/live_bottom_controller.dart'
    as _i141;
import '../presentation/live/presentation/live_message/state/live_message_bloc.dart'
    as _i17;
import '../presentation/live/presentation/live_tab/live_controller.dart'
    as _i144;
import '../presentation/live/presentation/widget/check_password_enable.dart'
    as _i143;
import '../presentation/marshop/marshop_bloc.dart' as _i170;
import '../presentation/marshop/marshop_routes.dart' as _i23;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i15;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i12;
import '../presentation/notification/notification_routes.dart' as _i26;
import '../presentation/notification/state/notification_bloc.dart' as _i148;
import '../presentation/otp_verify/email_otp_verify.dart' as _i117;
import '../presentation/profile/state/user_profile_bloc.dart' as _i161;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i140;
import '../presentation/protector/protector_router.dart' as _i28;
import '../presentation/qr_code/qr_code_route.dart' as _i29;
import '../presentation/routes.dart' as _i30;
import '../presentation/settings/setting_routes.dart' as _i31;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i163;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i159;
import '../presentation/social/profile/profile_bloc.dart' as _i173;
import '../presentation/social/social_routes.dart' as _i33;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i34;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i171;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i138;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i150;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i152;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i85;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i157;
import 'modules/config_module.dart' as _i169;
import 'modules/data_source_module.dart' as _i168;

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
  final upgradeAgreePolicyBlocFactory = _$UpgradeAgreePolicyBlocFactory();
  final communityModule = _$CommunityModule();
  final diaryBlocFactory = _$DiaryBlocFactory();
  final dashBoardModule = _$DashBoardModule();
  gh.singleton<_i4.AppDelegate>(_i4.AppDelegate());
  gh.factory<_i5.AuthenticationRoutes>(() => _i5.AuthenticationRoutes());
  gh.factory<_i6.CallCubit>(() => _i6.CallCubit());
  gh.factory<_i7.CallRoutes>(() => _i7.CallRoutes());
  gh.factory<_i8.ChatRoutes>(() => _i8.ChatRoutes());
  gh.factory<_i9.ChatSocket>(() => _i9.ChatSocket());
  gh.factory<_i10.CommunityRoutes>(() => _i10.CommunityRoutes());
  gh.factory<_i11.DashboardRoutes>(() => _i11.DashboardRoutes());
  gh.factory<_i12.DeeplinkBloc>(() => _i12.DeeplinkBloc());
  gh.factory<_i13.FloatingGiftsProvider>(() => _i13.FloatingGiftsProvider());
  gh.factory<_i14.GeneralRoutes>(() => _i14.GeneralRoutes());
  gh.factory<_i15.GeneralRoutes>(() => _i15.GeneralRoutes());
  gh.factory<_i16.InfoProfileRoutes>(() => _i16.InfoProfileRoutes());
  gh.factory<_i17.LiveMessageBloc>(() => _i17.LiveMessageBloc());
  gh.factory<_i18.LiveRoutes>(() => _i18.LiveRoutes());
  gh.factory<_i19.LiveService>(() => _i20.LiveServiceImpl());
  gh.factory<_i21.LiveSocketService>(() => _i22.LiveSocketServiceImpl());
  gh.factory<_i23.MarkShopRoutes>(() => _i23.MarkShopRoutes());
  gh.lazySingleton<_i24.MediaPicker>(() => _i25.MediaPickerImpl());
  gh.factory<_i26.NotificationRoutes>(() => _i26.NotificationRoutes());
  gh.singleton<_i27.NotificationService>(
      _i27.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i28.ProtectorModule>(() => _i28.ProtectorModule());
  gh.factory<_i29.QrCodeRoutes>(() => _i29.QrCodeRoutes());
  gh.singleton<_i30.Routes>(_i30.Routes());
  gh.factory<_i31.SettingRoutes>(() => _i31.SettingRoutes());
  await gh.singletonAsync<_i32.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i33.SocialRoutes>(() => _i33.SocialRoutes());
  gh.factory<_i34.UpgradeAccountRoutes>(() => _i34.UpgradeAccountRoutes());
  gh.factory<_i35.UserSharePreferencesUsecase>(
      () => _i35.UserSharePreferencesUsecase(gh<_i32.SharedPreferences>()));
  gh.singleton<_i36.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i37.DashboardSharePreferenceUseCase>(
      () => _i37.DashboardSharePreferenceUseCase(gh<_i32.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i32.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i38.EcomAPI>(() => _i38.EcomAPI(gh<_i39.Dio>()));
  gh.factory<_i40.EcomRepository>(
      () => _i41.EcomRepositoryImpl(gh<_i38.EcomAPI>()));
  gh.factory<_i42.EcomUsecase>(
      () => _i42.EcomUsecase(gh<_i40.EcomRepository>()));
  gh.factory<_i43.FriendApi>(() => _i43.FriendApi(gh<_i39.Dio>()));
  gh.factory<_i44.FriendRepository>(
      () => _i45.FriendRepositoryImpl(gh<_i43.FriendApi>()));
  gh.factory<_i46.FriendUsecase>(
      () => _i46.FriendUsecase(gh<_i44.FriendRepository>()));
  gh.factory<_i47.GetListBlocParam1<_i48.ProductDetailResponse, List<String>>>(
      () => marshopBlocFactory.getProducts(gh<_i42.EcomUsecase>()));
  gh.factory<_i49.GiftSharePreferencesUseCase>(
      () => _i49.GiftSharePreferencesUseCase(gh<_i32.SharedPreferences>()));
  gh.factory<_i50.InformationPDoneSharePreferencesUsecase>(() =>
      _i50.InformationPDoneSharePreferencesUsecase(
          gh<_i32.SharedPreferences>()));
  gh.factory<_i51.InformationPdoneProfileCubit>(() =>
      _i51.InformationPdoneProfileCubit(
          gh<_i50.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i52.LiveApi>(() => _i52.LiveApi(gh<_i3.Dio>()));
  gh.factory<_i53.LiveRepository>(
      () => _i54.LiveRepositoryImpl(gh<_i52.LiveApi>()));
  gh.factory<_i55.LiveUseCase>(
      () => _i55.LiveUseCase(gh<_i53.LiveRepository>()));
  gh.factory<_i56.MarshopAPI>(() => _i56.MarshopAPI(gh<_i39.Dio>()));
  gh.factory<_i57.MarshopRepository>(
      () => _i58.MarshopRepositoryImpl(gh<_i56.MarshopAPI>()));
  gh.factory<_i59.MarshopUsecase>(
      () => _i59.MarshopUsecase(gh<_i57.MarshopRepository>()));
  gh.factory<_i60.NotificationAPI>(() => _i60.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i61.NotificationRepository>(
      () => _i62.NotificationRepositoryImpl(gh<_i60.NotificationAPI>()));
  gh.factory<_i63.NotificationUsecase>(
      () => _i63.NotificationUsecase(gh<_i61.NotificationRepository>()));
  gh.lazySingleton<_i64.OpenWeatherApi>(
      () => _i64.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i65.OpenWeatherRepository>(
      () => _i66.OpenWeatherRepositoryImpl(gh<_i64.OpenWeatherApi>()));
  gh.factory<_i67.OpenWeatherUseCase>(
      () => _i67.OpenWeatherUseCase(gh<_i65.OpenWeatherRepository>()));
  gh.factory<_i68.PlaceInformationAPI>(
      () => _i68.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i69.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i32.SharedPreferences>(),
        gh<_i69.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i70.PlaceInformationRepository>(() =>
      _i71.PlaceInformationRepositoryImpl(gh<_i68.PlaceInformationAPI>()));
  gh.factory<_i72.PlaceInformationUsecase>(() =>
      _i72.PlaceInformationUsecase(gh<_i70.PlaceInformationRepository>()));
  gh.lazySingleton<_i73.ProtectorAPI>(() => _i73.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i74.ProtectorRepository>(
      () => _i75.ProtectorRepositoryImpl(gh<_i73.ProtectorAPI>()));
  gh.factory<_i76.ProtectorUseCase>(
      () => _i76.ProtectorUseCase(gh<_i74.ProtectorRepository>()));
  gh.factory<_i77.ResourceApi>(() => _i77.ResourceApi(gh<_i39.Dio>()));
  gh.factory<_i78.ResourceRepository>(
      () => _i79.ResourceRepositoryImpl(gh<_i77.ResourceApi>()));
  gh.factory<_i80.ResourceUsecase>(
      () => _i80.ResourceUsecase(gh<_i78.ResourceRepository>()));
  gh.factory<_i81.UpgradeAccountApi>(
      () => _i81.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i82.UpgradeAccountRepository>(
      () => _i83.UpgradeAccountRepositoryImpl(
            gh<_i81.UpgradeAccountApi>(),
            gh<_i77.ResourceApi>(),
          ));
  gh.factory<_i84.UpgradeAccountUsecase>(
      () => _i84.UpgradeAccountUsecase(gh<_i82.UpgradeAccountRepository>()));
  gh.factory<_i85.UpgradeCubit>(
      () => _i85.UpgradeCubit(gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<_i86.UserApi>(() => _i86.UserApi(gh<_i3.Dio>()));
  gh.factory<_i87.UserRepository>(
      () => _i88.AuthRepositoryImpl(gh<_i86.UserApi>()));
  gh.factory<_i89.UserUsecase>(
      () => _i89.UserUsecase(gh<_i87.UserRepository>()));
  gh.factory<_i90.AddMemberChangeNotifier>(
      () => _i90.AddMemberChangeNotifier(gh<_i89.UserUsecase>()));
  gh.factory<_i91.AllFriendsCubit>(
      () => _i91.AllFriendsCubit(gh<_i46.FriendUsecase>()));
  gh.factory<_i92.ApprovedRequestCubit>(
      () => _i92.ApprovedRequestCubit(gh<_i89.UserUsecase>()));
  gh.factory<_i93.AuthApi>(() => _i93.AuthApi(gh<_i39.Dio>()));
  gh.factory<_i94.AuthRepository>(
      () => _i95.AuthRepositoryImpl(gh<_i93.AuthApi>()));
  gh.factory<_i96.AuthenticationUsecase>(() => _i96.AuthenticationUsecase(
        gh<_i94.AuthRepository>(),
        gh<_i35.UserSharePreferencesUsecase>(),
        gh<_i87.UserRepository>(),
        gh<_i27.NotificationService>(),
        gh<_i9.ChatSocket>(),
      ));
  gh.factory<_i97.CallApi>(() => _i97.CallApi(gh<_i39.Dio>()));
  gh.factory<_i98.CallRepository>(
      () => _i99.CallRepositoryImpl(gh<_i97.CallApi>()));
  gh.factory<_i100.CallUseCase>(
      () => _i100.CallUseCase(gh<_i98.CallRepository>()));
  gh.factory<_i101.CategoryController>(
      () => _i101.CategoryController(gh<_i53.LiveRepository>()));
  gh.factory<_i102.ChangePasswordController>(
      () => _i102.ChangePasswordController(gh<_i96.AuthenticationUsecase>()));
  gh.factory<_i103.ChatApi>(() => _i103.ChatApi(gh<_i39.Dio>()));
  gh.factory<_i104.ChatRepository>(
      () => _i105.ChatRepositoryImpl(gh<_i103.ChatApi>()));
  gh.factory<_i106.ChatUseCase>(() => _i106.ChatUseCase(
        gh<_i104.ChatRepository>(),
        gh<_i44.FriendRepository>(),
      ));
  gh.factory<_i107.CommunityApi>(() => _i107.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i108.CommunityRepository>(
      () => _i109.CommunityRepositoryImpl(gh<_i107.CommunityApi>()));
  gh.factory<_i110.CommunityUsecase>(() => _i110.CommunityUsecase(
        gh<_i108.CommunityRepository>(),
        gh<_i80.ResourceUsecase>(),
      ));
  gh.singleton<_i111.ConversationCubit>(
      _i111.ConversationCubit(gh<_i106.ChatUseCase>()));
  gh.factory<_i112.DashBoardBgController>(() =>
      _i112.DashBoardBgController(gh<_i37.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i113.DashBoardScreenController>(() =>
      _i113.DashBoardScreenController(
          gh<_i37.DashboardSharePreferenceUseCase>()));
  gh.factory<_i114.DashboardCommunityBloc>(() =>
      _i114.DashboardCommunityBloc(gh<_i37.DashboardSharePreferenceUseCase>()));
  gh.factory<_i114.DashboardEcommerceBloc>(() =>
      _i114.DashboardEcommerceBloc(gh<_i37.DashboardSharePreferenceUseCase>()));
  gh.factory<_i114.DashboardPersonalBloc>(() =>
      _i114.DashboardPersonalBloc(gh<_i37.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i115.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i115.EditCommunityDetailBloc(
        gh<_i110.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i116.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i116.EditFanGroupBloc(
        gh<_i110.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i117.EmailVerifyController>(
      () => _i117.EmailVerifyController(gh<_i89.UserUsecase>()));
  gh.factory<_i118.FanGroupDetailBloc>(
      () => _i118.FanGroupDetailBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<_i47.GetDetailBloc<_i119.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<_i47.GetDetailBloc<_i3.FanGroup>>(() =>
      communityModule.createGetFanGroupBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<_i47.GetDetailBloc<_i120.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<_i47.GetDetailBloc<_i121.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<
          _i47.GetDetailBlocParam1<_i122.MarshopResponse,
              _i123.GetMarshopInfoPayload>>(
      () => marshopBlocFactory.getMarshopInfo(gh<_i59.MarshopUsecase>()));
  gh.factory<
      _i47.GetDetailBlocParam1<_i124.ConfirmRegisterJAResponse,
          _i125.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<
      _i47.GetDetailBlocParam1<_i119.BankAccount,
          _i126.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<
      _i47.GetDetailBlocParam1<_i120.UpgradeAccountResponse,
          _i127.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<_i47.GetDetailBlocParam1<dynamic, _i128.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<
          _i47.GetDetailBlocParam1<_i129.BossCommunityStatusResponse, String>>(
      () => communityModule
          .createGetBossStatusBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<
          _i47
          .GetDetailBlocParam1<_i130.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<_i47.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i89.UserUsecase>()));
  gh.factory<
      _i47.GetDetailBlocParam2<_i131.ConfirmResponse, String,
          _i132.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<
      _i47.GetDetailBlocParam2<_i131.ConfirmResponse, String,
          _i133.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<_i47.GetListBloc<_i134.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<_i47.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i110.CommunityUsecase>()));
  gh.factory<_i47.GetListBloc<_i135.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<_i47.GetListBloc<_i122.MarshopRegisterPackResponse>>(
      () => marshopBlocFactory.getMarshopPack(gh<_i59.MarshopUsecase>()));
  gh.factory<_i47.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<
          _i47.GetListBlocParam1<_i122.MarshopResponse,
              _i123.GetListMarshopPayload>>(
      () => marshopBlocFactory.listMarshopBloc(gh<_i59.MarshopUsecase>()));
  gh.factory<_i47.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<_i136.GiftController>(
      () => _i136.GiftController(gh<_i55.LiveUseCase>()));
  gh.factory<_i137.GroupDetailBloc>(
      () => _i137.GroupDetailBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<_i138.GuardianPDoneBloc>(
      () => _i138.GuardianPDoneBloc(gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<_i139.InformationUpdateProfilBloc>(
      () => _i139.InformationUpdateProfilBloc(
            gh<_i89.UserUsecase>(),
            gh<_i50.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i140.ListProtectorRequestController>(
      () => _i140.ListProtectorRequestController(gh<_i76.ProtectorUseCase>()));
  gh.factory<_i141.LiveBottomController>(() => _i141.LiveBottomController(
        gh<_i55.LiveUseCase>(),
        gh<_i89.UserUsecase>(),
      ));
  gh.factory<_i142.LiveChannelController>(() => _i142.LiveChannelController(
        gh<_i53.LiveRepository>(),
        gh<_i35.UserSharePreferencesUsecase>(),
        gh<_i89.UserUsecase>(),
        gh<_i19.LiveService>(),
        gh<_i21.LiveSocketService>(),
        gh<_i13.FloatingGiftsProvider>(),
      ));
  gh.factory<_i143.LiveCheckPasswordController>(
      () => _i143.LiveCheckPasswordController(gh<_i55.LiveUseCase>()));
  gh.factory<_i144.LiveController>(
      () => _i144.LiveController(gh<_i55.LiveUseCase>()));
  gh.factory<_i145.LiveCreateController>(() => _i145.LiveCreateController(
        gh<_i53.LiveRepository>(),
        gh<_i19.LiveService>(),
      ));
  gh.factory<_i140.ManageProtectController>(
      () => _i140.ManageProtectController(gh<_i76.ProtectorUseCase>()));
  gh.factory<_i146.MarshopCubit>(
      () => _i146.MarshopCubit(gh<_i59.MarshopUsecase>()));
  gh.factory<_i147.NewMessageCubit>(
      () => _i147.NewMessageCubit(gh<_i106.ChatUseCase>()));
  gh.factory<_i148.NotificationBloc>(
      () => _i148.NotificationBloc(gh<_i63.NotificationUsecase>()));
  gh.factory<_i149.OpenWeatherBloc>(
      () => _i149.OpenWeatherBloc(gh<_i67.OpenWeatherUseCase>()));
  gh.factory<_i150.PDoneInformationBloc>(
      () => _i150.PDoneInformationBloc(gh<_i84.UpgradeAccountUsecase>()));
  gh.factory<_i151.PhoneBookDetailCubit>(
      () => _i151.PhoneBookDetailCubit(gh<_i100.CallUseCase>()));
  gh.factory<_i152.PlaceInformationBloc>(
      () => _i152.PlaceInformationBloc(gh<_i72.PlaceInformationUsecase>()));
  gh.factory<_i153.PlaceInformationBloc2>(
      () => _i153.PlaceInformationBloc2(gh<_i72.PlaceInformationUsecase>()));
  gh.factory<_i154.SearchCubit>(
      () => _i154.SearchCubit(gh<_i89.UserUsecase>()));
  gh.factory<_i155.TeamDetailBloc>(
      () => _i155.TeamDetailBloc(gh<_i110.CommunityUsecase>()));
  gh.factory<_i156.TeamRequestCubit>(
      () => _i156.TeamRequestCubit(gh<_i110.CommunityUsecase>()));
  gh.factory<_i157.UpgradePDoneBloc>(() => _i157.UpgradePDoneBloc(
        gh<_i84.UpgradeAccountUsecase>(),
        gh<_i89.UserUsecase>(),
        gh<_i35.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i158.UserActionCubit>(
      () => _i158.UserActionCubit(gh<_i89.UserUsecase>()));
  gh.factory<_i159.UserBloc>(() => _i159.UserBloc(
        gh<_i96.AuthenticationUsecase>(),
        gh<_i35.UserSharePreferencesUsecase>(),
        gh<_i89.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i160.UserCubit>(() => _i160.UserCubit(
        gh<_i96.AuthenticationUsecase>(),
        gh<_i35.UserSharePreferencesUsecase>(),
        gh<_i89.UserUsecase>(),
      ));
  gh.factory<_i161.UserProfileBloc>(() => _i161.UserProfileBloc(
        gh<_i89.UserUsecase>(),
        gh<_i76.ProtectorUseCase>(),
        gh<_i24.MediaPicker>(),
        gh<_i84.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i162.AppCubit>(() => _i162.AppCubit(
        gh<_i80.ResourceUsecase>(),
        gh<_i35.UserSharePreferencesUsecase>(),
        gh<_i96.AuthenticationUsecase>(),
      ));
  gh.singleton<_i163.AppSettingBloc>(
      _i163.AppSettingBloc(gh<_i96.AuthenticationUsecase>()));
  gh.factory<_i164.AuthCubit>(
      () => _i164.AuthCubit(gh<_i96.AuthenticationUsecase>()));
  gh.factory<_i165.CallHistoryCubit>(
      () => _i165.CallHistoryCubit(gh<_i100.CallUseCase>()));
  gh.singleton<_i166.ChatRoomCubit>(_i166.ChatRoomCubit(
    gh<_i106.ChatUseCase>(),
    gh<_i89.UserUsecase>(),
    gh<_i84.UpgradeAccountUsecase>(),
    gh<_i24.MediaPicker>(),
  ));
  await _i167.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i168.DataSourceModule {}

class _$ConfigModule extends _i169.ConfigModule {}

class _$MarshopBlocFactory extends _i170.MarshopBlocFactory {}

class _$PlaceModule extends _i69.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i171.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i172.CommunityModule {}

class _$DiaryBlocFactory extends _i173.DiaryBlocFactory {}

class _$DashBoardModule extends _i174.DashBoardModule {}
