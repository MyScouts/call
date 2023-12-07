// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i38;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i46;
import 'package:shared_preferences/shared_preferences.dart' as _i31;
import 'package:wallet/core/core.dart' as _i35;
import 'package:wallet/di/wallet_micro.module.dart' as _i168;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i162;
import '../blocs/approved_request/approved_request_cubit.dart' as _i91;
import '../blocs/auth/auth_cubit.dart' as _i164;
import '../blocs/community/team_request/team_request_cubit.dart' as _i156;
import '../blocs/marshop/marshop_cubit.dart' as _i146;
import '../blocs/user/user_cubit.dart' as _i160;
import '../blocs/user_action/user_action_cubit.dart' as _i158;
import '../core/services/live_service/impl/live_service_impl.dart' as _i19;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i21;
import '../core/services/live_service/live_service.dart' as _i18;
import '../core/services/live_service/live_socket_service.dart' as _i20;
import '../core/services/notifications/notification_service.dart' as _i26;
import '../core/socket/chat_socket.dart' as _i8;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i49;
import '../data/data_sources/remote/auth_api.dart' as _i92;
import '../data/data_sources/remote/call_api.dart' as _i96;
import '../data/data_sources/remote/chat_api.dart' as _i102;
import '../data/data_sources/remote/community_api.dart' as _i106;
import '../data/data_sources/remote/ecom_api.dart' as _i37;
import '../data/data_sources/remote/friend_api.dart' as _i42;
import '../data/data_sources/remote/marshop_api.dart' as _i55;
import '../data/data_sources/remote/notification_api.dart' as _i59;
import '../data/data_sources/remote/open_weather_api.dart' as _i63;
import '../data/data_sources/remote/place_information_api.dart' as _i67;
import '../data/data_sources/remote/place_information_provider.dart' as _i68;
import '../data/data_sources/remote/protector_api.dart' as _i72;
import '../data/data_sources/remote/resource_api.dart' as _i76;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i80;
import '../data/data_sources/remote/user_api.dart' as _i85;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i133;
import '../data/models/payloads/marshop/marshop_payload.dart' as _i126;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i129;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i124;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i122;
import '../data/models/responses/boss_community_status_response.dart' as _i130;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i123;
import '../data/models/responses/confirm_register_ja_response.dart' as _i128;
import '../data/models/responses/confirm_response.dart' as _i131;
import '../data/models/responses/ecom/product_detail_response.dart' as _i47;
import '../data/models/responses/group_request_response.dart' as _i134;
import '../data/models/responses/ja_status_response.dart' as _i119;
import '../data/models/responses/marshop_response.dart' as _i125;
import '../data/models/responses/upgrade_account_response.dart' as _i121;
import '../data/repositories/auth_repository.dart' as _i93;
import '../data/repositories/ecom_repository.dart' as _i39;
import '../data/repositories/impl/auth_repository_impl.dart' as _i94;
import '../data/repositories/impl/call_repository_impl.dart' as _i98;
import '../data/repositories/impl/chat_repository_impl.dart' as _i104;
import '../data/repositories/impl/community_repository.impl.dart' as _i108;
import '../data/repositories/impl/ecom_repository_impl.dart' as _i40;
import '../data/repositories/impl/friend_repository_impl.dart' as _i44;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i57;
import '../data/repositories/impl/media_picker_impl.dart' as _i24;
import '../data/repositories/impl/notification_repository.impl.dart' as _i61;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i65;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i70;
import '../data/repositories/impl/protector_repository_impl.dart' as _i74;
import '../data/repositories/impl/resource_repository.impl.dart' as _i78;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i82;
import '../data/repositories/impl/user_repository_impl.dart' as _i87;
import '../data/repositories/marshop_repository.dart' as _i56;
import '../data/repositories/media_picker.dart' as _i23;
import '../data/repositories/notification_repository.dart' as _i60;
import '../data/repositories/protector_repository.dart' as _i73;
import '../data/repositories/user_repository.dart' as _i86;
import '../domain/entities/bank.dart' as _i135;
import '../domain/entities/commity_action_type.dart' as _i127;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i120;
import '../domain/repository/call_repository.dart' as _i97;
import '../domain/repository/chat_repository.dart' as _i103;
import '../domain/repository/community_repository.dart' as _i107;
import '../domain/repository/friend_repository.dart' as _i43;
import '../domain/repository/open_weather_repository.dart' as _i64;
import '../domain/repository/place_information_repository.dart' as _i69;
import '../domain/repository/resource_repository.dart' as _i77;
import '../domain/repository/upgrade_account_repository.dart' as _i81;
import '../domain/usecases/authentication_usecase.dart' as _i95;
import '../domain/usecases/call_usecase.dart' as _i99;
import '../domain/usecases/chat_usecase.dart' as _i105;
import '../domain/usecases/community_usecase.dart' as _i109;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i36;
import '../domain/usecases/ecom_usecase.dart' as _i41;
import '../domain/usecases/friend_usecase.dart' as _i45;
import '../domain/usecases/marshop_usecase.dart' as _i58;
import '../domain/usecases/notification_usecase.dart' as _i62;
import '../domain/usecases/open_weather_usecase.dart' as _i66;
import '../domain/usecases/place_information_usecase.dart' as _i71;
import '../domain/usecases/protector_usecase.dart' as _i75;
import '../domain/usecases/resource_usecase.dart' as _i79;
import '../domain/usecases/upgrade_account_usecase.dart' as _i83;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i34;
import '../domain/usecases/user_usecase.dart' as _i88;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/call/call_1v1/cubit/call_cubit.dart' as _i165;
import '../presentation/call/call_routes.dart' as _i6;
import '../presentation/call/phone_book/tabs/all_friends/cubit/all_friends_cubit.dart'
    as _i90;
import '../presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart'
    as _i166;
import '../presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart'
    as _i151;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i167;
import '../presentation/chat/chat_routes.dart' as _i7;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i110;
import '../presentation/chat/create_room/cubit/create_room_cubit.dart' as _i111;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i147;
import '../presentation/community/community_constants.dart' as _i132;
import '../presentation/community/community_module.dart' as _i172;
import '../presentation/community/community_routes.dart' as _i9;
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
    as _i89;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i113;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i114;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i149;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i112;
import '../presentation/dashboard/dashboard_module.dart' as _i175;
import '../presentation/dashboard/dashboard_routes.dart' as _i10;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i154;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i101;
import '../presentation/general_setting/general_routes.dart' as _i14;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i139;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i50;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i153;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i15;
import '../presentation/live/data/data_sources/remote/live_api.dart' as _i51;
import '../presentation/live/data/repository/live_repository.dart' as _i52;
import '../presentation/live/data/repository/repository_impl/live_repository_impl.dart'
    as _i53;
import '../presentation/live/domain/usecases/gift_share_preferences_usecase.dart'
    as _i48;
import '../presentation/live/domain/usecases/live_usecases.dart' as _i54;
import '../presentation/live/live_routes.dart' as _i17;
import '../presentation/live/presentation/channel/state/live_channel_controller.dart'
    as _i142;
import '../presentation/live/presentation/channel/widget/sent_gift_page.dart'
    as _i12;
import '../presentation/live/presentation/create/state/live_create_controller.dart'
    as _i145;
import '../presentation/live/presentation/create/widget/live_category_picker.dart'
    as _i100;
import '../presentation/live/presentation/list_gift/gift_controller.dart'
    as _i136;
import '../presentation/live/presentation/live_bottom/live_bottom_controller.dart'
    as _i141;
import '../presentation/live/presentation/live_message/state/live_message_bloc.dart'
    as _i16;
import '../presentation/live/presentation/live_tab/live_controller.dart'
    as _i144;
import '../presentation/live/presentation/widget/check_password_enable.dart'
    as _i143;
import '../presentation/marshop/marshop_bloc.dart' as _i171;
import '../presentation/marshop/marshop_routes.dart' as _i22;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i13;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i11;
import '../presentation/notification/notification_routes.dart' as _i25;
import '../presentation/notification/state/notification_bloc.dart' as _i148;
import '../presentation/otp_verify/email_otp_verify.dart' as _i117;
import '../presentation/profile/state/user_profile_bloc.dart' as _i161;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i140;
import '../presentation/protector/protector_router.dart' as _i27;
import '../presentation/qr_code/qr_code_route.dart' as _i28;
import '../presentation/routes.dart' as _i29;
import '../presentation/settings/setting_routes.dart' as _i30;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i163;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i159;
import '../presentation/social/profile/profile_bloc.dart' as _i174;
import '../presentation/social/social_routes.dart' as _i32;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i33;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i173;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i138;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i150;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i152;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i84;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i157;
import 'modules/config_module.dart' as _i170;
import 'modules/data_source_module.dart' as _i169;

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
  gh.factory<_i6.CallRoutes>(() => _i6.CallRoutes());
  gh.factory<_i7.ChatRoutes>(() => _i7.ChatRoutes());
  gh.factory<_i8.ChatSocket>(() => _i8.ChatSocket());
  gh.factory<_i9.CommunityRoutes>(() => _i9.CommunityRoutes());
  gh.factory<_i10.DashboardRoutes>(() => _i10.DashboardRoutes());
  gh.factory<_i11.DeeplinkBloc>(() => _i11.DeeplinkBloc());
  gh.factory<_i12.FloatingGiftsProvider>(() => _i12.FloatingGiftsProvider());
  gh.factory<_i13.GeneralRoutes>(() => _i13.GeneralRoutes());
  gh.factory<_i14.GeneralRoutes>(() => _i14.GeneralRoutes());
  gh.factory<_i15.InfoProfileRoutes>(() => _i15.InfoProfileRoutes());
  gh.factory<_i16.LiveMessageBloc>(() => _i16.LiveMessageBloc());
  gh.factory<_i17.LiveRoutes>(() => _i17.LiveRoutes());
  gh.factory<_i18.LiveService>(() => _i19.LiveServiceImpl());
  gh.factory<_i20.LiveSocketService>(() => _i21.LiveSocketServiceImpl());
  gh.factory<_i22.MarkShopRoutes>(() => _i22.MarkShopRoutes());
  gh.lazySingleton<_i23.MediaPicker>(() => _i24.MediaPickerImpl());
  gh.factory<_i25.NotificationRoutes>(() => _i25.NotificationRoutes());
  gh.singleton<_i26.NotificationService>(
      _i26.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i27.ProtectorModule>(() => _i27.ProtectorModule());
  gh.factory<_i28.QrCodeRoutes>(() => _i28.QrCodeRoutes());
  gh.singleton<_i29.Routes>(_i29.Routes());
  gh.factory<_i30.SettingRoutes>(() => _i30.SettingRoutes());
  await gh.singletonAsync<_i31.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i32.SocialRoutes>(() => _i32.SocialRoutes());
  gh.factory<_i33.UpgradeAccountRoutes>(() => _i33.UpgradeAccountRoutes());
  gh.factory<_i34.UserSharePreferencesUsecase>(
      () => _i34.UserSharePreferencesUsecase(gh<_i31.SharedPreferences>()));
  gh.singleton<_i35.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i36.DashboardSharePreferenceUseCase>(
      () => _i36.DashboardSharePreferenceUseCase(gh<_i31.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i31.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i37.EcomAPI>(() => _i37.EcomAPI(gh<_i38.Dio>()));
  gh.factory<_i39.EcomRepository>(
      () => _i40.EcomRepositoryImpl(gh<_i37.EcomAPI>()));
  gh.factory<_i41.EcomUsecase>(
      () => _i41.EcomUsecase(gh<_i39.EcomRepository>()));
  gh.factory<_i42.FriendApi>(() => _i42.FriendApi(gh<_i38.Dio>()));
  gh.factory<_i43.FriendRepository>(
      () => _i44.FriendRepositoryImpl(gh<_i42.FriendApi>()));
  gh.factory<_i45.FriendUsecase>(
      () => _i45.FriendUsecase(gh<_i43.FriendRepository>()));
  gh.factory<_i46.GetListBlocParam1<_i47.ProductDetailResponse, List<String>>>(
      () => marshopBlocFactory.getProducts(gh<_i41.EcomUsecase>()));
  gh.factory<_i48.GiftSharePreferencesUseCase>(
      () => _i48.GiftSharePreferencesUseCase(gh<_i31.SharedPreferences>()));
  gh.factory<_i49.InformationPDoneSharePreferencesUsecase>(() =>
      _i49.InformationPDoneSharePreferencesUsecase(
          gh<_i31.SharedPreferences>()));
  gh.factory<_i50.InformationPdoneProfileCubit>(() =>
      _i50.InformationPdoneProfileCubit(
          gh<_i49.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i51.LiveApi>(() => _i51.LiveApi(gh<_i3.Dio>()));
  gh.factory<_i52.LiveRepository>(
      () => _i53.LiveRepositoryImpl(gh<_i51.LiveApi>()));
  gh.factory<_i54.LiveUseCase>(
      () => _i54.LiveUseCase(gh<_i52.LiveRepository>()));
  gh.factory<_i55.MarshopAPI>(() => _i55.MarshopAPI(gh<_i38.Dio>()));
  gh.factory<_i56.MarshopRepository>(
      () => _i57.MarshopRepositoryImpl(gh<_i55.MarshopAPI>()));
  gh.factory<_i58.MarshopUsecase>(
      () => _i58.MarshopUsecase(gh<_i56.MarshopRepository>()));
  gh.factory<_i59.NotificationAPI>(() => _i59.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i60.NotificationRepository>(
      () => _i61.NotificationRepositoryImpl(gh<_i59.NotificationAPI>()));
  gh.factory<_i62.NotificationUsecase>(
      () => _i62.NotificationUsecase(gh<_i60.NotificationRepository>()));
  gh.lazySingleton<_i63.OpenWeatherApi>(
      () => _i63.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i64.OpenWeatherRepository>(
      () => _i65.OpenWeatherRepositoryImpl(gh<_i63.OpenWeatherApi>()));
  gh.factory<_i66.OpenWeatherUseCase>(
      () => _i66.OpenWeatherUseCase(gh<_i64.OpenWeatherRepository>()));
  gh.factory<_i67.PlaceInformationAPI>(
      () => _i67.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i68.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i31.SharedPreferences>(),
        gh<_i68.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i69.PlaceInformationRepository>(() =>
      _i70.PlaceInformationRepositoryImpl(gh<_i67.PlaceInformationAPI>()));
  gh.factory<_i71.PlaceInformationUsecase>(() =>
      _i71.PlaceInformationUsecase(gh<_i69.PlaceInformationRepository>()));
  gh.lazySingleton<_i72.ProtectorAPI>(() => _i72.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i73.ProtectorRepository>(
      () => _i74.ProtectorRepositoryImpl(gh<_i72.ProtectorAPI>()));
  gh.factory<_i75.ProtectorUseCase>(
      () => _i75.ProtectorUseCase(gh<_i73.ProtectorRepository>()));
  gh.factory<_i76.ResourceApi>(() => _i76.ResourceApi(gh<_i38.Dio>()));
  gh.factory<_i77.ResourceRepository>(
      () => _i78.ResourceRepositoryImpl(gh<_i76.ResourceApi>()));
  gh.factory<_i79.ResourceUsecase>(
      () => _i79.ResourceUsecase(gh<_i77.ResourceRepository>()));
  gh.factory<_i80.UpgradeAccountApi>(
      () => _i80.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i81.UpgradeAccountRepository>(
      () => _i82.UpgradeAccountRepositoryImpl(
            gh<_i80.UpgradeAccountApi>(),
            gh<_i76.ResourceApi>(),
          ));
  gh.factory<_i83.UpgradeAccountUsecase>(
      () => _i83.UpgradeAccountUsecase(gh<_i81.UpgradeAccountRepository>()));
  gh.factory<_i84.UpgradeCubit>(
      () => _i84.UpgradeCubit(gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<_i85.UserApi>(() => _i85.UserApi(gh<_i3.Dio>()));
  gh.factory<_i86.UserRepository>(
      () => _i87.AuthRepositoryImpl(gh<_i85.UserApi>()));
  gh.factory<_i88.UserUsecase>(
      () => _i88.UserUsecase(gh<_i86.UserRepository>()));
  gh.factory<_i89.AddMemberChangeNotifier>(
      () => _i89.AddMemberChangeNotifier(gh<_i88.UserUsecase>()));
  gh.factory<_i90.AllFriendsCubit>(
      () => _i90.AllFriendsCubit(gh<_i45.FriendUsecase>()));
  gh.factory<_i91.ApprovedRequestCubit>(
      () => _i91.ApprovedRequestCubit(gh<_i88.UserUsecase>()));
  gh.factory<_i92.AuthApi>(() => _i92.AuthApi(gh<_i38.Dio>()));
  gh.factory<_i93.AuthRepository>(
      () => _i94.AuthRepositoryImpl(gh<_i92.AuthApi>()));
  gh.factory<_i95.AuthenticationUsecase>(() => _i95.AuthenticationUsecase(
        gh<_i93.AuthRepository>(),
        gh<_i34.UserSharePreferencesUsecase>(),
        gh<_i86.UserRepository>(),
        gh<_i26.NotificationService>(),
        gh<_i8.ChatSocket>(),
      ));
  gh.factory<_i96.CallApi>(() => _i96.CallApi(gh<_i38.Dio>()));
  gh.factory<_i97.CallRepository>(
      () => _i98.CallRepositoryImpl(gh<_i96.CallApi>()));
  gh.factory<_i99.CallUseCase>(
      () => _i99.CallUseCase(gh<_i97.CallRepository>()));
  gh.factory<_i100.CategoryController>(
      () => _i100.CategoryController(gh<_i52.LiveRepository>()));
  gh.factory<_i101.ChangePasswordController>(
      () => _i101.ChangePasswordController(gh<_i95.AuthenticationUsecase>()));
  gh.factory<_i102.ChatApi>(() => _i102.ChatApi(gh<_i38.Dio>()));
  gh.factory<_i103.ChatRepository>(
      () => _i104.ChatRepositoryImpl(gh<_i102.ChatApi>()));
  gh.factory<_i105.ChatUseCase>(() => _i105.ChatUseCase(
        gh<_i103.ChatRepository>(),
        gh<_i43.FriendRepository>(),
      ));
  gh.factory<_i106.CommunityApi>(() => _i106.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i107.CommunityRepository>(
      () => _i108.CommunityRepositoryImpl(gh<_i106.CommunityApi>()));
  gh.factory<_i109.CommunityUsecase>(() => _i109.CommunityUsecase(
        gh<_i107.CommunityRepository>(),
        gh<_i79.ResourceUsecase>(),
      ));
  gh.singleton<_i110.ConversationCubit>(
      _i110.ConversationCubit(gh<_i105.ChatUseCase>()));
  gh.factory<_i111.CreateRoomCubit>(
      () => _i111.CreateRoomCubit(gh<_i105.ChatUseCase>()));
  gh.factory<_i112.DashBoardBgController>(() =>
      _i112.DashBoardBgController(gh<_i36.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i113.DashBoardScreenController>(() =>
      _i113.DashBoardScreenController(
          gh<_i36.DashboardSharePreferenceUseCase>()));
  gh.factory<_i114.DashboardCommunityBloc>(() =>
      _i114.DashboardCommunityBloc(gh<_i36.DashboardSharePreferenceUseCase>()));
  gh.factory<_i114.DashboardEcommerceBloc>(() =>
      _i114.DashboardEcommerceBloc(gh<_i36.DashboardSharePreferenceUseCase>()));
  gh.factory<_i114.DashboardPersonalBloc>(() =>
      _i114.DashboardPersonalBloc(gh<_i36.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i115.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i115.EditCommunityDetailBloc(
        gh<_i109.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i116.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i116.EditFanGroupBloc(
        gh<_i109.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i117.EmailVerifyController>(
      () => _i117.EmailVerifyController(gh<_i88.UserUsecase>()));
  gh.factory<_i118.FanGroupDetailBloc>(
      () => _i118.FanGroupDetailBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<_i46.GetDetailBloc<_i119.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<_i46.GetDetailBloc<_i120.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<_i46.GetDetailBloc<_i121.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<_i46.GetDetailBloc<_i3.FanGroup>>(() =>
      communityModule.createGetFanGroupBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<_i46.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i88.UserUsecase>()));
  gh.factory<_i46.GetDetailBlocParam1<dynamic, _i122.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<
          _i46
          .GetDetailBlocParam1<_i123.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<
      _i46.GetDetailBlocParam1<_i120.BankAccount,
          _i124.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<
          _i46.GetDetailBlocParam1<_i125.MarshopResponse,
              _i126.GetMarshopInfoPayload>>(
      () => marshopBlocFactory.getMarshopInfo(gh<_i58.MarshopUsecase>()));
  gh.factory<
      _i46.GetDetailBlocParam1<_i121.UpgradeAccountResponse,
          _i127.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<
      _i46.GetDetailBlocParam1<_i128.ConfirmRegisterJAResponse,
          _i129.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<
          _i46.GetDetailBlocParam1<_i130.BossCommunityStatusResponse, String>>(
      () => communityModule
          .createGetBossStatusBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<
      _i46.GetDetailBlocParam2<_i131.ConfirmResponse, String,
          _i132.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<
      _i46.GetDetailBlocParam2<_i131.ConfirmResponse, String,
          _i133.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<_i46.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<_i46.GetListBloc<_i125.MarshopRegisterPackResponse>>(
      () => marshopBlocFactory.getMarshopPack(gh<_i58.MarshopUsecase>()));
  gh.factory<_i46.GetListBloc<_i134.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<_i46.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i109.CommunityUsecase>()));
  gh.factory<_i46.GetListBloc<_i135.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<_i46.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<
          _i46.GetListBlocParam1<_i125.MarshopResponse,
              _i126.GetListMarshopPayload>>(
      () => marshopBlocFactory.listMarshopBloc(gh<_i58.MarshopUsecase>()));
  gh.factory<_i136.GiftController>(
      () => _i136.GiftController(gh<_i54.LiveUseCase>()));
  gh.factory<_i137.GroupDetailBloc>(
      () => _i137.GroupDetailBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<_i138.GuardianPDoneBloc>(
      () => _i138.GuardianPDoneBloc(gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<_i139.InformationUpdateProfilBloc>(
      () => _i139.InformationUpdateProfilBloc(
            gh<_i88.UserUsecase>(),
            gh<_i49.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i140.ListProtectorRequestController>(
      () => _i140.ListProtectorRequestController(gh<_i75.ProtectorUseCase>()));
  gh.factory<_i141.LiveBottomController>(() => _i141.LiveBottomController(
        gh<_i54.LiveUseCase>(),
        gh<_i88.UserUsecase>(),
      ));
  gh.factory<_i142.LiveChannelController>(() => _i142.LiveChannelController(
        gh<_i52.LiveRepository>(),
        gh<_i34.UserSharePreferencesUsecase>(),
        gh<_i88.UserUsecase>(),
        gh<_i18.LiveService>(),
        gh<_i20.LiveSocketService>(),
        gh<_i12.FloatingGiftsProvider>(),
      ));
  gh.factory<_i143.LiveCheckPasswordController>(
      () => _i143.LiveCheckPasswordController(gh<_i54.LiveUseCase>()));
  gh.factory<_i144.LiveController>(
      () => _i144.LiveController(gh<_i54.LiveUseCase>()));
  gh.factory<_i145.LiveCreateController>(() => _i145.LiveCreateController(
        gh<_i52.LiveRepository>(),
        gh<_i18.LiveService>(),
      ));
  gh.factory<_i140.ManageProtectController>(
      () => _i140.ManageProtectController(gh<_i75.ProtectorUseCase>()));
  gh.factory<_i146.MarshopCubit>(
      () => _i146.MarshopCubit(gh<_i58.MarshopUsecase>()));
  gh.factory<_i147.NewMessageCubit>(
      () => _i147.NewMessageCubit(gh<_i105.ChatUseCase>()));
  gh.factory<_i148.NotificationBloc>(
      () => _i148.NotificationBloc(gh<_i62.NotificationUsecase>()));
  gh.factory<_i149.OpenWeatherBloc>(
      () => _i149.OpenWeatherBloc(gh<_i66.OpenWeatherUseCase>()));
  gh.factory<_i150.PDoneInformationBloc>(
      () => _i150.PDoneInformationBloc(gh<_i83.UpgradeAccountUsecase>()));
  gh.factory<_i151.PhoneBookDetailCubit>(
      () => _i151.PhoneBookDetailCubit(gh<_i99.CallUseCase>()));
  gh.factory<_i152.PlaceInformationBloc>(
      () => _i152.PlaceInformationBloc(gh<_i71.PlaceInformationUsecase>()));
  gh.factory<_i153.PlaceInformationBloc2>(
      () => _i153.PlaceInformationBloc2(gh<_i71.PlaceInformationUsecase>()));
  gh.factory<_i154.SearchCubit>(
      () => _i154.SearchCubit(gh<_i88.UserUsecase>()));
  gh.factory<_i155.TeamDetailBloc>(
      () => _i155.TeamDetailBloc(gh<_i109.CommunityUsecase>()));
  gh.factory<_i156.TeamRequestCubit>(
      () => _i156.TeamRequestCubit(gh<_i109.CommunityUsecase>()));
  gh.factory<_i157.UpgradePDoneBloc>(() => _i157.UpgradePDoneBloc(
        gh<_i83.UpgradeAccountUsecase>(),
        gh<_i88.UserUsecase>(),
        gh<_i34.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i158.UserActionCubit>(
      () => _i158.UserActionCubit(gh<_i88.UserUsecase>()));
  gh.factory<_i159.UserBloc>(() => _i159.UserBloc(
        gh<_i95.AuthenticationUsecase>(),
        gh<_i34.UserSharePreferencesUsecase>(),
        gh<_i88.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i160.UserCubit>(() => _i160.UserCubit(
        gh<_i95.AuthenticationUsecase>(),
        gh<_i34.UserSharePreferencesUsecase>(),
        gh<_i88.UserUsecase>(),
      ));
  gh.factory<_i161.UserProfileBloc>(() => _i161.UserProfileBloc(
        gh<_i88.UserUsecase>(),
        gh<_i75.ProtectorUseCase>(),
        gh<_i23.MediaPicker>(),
        gh<_i83.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i162.AppCubit>(() => _i162.AppCubit(
        gh<_i79.ResourceUsecase>(),
        gh<_i34.UserSharePreferencesUsecase>(),
        gh<_i95.AuthenticationUsecase>(),
      ));
  gh.singleton<_i163.AppSettingBloc>(
      _i163.AppSettingBloc(gh<_i95.AuthenticationUsecase>()));
  gh.factory<_i164.AuthCubit>(
      () => _i164.AuthCubit(gh<_i95.AuthenticationUsecase>()));
  gh.singleton<_i165.CallCubit>(_i165.CallCubit(
    gh<_i99.CallUseCase>(),
    gh<_i88.UserUsecase>(),
  ));
  gh.factory<_i166.CallHistoryCubit>(
      () => _i166.CallHistoryCubit(gh<_i99.CallUseCase>()));
  gh.singleton<_i167.ChatRoomCubit>(_i167.ChatRoomCubit(
    gh<_i105.ChatUseCase>(),
    gh<_i88.UserUsecase>(),
    gh<_i83.UpgradeAccountUsecase>(),
    gh<_i23.MediaPicker>(),
  ));
  await _i168.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i169.DataSourceModule {}

class _$ConfigModule extends _i170.ConfigModule {}

class _$MarshopBlocFactory extends _i171.MarshopBlocFactory {}

class _$PlaceModule extends _i68.PlaceModule {}

class _$CommunityModule extends _i172.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i173.UpgradeAgreePolicyBlocFactory {}

class _$DiaryBlocFactory extends _i174.DiaryBlocFactory {}

class _$DashBoardModule extends _i175.DashBoardModule {}
