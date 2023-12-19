// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i45;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i57;
import 'package:shared_preferences/shared_preferences.dart' as _i36;
import 'package:wallet/core/core.dart' as _i41;
import 'package:wallet/di/wallet_micro.module.dart' as _i200;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i193;
import '../blocs/approved_request/approved_request_cubit.dart' as _i108;
import '../blocs/auth/auth_cubit.dart' as _i195;
import '../blocs/bloc.dart' as _i207;
import '../blocs/community/team_request/team_request_cubit.dart' as _i185;
import '../blocs/marshop/marshop_cubit.dart' as _i172;
import '../blocs/user/user_cubit.dart' as _i189;
import '../blocs/user_action/user_action_cubit.dart' as _i187;
import '../core/services/live_service/impl/live_service_impl.dart' as _i23;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i25;
import '../core/services/live_service/live_service.dart' as _i22;
import '../core/services/live_service/live_socket_service.dart' as _i24;
import '../core/services/notifications/notification_service.dart' as _i31;
import '../core/services/stringee/stringee_service.dart' as _i38;
import '../core/socket/chat_socket.dart' as _i10;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i60;
import '../data/data_sources/remote/auth_api.dart' as _i109;
import '../data/data_sources/remote/call_api.dart' as _i113;
import '../data/data_sources/remote/chat_api.dart' as _i119;
import '../data/data_sources/remote/comment_api.dart' as _i123;
import '../data/data_sources/remote/community_api.dart' as _i127;
import '../data/data_sources/remote/ecom_api.dart' as _i44;
import '../data/data_sources/remote/following_api.dart' as _i49;
import '../data/data_sources/remote/friend_api.dart' as _i53;
import '../data/data_sources/remote/marshop_api.dart' as _i67;
import '../data/data_sources/remote/notification_api.dart' as _i71;
import '../data/data_sources/remote/open_weather_api.dart' as _i75;
import '../data/data_sources/remote/place_information_api.dart' as _i80;
import '../data/data_sources/remote/place_information_provider.dart' as _i81;
import '../data/data_sources/remote/post_api.dart' as _i85;
import '../data/data_sources/remote/protector_api.dart' as _i88;
import '../data/data_sources/remote/resource_api.dart' as _i92;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i97;
import '../data/data_sources/remote/user_api.dart' as _i102;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i157;
import '../data/models/payloads/marshop/marshop_payload.dart' as _i152;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i149;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i147;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i154;
import '../data/models/responses/boss_community_status_response.dart' as _i150;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i146;
import '../data/models/responses/confirm_register_ja_response.dart' as _i148;
import '../data/models/responses/confirm_response.dart' as _i155;
import '../data/models/responses/ecom/product_detail_response.dart' as _i58;
import '../data/models/responses/group_request_response.dart' as _i159;
import '../data/models/responses/ja_status_response.dart' as _i144;
import '../data/models/responses/join_request_response.dart' as _i158;
import '../data/models/responses/marshop_response.dart' as _i151;
import '../data/models/responses/open_group_request_response.dart' as _i141;
import '../data/models/responses/resource_response.dart' as _i153;
import '../data/models/responses/upgrade_account_response.dart' as _i142;
import '../data/repositories/auth_repository.dart' as _i110;
import '../data/repositories/comment_repository.dart' as _i124;
import '../data/repositories/ecom_repository.dart' as _i46;
import '../data/repositories/following_repository.dart' as _i50;
import '../data/repositories/impl/auth_repository_impl.dart' as _i111;
import '../data/repositories/impl/call_repository_impl.dart' as _i115;
import '../data/repositories/impl/chat_repository_impl.dart' as _i121;
import '../data/repositories/impl/comment_repository_impl.dart' as _i125;
import '../data/repositories/impl/community_repository.impl.dart' as _i129;
import '../data/repositories/impl/ecom_repository_impl.dart' as _i47;
import '../data/repositories/impl/following_repository_impl.dart' as _i51;
import '../data/repositories/impl/friend_repository_impl.dart' as _i55;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i69;
import '../data/repositories/impl/media_picker_impl.dart' as _i28;
import '../data/repositories/impl/notification_repository.impl.dart' as _i73;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i77;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i83;
import '../data/repositories/impl/post_repository_impl.dart' as _i87;
import '../data/repositories/impl/protector_repository_impl.dart' as _i90;
import '../data/repositories/impl/resource_repository.impl.dart' as _i94;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i99;
import '../data/repositories/impl/user_repository_impl.dart' as _i104;
import '../data/repositories/marshop_repository.dart' as _i68;
import '../data/repositories/media_picker.dart' as _i27;
import '../data/repositories/notification_repository.dart' as _i72;
import '../data/repositories/post_repository.dart' as _i86;
import '../data/repositories/protector_repository.dart' as _i89;
import '../data/repositories/user_repository.dart' as _i103;
import '../domain/entities/bank.dart' as _i160;
import '../domain/entities/commity_action_type.dart' as _i145;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i143;
import '../domain/repository/call_repository.dart' as _i114;
import '../domain/repository/chat_repository.dart' as _i120;
import '../domain/repository/community_repository.dart' as _i128;
import '../domain/repository/friend_repository.dart' as _i54;
import '../domain/repository/open_weather_repository.dart' as _i76;
import '../domain/repository/place_information_repository.dart' as _i82;
import '../domain/repository/resource_repository.dart' as _i93;
import '../domain/repository/upgrade_account_repository.dart' as _i98;
import '../domain/usecases/authentication_usecase.dart' as _i112;
import '../domain/usecases/call_usecase.dart' as _i116;
import '../domain/usecases/chat_usecase.dart' as _i122;
import '../domain/usecases/comment_usecase.dart' as _i126;
import '../domain/usecases/community_usecase.dart' as _i130;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i43;
import '../domain/usecases/ecom_usecase.dart' as _i48;
import '../domain/usecases/following_usecase.dart' as _i52;
import '../domain/usecases/friend_usecase.dart' as _i56;
import '../domain/usecases/marshop_usecase.dart' as _i70;
import '../domain/usecases/notification_usecase.dart' as _i74;
import '../domain/usecases/open_weather_usecase.dart' as _i78;
import '../domain/usecases/place_information_usecase.dart' as _i84;
import '../domain/usecases/post_usecase.dart' as _i182;
import '../domain/usecases/protector_usecase.dart' as _i91;
import '../domain/usecases/resource_usecase.dart' as _i95;
import '../domain/usecases/upgrade_account_usecase.dart' as _i100;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i40;
import '../domain/usecases/user_usecase.dart' as _i105;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/call/call_routes.dart' as _i8;
import '../presentation/call/phone_book/tabs/all_friends/cubit/all_friends_cubit.dart'
    as _i107;
import '../presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart'
    as _i196;
import '../presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart'
    as _i179;
import '../presentation/call/service/call_service.dart' as _i6;
import '../presentation/call/service/models/call_service_models.dart' as _i7;
import '../presentation/call/stringee_bloc/stringee_bloc.dart' as _i96;
import '../presentation/chat/add_member/cubit/add_member_cubit.dart' as _i191;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i197;
import '../presentation/chat/chat_routes.dart' as _i9;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i132;
import '../presentation/chat/create_room/cubit/create_room_cubit.dart' as _i133;
import '../presentation/chat/member/tab/admin/cubit/admin_tab_cubit.dart'
    as _i192;
import '../presentation/chat/member/tab/member/cubit/member_tab_cubit.dart'
    as _i173;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i175;
import '../presentation/community/community_constants.dart' as _i156;
import '../presentation/community/community_module.dart' as _i204;
import '../presentation/community/community_routes.dart' as _i11;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i137;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i162;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i184;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i106;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i135;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i136;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i177;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i134;
import '../presentation/dashboard/dashboard_module.dart' as _i208;
import '../presentation/dashboard/dashboard_routes.dart' as _i13;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i183;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i118;
import '../presentation/general_setting/contracts/bloc/contract_bloc_cubit.dart'
    as _i131;
import '../presentation/general_setting/general_routes.dart' as _i18;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i164;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i61;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i181;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i19;
import '../presentation/live/data/data_sources/remote/live_api.dart' as _i62;
import '../presentation/live/data/repository/live_repository.dart' as _i63;
import '../presentation/live/data/repository/repository_impl/live_repository_impl.dart'
    as _i64;
import '../presentation/live/domain/usecases/gift_share_preferences_usecase.dart'
    as _i59;
import '../presentation/live/domain/usecases/live_share_preferences_usecase.dart'
    as _i65;
import '../presentation/live/domain/usecases/live_usecases.dart' as _i66;
import '../presentation/live/live_routes.dart' as _i21;
import '../presentation/live/presentation/channel/state/live_channel_controller.dart'
    as _i167;
import '../presentation/live/presentation/channel/widget/sent_gift_page.dart'
    as _i15;
import '../presentation/live/presentation/create/state/live_create_controller.dart'
    as _i170;
import '../presentation/live/presentation/create/widget/live_category_picker.dart'
    as _i117;
import '../presentation/live/presentation/list_gift/gift_controller.dart'
    as _i161;
import '../presentation/live/presentation/live_bottom/live_bottom_controller.dart'
    as _i166;
import '../presentation/live/presentation/live_message/state/live_message_bloc.dart'
    as _i20;
import '../presentation/live/presentation/live_tab/live_controller.dart'
    as _i169;
import '../presentation/live/presentation/pk/invite/pk_invite_controller.dart'
    as _i79;
import '../presentation/live/presentation/widget/check_password_enable.dart'
    as _i168;
import '../presentation/live/presentation/widget/mashop_status_builder.dart'
    as _i171;
import '../presentation/marshop/marshop_bloc.dart' as _i203;
import '../presentation/marshop/marshop_routes.dart' as _i26;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i17;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i14;
import '../presentation/notification/notification_routes.dart' as _i30;
import '../presentation/notification/state/notification_bloc.dart' as _i176;
import '../presentation/otp_verify/email_otp_verify.dart' as _i138;
import '../presentation/profile/state/user_profile_bloc.dart' as _i190;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i165;
import '../presentation/protector/protector_router.dart' as _i32;
import '../presentation/qr_code/qr_code_route.dart' as _i33;
import '../presentation/routes.dart' as _i34;
import '../presentation/settings/setting_routes.dart' as _i35;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i194;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i188;
import '../presentation/social/following/blocs/following_bloc.dart' as _i139;
import '../presentation/social/following/blocs/following_tab_bloc.dart'
    as _i140;
import '../presentation/social/following/following_routes.dart' as _i16;
import '../presentation/social/my_profile/blocs/film_tab_bloc.dart' as _i198;
import '../presentation/social/my_profile/blocs/my_profile_bloc.dart' as _i174;
import '../presentation/social/my_profile/blocs/post_tab_bloc.dart' as _i199;
import '../presentation/social/my_profile/my_profile_routes.dart' as _i29;
import '../presentation/social/my_profile/screens/components/create_film/blocs/create_film_bloc.dart'
    as _i12;
import '../presentation/social/my_profile/screens/components/create_post/blocs/create_post_bloc.dart'
    as _i42;
import '../presentation/social/profile/profile_bloc.dart' as _i206;
import '../presentation/social/social_routes.dart' as _i37;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i39;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i205;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i163;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i178;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i180;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i101;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i186;
import 'modules/config_module.dart' as _i202;
import 'modules/data_source_module.dart' as _i201;

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
  final blocModule = _$BlocModule();
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
  gh.factory<_i12.CreateFilmBloc>(() => _i12.CreateFilmBloc());
  gh.factory<_i13.DashboardRoutes>(() => _i13.DashboardRoutes());
  gh.factory<_i14.DeeplinkBloc>(() => _i14.DeeplinkBloc());
  gh.factory<_i15.FloatingGiftsProvider>(() => _i15.FloatingGiftsProvider());
  gh.factory<_i16.FollowingRoutes>(() => _i16.FollowingRoutes());
  gh.factory<_i17.GeneralRoutes>(() => _i17.GeneralRoutes());
  gh.factory<_i18.GeneralRoutes>(() => _i18.GeneralRoutes());
  gh.factory<_i19.InfoProfileRoutes>(() => _i19.InfoProfileRoutes());
  gh.factory<_i20.LiveMessageBloc>(() => _i20.LiveMessageBloc());
  gh.factory<_i21.LiveRoutes>(() => _i21.LiveRoutes());
  gh.factory<_i22.LiveService>(() => _i23.LiveServiceImpl());
  gh.factory<_i24.LiveSocketService>(() => _i25.LiveSocketServiceImpl());
  gh.factory<_i26.MarkShopRoutes>(() => _i26.MarkShopRoutes());
  gh.lazySingleton<_i27.MediaPicker>(() => _i28.MediaPickerImpl());
  gh.factory<_i29.MyProfileRoutes>(() => _i29.MyProfileRoutes());
  gh.factory<_i30.NotificationRoutes>(() => _i30.NotificationRoutes());
  gh.singleton<_i31.NotificationService>(
      _i31.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i32.ProtectorModule>(() => _i32.ProtectorModule());
  gh.factory<_i33.QrCodeRoutes>(() => _i33.QrCodeRoutes());
  gh.singleton<_i34.Routes>(_i34.Routes());
  gh.factory<_i35.SettingRoutes>(() => _i35.SettingRoutes());
  await gh.singletonAsync<_i36.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i37.SocialRoutes>(() => _i37.SocialRoutes());
  gh.singleton<_i38.StringeeService>(_i38.StringeeService());
  gh.factory<_i39.UpgradeAccountRoutes>(() => _i39.UpgradeAccountRoutes());
  gh.factory<_i40.UserSharePreferencesUsecase>(
      () => _i40.UserSharePreferencesUsecase(gh<_i36.SharedPreferences>()));
  gh.singleton<_i41.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i42.CreatePostBloc>(
      () => _i42.CreatePostBloc(gh<_i27.MediaPicker>()));
  gh.factory<_i43.DashboardSharePreferenceUseCase>(
      () => _i43.DashboardSharePreferenceUseCase(gh<_i36.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i36.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i44.EcomAPI>(() => _i44.EcomAPI(gh<_i45.Dio>()));
  gh.factory<_i46.EcomRepository>(
      () => _i47.EcomRepositoryImpl(gh<_i44.EcomAPI>()));
  gh.factory<_i48.EcomUsecase>(
      () => _i48.EcomUsecase(gh<_i46.EcomRepository>()));
  gh.factory<_i49.FollowingAPI>(() => _i49.FollowingAPI(gh<_i3.Dio>()));
  gh.factory<_i50.FollowingRepository>(
      () => _i51.FollowingRepositoryImpl(gh<_i49.FollowingAPI>()));
  gh.factory<_i52.FollowingUsecase>(
      () => _i52.FollowingUsecase(gh<_i50.FollowingRepository>()));
  gh.factory<_i53.FriendApi>(() => _i53.FriendApi(gh<_i45.Dio>()));
  gh.factory<_i54.FriendRepository>(
      () => _i55.FriendRepositoryImpl(gh<_i53.FriendApi>()));
  gh.factory<_i56.FriendUsecase>(
      () => _i56.FriendUsecase(gh<_i54.FriendRepository>()));
  gh.factory<_i57.GetListBlocParam1<_i58.ProductDetailResponse, List<String>>>(
      () => marshopBlocFactory.getProducts(gh<_i48.EcomUsecase>()));
  gh.factory<_i59.GiftSharePreferencesUseCase>(
      () => _i59.GiftSharePreferencesUseCase(gh<_i36.SharedPreferences>()));
  gh.factory<_i60.InformationPDoneSharePreferencesUsecase>(() =>
      _i60.InformationPDoneSharePreferencesUsecase(
          gh<_i36.SharedPreferences>()));
  gh.factory<_i61.InformationPdoneProfileCubit>(() =>
      _i61.InformationPdoneProfileCubit(
          gh<_i60.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i62.LiveApi>(() => _i62.LiveApi(gh<_i3.Dio>()));
  gh.factory<_i63.LiveRepository>(
      () => _i64.LiveRepositoryImpl(gh<_i62.LiveApi>()));
  gh.factory<_i65.LiveSharePreferenceUseCase>(
      () => _i65.LiveSharePreferenceUseCase(gh<_i36.SharedPreferences>()));
  gh.factory<_i66.LiveUseCase>(
      () => _i66.LiveUseCase(gh<_i63.LiveRepository>()));
  gh.factory<_i67.MarshopAPI>(() => _i67.MarshopAPI(gh<_i45.Dio>()));
  gh.factory<_i68.MarshopRepository>(
      () => _i69.MarshopRepositoryImpl(gh<_i67.MarshopAPI>()));
  gh.factory<_i70.MarshopUsecase>(
      () => _i70.MarshopUsecase(gh<_i68.MarshopRepository>()));
  gh.factory<_i71.NotificationAPI>(() => _i71.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i72.NotificationRepository>(
      () => _i73.NotificationRepositoryImpl(gh<_i71.NotificationAPI>()));
  gh.factory<_i74.NotificationUsecase>(
      () => _i74.NotificationUsecase(gh<_i72.NotificationRepository>()));
  gh.lazySingleton<_i75.OpenWeatherApi>(
      () => _i75.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i76.OpenWeatherRepository>(
      () => _i77.OpenWeatherRepositoryImpl(gh<_i75.OpenWeatherApi>()));
  gh.factory<_i78.OpenWeatherUseCase>(
      () => _i78.OpenWeatherUseCase(gh<_i76.OpenWeatherRepository>()));
  gh.factory<_i79.PkInviteController>(
      () => _i79.PkInviteController(gh<_i66.LiveUseCase>()));
  gh.factory<_i80.PlaceInformationAPI>(
      () => _i80.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i81.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i36.SharedPreferences>(),
        gh<_i81.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i82.PlaceInformationRepository>(() =>
      _i83.PlaceInformationRepositoryImpl(gh<_i80.PlaceInformationAPI>()));
  gh.factory<_i84.PlaceInformationUsecase>(() =>
      _i84.PlaceInformationUsecase(gh<_i82.PlaceInformationRepository>()));
  gh.factory<_i85.PostAPI>(() => _i85.PostAPI(gh<_i3.Dio>()));
  gh.factory<_i86.PostRepository>(
      () => _i87.PostRepositoryImpl(gh<_i85.PostAPI>()));
  gh.lazySingleton<_i88.ProtectorAPI>(() => _i88.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i89.ProtectorRepository>(
      () => _i90.ProtectorRepositoryImpl(gh<_i88.ProtectorAPI>()));
  gh.factory<_i91.ProtectorUseCase>(
      () => _i91.ProtectorUseCase(gh<_i89.ProtectorRepository>()));
  gh.factory<_i92.ResourceApi>(() => _i92.ResourceApi(gh<_i45.Dio>()));
  gh.factory<_i93.ResourceRepository>(
      () => _i94.ResourceRepositoryImpl(gh<_i92.ResourceApi>()));
  gh.factory<_i95.ResourceUsecase>(
      () => _i95.ResourceUsecase(gh<_i93.ResourceRepository>()));
  gh.singleton<_i96.StringeeBloc>(_i96.StringeeBloc(
    gh<_i38.StringeeService>(),
    gh<_i40.UserSharePreferencesUsecase>(),
  ));
  gh.factory<_i97.UpgradeAccountApi>(
      () => _i97.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i98.UpgradeAccountRepository>(
      () => _i99.UpgradeAccountRepositoryImpl(
            gh<_i97.UpgradeAccountApi>(),
            gh<_i92.ResourceApi>(),
          ));
  gh.factory<_i100.UpgradeAccountUsecase>(
      () => _i100.UpgradeAccountUsecase(gh<_i98.UpgradeAccountRepository>()));
  gh.factory<_i101.UpgradeCubit>(
      () => _i101.UpgradeCubit(gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<_i102.UserApi>(() => _i102.UserApi(gh<_i3.Dio>()));
  gh.factory<_i103.UserRepository>(
      () => _i104.AuthRepositoryImpl(gh<_i102.UserApi>()));
  gh.factory<_i105.UserUsecase>(() => _i105.UserUsecase(
        gh<_i103.UserRepository>(),
        gh<_i40.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i106.AddMemberChangeNotifier>(
      () => _i106.AddMemberChangeNotifier(gh<_i105.UserUsecase>()));
  gh.factory<_i107.AllFriendsCubit>(
      () => _i107.AllFriendsCubit(gh<_i56.FriendUsecase>()));
  gh.factory<_i108.ApprovedRequestCubit>(
      () => _i108.ApprovedRequestCubit(gh<_i105.UserUsecase>()));
  gh.factory<_i109.AuthApi>(() => _i109.AuthApi(gh<_i45.Dio>()));
  gh.factory<_i110.AuthRepository>(
      () => _i111.AuthRepositoryImpl(gh<_i109.AuthApi>()));
  gh.factory<_i112.AuthenticationUsecase>(() => _i112.AuthenticationUsecase(
        gh<_i110.AuthRepository>(),
        gh<_i40.UserSharePreferencesUsecase>(),
        gh<_i103.UserRepository>(),
        gh<_i31.NotificationService>(),
        gh<_i10.ChatSocket>(),
      ));
  gh.factory<_i113.CallApi>(() => _i113.CallApi(gh<_i45.Dio>()));
  gh.factory<_i114.CallRepository>(
      () => _i115.CallRepositoryImpl(gh<_i113.CallApi>()));
  gh.factory<_i116.CallUseCase>(
      () => _i116.CallUseCase(gh<_i114.CallRepository>()));
  gh.factory<_i117.CategoryController>(
      () => _i117.CategoryController(gh<_i63.LiveRepository>()));
  gh.factory<_i118.ChangePasswordController>(
      () => _i118.ChangePasswordController(gh<_i112.AuthenticationUsecase>()));
  gh.factory<_i119.ChatApi>(() => _i119.ChatApi(gh<_i45.Dio>()));
  gh.factory<_i120.ChatRepository>(
      () => _i121.ChatRepositoryImpl(gh<_i119.ChatApi>()));
  gh.factory<_i122.ChatUseCase>(() => _i122.ChatUseCase(
        gh<_i120.ChatRepository>(),
        gh<_i54.FriendRepository>(),
      ));
  gh.factory<_i123.CommentAPI>(() => _i123.CommentAPI(gh<_i3.Dio>()));
  gh.factory<_i124.CommentRepository>(
      () => _i125.CommentRepositoryImpl(gh<_i123.CommentAPI>()));
  gh.factory<_i126.CommentUsecase>(
      () => _i126.CommentUsecase(gh<_i124.CommentRepository>()));
  gh.factory<_i127.CommunityApi>(() => _i127.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i128.CommunityRepository>(
      () => _i129.CommunityRepositoryImpl(gh<_i127.CommunityApi>()));
  gh.factory<_i130.CommunityUsecase>(
      () => _i130.CommunityUsecase(gh<_i128.CommunityRepository>()));
  gh.factory<_i131.ContractBlocCubit>(() => _i131.ContractBlocCubit(
        gh<_i95.ResourceUsecase>(),
        gh<_i105.UserUsecase>(),
      ));
  gh.singleton<_i132.ConversationCubit>(
      _i132.ConversationCubit(gh<_i122.ChatUseCase>()));
  gh.factory<_i133.CreateRoomCubit>(
      () => _i133.CreateRoomCubit(gh<_i122.ChatUseCase>()));
  gh.factory<_i134.DashBoardBgController>(() =>
      _i134.DashBoardBgController(gh<_i43.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i135.DashBoardScreenController>(() =>
      _i135.DashBoardScreenController(
          gh<_i43.DashboardSharePreferenceUseCase>()));
  gh.factory<_i136.DashboardCommunityBloc>(() =>
      _i136.DashboardCommunityBloc(gh<_i43.DashboardSharePreferenceUseCase>()));
  gh.factory<_i136.DashboardEcommerceBloc>(() =>
      _i136.DashboardEcommerceBloc(gh<_i43.DashboardSharePreferenceUseCase>()));
  gh.factory<_i136.DashboardPersonalBloc>(() =>
      _i136.DashboardPersonalBloc(gh<_i43.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i137.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i137.EditCommunityDetailBloc(
        gh<_i130.CommunityUsecase>(),
        gh<_i95.ResourceUsecase>(),
        community,
      ));
  gh.factory<_i138.EmailVerifyController>(
      () => _i138.EmailVerifyController(gh<_i105.UserUsecase>()));
  gh.factory<_i139.FollowingBloc>(
      () => _i139.FollowingBloc(gh<_i105.UserUsecase>()));
  gh.factory<_i140.FollowingTabBloc>(() => _i140.FollowingTabBloc(
        gh<_i52.FollowingUsecase>(),
        gh<_i105.UserUsecase>(),
      ));
  gh.factory<_i57.GetDetailBloc<_i141.OpenGroupRequestResponse>>(() =>
      communityModule
          .createGetOpenGroupRequestBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<_i57.GetDetailBloc<dynamic>>(() => communityModule
      .createDeleteOpenGroupRequestBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<_i57.GetDetailBloc<_i142.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<_i57.GetDetailBloc<_i143.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<_i57.GetDetailBloc<_i144.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<
      _i57.GetDetailBlocParam1<_i142.UpgradeAccountResponse,
          _i145.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<
          _i57
          .GetDetailBlocParam1<_i146.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<
      _i57.GetDetailBlocParam1<_i143.BankAccount,
          _i147.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<
      _i57.GetDetailBlocParam1<_i148.ConfirmRegisterJAResponse,
          _i149.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<
          _i57.GetDetailBlocParam1<_i150.BossCommunityStatusResponse, String>>(
      () => communityModule
          .createGetBossStatusBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<_i57.GetDetailBlocParam1<Map<String, dynamic>, int>>(() =>
      diaryBlocFactory.globalPersonSettingBloc(gh<_i95.ResourceUsecase>()));
  gh.factory<_i57.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i105.UserUsecase>()));
  gh.factory<_i57.GetDetailBlocParam1<dynamic, String>>(() => communityModule
      .createCreateOpenGroupRequestBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<
          _i57.GetDetailBlocParam1<_i151.MarshopResponse,
              _i152.GetMarshopInfoPayload>>(
      () => marshopBlocFactory.getMarshopInfo(gh<_i70.MarshopUsecase>()));
  gh.factory<_i57.GetDetailBlocParam1<_i153.GlobalSettingResponse, String>>(
      () => blocModule.getGlobalBloc(gh<_i95.ResourceUsecase>()));
  gh.factory<_i57.GetDetailBlocParam1<dynamic, _i154.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<
      _i57.GetDetailBlocParam2<_i155.ConfirmResponse, String,
          _i156.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<
      _i57.GetDetailBlocParam2<_i155.ConfirmResponse, String,
          _i157.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<_i57.GetListBloc<_i158.JoinRequest>>(
      () => communityModule.joinRequestBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<_i57.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetMyGroupsBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<_i57.GetListBloc<_i159.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<_i57.GetListBloc<_i151.MarshopRegisterPackResponse>>(
      () => marshopBlocFactory.getMarshopPack(gh<_i70.MarshopUsecase>()));
  gh.factory<_i57.GetListBloc<_i160.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<_i57.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i130.CommunityUsecase>()));
  gh.factory<
          _i57.GetListBlocParam1<_i151.MarshopResponse,
              _i152.GetListMarshopPayload>>(
      () => marshopBlocFactory.listMarshopBloc(gh<_i70.MarshopUsecase>()));
  gh.factory<_i57.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<_i161.GiftController>(
      () => _i161.GiftController(gh<_i66.LiveUseCase>()));
  gh.factory<_i162.GroupDetailBloc>(
      () => _i162.GroupDetailBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<_i163.GuardianPDoneBloc>(
      () => _i163.GuardianPDoneBloc(gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<_i164.InformationUpdateProfilBloc>(
      () => _i164.InformationUpdateProfilBloc(
            gh<_i105.UserUsecase>(),
            gh<_i60.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i165.ListProtectorRequestController>(
      () => _i165.ListProtectorRequestController(gh<_i91.ProtectorUseCase>()));
  gh.factory<_i166.LiveBottomController>(() => _i166.LiveBottomController(
        gh<_i66.LiveUseCase>(),
        gh<_i105.UserUsecase>(),
      ));
  gh.factory<_i167.LiveChannelController>(() => _i167.LiveChannelController(
        gh<_i63.LiveRepository>(),
        gh<_i40.UserSharePreferencesUsecase>(),
        gh<_i105.UserUsecase>(),
        gh<_i22.LiveService>(),
        gh<_i24.LiveSocketService>(),
        gh<_i15.FloatingGiftsProvider>(),
      ));
  gh.factory<_i168.LiveCheckPasswordController>(
      () => _i168.LiveCheckPasswordController(gh<_i66.LiveUseCase>()));
  gh.factory<_i169.LiveController>(
      () => _i169.LiveController(gh<_i66.LiveUseCase>()));
  gh.factory<_i170.LiveCreateController>(() => _i170.LiveCreateController(
        gh<_i63.LiveRepository>(),
        gh<_i22.LiveService>(),
      ));
  gh.factory<_i165.ManageProtectController>(
      () => _i165.ManageProtectController(gh<_i91.ProtectorUseCase>()));
  gh.factory<_i171.MarShopBuilderController>(
      () => _i171.MarShopBuilderController(gh<_i103.UserRepository>()));
  gh.factory<_i172.MarshopCubit>(
      () => _i172.MarshopCubit(gh<_i70.MarshopUsecase>()));
  gh.singleton<_i173.MemberTabCubit>(_i173.MemberTabCubit(
    gh<_i122.ChatUseCase>(),
    gh<_i105.UserUsecase>(),
  ));
  gh.factory<_i174.MyProfileBloc>(
      () => _i174.MyProfileBloc(gh<_i105.UserUsecase>()));
  gh.factory<_i175.NewMessageCubit>(
      () => _i175.NewMessageCubit(gh<_i122.ChatUseCase>()));
  gh.factory<_i176.NotificationBloc>(
      () => _i176.NotificationBloc(gh<_i74.NotificationUsecase>()));
  gh.factory<_i177.OpenWeatherBloc>(
      () => _i177.OpenWeatherBloc(gh<_i78.OpenWeatherUseCase>()));
  gh.factory<_i178.PDoneInformationBloc>(
      () => _i178.PDoneInformationBloc(gh<_i100.UpgradeAccountUsecase>()));
  gh.factory<_i179.PhoneBookDetailCubit>(
      () => _i179.PhoneBookDetailCubit(gh<_i116.CallUseCase>()));
  gh.factory<_i180.PlaceInformationBloc>(
      () => _i180.PlaceInformationBloc(gh<_i84.PlaceInformationUsecase>()));
  gh.factory<_i181.PlaceInformationBloc2>(
      () => _i181.PlaceInformationBloc2(gh<_i84.PlaceInformationUsecase>()));
  gh.factory<_i182.PostUsecase>(() => _i182.PostUsecase(
        gh<_i86.PostRepository>(),
        gh<_i126.CommentUsecase>(),
        gh<_i92.ResourceApi>(),
      ));
  gh.factory<_i183.SearchCubit>(
      () => _i183.SearchCubit(gh<_i105.UserUsecase>()));
  gh.factory<_i184.TeamDetailBloc>(
      () => _i184.TeamDetailBloc(gh<_i130.CommunityUsecase>()));
  gh.factory<_i185.TeamRequestCubit>(
      () => _i185.TeamRequestCubit(gh<_i130.CommunityUsecase>()));
  gh.factory<_i186.UpgradePDoneBloc>(() => _i186.UpgradePDoneBloc(
        gh<_i100.UpgradeAccountUsecase>(),
        gh<_i105.UserUsecase>(),
        gh<_i40.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i187.UserActionCubit>(
      () => _i187.UserActionCubit(gh<_i105.UserUsecase>()));
  gh.factory<_i188.UserBloc>(() => _i188.UserBloc(
        gh<_i112.AuthenticationUsecase>(),
        gh<_i40.UserSharePreferencesUsecase>(),
        gh<_i105.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i189.UserCubit>(() => _i189.UserCubit(
        gh<_i112.AuthenticationUsecase>(),
        gh<_i40.UserSharePreferencesUsecase>(),
        gh<_i105.UserUsecase>(),
      ));
  gh.factory<_i190.UserProfileBloc>(() => _i190.UserProfileBloc(
        gh<_i105.UserUsecase>(),
        gh<_i91.ProtectorUseCase>(),
        gh<_i27.MediaPicker>(),
        gh<_i100.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i191.AddMemberCubit>(
      () => _i191.AddMemberCubit(gh<_i122.ChatUseCase>()));
  gh.factory<_i192.AdminTabCubit>(
      () => _i192.AdminTabCubit(gh<_i122.ChatUseCase>()));
  gh.factory<_i193.AppCubit>(() => _i193.AppCubit(
        gh<_i95.ResourceUsecase>(),
        gh<_i40.UserSharePreferencesUsecase>(),
        gh<_i112.AuthenticationUsecase>(),
      ));
  gh.singleton<_i194.AppSettingBloc>(
      _i194.AppSettingBloc(gh<_i112.AuthenticationUsecase>()));
  gh.factory<_i195.AuthCubit>(
      () => _i195.AuthCubit(gh<_i112.AuthenticationUsecase>()));
  gh.factory<_i196.CallHistoryCubit>(
      () => _i196.CallHistoryCubit(gh<_i116.CallUseCase>()));
  gh.singleton<_i197.ChatRoomCubit>(_i197.ChatRoomCubit(
    gh<_i122.ChatUseCase>(),
    gh<_i105.UserUsecase>(),
    gh<_i100.UpgradeAccountUsecase>(),
    gh<_i27.MediaPicker>(),
  ));
  gh.factory<_i198.FilmTabBloc>(() => _i198.FilmTabBloc(
        gh<_i182.PostUsecase>(),
        gh<_i27.MediaPicker>(),
      ));
  gh.factory<_i199.PostTabBloc>(() => _i199.PostTabBloc(
        gh<_i182.PostUsecase>(),
        gh<_i126.CommentUsecase>(),
      ));
  await _i200.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i201.DataSourceModule {}

class _$ConfigModule extends _i202.ConfigModule {}

class _$MarshopBlocFactory extends _i203.MarshopBlocFactory {}

class _$PlaceModule extends _i81.PlaceModule {}

class _$CommunityModule extends _i204.CommunityModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i205.UpgradeAgreePolicyBlocFactory {}

class _$DiaryBlocFactory extends _i206.DiaryBlocFactory {}

class _$BlocModule extends _i207.BlocModule {}

class _$DashBoardModule extends _i208.DashBoardModule {}
