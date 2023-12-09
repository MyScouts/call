// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i40;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i48;
import 'package:shared_preferences/shared_preferences.dart' as _i32;
import 'package:wallet/core/core.dart' as _i36;
import 'package:wallet/di/wallet_micro.module.dart' as _i180;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i173;
import '../blocs/approved_request/approved_request_cubit.dart' as _i97;
import '../blocs/auth/auth_cubit.dart' as _i175;
import '../blocs/community/team_request/team_request_cubit.dart' as _i167;
import '../blocs/marshop/marshop_cubit.dart' as _i156;
import '../blocs/user/user_cubit.dart' as _i171;
import '../blocs/user_action/user_action_cubit.dart' as _i169;
import '../core/services/live_service/impl/live_service_impl.dart' as _i19;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i21;
import '../core/services/live_service/live_service.dart' as _i18;
import '../core/services/live_service/live_socket_service.dart' as _i20;
import '../core/services/notifications/notification_service.dart' as _i27;
import '../core/socket/chat_socket.dart' as _i8;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i51;
import '../data/data_sources/remote/auth_api.dart' as _i98;
import '../data/data_sources/remote/call_api.dart' as _i102;
import '../data/data_sources/remote/chat_api.dart' as _i108;
import '../data/data_sources/remote/comment_api.dart' as _i112;
import '../data/data_sources/remote/community_api.dart' as _i116;
import '../data/data_sources/remote/ecom_api.dart' as _i39;
import '../data/data_sources/remote/friend_api.dart' as _i44;
import '../data/data_sources/remote/marshop_api.dart' as _i57;
import '../data/data_sources/remote/notification_api.dart' as _i61;
import '../data/data_sources/remote/open_weather_api.dart' as _i65;
import '../data/data_sources/remote/place_information_api.dart' as _i70;
import '../data/data_sources/remote/place_information_provider.dart' as _i71;
import '../data/data_sources/remote/post_api.dart' as _i75;
import '../data/data_sources/remote/protector_api.dart' as _i78;
import '../data/data_sources/remote/resource_api.dart' as _i82;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i86;
import '../data/data_sources/remote/user_api.dart' as _i91;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i142;
import '../data/models/payloads/marshop/marshop_payload.dart' as _i140;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i133;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i135;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i138;
import '../data/models/responses/boss_community_status_response.dart' as _i134;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i136;
import '../data/models/responses/confirm_register_ja_response.dart' as _i132;
import '../data/models/responses/confirm_response.dart' as _i141;
import '../data/models/responses/ecom/product_detail_response.dart' as _i49;
import '../data/models/responses/group_request_response.dart' as _i144;
import '../data/models/responses/ja_status_response.dart' as _i130;
import '../data/models/responses/marshop_response.dart' as _i139;
import '../data/models/responses/upgrade_account_response.dart' as _i129;
import '../data/repositories/auth_repository.dart' as _i99;
import '../data/repositories/comment_repository.dart' as _i113;
import '../data/repositories/ecom_repository.dart' as _i41;
import '../data/repositories/impl/auth_repository_impl.dart' as _i100;
import '../data/repositories/impl/call_repository_impl.dart' as _i104;
import '../data/repositories/impl/chat_repository_impl.dart' as _i110;
import '../data/repositories/impl/comment_repository_impl.dart' as _i114;
import '../data/repositories/impl/community_repository.impl.dart' as _i118;
import '../data/repositories/impl/ecom_repository_impl.dart' as _i42;
import '../data/repositories/impl/friend_repository_impl.dart' as _i46;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i59;
import '../data/repositories/impl/media_picker_impl.dart' as _i24;
import '../data/repositories/impl/notification_repository.impl.dart' as _i63;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i67;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i73;
import '../data/repositories/impl/post_repository_impl.dart' as _i77;
import '../data/repositories/impl/protector_repository_impl.dart' as _i80;
import '../data/repositories/impl/resource_repository.impl.dart' as _i84;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i88;
import '../data/repositories/impl/user_repository_impl.dart' as _i93;
import '../data/repositories/marshop_repository.dart' as _i58;
import '../data/repositories/media_picker.dart' as _i23;
import '../data/repositories/notification_repository.dart' as _i62;
import '../data/repositories/post_repository.dart' as _i76;
import '../data/repositories/protector_repository.dart' as _i79;
import '../data/repositories/user_repository.dart' as _i92;
import '../domain/entities/bank.dart' as _i145;
import '../domain/entities/commity_action_type.dart' as _i137;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i131;
import '../domain/repository/call_repository.dart' as _i103;
import '../domain/repository/chat_repository.dart' as _i109;
import '../domain/repository/community_repository.dart' as _i117;
import '../domain/repository/friend_repository.dart' as _i45;
import '../domain/repository/open_weather_repository.dart' as _i66;
import '../domain/repository/place_information_repository.dart' as _i72;
import '../domain/repository/resource_repository.dart' as _i83;
import '../domain/repository/upgrade_account_repository.dart' as _i87;
import '../domain/usecases/authentication_usecase.dart' as _i101;
import '../domain/usecases/call_usecase.dart' as _i105;
import '../domain/usecases/chat_usecase.dart' as _i111;
import '../domain/usecases/comment_usecase.dart' as _i115;
import '../domain/usecases/community_usecase.dart' as _i119;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i38;
import '../domain/usecases/ecom_usecase.dart' as _i43;
import '../domain/usecases/friend_usecase.dart' as _i47;
import '../domain/usecases/marshop_usecase.dart' as _i60;
import '../domain/usecases/notification_usecase.dart' as _i64;
import '../domain/usecases/open_weather_usecase.dart' as _i68;
import '../domain/usecases/place_information_usecase.dart' as _i74;
import '../domain/usecases/post_usecase.dart' as _i164;
import '../domain/usecases/protector_usecase.dart' as _i81;
import '../domain/usecases/resource_usecase.dart' as _i85;
import '../domain/usecases/upgrade_account_usecase.dart' as _i89;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i35;
import '../domain/usecases/user_usecase.dart' as _i94;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/call/call_1v1/cubit/call_cubit.dart' as _i176;
import '../presentation/call/call_routes.dart' as _i6;
import '../presentation/call/phone_book/tabs/all_friends/cubit/all_friends_cubit.dart'
    as _i96;
import '../presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart'
    as _i177;
import '../presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart'
    as _i161;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i178;
import '../presentation/chat/chat_routes.dart' as _i7;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i120;
import '../presentation/chat/create_room/cubit/create_room_cubit.dart' as _i121;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i157;
import '../presentation/community/community_constants.dart' as _i143;
import '../presentation/community/community_module.dart' as _i185;
import '../presentation/community/community_routes.dart' as _i9;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i125;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i126;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i128;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i147;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i166;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i95;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i123;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i124;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i159;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i122;
import '../presentation/dashboard/dashboard_module.dart' as _i187;
import '../presentation/dashboard/dashboard_routes.dart' as _i10;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i165;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i107;
import '../presentation/general_setting/general_routes.dart' as _i14;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i149;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i52;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i163;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i15;
import '../presentation/live/data/data_sources/remote/live_api.dart' as _i53;
import '../presentation/live/data/repository/live_repository.dart' as _i54;
import '../presentation/live/data/repository/repository_impl/live_repository_impl.dart'
    as _i55;
import '../presentation/live/domain/usecases/gift_share_preferences_usecase.dart'
    as _i50;
import '../presentation/live/domain/usecases/live_usecases.dart' as _i56;
import '../presentation/live/live_routes.dart' as _i17;
import '../presentation/live/presentation/channel/state/live_channel_controller.dart'
    as _i152;
import '../presentation/live/presentation/channel/widget/sent_gift_page.dart'
    as _i12;
import '../presentation/live/presentation/create/state/live_create_controller.dart'
    as _i155;
import '../presentation/live/presentation/create/widget/live_category_picker.dart'
    as _i106;
import '../presentation/live/presentation/list_gift/gift_controller.dart'
    as _i146;
import '../presentation/live/presentation/live_bottom/live_bottom_controller.dart'
    as _i151;
import '../presentation/live/presentation/live_message/state/live_message_bloc.dart'
    as _i16;
import '../presentation/live/presentation/live_tab/live_controller.dart'
    as _i154;
import '../presentation/live/presentation/pk/invite/pk_invite_controller.dart'
    as _i69;
import '../presentation/live/presentation/widget/check_password_enable.dart'
    as _i153;
import '../presentation/marshop/marshop_bloc.dart' as _i183;
import '../presentation/marshop/marshop_routes.dart' as _i22;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i13;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i11;
import '../presentation/notification/notification_routes.dart' as _i26;
import '../presentation/notification/state/notification_bloc.dart' as _i158;
import '../presentation/otp_verify/email_otp_verify.dart' as _i127;
import '../presentation/profile/state/user_profile_bloc.dart' as _i172;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i150;
import '../presentation/protector/protector_router.dart' as _i28;
import '../presentation/qr_code/qr_code_route.dart' as _i29;
import '../presentation/routes.dart' as _i30;
import '../presentation/settings/setting_routes.dart' as _i31;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i174;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i170;
import '../presentation/social/my_profile/blocs/my_profile_bloc.dart' as _i179;
import '../presentation/social/my_profile/my_profile_routes.dart' as _i25;
import '../presentation/social/my_profile/screens/components/create_post/blocs/create_post_bloc.dart'
    as _i37;
import '../presentation/social/profile/profile_bloc.dart' as _i186;
import '../presentation/social/social_routes.dart' as _i33;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i34;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i184;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i148;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i160;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i162;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i90;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i168;
import 'modules/config_module.dart' as _i182;
import 'modules/data_source_module.dart' as _i181;

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
  gh.factory<_i25.MyProfileRoutes>(() => _i25.MyProfileRoutes());
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
  gh.factory<_i37.CreatePostBloc>(
      () => _i37.CreatePostBloc(gh<_i23.MediaPicker>()));
  gh.factory<_i38.DashboardSharePreferenceUseCase>(
      () => _i38.DashboardSharePreferenceUseCase(gh<_i32.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i32.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i39.EcomAPI>(() => _i39.EcomAPI(gh<_i40.Dio>()));
  gh.factory<_i41.EcomRepository>(
      () => _i42.EcomRepositoryImpl(gh<_i39.EcomAPI>()));
  gh.factory<_i43.EcomUsecase>(
      () => _i43.EcomUsecase(gh<_i41.EcomRepository>()));
  gh.factory<_i44.FriendApi>(() => _i44.FriendApi(gh<_i40.Dio>()));
  gh.factory<_i45.FriendRepository>(
      () => _i46.FriendRepositoryImpl(gh<_i44.FriendApi>()));
  gh.factory<_i47.FriendUsecase>(
      () => _i47.FriendUsecase(gh<_i45.FriendRepository>()));
  gh.factory<_i48.GetListBlocParam1<_i49.ProductDetailResponse, List<String>>>(
      () => marshopBlocFactory.getProducts(gh<_i43.EcomUsecase>()));
  gh.factory<_i50.GiftSharePreferencesUseCase>(
      () => _i50.GiftSharePreferencesUseCase(gh<_i32.SharedPreferences>()));
  gh.factory<_i51.InformationPDoneSharePreferencesUsecase>(() =>
      _i51.InformationPDoneSharePreferencesUsecase(
          gh<_i32.SharedPreferences>()));
  gh.factory<_i52.InformationPdoneProfileCubit>(() =>
      _i52.InformationPdoneProfileCubit(
          gh<_i51.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i53.LiveApi>(() => _i53.LiveApi(gh<_i3.Dio>()));
  gh.factory<_i54.LiveRepository>(
      () => _i55.LiveRepositoryImpl(gh<_i53.LiveApi>()));
  gh.factory<_i56.LiveUseCase>(
      () => _i56.LiveUseCase(gh<_i54.LiveRepository>()));
  gh.factory<_i57.MarshopAPI>(() => _i57.MarshopAPI(gh<_i40.Dio>()));
  gh.factory<_i58.MarshopRepository>(
      () => _i59.MarshopRepositoryImpl(gh<_i57.MarshopAPI>()));
  gh.factory<_i60.MarshopUsecase>(
      () => _i60.MarshopUsecase(gh<_i58.MarshopRepository>()));
  gh.factory<_i61.NotificationAPI>(() => _i61.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i62.NotificationRepository>(
      () => _i63.NotificationRepositoryImpl(gh<_i61.NotificationAPI>()));
  gh.factory<_i64.NotificationUsecase>(
      () => _i64.NotificationUsecase(gh<_i62.NotificationRepository>()));
  gh.lazySingleton<_i65.OpenWeatherApi>(
      () => _i65.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i66.OpenWeatherRepository>(
      () => _i67.OpenWeatherRepositoryImpl(gh<_i65.OpenWeatherApi>()));
  gh.factory<_i68.OpenWeatherUseCase>(
      () => _i68.OpenWeatherUseCase(gh<_i66.OpenWeatherRepository>()));
  gh.factory<_i69.PkInviteController>(
      () => _i69.PkInviteController(gh<_i56.LiveUseCase>()));
  gh.factory<_i70.PlaceInformationAPI>(
      () => _i70.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i71.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i32.SharedPreferences>(),
        gh<_i71.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i72.PlaceInformationRepository>(() =>
      _i73.PlaceInformationRepositoryImpl(gh<_i70.PlaceInformationAPI>()));
  gh.factory<_i74.PlaceInformationUsecase>(() =>
      _i74.PlaceInformationUsecase(gh<_i72.PlaceInformationRepository>()));
  gh.factory<_i75.PostAPI>(() => _i75.PostAPI(gh<_i3.Dio>()));
  gh.factory<_i76.PostRepository>(
      () => _i77.PostRepositoryImpl(gh<_i75.PostAPI>()));
  gh.lazySingleton<_i78.ProtectorAPI>(() => _i78.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i79.ProtectorRepository>(
      () => _i80.ProtectorRepositoryImpl(gh<_i78.ProtectorAPI>()));
  gh.factory<_i81.ProtectorUseCase>(
      () => _i81.ProtectorUseCase(gh<_i79.ProtectorRepository>()));
  gh.factory<_i82.ResourceApi>(() => _i82.ResourceApi(gh<_i40.Dio>()));
  gh.factory<_i83.ResourceRepository>(
      () => _i84.ResourceRepositoryImpl(gh<_i82.ResourceApi>()));
  gh.factory<_i85.ResourceUsecase>(
      () => _i85.ResourceUsecase(gh<_i83.ResourceRepository>()));
  gh.factory<_i86.UpgradeAccountApi>(
      () => _i86.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i87.UpgradeAccountRepository>(
      () => _i88.UpgradeAccountRepositoryImpl(
            gh<_i86.UpgradeAccountApi>(),
            gh<_i82.ResourceApi>(),
          ));
  gh.factory<_i89.UpgradeAccountUsecase>(
      () => _i89.UpgradeAccountUsecase(gh<_i87.UpgradeAccountRepository>()));
  gh.factory<_i90.UpgradeCubit>(
      () => _i90.UpgradeCubit(gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<_i91.UserApi>(() => _i91.UserApi(gh<_i3.Dio>()));
  gh.factory<_i92.UserRepository>(
      () => _i93.AuthRepositoryImpl(gh<_i91.UserApi>()));
  gh.factory<_i94.UserUsecase>(
      () => _i94.UserUsecase(gh<_i92.UserRepository>()));
  gh.factory<_i95.AddMemberChangeNotifier>(
      () => _i95.AddMemberChangeNotifier(gh<_i94.UserUsecase>()));
  gh.factory<_i96.AllFriendsCubit>(
      () => _i96.AllFriendsCubit(gh<_i47.FriendUsecase>()));
  gh.factory<_i97.ApprovedRequestCubit>(
      () => _i97.ApprovedRequestCubit(gh<_i94.UserUsecase>()));
  gh.factory<_i98.AuthApi>(() => _i98.AuthApi(gh<_i40.Dio>()));
  gh.factory<_i99.AuthRepository>(
      () => _i100.AuthRepositoryImpl(gh<_i98.AuthApi>()));
  gh.factory<_i101.AuthenticationUsecase>(() => _i101.AuthenticationUsecase(
        gh<_i99.AuthRepository>(),
        gh<_i35.UserSharePreferencesUsecase>(),
        gh<_i92.UserRepository>(),
        gh<_i27.NotificationService>(),
        gh<_i8.ChatSocket>(),
      ));
  gh.factory<_i102.CallApi>(() => _i102.CallApi(gh<_i40.Dio>()));
  gh.factory<_i103.CallRepository>(
      () => _i104.CallRepositoryImpl(gh<_i102.CallApi>()));
  gh.factory<_i105.CallUseCase>(
      () => _i105.CallUseCase(gh<_i103.CallRepository>()));
  gh.factory<_i106.CategoryController>(
      () => _i106.CategoryController(gh<_i54.LiveRepository>()));
  gh.factory<_i107.ChangePasswordController>(
      () => _i107.ChangePasswordController(gh<_i101.AuthenticationUsecase>()));
  gh.factory<_i108.ChatApi>(() => _i108.ChatApi(gh<_i40.Dio>()));
  gh.factory<_i109.ChatRepository>(
      () => _i110.ChatRepositoryImpl(gh<_i108.ChatApi>()));
  gh.factory<_i111.ChatUseCase>(() => _i111.ChatUseCase(
        gh<_i109.ChatRepository>(),
        gh<_i45.FriendRepository>(),
      ));
  gh.factory<_i112.CommentAPI>(() => _i112.CommentAPI(gh<_i3.Dio>()));
  gh.factory<_i113.CommentRepository>(
      () => _i114.CommentRepositoryImpl(gh<_i112.CommentAPI>()));
  gh.factory<_i115.CommentUsecase>(
      () => _i115.CommentUsecase(gh<_i113.CommentRepository>()));
  gh.factory<_i116.CommunityApi>(() => _i116.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i117.CommunityRepository>(
      () => _i118.CommunityRepositoryImpl(gh<_i116.CommunityApi>()));
  gh.factory<_i119.CommunityUsecase>(() => _i119.CommunityUsecase(
        gh<_i117.CommunityRepository>(),
        gh<_i85.ResourceUsecase>(),
      ));
  gh.singleton<_i120.ConversationCubit>(
      _i120.ConversationCubit(gh<_i111.ChatUseCase>()));
  gh.factory<_i121.CreateRoomCubit>(
      () => _i121.CreateRoomCubit(gh<_i111.ChatUseCase>()));
  gh.factory<_i122.DashBoardBgController>(() =>
      _i122.DashBoardBgController(gh<_i38.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i123.DashBoardScreenController>(() =>
      _i123.DashBoardScreenController(
          gh<_i38.DashboardSharePreferenceUseCase>()));
  gh.factory<_i124.DashboardCommunityBloc>(() =>
      _i124.DashboardCommunityBloc(gh<_i38.DashboardSharePreferenceUseCase>()));
  gh.factory<_i124.DashboardEcommerceBloc>(() =>
      _i124.DashboardEcommerceBloc(gh<_i38.DashboardSharePreferenceUseCase>()));
  gh.factory<_i124.DashboardPersonalBloc>(() =>
      _i124.DashboardPersonalBloc(gh<_i38.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i125.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i125.EditCommunityDetailBloc(
        gh<_i119.CommunityUsecase>(),
        community,
      ));
  gh.factoryParam<_i126.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i126.EditFanGroupBloc(
        gh<_i119.CommunityUsecase>(),
        fanGroup,
      ));
  gh.factory<_i127.EmailVerifyController>(
      () => _i127.EmailVerifyController(gh<_i94.UserUsecase>()));
  gh.factory<_i128.FanGroupDetailBloc>(
      () => _i128.FanGroupDetailBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<_i48.GetDetailBloc<_i3.FanGroup>>(() =>
      communityModule.createGetFanGroupBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<_i48.GetDetailBloc<_i129.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<_i48.GetDetailBloc<_i130.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<_i48.GetDetailBloc<_i131.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<
      _i48.GetDetailBlocParam1<_i132.ConfirmRegisterJAResponse,
          _i133.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<
          _i48.GetDetailBlocParam1<_i134.BossCommunityStatusResponse, String>>(
      () => communityModule
          .createGetBossStatusBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<
      _i48.GetDetailBlocParam1<_i131.BankAccount,
          _i135.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<
          _i48
          .GetDetailBlocParam1<_i136.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<_i48.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i94.UserUsecase>()));
  gh.factory<
      _i48.GetDetailBlocParam1<_i129.UpgradeAccountResponse,
          _i137.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<_i48.GetDetailBlocParam1<dynamic, _i138.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<
          _i48.GetDetailBlocParam1<_i139.MarshopResponse,
              _i140.GetMarshopInfoPayload>>(
      () => marshopBlocFactory.getMarshopInfo(gh<_i60.MarshopUsecase>()));
  gh.factory<
      _i48.GetDetailBlocParam2<_i141.ConfirmResponse, String,
          _i142.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<
      _i48.GetDetailBlocParam2<_i141.ConfirmResponse, String,
          _i143.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<_i48.GetListBloc<_i139.MarshopRegisterPackResponse>>(
      () => marshopBlocFactory.getMarshopPack(gh<_i60.MarshopUsecase>()));
  gh.factory<_i48.GetListBloc<_i144.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<_i48.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i119.CommunityUsecase>()));
  gh.factory<_i48.GetListBloc<_i145.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<_i48.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<
          _i48.GetListBlocParam1<_i139.MarshopResponse,
              _i140.GetListMarshopPayload>>(
      () => marshopBlocFactory.listMarshopBloc(gh<_i60.MarshopUsecase>()));
  gh.factory<_i48.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<_i146.GiftController>(
      () => _i146.GiftController(gh<_i56.LiveUseCase>()));
  gh.factory<_i147.GroupDetailBloc>(
      () => _i147.GroupDetailBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<_i148.GuardianPDoneBloc>(
      () => _i148.GuardianPDoneBloc(gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<_i149.InformationUpdateProfilBloc>(
      () => _i149.InformationUpdateProfilBloc(
            gh<_i94.UserUsecase>(),
            gh<_i51.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i150.ListProtectorRequestController>(
      () => _i150.ListProtectorRequestController(gh<_i81.ProtectorUseCase>()));
  gh.factory<_i151.LiveBottomController>(() => _i151.LiveBottomController(
        gh<_i56.LiveUseCase>(),
        gh<_i94.UserUsecase>(),
      ));
  gh.factory<_i152.LiveChannelController>(() => _i152.LiveChannelController(
        gh<_i54.LiveRepository>(),
        gh<_i35.UserSharePreferencesUsecase>(),
        gh<_i94.UserUsecase>(),
        gh<_i18.LiveService>(),
        gh<_i20.LiveSocketService>(),
        gh<_i12.FloatingGiftsProvider>(),
      ));
  gh.factory<_i153.LiveCheckPasswordController>(
      () => _i153.LiveCheckPasswordController(gh<_i56.LiveUseCase>()));
  gh.factory<_i154.LiveController>(
      () => _i154.LiveController(gh<_i56.LiveUseCase>()));
  gh.factory<_i155.LiveCreateController>(() => _i155.LiveCreateController(
        gh<_i54.LiveRepository>(),
        gh<_i18.LiveService>(),
      ));
  gh.factory<_i150.ManageProtectController>(
      () => _i150.ManageProtectController(gh<_i81.ProtectorUseCase>()));
  gh.factory<_i156.MarshopCubit>(
      () => _i156.MarshopCubit(gh<_i60.MarshopUsecase>()));
  gh.factory<_i157.NewMessageCubit>(
      () => _i157.NewMessageCubit(gh<_i111.ChatUseCase>()));
  gh.factory<_i158.NotificationBloc>(
      () => _i158.NotificationBloc(gh<_i64.NotificationUsecase>()));
  gh.factory<_i159.OpenWeatherBloc>(
      () => _i159.OpenWeatherBloc(gh<_i68.OpenWeatherUseCase>()));
  gh.factory<_i160.PDoneInformationBloc>(
      () => _i160.PDoneInformationBloc(gh<_i89.UpgradeAccountUsecase>()));
  gh.factory<_i161.PhoneBookDetailCubit>(
      () => _i161.PhoneBookDetailCubit(gh<_i105.CallUseCase>()));
  gh.factory<_i162.PlaceInformationBloc>(
      () => _i162.PlaceInformationBloc(gh<_i74.PlaceInformationUsecase>()));
  gh.factory<_i163.PlaceInformationBloc2>(
      () => _i163.PlaceInformationBloc2(gh<_i74.PlaceInformationUsecase>()));
  gh.factory<_i164.PostUsecase>(() => _i164.PostUsecase(
        gh<_i76.PostRepository>(),
        gh<_i115.CommentUsecase>(),
        gh<_i82.ResourceApi>(),
      ));
  gh.factory<_i165.SearchCubit>(
      () => _i165.SearchCubit(gh<_i94.UserUsecase>()));
  gh.factory<_i166.TeamDetailBloc>(
      () => _i166.TeamDetailBloc(gh<_i119.CommunityUsecase>()));
  gh.factory<_i167.TeamRequestCubit>(
      () => _i167.TeamRequestCubit(gh<_i119.CommunityUsecase>()));
  gh.factory<_i168.UpgradePDoneBloc>(() => _i168.UpgradePDoneBloc(
        gh<_i89.UpgradeAccountUsecase>(),
        gh<_i94.UserUsecase>(),
        gh<_i35.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i169.UserActionCubit>(
      () => _i169.UserActionCubit(gh<_i94.UserUsecase>()));
  gh.factory<_i170.UserBloc>(() => _i170.UserBloc(
        gh<_i101.AuthenticationUsecase>(),
        gh<_i35.UserSharePreferencesUsecase>(),
        gh<_i94.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i171.UserCubit>(() => _i171.UserCubit(
        gh<_i101.AuthenticationUsecase>(),
        gh<_i35.UserSharePreferencesUsecase>(),
        gh<_i94.UserUsecase>(),
      ));
  gh.factory<_i172.UserProfileBloc>(() => _i172.UserProfileBloc(
        gh<_i94.UserUsecase>(),
        gh<_i81.ProtectorUseCase>(),
        gh<_i23.MediaPicker>(),
        gh<_i89.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i173.AppCubit>(() => _i173.AppCubit(
        gh<_i85.ResourceUsecase>(),
        gh<_i35.UserSharePreferencesUsecase>(),
        gh<_i101.AuthenticationUsecase>(),
      ));
  gh.singleton<_i174.AppSettingBloc>(
      _i174.AppSettingBloc(gh<_i101.AuthenticationUsecase>()));
  gh.factory<_i175.AuthCubit>(
      () => _i175.AuthCubit(gh<_i101.AuthenticationUsecase>()));
  gh.singleton<_i176.CallCubit>(_i176.CallCubit(
    gh<_i105.CallUseCase>(),
    gh<_i94.UserUsecase>(),
  ));
  gh.factory<_i177.CallHistoryCubit>(
      () => _i177.CallHistoryCubit(gh<_i105.CallUseCase>()));
  gh.singleton<_i178.ChatRoomCubit>(_i178.ChatRoomCubit(
    gh<_i111.ChatUseCase>(),
    gh<_i94.UserUsecase>(),
    gh<_i89.UpgradeAccountUsecase>(),
    gh<_i23.MediaPicker>(),
  ));
  gh.factory<_i179.MyProfileBloc>(() => _i179.MyProfileBloc(
        gh<_i94.UserUsecase>(),
        gh<_i164.PostUsecase>(),
        gh<_i115.CommentUsecase>(),
        gh<_i94.UserUsecase>(),
      ));
  await _i180.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i181.DataSourceModule {}

class _$ConfigModule extends _i182.ConfigModule {}

class _$MarshopBlocFactory extends _i183.MarshopBlocFactory {}

class _$PlaceModule extends _i71.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i184.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i185.CommunityModule {}

class _$DiaryBlocFactory extends _i186.DiaryBlocFactory {}

class _$DashBoardModule extends _i187.DashBoardModule {}
