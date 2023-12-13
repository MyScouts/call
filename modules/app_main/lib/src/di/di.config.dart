// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i44;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i56;
import 'package:shared_preferences/shared_preferences.dart' as _i35;
import 'package:wallet/core/core.dart' as _i40;
import 'package:wallet/di/wallet_micro.module.dart' as _i190;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i184;
import '../blocs/approved_request/approved_request_cubit.dart' as _i106;
import '../blocs/auth/auth_cubit.dart' as _i186;
import '../blocs/community/team_request/team_request_cubit.dart' as _i178;
import '../blocs/marshop/marshop_cubit.dart' as _i167;
import '../blocs/user/user_cubit.dart' as _i182;
import '../blocs/user_action/user_action_cubit.dart' as _i180;
import '../core/services/live_service/impl/live_service_impl.dart' as _i22;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i24;
import '../core/services/live_service/live_service.dart' as _i21;
import '../core/services/live_service/live_socket_service.dart' as _i23;
import '../core/services/notifications/notification_service.dart' as _i30;
import '../core/services/stringee/stringee_service.dart' as _i37;
import '../core/socket/chat_socket.dart' as _i10;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i59;
import '../data/data_sources/remote/auth_api.dart' as _i107;
import '../data/data_sources/remote/call_api.dart' as _i111;
import '../data/data_sources/remote/chat_api.dart' as _i117;
import '../data/data_sources/remote/comment_api.dart' as _i121;
import '../data/data_sources/remote/community_api.dart' as _i125;
import '../data/data_sources/remote/ecom_api.dart' as _i43;
import '../data/data_sources/remote/following_api.dart' as _i48;
import '../data/data_sources/remote/friend_api.dart' as _i52;
import '../data/data_sources/remote/marshop_api.dart' as _i65;
import '../data/data_sources/remote/notification_api.dart' as _i69;
import '../data/data_sources/remote/open_weather_api.dart' as _i73;
import '../data/data_sources/remote/place_information_api.dart' as _i78;
import '../data/data_sources/remote/place_information_provider.dart' as _i79;
import '../data/data_sources/remote/post_api.dart' as _i83;
import '../data/data_sources/remote/protector_api.dart' as _i86;
import '../data/data_sources/remote/resource_api.dart' as _i90;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i95;
import '../data/data_sources/remote/user_api.dart' as _i100;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i154;
import '../data/models/payloads/marshop/marshop_payload.dart' as _i149;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i151;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i143;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i145;
import '../data/models/responses/boss_community_status_response.dart' as _i147;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i146;
import '../data/models/responses/confirm_register_ja_response.dart' as _i150;
import '../data/models/responses/confirm_response.dart' as _i152;
import '../data/models/responses/ecom/product_detail_response.dart' as _i57;
import '../data/models/responses/group_request_response.dart' as _i156;
import '../data/models/responses/ja_status_response.dart' as _i140;
import '../data/models/responses/marshop_response.dart' as _i148;
import '../data/models/responses/upgrade_account_response.dart' as _i142;
import '../data/repositories/auth_repository.dart' as _i108;
import '../data/repositories/comment_repository.dart' as _i122;
import '../data/repositories/ecom_repository.dart' as _i45;
import '../data/repositories/following_repository.dart' as _i49;
import '../data/repositories/impl/auth_repository_impl.dart' as _i109;
import '../data/repositories/impl/call_repository_impl.dart' as _i113;
import '../data/repositories/impl/chat_repository_impl.dart' as _i119;
import '../data/repositories/impl/comment_repository_impl.dart' as _i123;
import '../data/repositories/impl/community_repository.impl.dart' as _i127;
import '../data/repositories/impl/ecom_repository_impl.dart' as _i46;
import '../data/repositories/impl/following_repository_impl.dart' as _i50;
import '../data/repositories/impl/friend_repository_impl.dart' as _i54;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i67;
import '../data/repositories/impl/media_picker_impl.dart' as _i27;
import '../data/repositories/impl/notification_repository.impl.dart' as _i71;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i75;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i81;
import '../data/repositories/impl/post_repository_impl.dart' as _i85;
import '../data/repositories/impl/protector_repository_impl.dart' as _i88;
import '../data/repositories/impl/resource_repository.impl.dart' as _i92;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i97;
import '../data/repositories/impl/user_repository_impl.dart' as _i102;
import '../data/repositories/marshop_repository.dart' as _i66;
import '../data/repositories/media_picker.dart' as _i26;
import '../data/repositories/notification_repository.dart' as _i70;
import '../data/repositories/post_repository.dart' as _i84;
import '../data/repositories/protector_repository.dart' as _i87;
import '../data/repositories/user_repository.dart' as _i101;
import '../domain/entities/bank.dart' as _i155;
import '../domain/entities/commity_action_type.dart' as _i144;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i141;
import '../domain/repository/call_repository.dart' as _i112;
import '../domain/repository/chat_repository.dart' as _i118;
import '../domain/repository/community_repository.dart' as _i126;
import '../domain/repository/friend_repository.dart' as _i53;
import '../domain/repository/open_weather_repository.dart' as _i74;
import '../domain/repository/place_information_repository.dart' as _i80;
import '../domain/repository/resource_repository.dart' as _i91;
import '../domain/repository/upgrade_account_repository.dart' as _i96;
import '../domain/usecases/authentication_usecase.dart' as _i110;
import '../domain/usecases/call_usecase.dart' as _i114;
import '../domain/usecases/chat_usecase.dart' as _i120;
import '../domain/usecases/comment_usecase.dart' as _i124;
import '../domain/usecases/community_usecase.dart' as _i128;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i42;
import '../domain/usecases/ecom_usecase.dart' as _i47;
import '../domain/usecases/following_usecase.dart' as _i51;
import '../domain/usecases/friend_usecase.dart' as _i55;
import '../domain/usecases/marshop_usecase.dart' as _i68;
import '../domain/usecases/notification_usecase.dart' as _i72;
import '../domain/usecases/open_weather_usecase.dart' as _i76;
import '../domain/usecases/place_information_usecase.dart' as _i82;
import '../domain/usecases/post_usecase.dart' as _i175;
import '../domain/usecases/protector_usecase.dart' as _i89;
import '../domain/usecases/resource_usecase.dart' as _i93;
import '../domain/usecases/upgrade_account_usecase.dart' as _i98;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i39;
import '../domain/usecases/user_usecase.dart' as _i103;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/call/call_routes.dart' as _i8;
import '../presentation/call/phone_book/tabs/all_friends/cubit/all_friends_cubit.dart'
    as _i105;
import '../presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart'
    as _i187;
import '../presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart'
    as _i172;
import '../presentation/call/service/call_service.dart' as _i6;
import '../presentation/call/service/models/call_service_models.dart' as _i7;
import '../presentation/call/stringee_bloc/stringee_bloc.dart' as _i94;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i188;
import '../presentation/chat/chat_routes.dart' as _i9;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i129;
import '../presentation/chat/create_room/cubit/create_room_cubit.dart' as _i130;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i168;
import '../presentation/community/community_constants.dart' as _i153;
import '../presentation/community/community_module.dart' as _i195;
import '../presentation/community/community_routes.dart' as _i11;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i134;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i135;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i137;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i158;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i177;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i104;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i132;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i133;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i170;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i131;
import '../presentation/dashboard/dashboard_module.dart' as _i197;
import '../presentation/dashboard/dashboard_routes.dart' as _i12;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i176;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i116;
import '../presentation/general_setting/general_routes.dart' as _i17;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i160;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i60;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i174;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i18;
import '../presentation/live/data/data_sources/remote/live_api.dart' as _i61;
import '../presentation/live/data/repository/live_repository.dart' as _i62;
import '../presentation/live/data/repository/repository_impl/live_repository_impl.dart'
    as _i63;
import '../presentation/live/domain/usecases/gift_share_preferences_usecase.dart'
    as _i58;
import '../presentation/live/domain/usecases/live_usecases.dart' as _i64;
import '../presentation/live/live_routes.dart' as _i20;
import '../presentation/live/presentation/channel/state/live_channel_controller.dart'
    as _i163;
import '../presentation/live/presentation/channel/widget/sent_gift_page.dart'
    as _i14;
import '../presentation/live/presentation/create/state/live_create_controller.dart'
    as _i166;
import '../presentation/live/presentation/create/widget/live_category_picker.dart'
    as _i115;
import '../presentation/live/presentation/list_gift/gift_controller.dart'
    as _i157;
import '../presentation/live/presentation/live_bottom/live_bottom_controller.dart'
    as _i162;
import '../presentation/live/presentation/live_message/state/live_message_bloc.dart'
    as _i19;
import '../presentation/live/presentation/live_tab/live_controller.dart'
    as _i165;
import '../presentation/live/presentation/pk/invite/pk_invite_controller.dart'
    as _i77;
import '../presentation/live/presentation/widget/check_password_enable.dart'
    as _i164;
import '../presentation/marshop/marshop_bloc.dart' as _i193;
import '../presentation/marshop/marshop_routes.dart' as _i25;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i16;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i13;
import '../presentation/notification/notification_routes.dart' as _i29;
import '../presentation/notification/state/notification_bloc.dart' as _i169;
import '../presentation/otp_verify/email_otp_verify.dart' as _i136;
import '../presentation/profile/state/user_profile_bloc.dart' as _i183;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i161;
import '../presentation/protector/protector_router.dart' as _i31;
import '../presentation/qr_code/qr_code_route.dart' as _i32;
import '../presentation/routes.dart' as _i33;
import '../presentation/settings/setting_routes.dart' as _i34;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i185;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i181;
import '../presentation/social/following/blocs/following_bloc.dart' as _i138;
import '../presentation/social/following/blocs/following_tab_bloc.dart'
    as _i139;
import '../presentation/social/following/following_routes.dart' as _i15;
import '../presentation/social/my_profile/blocs/my_profile_bloc.dart' as _i189;
import '../presentation/social/my_profile/my_profile_routes.dart' as _i28;
import '../presentation/social/my_profile/screens/components/create_post/blocs/create_post_bloc.dart'
    as _i41;
import '../presentation/social/profile/profile_bloc.dart' as _i196;
import '../presentation/social/social_routes.dart' as _i36;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i38;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i194;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i159;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i171;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i173;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i99;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i179;
import 'modules/config_module.dart' as _i192;
import 'modules/data_source_module.dart' as _i191;

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
  gh.factoryParam<_i6.Call1vs1Service, _i7.CallServiceContext, dynamic>((
    context,
    _,
  ) =>
      _i6.Call1vs1ServiceImpl(context));
  gh.factory<_i8.CallRoutes>(() => _i8.CallRoutes());
  gh.factory<_i9.ChatRoutes>(() => _i9.ChatRoutes());
  gh.factory<_i10.ChatSocket>(() => _i10.ChatSocket());
  gh.factory<_i11.CommunityRoutes>(() => _i11.CommunityRoutes());
  gh.factory<_i12.DashboardRoutes>(() => _i12.DashboardRoutes());
  gh.factory<_i13.DeeplinkBloc>(() => _i13.DeeplinkBloc());
  gh.factory<_i14.FloatingGiftsProvider>(() => _i14.FloatingGiftsProvider());
  gh.factory<_i15.FollowingRoutes>(() => _i15.FollowingRoutes());
  gh.factory<_i16.GeneralRoutes>(() => _i16.GeneralRoutes());
  gh.factory<_i17.GeneralRoutes>(() => _i17.GeneralRoutes());
  gh.factory<_i18.InfoProfileRoutes>(() => _i18.InfoProfileRoutes());
  gh.factory<_i19.LiveMessageBloc>(() => _i19.LiveMessageBloc());
  gh.factory<_i20.LiveRoutes>(() => _i20.LiveRoutes());
  gh.factory<_i21.LiveService>(() => _i22.LiveServiceImpl());
  gh.factory<_i23.LiveSocketService>(() => _i24.LiveSocketServiceImpl());
  gh.factory<_i25.MarkShopRoutes>(() => _i25.MarkShopRoutes());
  gh.lazySingleton<_i26.MediaPicker>(() => _i27.MediaPickerImpl());
  gh.factory<_i28.MyProfileRoutes>(() => _i28.MyProfileRoutes());
  gh.factory<_i29.NotificationRoutes>(() => _i29.NotificationRoutes());
  gh.singleton<_i30.NotificationService>(
      _i30.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i31.ProtectorModule>(() => _i31.ProtectorModule());
  gh.factory<_i32.QrCodeRoutes>(() => _i32.QrCodeRoutes());
  gh.singleton<_i33.Routes>(_i33.Routes());
  gh.factory<_i34.SettingRoutes>(() => _i34.SettingRoutes());
  await gh.singletonAsync<_i35.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i36.SocialRoutes>(() => _i36.SocialRoutes());
  gh.singleton<_i37.StringeeService>(_i37.StringeeService());
  gh.factory<_i38.UpgradeAccountRoutes>(() => _i38.UpgradeAccountRoutes());
  gh.factory<_i39.UserSharePreferencesUsecase>(
      () => _i39.UserSharePreferencesUsecase(gh<_i35.SharedPreferences>()));
  gh.singleton<_i40.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i41.CreatePostBloc>(
      () => _i41.CreatePostBloc(gh<_i26.MediaPicker>()));
  gh.factory<_i42.DashboardSharePreferenceUseCase>(
      () => _i42.DashboardSharePreferenceUseCase(gh<_i35.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i35.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i43.EcomAPI>(() => _i43.EcomAPI(gh<_i44.Dio>()));
  gh.factory<_i45.EcomRepository>(
      () => _i46.EcomRepositoryImpl(gh<_i43.EcomAPI>()));
  gh.factory<_i47.EcomUsecase>(
      () => _i47.EcomUsecase(gh<_i45.EcomRepository>()));
  gh.factory<_i48.FollowingAPI>(() => _i48.FollowingAPI(gh<_i3.Dio>()));
  gh.factory<_i49.FollowingRepository>(
      () => _i50.FollowingRepositoryImpl(gh<_i48.FollowingAPI>()));
  gh.factory<_i51.FollowingUsecase>(
      () => _i51.FollowingUsecase(gh<_i49.FollowingRepository>()));
  gh.factory<_i52.FriendApi>(() => _i52.FriendApi(gh<_i44.Dio>()));
  gh.factory<_i53.FriendRepository>(
      () => _i54.FriendRepositoryImpl(gh<_i52.FriendApi>()));
  gh.factory<_i55.FriendUsecase>(
      () => _i55.FriendUsecase(gh<_i53.FriendRepository>()));
  gh.factory<_i56.GetListBlocParam1<_i57.ProductDetailResponse, List<String>>>(
      () => marshopBlocFactory.getProducts(gh<_i47.EcomUsecase>()));
  gh.factory<_i58.GiftSharePreferencesUseCase>(
      () => _i58.GiftSharePreferencesUseCase(gh<_i35.SharedPreferences>()));
  gh.factory<_i59.InformationPDoneSharePreferencesUsecase>(() =>
      _i59.InformationPDoneSharePreferencesUsecase(
          gh<_i35.SharedPreferences>()));
  gh.factory<_i60.InformationPdoneProfileCubit>(() =>
      _i60.InformationPdoneProfileCubit(
          gh<_i59.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i61.LiveApi>(() => _i61.LiveApi(gh<_i3.Dio>()));
  gh.factory<_i62.LiveRepository>(
      () => _i63.LiveRepositoryImpl(gh<_i61.LiveApi>()));
  gh.factory<_i64.LiveUseCase>(
      () => _i64.LiveUseCase(gh<_i62.LiveRepository>()));
  gh.factory<_i65.MarshopAPI>(() => _i65.MarshopAPI(gh<_i44.Dio>()));
  gh.factory<_i66.MarshopRepository>(
      () => _i67.MarshopRepositoryImpl(gh<_i65.MarshopAPI>()));
  gh.factory<_i68.MarshopUsecase>(
      () => _i68.MarshopUsecase(gh<_i66.MarshopRepository>()));
  gh.factory<_i69.NotificationAPI>(() => _i69.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i70.NotificationRepository>(
      () => _i71.NotificationRepositoryImpl(gh<_i69.NotificationAPI>()));
  gh.factory<_i72.NotificationUsecase>(
      () => _i72.NotificationUsecase(gh<_i70.NotificationRepository>()));
  gh.lazySingleton<_i73.OpenWeatherApi>(
      () => _i73.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i74.OpenWeatherRepository>(
      () => _i75.OpenWeatherRepositoryImpl(gh<_i73.OpenWeatherApi>()));
  gh.factory<_i76.OpenWeatherUseCase>(
      () => _i76.OpenWeatherUseCase(gh<_i74.OpenWeatherRepository>()));
  gh.factory<_i77.PkInviteController>(
      () => _i77.PkInviteController(gh<_i64.LiveUseCase>()));
  gh.factory<_i78.PlaceInformationAPI>(
      () => _i78.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i79.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i35.SharedPreferences>(),
        gh<_i79.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i80.PlaceInformationRepository>(() =>
      _i81.PlaceInformationRepositoryImpl(gh<_i78.PlaceInformationAPI>()));
  gh.factory<_i82.PlaceInformationUsecase>(() =>
      _i82.PlaceInformationUsecase(gh<_i80.PlaceInformationRepository>()));
  gh.factory<_i83.PostAPI>(() => _i83.PostAPI(gh<_i3.Dio>()));
  gh.factory<_i84.PostRepository>(
      () => _i85.PostRepositoryImpl(gh<_i83.PostAPI>()));
  gh.lazySingleton<_i86.ProtectorAPI>(() => _i86.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i87.ProtectorRepository>(
      () => _i88.ProtectorRepositoryImpl(gh<_i86.ProtectorAPI>()));
  gh.factory<_i89.ProtectorUseCase>(
      () => _i89.ProtectorUseCase(gh<_i87.ProtectorRepository>()));
  gh.factory<_i90.ResourceApi>(() => _i90.ResourceApi(gh<_i44.Dio>()));
  gh.factory<_i91.ResourceRepository>(
      () => _i92.ResourceRepositoryImpl(gh<_i90.ResourceApi>()));
  gh.factory<_i93.ResourceUsecase>(
      () => _i93.ResourceUsecase(gh<_i91.ResourceRepository>()));
  gh.singleton<_i94.StringeeBloc>(_i94.StringeeBloc(
    gh<_i37.StringeeService>(),
    gh<_i39.UserSharePreferencesUsecase>(),
  ));
  gh.factory<_i95.UpgradeAccountApi>(
      () => _i95.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i96.UpgradeAccountRepository>(
      () => _i97.UpgradeAccountRepositoryImpl(
            gh<_i95.UpgradeAccountApi>(),
            gh<_i90.ResourceApi>(),
          ));
  gh.factory<_i98.UpgradeAccountUsecase>(
      () => _i98.UpgradeAccountUsecase(gh<_i96.UpgradeAccountRepository>()));
  gh.factory<_i99.UpgradeCubit>(
      () => _i99.UpgradeCubit(gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<_i100.UserApi>(() => _i100.UserApi(gh<_i3.Dio>()));
  gh.factory<_i101.UserRepository>(
      () => _i102.AuthRepositoryImpl(gh<_i100.UserApi>()));
  gh.factory<_i103.UserUsecase>(
      () => _i103.UserUsecase(gh<_i101.UserRepository>()));
  gh.factory<_i104.AddMemberChangeNotifier>(
      () => _i104.AddMemberChangeNotifier(gh<_i103.UserUsecase>()));
  gh.factory<_i105.AllFriendsCubit>(
      () => _i105.AllFriendsCubit(gh<_i55.FriendUsecase>()));
  gh.factory<_i106.ApprovedRequestCubit>(
      () => _i106.ApprovedRequestCubit(gh<_i103.UserUsecase>()));
  gh.factory<_i107.AuthApi>(() => _i107.AuthApi(gh<_i44.Dio>()));
  gh.factory<_i108.AuthRepository>(
      () => _i109.AuthRepositoryImpl(gh<_i107.AuthApi>()));
  gh.factory<_i110.AuthenticationUsecase>(() => _i110.AuthenticationUsecase(
        gh<_i108.AuthRepository>(),
        gh<_i39.UserSharePreferencesUsecase>(),
        gh<_i101.UserRepository>(),
        gh<_i30.NotificationService>(),
        gh<_i10.ChatSocket>(),
      ));
  gh.factory<_i111.CallApi>(() => _i111.CallApi(gh<_i44.Dio>()));
  gh.factory<_i112.CallRepository>(
      () => _i113.CallRepositoryImpl(gh<_i111.CallApi>()));
  gh.factory<_i114.CallUseCase>(
      () => _i114.CallUseCase(gh<_i112.CallRepository>()));
  gh.factory<_i115.CategoryController>(
      () => _i115.CategoryController(gh<_i62.LiveRepository>()));
  gh.factory<_i116.ChangePasswordController>(
      () => _i116.ChangePasswordController(gh<_i110.AuthenticationUsecase>()));
  gh.factory<_i117.ChatApi>(() => _i117.ChatApi(gh<_i44.Dio>()));
  gh.factory<_i118.ChatRepository>(
      () => _i119.ChatRepositoryImpl(gh<_i117.ChatApi>()));
  gh.factory<_i120.ChatUseCase>(() => _i120.ChatUseCase(
        gh<_i118.ChatRepository>(),
        gh<_i53.FriendRepository>(),
      ));
  gh.factory<_i121.CommentAPI>(() => _i121.CommentAPI(gh<_i3.Dio>()));
  gh.factory<_i122.CommentRepository>(
      () => _i123.CommentRepositoryImpl(gh<_i121.CommentAPI>()));
  gh.factory<_i124.CommentUsecase>(
      () => _i124.CommentUsecase(gh<_i122.CommentRepository>()));
  gh.factory<_i125.CommunityApi>(() => _i125.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i126.CommunityRepository>(
      () => _i127.CommunityRepositoryImpl(gh<_i125.CommunityApi>()));
  gh.factory<_i128.CommunityUsecase>(
      () => _i128.CommunityUsecase(gh<_i126.CommunityRepository>()));
  gh.singleton<_i129.ConversationCubit>(
      _i129.ConversationCubit(gh<_i120.ChatUseCase>()));
  gh.factory<_i130.CreateRoomCubit>(
      () => _i130.CreateRoomCubit(gh<_i120.ChatUseCase>()));
  gh.factory<_i131.DashBoardBgController>(() =>
      _i131.DashBoardBgController(gh<_i42.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i132.DashBoardScreenController>(() =>
      _i132.DashBoardScreenController(
          gh<_i42.DashboardSharePreferenceUseCase>()));
  gh.factory<_i133.DashboardCommunityBloc>(() =>
      _i133.DashboardCommunityBloc(gh<_i42.DashboardSharePreferenceUseCase>()));
  gh.factory<_i133.DashboardEcommerceBloc>(() =>
      _i133.DashboardEcommerceBloc(gh<_i42.DashboardSharePreferenceUseCase>()));
  gh.factory<_i133.DashboardPersonalBloc>(() =>
      _i133.DashboardPersonalBloc(gh<_i42.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i134.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i134.EditCommunityDetailBloc(
        gh<_i128.CommunityUsecase>(),
        gh<_i93.ResourceUsecase>(),
        community,
      ));
  gh.factoryParam<_i135.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i135.EditFanGroupBloc(
        gh<_i128.CommunityUsecase>(),
        gh<_i93.ResourceUsecase>(),
        fanGroup,
      ));
  gh.factory<_i136.EmailVerifyController>(
      () => _i136.EmailVerifyController(gh<_i103.UserUsecase>()));
  gh.factory<_i137.FanGroupDetailBloc>(
      () => _i137.FanGroupDetailBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<_i138.FollowingBloc>(
      () => _i138.FollowingBloc(gh<_i103.UserUsecase>()));
  gh.factory<_i139.FollowingTabBloc>(() => _i139.FollowingTabBloc(
        gh<_i51.FollowingUsecase>(),
        gh<_i103.UserUsecase>(),
      ));
  gh.factory<_i56.GetDetailBloc<_i140.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<_i56.GetDetailBloc<_i3.FanGroup>>(() =>
      communityModule.createGetFanGroupBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<_i56.GetDetailBloc<_i141.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<_i56.GetDetailBloc<_i142.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<
      _i56.GetDetailBlocParam1<_i141.BankAccount,
          _i143.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<
      _i56.GetDetailBlocParam1<_i142.UpgradeAccountResponse,
          _i144.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<_i56.GetDetailBlocParam1<dynamic, _i145.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<_i56.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i103.UserUsecase>()));
  gh.factory<
          _i56
          .GetDetailBlocParam1<_i146.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<
          _i56.GetDetailBlocParam1<_i147.BossCommunityStatusResponse, String>>(
      () => communityModule
          .createGetBossStatusBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<
          _i56.GetDetailBlocParam1<_i148.MarshopResponse,
              _i149.GetMarshopInfoPayload>>(
      () => marshopBlocFactory.getMarshopInfo(gh<_i68.MarshopUsecase>()));
  gh.factory<_i56.GetDetailBlocParam1<Map<String, dynamic>, int>>(() =>
      diaryBlocFactory.globalPersonSettingBloc(gh<_i93.ResourceUsecase>()));
  gh.factory<
      _i56.GetDetailBlocParam1<_i150.ConfirmRegisterJAResponse,
          _i151.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<
      _i56.GetDetailBlocParam2<_i152.ConfirmResponse, String,
          _i153.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<
      _i56.GetDetailBlocParam2<_i152.ConfirmResponse, String,
          _i154.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<_i56.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i128.CommunityUsecase>()));
  gh.factory<_i56.GetListBloc<_i148.MarshopRegisterPackResponse>>(
      () => marshopBlocFactory.getMarshopPack(gh<_i68.MarshopUsecase>()));
  gh.factory<_i56.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<_i56.GetListBloc<_i155.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<_i56.GetListBloc<_i156.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<_i56.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<
          _i56.GetListBlocParam1<_i148.MarshopResponse,
              _i149.GetListMarshopPayload>>(
      () => marshopBlocFactory.listMarshopBloc(gh<_i68.MarshopUsecase>()));
  gh.factory<_i157.GiftController>(
      () => _i157.GiftController(gh<_i64.LiveUseCase>()));
  gh.factory<_i158.GroupDetailBloc>(
      () => _i158.GroupDetailBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<_i159.GuardianPDoneBloc>(
      () => _i159.GuardianPDoneBloc(gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<_i160.InformationUpdateProfilBloc>(
      () => _i160.InformationUpdateProfilBloc(
            gh<_i103.UserUsecase>(),
            gh<_i59.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i161.ListProtectorRequestController>(
      () => _i161.ListProtectorRequestController(gh<_i89.ProtectorUseCase>()));
  gh.factory<_i162.LiveBottomController>(() => _i162.LiveBottomController(
        gh<_i64.LiveUseCase>(),
        gh<_i103.UserUsecase>(),
      ));
  gh.factory<_i163.LiveChannelController>(() => _i163.LiveChannelController(
        gh<_i62.LiveRepository>(),
        gh<_i39.UserSharePreferencesUsecase>(),
        gh<_i103.UserUsecase>(),
        gh<_i21.LiveService>(),
        gh<_i23.LiveSocketService>(),
        gh<_i14.FloatingGiftsProvider>(),
      ));
  gh.factory<_i164.LiveCheckPasswordController>(
      () => _i164.LiveCheckPasswordController(gh<_i64.LiveUseCase>()));
  gh.factory<_i165.LiveController>(
      () => _i165.LiveController(gh<_i64.LiveUseCase>()));
  gh.factory<_i166.LiveCreateController>(() => _i166.LiveCreateController(
        gh<_i62.LiveRepository>(),
        gh<_i21.LiveService>(),
      ));
  gh.factory<_i161.ManageProtectController>(
      () => _i161.ManageProtectController(gh<_i89.ProtectorUseCase>()));
  gh.factory<_i167.MarshopCubit>(
      () => _i167.MarshopCubit(gh<_i68.MarshopUsecase>()));
  gh.factory<_i168.NewMessageCubit>(
      () => _i168.NewMessageCubit(gh<_i120.ChatUseCase>()));
  gh.factory<_i169.NotificationBloc>(
      () => _i169.NotificationBloc(gh<_i72.NotificationUsecase>()));
  gh.factory<_i170.OpenWeatherBloc>(
      () => _i170.OpenWeatherBloc(gh<_i76.OpenWeatherUseCase>()));
  gh.factory<_i171.PDoneInformationBloc>(
      () => _i171.PDoneInformationBloc(gh<_i98.UpgradeAccountUsecase>()));
  gh.factory<_i172.PhoneBookDetailCubit>(
      () => _i172.PhoneBookDetailCubit(gh<_i114.CallUseCase>()));
  gh.factory<_i173.PlaceInformationBloc>(
      () => _i173.PlaceInformationBloc(gh<_i82.PlaceInformationUsecase>()));
  gh.factory<_i174.PlaceInformationBloc2>(
      () => _i174.PlaceInformationBloc2(gh<_i82.PlaceInformationUsecase>()));
  gh.factory<_i175.PostUsecase>(() => _i175.PostUsecase(
        gh<_i84.PostRepository>(),
        gh<_i124.CommentUsecase>(),
        gh<_i90.ResourceApi>(),
      ));
  gh.factory<_i176.SearchCubit>(
      () => _i176.SearchCubit(gh<_i103.UserUsecase>()));
  gh.factory<_i177.TeamDetailBloc>(
      () => _i177.TeamDetailBloc(gh<_i128.CommunityUsecase>()));
  gh.factory<_i178.TeamRequestCubit>(
      () => _i178.TeamRequestCubit(gh<_i128.CommunityUsecase>()));
  gh.factory<_i179.UpgradePDoneBloc>(() => _i179.UpgradePDoneBloc(
        gh<_i98.UpgradeAccountUsecase>(),
        gh<_i103.UserUsecase>(),
        gh<_i39.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i180.UserActionCubit>(
      () => _i180.UserActionCubit(gh<_i103.UserUsecase>()));
  gh.factory<_i181.UserBloc>(() => _i181.UserBloc(
        gh<_i110.AuthenticationUsecase>(),
        gh<_i39.UserSharePreferencesUsecase>(),
        gh<_i103.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i182.UserCubit>(() => _i182.UserCubit(
        gh<_i110.AuthenticationUsecase>(),
        gh<_i39.UserSharePreferencesUsecase>(),
        gh<_i103.UserUsecase>(),
      ));
  gh.factory<_i183.UserProfileBloc>(() => _i183.UserProfileBloc(
        gh<_i103.UserUsecase>(),
        gh<_i89.ProtectorUseCase>(),
        gh<_i26.MediaPicker>(),
        gh<_i98.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i184.AppCubit>(() => _i184.AppCubit(
        gh<_i93.ResourceUsecase>(),
        gh<_i39.UserSharePreferencesUsecase>(),
        gh<_i110.AuthenticationUsecase>(),
      ));
  gh.singleton<_i185.AppSettingBloc>(
      _i185.AppSettingBloc(gh<_i110.AuthenticationUsecase>()));
  gh.factory<_i186.AuthCubit>(
      () => _i186.AuthCubit(gh<_i110.AuthenticationUsecase>()));
  gh.factory<_i187.CallHistoryCubit>(
      () => _i187.CallHistoryCubit(gh<_i114.CallUseCase>()));
  gh.singleton<_i188.ChatRoomCubit>(_i188.ChatRoomCubit(
    gh<_i120.ChatUseCase>(),
    gh<_i103.UserUsecase>(),
    gh<_i98.UpgradeAccountUsecase>(),
    gh<_i26.MediaPicker>(),
  ));
  gh.factory<_i189.MyProfileBloc>(() => _i189.MyProfileBloc(
        gh<_i103.UserUsecase>(),
        gh<_i175.PostUsecase>(),
        gh<_i124.CommentUsecase>(),
        gh<_i103.UserUsecase>(),
      ));
  await _i190.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i191.DataSourceModule {}

class _$ConfigModule extends _i192.ConfigModule {}

class _$MarshopBlocFactory extends _i193.MarshopBlocFactory {}

class _$PlaceModule extends _i79.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i194.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i195.CommunityModule {}

class _$DiaryBlocFactory extends _i196.DiaryBlocFactory {}

class _$DashBoardModule extends _i197.DashBoardModule {}
