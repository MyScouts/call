// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i43;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i51;
import 'package:shared_preferences/shared_preferences.dart' as _i34;
import 'package:wallet/core/core.dart' as _i39;
import 'package:wallet/di/wallet_micro.module.dart' as _i183;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i177;
import '../blocs/approved_request/approved_request_cubit.dart' as _i101;
import '../blocs/auth/auth_cubit.dart' as _i179;
import '../blocs/community/team_request/team_request_cubit.dart' as _i171;
import '../blocs/marshop/marshop_cubit.dart' as _i160;
import '../blocs/user/user_cubit.dart' as _i175;
import '../blocs/user_action/user_action_cubit.dart' as _i173;
import '../core/services/live_service/impl/live_service_impl.dart' as _i21;
import '../core/services/live_service/impl/live_socket_service_impl.dart'
    as _i23;
import '../core/services/live_service/live_service.dart' as _i20;
import '../core/services/live_service/live_socket_service.dart' as _i22;
import '../core/services/notifications/notification_service.dart' as _i29;
import '../core/services/stringee/stringee_service.dart' as _i36;
import '../core/socket/chat_socket.dart' as _i10;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i54;
import '../data/data_sources/remote/auth_api.dart' as _i102;
import '../data/data_sources/remote/call_api.dart' as _i106;
import '../data/data_sources/remote/chat_api.dart' as _i112;
import '../data/data_sources/remote/comment_api.dart' as _i116;
import '../data/data_sources/remote/community_api.dart' as _i120;
import '../data/data_sources/remote/ecom_api.dart' as _i42;
import '../data/data_sources/remote/friend_api.dart' as _i47;
import '../data/data_sources/remote/marshop_api.dart' as _i60;
import '../data/data_sources/remote/notification_api.dart' as _i64;
import '../data/data_sources/remote/open_weather_api.dart' as _i68;
import '../data/data_sources/remote/place_information_api.dart' as _i73;
import '../data/data_sources/remote/place_information_provider.dart' as _i74;
import '../data/data_sources/remote/post_api.dart' as _i78;
import '../data/data_sources/remote/protector_api.dart' as _i81;
import '../data/data_sources/remote/resource_api.dart' as _i85;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i90;
import '../data/data_sources/remote/user_api.dart' as _i95;
import '../data/models/payloads/community/reply_give_up_boss_team_role_payload.dart'
    as _i146;
import '../data/models/payloads/marshop/marshop_payload.dart' as _i138;
import '../data/models/payloads/upgrade_account/upgrade_ja/confirm_register_ja_payload.dart'
    as _i142;
import '../data/models/payloads/upgrade_account/upgrade_ja/update_bank_account_payload.dart'
    as _i139;
import '../data/models/payloads/upgrade_account/upgrade_ja/verify_phone_otp.dart'
    as _i140;
import '../data/models/responses/boss_community_status_response.dart' as _i144;
import '../data/models/responses/boss_team_relinquish_status_response.dart'
    as _i143;
import '../data/models/responses/confirm_register_ja_response.dart' as _i141;
import '../data/models/responses/confirm_response.dart' as _i145;
import '../data/models/responses/ecom/product_detail_response.dart' as _i52;
import '../data/models/responses/group_request_response.dart' as _i149;
import '../data/models/responses/ja_status_response.dart' as _i135;
import '../data/models/responses/marshop_response.dart' as _i137;
import '../data/models/responses/upgrade_account_response.dart' as _i133;
import '../data/repositories/auth_repository.dart' as _i103;
import '../data/repositories/comment_repository.dart' as _i117;
import '../data/repositories/ecom_repository.dart' as _i44;
import '../data/repositories/impl/auth_repository_impl.dart' as _i104;
import '../data/repositories/impl/call_repository_impl.dart' as _i108;
import '../data/repositories/impl/chat_repository_impl.dart' as _i114;
import '../data/repositories/impl/comment_repository_impl.dart' as _i118;
import '../data/repositories/impl/community_repository.impl.dart' as _i122;
import '../data/repositories/impl/ecom_repository_impl.dart' as _i45;
import '../data/repositories/impl/friend_repository_impl.dart' as _i49;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i62;
import '../data/repositories/impl/media_picker_impl.dart' as _i26;
import '../data/repositories/impl/notification_repository.impl.dart' as _i66;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i70;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i76;
import '../data/repositories/impl/post_repository_impl.dart' as _i80;
import '../data/repositories/impl/protector_repository_impl.dart' as _i83;
import '../data/repositories/impl/resource_repository.impl.dart' as _i87;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i92;
import '../data/repositories/impl/user_repository_impl.dart' as _i97;
import '../data/repositories/marshop_repository.dart' as _i61;
import '../data/repositories/media_picker.dart' as _i25;
import '../data/repositories/notification_repository.dart' as _i65;
import '../data/repositories/post_repository.dart' as _i79;
import '../data/repositories/protector_repository.dart' as _i82;
import '../data/repositories/user_repository.dart' as _i96;
import '../domain/entities/bank.dart' as _i148;
import '../domain/entities/commity_action_type.dart' as _i136;
import '../domain/entities/update_account/bank_acount/bank_account.dart'
    as _i134;
import '../domain/repository/call_repository.dart' as _i107;
import '../domain/repository/chat_repository.dart' as _i113;
import '../domain/repository/community_repository.dart' as _i121;
import '../domain/repository/friend_repository.dart' as _i48;
import '../domain/repository/open_weather_repository.dart' as _i69;
import '../domain/repository/place_information_repository.dart' as _i75;
import '../domain/repository/resource_repository.dart' as _i86;
import '../domain/repository/upgrade_account_repository.dart' as _i91;
import '../domain/usecases/authentication_usecase.dart' as _i105;
import '../domain/usecases/call_usecase.dart' as _i109;
import '../domain/usecases/chat_usecase.dart' as _i115;
import '../domain/usecases/comment_usecase.dart' as _i119;
import '../domain/usecases/community_usecase.dart' as _i123;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i41;
import '../domain/usecases/ecom_usecase.dart' as _i46;
import '../domain/usecases/friend_usecase.dart' as _i50;
import '../domain/usecases/marshop_usecase.dart' as _i63;
import '../domain/usecases/notification_usecase.dart' as _i67;
import '../domain/usecases/open_weather_usecase.dart' as _i71;
import '../domain/usecases/place_information_usecase.dart' as _i77;
import '../domain/usecases/post_usecase.dart' as _i168;
import '../domain/usecases/protector_usecase.dart' as _i84;
import '../domain/usecases/resource_usecase.dart' as _i88;
import '../domain/usecases/upgrade_account_usecase.dart' as _i93;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i38;
import '../domain/usecases/user_usecase.dart' as _i98;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/call/call_routes.dart' as _i8;
import '../presentation/call/phone_book/tabs/all_friends/cubit/all_friends_cubit.dart'
    as _i100;
import '../presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart'
    as _i180;
import '../presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart'
    as _i165;
import '../presentation/call/service/call_service.dart' as _i6;
import '../presentation/call/service/models/call_service_models.dart' as _i7;
import '../presentation/call/stringee_bloc/stringee_bloc.dart' as _i89;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i181;
import '../presentation/chat/chat_routes.dart' as _i9;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i124;
import '../presentation/chat/create_room/cubit/create_room_cubit.dart' as _i125;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i161;
import '../presentation/community/community_constants.dart' as _i147;
import '../presentation/community/community_module.dart' as _i188;
import '../presentation/community/community_routes.dart' as _i11;
import '../presentation/community/edit_community_detail/bloc/edit_community_detail_bloc.dart'
    as _i129;
import '../presentation/community/edit_fan_group/bloc/edit_fan_group_bloc.dart'
    as _i130;
import '../presentation/community/fan_group_detail/bloc/fan_group_detail_bloc.dart'
    as _i132;
import '../presentation/community/group_detail/bloc/group_detail_bloc.dart'
    as _i151;
import '../presentation/community/team_detail/bloc/team_detail_bloc.dart'
    as _i170;
import '../presentation/community/team_detail/pages/add_team_member_sheet.dart'
    as _i99;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i127;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i128;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i163;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i126;
import '../presentation/dashboard/dashboard_module.dart' as _i190;
import '../presentation/dashboard/dashboard_routes.dart' as _i12;
import '../presentation/dashboard/search/blocs/search/search_cubit.dart'
    as _i169;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i111;
import '../presentation/general_setting/general_routes.dart' as _i15;
import '../presentation/information_profile/bloc/bloc/information_update_profil_bloc.dart'
    as _i153;
import '../presentation/information_profile/bloc/cubit/information_pdone_profile_cubit.dart'
    as _i55;
import '../presentation/information_profile/bloc/place_information_2/place_information_2_bloc.dart'
    as _i167;
import '../presentation/information_profile/information_profile_routes.dart'
    as _i17;
import '../presentation/live/data/data_sources/remote/live_api.dart' as _i56;
import '../presentation/live/data/repository/live_repository.dart' as _i57;
import '../presentation/live/data/repository/repository_impl/live_repository_impl.dart'
    as _i58;
import '../presentation/live/domain/usecases/gift_share_preferences_usecase.dart'
    as _i53;
import '../presentation/live/domain/usecases/live_usecases.dart' as _i59;
import '../presentation/live/live_routes.dart' as _i19;
import '../presentation/live/presentation/channel/state/live_channel_controller.dart'
    as _i156;
import '../presentation/live/presentation/channel/widget/sent_gift_page.dart'
    as _i14;
import '../presentation/live/presentation/create/state/live_create_controller.dart'
    as _i159;
import '../presentation/live/presentation/create/widget/live_category_picker.dart'
    as _i110;
import '../presentation/live/presentation/list_gift/gift_controller.dart'
    as _i150;
import '../presentation/live/presentation/live_bottom/live_bottom_controller.dart'
    as _i155;
import '../presentation/live/presentation/live_message/state/live_message_bloc.dart'
    as _i18;
import '../presentation/live/presentation/live_tab/live_controller.dart'
    as _i158;
import '../presentation/live/presentation/pk/invite/pk_invite_controller.dart'
    as _i72;
import '../presentation/live/presentation/widget/check_password_enable.dart'
    as _i157;
import '../presentation/marshop/marshop_bloc.dart' as _i186;
import '../presentation/marshop/marshop_routes.dart' as _i24;
import '../presentation/marshop/widgets/general_setting/general_routes.dart'
    as _i16;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i13;
import '../presentation/notification/notification_routes.dart' as _i28;
import '../presentation/notification/state/notification_bloc.dart' as _i162;
import '../presentation/otp_verify/email_otp_verify.dart' as _i131;
import '../presentation/profile/state/user_profile_bloc.dart' as _i176;
import '../presentation/protector/controller/manage_protector_controller.dart'
    as _i154;
import '../presentation/protector/protector_router.dart' as _i30;
import '../presentation/qr_code/qr_code_route.dart' as _i31;
import '../presentation/routes.dart' as _i32;
import '../presentation/settings/setting_routes.dart' as _i33;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i178;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i174;
import '../presentation/social/my_profile/blocs/my_profile_bloc.dart' as _i182;
import '../presentation/social/my_profile/my_profile_routes.dart' as _i27;
import '../presentation/social/my_profile/screens/components/create_post/blocs/create_post_bloc.dart'
    as _i40;
import '../presentation/social/profile/profile_bloc.dart' as _i189;
import '../presentation/social/social_routes.dart' as _i35;
import '../presentation/upgrade_account/upgrade_account_routes.dart' as _i37;
import '../presentation/upgrade_account/upgrade_ja/upgrade_agree_policy.bloc.dart'
    as _i187;
import '../presentation/upgrade_account/upgrade_pdone/bloc/guardian_pdone/guardian_pdone_bloc.dart'
    as _i152;
import '../presentation/upgrade_account/upgrade_pdone/bloc/pdone_information/pdone_information_bloc.dart'
    as _i164;
import '../presentation/upgrade_account/upgrade_pdone/bloc/place_information/place_information_bloc.dart'
    as _i166;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade/upgrade_cubit.dart'
    as _i94;
import '../presentation/upgrade_account/upgrade_pdone/bloc/upgrade_pdone/upgrade_pdone_bloc.dart'
    as _i172;
import 'modules/config_module.dart' as _i185;
import 'modules/data_source_module.dart' as _i184;

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
  gh.factory<_i15.GeneralRoutes>(() => _i15.GeneralRoutes());
  gh.factory<_i16.GeneralRoutes>(() => _i16.GeneralRoutes());
  gh.factory<_i17.InfoProfileRoutes>(() => _i17.InfoProfileRoutes());
  gh.factory<_i18.LiveMessageBloc>(() => _i18.LiveMessageBloc());
  gh.factory<_i19.LiveRoutes>(() => _i19.LiveRoutes());
  gh.factory<_i20.LiveService>(() => _i21.LiveServiceImpl());
  gh.factory<_i22.LiveSocketService>(() => _i23.LiveSocketServiceImpl());
  gh.factory<_i24.MarkShopRoutes>(() => _i24.MarkShopRoutes());
  gh.lazySingleton<_i25.MediaPicker>(() => _i26.MediaPickerImpl());
  gh.factory<_i27.MyProfileRoutes>(() => _i27.MyProfileRoutes());
  gh.factory<_i28.NotificationRoutes>(() => _i28.NotificationRoutes());
  gh.singleton<_i29.NotificationService>(
      _i29.NotificationService(gh<_i3.LoggerService>()));
  gh.factory<_i30.ProtectorModule>(() => _i30.ProtectorModule());
  gh.factory<_i31.QrCodeRoutes>(() => _i31.QrCodeRoutes());
  gh.singleton<_i32.Routes>(_i32.Routes());
  gh.factory<_i33.SettingRoutes>(() => _i33.SettingRoutes());
  await gh.singletonAsync<_i34.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i35.SocialRoutes>(() => _i35.SocialRoutes());
  gh.singleton<_i36.StringeeService>(_i36.StringeeService());
  gh.factory<_i37.UpgradeAccountRoutes>(() => _i37.UpgradeAccountRoutes());
  gh.factory<_i38.UserSharePreferencesUsecase>(
      () => _i38.UserSharePreferencesUsecase(gh<_i34.SharedPreferences>()));
  gh.singleton<_i39.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i40.CreatePostBloc>(
      () => _i40.CreatePostBloc(gh<_i25.MediaPicker>()));
  gh.factory<_i41.DashboardSharePreferenceUseCase>(
      () => _i41.DashboardSharePreferenceUseCase(gh<_i34.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i34.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i42.EcomAPI>(() => _i42.EcomAPI(gh<_i43.Dio>()));
  gh.factory<_i44.EcomRepository>(
      () => _i45.EcomRepositoryImpl(gh<_i42.EcomAPI>()));
  gh.factory<_i46.EcomUsecase>(
      () => _i46.EcomUsecase(gh<_i44.EcomRepository>()));
  gh.factory<_i47.FriendApi>(() => _i47.FriendApi(gh<_i43.Dio>()));
  gh.factory<_i48.FriendRepository>(
      () => _i49.FriendRepositoryImpl(gh<_i47.FriendApi>()));
  gh.factory<_i50.FriendUsecase>(
      () => _i50.FriendUsecase(gh<_i48.FriendRepository>()));
  gh.factory<_i51.GetListBlocParam1<_i52.ProductDetailResponse, List<String>>>(
      () => marshopBlocFactory.getProducts(gh<_i46.EcomUsecase>()));
  gh.factory<_i53.GiftSharePreferencesUseCase>(
      () => _i53.GiftSharePreferencesUseCase(gh<_i34.SharedPreferences>()));
  gh.factory<_i54.InformationPDoneSharePreferencesUsecase>(() =>
      _i54.InformationPDoneSharePreferencesUsecase(
          gh<_i34.SharedPreferences>()));
  gh.factory<_i55.InformationPdoneProfileCubit>(() =>
      _i55.InformationPdoneProfileCubit(
          gh<_i54.InformationPDoneSharePreferencesUsecase>()));
  gh.factory<_i56.LiveApi>(() => _i56.LiveApi(gh<_i3.Dio>()));
  gh.factory<_i57.LiveRepository>(
      () => _i58.LiveRepositoryImpl(gh<_i56.LiveApi>()));
  gh.factory<_i59.LiveUseCase>(
      () => _i59.LiveUseCase(gh<_i57.LiveRepository>()));
  gh.factory<_i60.MarshopAPI>(() => _i60.MarshopAPI(gh<_i43.Dio>()));
  gh.factory<_i61.MarshopRepository>(
      () => _i62.MarshopRepositoryImpl(gh<_i60.MarshopAPI>()));
  gh.factory<_i63.MarshopUsecase>(
      () => _i63.MarshopUsecase(gh<_i61.MarshopRepository>()));
  gh.factory<_i64.NotificationAPI>(() => _i64.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i65.NotificationRepository>(
      () => _i66.NotificationRepositoryImpl(gh<_i64.NotificationAPI>()));
  gh.factory<_i67.NotificationUsecase>(
      () => _i67.NotificationUsecase(gh<_i65.NotificationRepository>()));
  gh.lazySingleton<_i68.OpenWeatherApi>(
      () => _i68.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i69.OpenWeatherRepository>(
      () => _i70.OpenWeatherRepositoryImpl(gh<_i68.OpenWeatherApi>()));
  gh.factory<_i71.OpenWeatherUseCase>(
      () => _i71.OpenWeatherUseCase(gh<_i69.OpenWeatherRepository>()));
  gh.factory<_i72.PkInviteController>(
      () => _i72.PkInviteController(gh<_i59.LiveUseCase>()));
  gh.factory<_i73.PlaceInformationAPI>(
      () => _i73.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i74.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i34.SharedPreferences>(),
        gh<_i74.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i75.PlaceInformationRepository>(() =>
      _i76.PlaceInformationRepositoryImpl(gh<_i73.PlaceInformationAPI>()));
  gh.factory<_i77.PlaceInformationUsecase>(() =>
      _i77.PlaceInformationUsecase(gh<_i75.PlaceInformationRepository>()));
  gh.factory<_i78.PostAPI>(() => _i78.PostAPI(gh<_i3.Dio>()));
  gh.factory<_i79.PostRepository>(
      () => _i80.PostRepositoryImpl(gh<_i78.PostAPI>()));
  gh.lazySingleton<_i81.ProtectorAPI>(() => _i81.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i82.ProtectorRepository>(
      () => _i83.ProtectorRepositoryImpl(gh<_i81.ProtectorAPI>()));
  gh.factory<_i84.ProtectorUseCase>(
      () => _i84.ProtectorUseCase(gh<_i82.ProtectorRepository>()));
  gh.factory<_i85.ResourceApi>(() => _i85.ResourceApi(gh<_i43.Dio>()));
  gh.factory<_i86.ResourceRepository>(
      () => _i87.ResourceRepositoryImpl(gh<_i85.ResourceApi>()));
  gh.factory<_i88.ResourceUsecase>(
      () => _i88.ResourceUsecase(gh<_i86.ResourceRepository>()));
  gh.singleton<_i89.StringeeBloc>(_i89.StringeeBloc(
    gh<_i36.StringeeService>(),
    gh<_i38.UserSharePreferencesUsecase>(),
  ));
  gh.factory<_i90.UpgradeAccountApi>(
      () => _i90.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i91.UpgradeAccountRepository>(
      () => _i92.UpgradeAccountRepositoryImpl(
            gh<_i90.UpgradeAccountApi>(),
            gh<_i85.ResourceApi>(),
          ));
  gh.factory<_i93.UpgradeAccountUsecase>(
      () => _i93.UpgradeAccountUsecase(gh<_i91.UpgradeAccountRepository>()));
  gh.factory<_i94.UpgradeCubit>(
      () => _i94.UpgradeCubit(gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<_i95.UserApi>(() => _i95.UserApi(gh<_i3.Dio>()));
  gh.factory<_i96.UserRepository>(
      () => _i97.AuthRepositoryImpl(gh<_i95.UserApi>()));
  gh.factory<_i98.UserUsecase>(
      () => _i98.UserUsecase(gh<_i96.UserRepository>()));
  gh.factory<_i99.AddMemberChangeNotifier>(
      () => _i99.AddMemberChangeNotifier(gh<_i98.UserUsecase>()));
  gh.factory<_i100.AllFriendsCubit>(
      () => _i100.AllFriendsCubit(gh<_i50.FriendUsecase>()));
  gh.factory<_i101.ApprovedRequestCubit>(
      () => _i101.ApprovedRequestCubit(gh<_i98.UserUsecase>()));
  gh.factory<_i102.AuthApi>(() => _i102.AuthApi(gh<_i43.Dio>()));
  gh.factory<_i103.AuthRepository>(
      () => _i104.AuthRepositoryImpl(gh<_i102.AuthApi>()));
  gh.factory<_i105.AuthenticationUsecase>(() => _i105.AuthenticationUsecase(
        gh<_i103.AuthRepository>(),
        gh<_i38.UserSharePreferencesUsecase>(),
        gh<_i96.UserRepository>(),
        gh<_i29.NotificationService>(),
        gh<_i10.ChatSocket>(),
      ));
  gh.factory<_i106.CallApi>(() => _i106.CallApi(gh<_i43.Dio>()));
  gh.factory<_i107.CallRepository>(
      () => _i108.CallRepositoryImpl(gh<_i106.CallApi>()));
  gh.factory<_i109.CallUseCase>(
      () => _i109.CallUseCase(gh<_i107.CallRepository>()));
  gh.factory<_i110.CategoryController>(
      () => _i110.CategoryController(gh<_i57.LiveRepository>()));
  gh.factory<_i111.ChangePasswordController>(
      () => _i111.ChangePasswordController(gh<_i105.AuthenticationUsecase>()));
  gh.factory<_i112.ChatApi>(() => _i112.ChatApi(gh<_i43.Dio>()));
  gh.factory<_i113.ChatRepository>(
      () => _i114.ChatRepositoryImpl(gh<_i112.ChatApi>()));
  gh.factory<_i115.ChatUseCase>(() => _i115.ChatUseCase(
        gh<_i113.ChatRepository>(),
        gh<_i48.FriendRepository>(),
      ));
  gh.factory<_i116.CommentAPI>(() => _i116.CommentAPI(gh<_i3.Dio>()));
  gh.factory<_i117.CommentRepository>(
      () => _i118.CommentRepositoryImpl(gh<_i116.CommentAPI>()));
  gh.factory<_i119.CommentUsecase>(
      () => _i119.CommentUsecase(gh<_i117.CommentRepository>()));
  gh.factory<_i120.CommunityApi>(() => _i120.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i121.CommunityRepository>(
      () => _i122.CommunityRepositoryImpl(gh<_i120.CommunityApi>()));
  gh.factory<_i123.CommunityUsecase>(
      () => _i123.CommunityUsecase(gh<_i121.CommunityRepository>()));
  gh.singleton<_i124.ConversationCubit>(
      _i124.ConversationCubit(gh<_i115.ChatUseCase>()));
  gh.factory<_i125.CreateRoomCubit>(
      () => _i125.CreateRoomCubit(gh<_i115.ChatUseCase>()));
  gh.factory<_i126.DashBoardBgController>(() =>
      _i126.DashBoardBgController(gh<_i41.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i127.DashBoardScreenController>(() =>
      _i127.DashBoardScreenController(
          gh<_i41.DashboardSharePreferenceUseCase>()));
  gh.factory<_i128.DashboardCommunityBloc>(() =>
      _i128.DashboardCommunityBloc(gh<_i41.DashboardSharePreferenceUseCase>()));
  gh.factory<_i128.DashboardEcommerceBloc>(() =>
      _i128.DashboardEcommerceBloc(gh<_i41.DashboardSharePreferenceUseCase>()));
  gh.factory<_i128.DashboardPersonalBloc>(() =>
      _i128.DashboardPersonalBloc(gh<_i41.DashboardSharePreferenceUseCase>()));
  gh.factoryParam<_i129.EditCommunityDetailBloc, _i3.Community, dynamic>((
    community,
    _,
  ) =>
      _i129.EditCommunityDetailBloc(
        gh<_i123.CommunityUsecase>(),
        gh<_i88.ResourceUsecase>(),
        community,
      ));
  gh.factoryParam<_i130.EditFanGroupBloc, _i3.FanGroup, dynamic>((
    fanGroup,
    _,
  ) =>
      _i130.EditFanGroupBloc(
        gh<_i123.CommunityUsecase>(),
        gh<_i88.ResourceUsecase>(),
        fanGroup,
      ));
  gh.factory<_i131.EmailVerifyController>(
      () => _i131.EmailVerifyController(gh<_i98.UserUsecase>()));
  gh.factory<_i132.FanGroupDetailBloc>(
      () => _i132.FanGroupDetailBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<_i51.GetDetailBloc<_i133.UpgradeAccountResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createUpgradeAccountBloc(gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<_i51.GetDetailBloc<_i134.BankAccount>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetDefaultBankBloc(gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<_i51.GetDetailBloc<_i3.FanGroup>>(() =>
      communityModule.createGetFanGroupBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<_i51.GetDetailBloc<_i135.JAStatusResponse>>(() =>
      upgradeAgreePolicyBlocFactory
          .createGetJAStatusBloc(gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<
      _i51.GetDetailBlocParam1<_i133.UpgradeAccountResponse,
          _i136.PDoneActionType>>(() => upgradeAgreePolicyBlocFactory
      .createResendOTPPhoneBloc(gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<
          _i51.GetDetailBlocParam1<_i137.MarshopResponse,
              _i138.GetMarshopInfoPayload>>(
      () => marshopBlocFactory.getMarshopInfo(gh<_i63.MarshopUsecase>()));
  gh.factory<
      _i51.GetDetailBlocParam1<_i134.BankAccount,
          _i139.UpdateBankAccountPayload>>(() => upgradeAgreePolicyBlocFactory
      .createUpdateBankAccountBloc(gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<_i51.GetDetailBlocParam1<Map<String, dynamic>, int>>(() =>
      diaryBlocFactory.globalPersonSettingBloc(gh<_i88.ResourceUsecase>()));
  gh.factory<_i51.GetDetailBlocParam1<dynamic, _i140.VerifyPhoneOtpPayload>>(
      () => upgradeAgreePolicyBlocFactory.createUpgradeAccountVerifyPhoneBloc(
          gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<_i51.GetDetailBlocParam1<_i3.User?, int>>(
      () => diaryBlocFactory.getUserDetailBloc(gh<_i98.UserUsecase>()));
  gh.factory<
      _i51.GetDetailBlocParam1<_i141.ConfirmRegisterJAResponse,
          _i142.ConfirmRegisterJAPayload>>(() => upgradeAgreePolicyBlocFactory
      .createConfirmRegisterJABloc(gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<
          _i51
          .GetDetailBlocParam1<_i143.BossTeamRelinquishStatusResponse, String>>(
      () => communityModule
          .createGetBossTeamRelinquishStatusBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<
          _i51.GetDetailBlocParam1<_i144.BossCommunityStatusResponse, String>>(
      () => communityModule
          .createGetBossStatusBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<
      _i51.GetDetailBlocParam2<_i145.ConfirmResponse, String,
          _i146.ReplyGiveUpBossTeamRolePayload>>(() => communityModule
      .createReplyGiveUpBossTeamBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<
      _i51.GetDetailBlocParam2<_i145.ConfirmResponse, String,
          _i147.CommunityType>>(() => communityModule
      .createRelinquishBossRoleBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<_i51.GetListBloc<_i148.Bank>>(() => upgradeAgreePolicyBlocFactory
      .createGetListBanksBloc(gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<_i51.GetListBloc<_i137.MarshopRegisterPackResponse>>(
      () => marshopBlocFactory.getMarshopPack(gh<_i63.MarshopUsecase>()));
  gh.factory<_i51.GetListBloc<_i3.Group>>(() =>
      communityModule.createGetListGroupsBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<_i51.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i123.CommunityUsecase>()));
  gh.factory<_i51.GetListBloc<_i149.GroupRequest>>(() =>
      communityModule.createGetGroupRequestsBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<
          _i51.GetListBlocParam1<_i137.MarshopResponse,
              _i138.GetListMarshopPayload>>(
      () => marshopBlocFactory.listMarshopBloc(gh<_i63.MarshopUsecase>()));
  gh.factory<_i51.GetListBlocParam1<_i3.Team, String>>(() =>
      communityModule.createGetListTeamsBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<_i150.GiftController>(
      () => _i150.GiftController(gh<_i59.LiveUseCase>()));
  gh.factory<_i151.GroupDetailBloc>(
      () => _i151.GroupDetailBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<_i152.GuardianPDoneBloc>(
      () => _i152.GuardianPDoneBloc(gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<_i153.InformationUpdateProfilBloc>(
      () => _i153.InformationUpdateProfilBloc(
            gh<_i98.UserUsecase>(),
            gh<_i54.InformationPDoneSharePreferencesUsecase>(),
          ));
  gh.factory<_i154.ListProtectorRequestController>(
      () => _i154.ListProtectorRequestController(gh<_i84.ProtectorUseCase>()));
  gh.factory<_i155.LiveBottomController>(() => _i155.LiveBottomController(
        gh<_i59.LiveUseCase>(),
        gh<_i98.UserUsecase>(),
      ));
  gh.factory<_i156.LiveChannelController>(() => _i156.LiveChannelController(
        gh<_i57.LiveRepository>(),
        gh<_i38.UserSharePreferencesUsecase>(),
        gh<_i98.UserUsecase>(),
        gh<_i20.LiveService>(),
        gh<_i22.LiveSocketService>(),
        gh<_i14.FloatingGiftsProvider>(),
      ));
  gh.factory<_i157.LiveCheckPasswordController>(
      () => _i157.LiveCheckPasswordController(gh<_i59.LiveUseCase>()));
  gh.factory<_i158.LiveController>(
      () => _i158.LiveController(gh<_i59.LiveUseCase>()));
  gh.factory<_i159.LiveCreateController>(() => _i159.LiveCreateController(
        gh<_i57.LiveRepository>(),
        gh<_i20.LiveService>(),
      ));
  gh.factory<_i154.ManageProtectController>(
      () => _i154.ManageProtectController(gh<_i84.ProtectorUseCase>()));
  gh.factory<_i160.MarshopCubit>(
      () => _i160.MarshopCubit(gh<_i63.MarshopUsecase>()));
  gh.factory<_i161.NewMessageCubit>(
      () => _i161.NewMessageCubit(gh<_i115.ChatUseCase>()));
  gh.factory<_i162.NotificationBloc>(
      () => _i162.NotificationBloc(gh<_i67.NotificationUsecase>()));
  gh.factory<_i163.OpenWeatherBloc>(
      () => _i163.OpenWeatherBloc(gh<_i71.OpenWeatherUseCase>()));
  gh.factory<_i164.PDoneInformationBloc>(
      () => _i164.PDoneInformationBloc(gh<_i93.UpgradeAccountUsecase>()));
  gh.factory<_i165.PhoneBookDetailCubit>(
      () => _i165.PhoneBookDetailCubit(gh<_i109.CallUseCase>()));
  gh.factory<_i166.PlaceInformationBloc>(
      () => _i166.PlaceInformationBloc(gh<_i77.PlaceInformationUsecase>()));
  gh.factory<_i167.PlaceInformationBloc2>(
      () => _i167.PlaceInformationBloc2(gh<_i77.PlaceInformationUsecase>()));
  gh.factory<_i168.PostUsecase>(() => _i168.PostUsecase(
        gh<_i79.PostRepository>(),
        gh<_i119.CommentUsecase>(),
        gh<_i85.ResourceApi>(),
      ));
  gh.factory<_i169.SearchCubit>(
      () => _i169.SearchCubit(gh<_i98.UserUsecase>()));
  gh.factory<_i170.TeamDetailBloc>(
      () => _i170.TeamDetailBloc(gh<_i123.CommunityUsecase>()));
  gh.factory<_i171.TeamRequestCubit>(
      () => _i171.TeamRequestCubit(gh<_i123.CommunityUsecase>()));
  gh.factory<_i172.UpgradePDoneBloc>(() => _i172.UpgradePDoneBloc(
        gh<_i93.UpgradeAccountUsecase>(),
        gh<_i98.UserUsecase>(),
        gh<_i38.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i173.UserActionCubit>(
      () => _i173.UserActionCubit(gh<_i98.UserUsecase>()));
  gh.factory<_i174.UserBloc>(() => _i174.UserBloc(
        gh<_i105.AuthenticationUsecase>(),
        gh<_i38.UserSharePreferencesUsecase>(),
        gh<_i98.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i175.UserCubit>(() => _i175.UserCubit(
        gh<_i105.AuthenticationUsecase>(),
        gh<_i38.UserSharePreferencesUsecase>(),
        gh<_i98.UserUsecase>(),
      ));
  gh.factory<_i176.UserProfileBloc>(() => _i176.UserProfileBloc(
        gh<_i98.UserUsecase>(),
        gh<_i84.ProtectorUseCase>(),
        gh<_i25.MediaPicker>(),
        gh<_i93.UpgradeAccountUsecase>(),
      ));
  gh.factory<_i177.AppCubit>(() => _i177.AppCubit(
        gh<_i88.ResourceUsecase>(),
        gh<_i38.UserSharePreferencesUsecase>(),
        gh<_i105.AuthenticationUsecase>(),
      ));
  gh.singleton<_i178.AppSettingBloc>(
      _i178.AppSettingBloc(gh<_i105.AuthenticationUsecase>()));
  gh.factory<_i179.AuthCubit>(
      () => _i179.AuthCubit(gh<_i105.AuthenticationUsecase>()));
  gh.factory<_i180.CallHistoryCubit>(
      () => _i180.CallHistoryCubit(gh<_i109.CallUseCase>()));
  gh.singleton<_i181.ChatRoomCubit>(_i181.ChatRoomCubit(
    gh<_i115.ChatUseCase>(),
    gh<_i98.UserUsecase>(),
    gh<_i93.UpgradeAccountUsecase>(),
    gh<_i25.MediaPicker>(),
  ));
  gh.factory<_i182.MyProfileBloc>(() => _i182.MyProfileBloc(
        gh<_i98.UserUsecase>(),
        gh<_i168.PostUsecase>(),
        gh<_i119.CommentUsecase>(),
        gh<_i98.UserUsecase>(),
      ));
  await _i183.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i184.DataSourceModule {}

class _$ConfigModule extends _i185.ConfigModule {}

class _$MarshopBlocFactory extends _i186.MarshopBlocFactory {}

class _$PlaceModule extends _i74.PlaceModule {}

class _$UpgradeAgreePolicyBlocFactory
    extends _i187.UpgradeAgreePolicyBlocFactory {}

class _$CommunityModule extends _i188.CommunityModule {}

class _$DiaryBlocFactory extends _i189.DiaryBlocFactory {}

class _$DashBoardModule extends _i190.DashBoardModule {}
