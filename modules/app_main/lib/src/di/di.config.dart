// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i26;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i99;
import 'package:shared_preferences/shared_preferences.dart' as _i20;
import 'package:wallet/core/core.dart' as _i23;
import 'package:wallet/di/wallet_micro.module.dart' as _i118;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i113;
import '../blocs/approved_request/approved_request_cubit.dart' as _i74;
import '../blocs/auth/auth_cubit.dart' as _i115;
import '../blocs/bloc.dart' as _i121;
import '../blocs/community/team_request/team_request_cubit.dart' as _i107;
import '../blocs/marshop/marshop_cubit.dart' as _i101;
import '../blocs/user/user_cubit.dart' as _i110;
import '../blocs/user_action/user_action_cubit.dart' as _i108;
import '../core/services/notifications/notification_service.dart' as _i17;
import '../core/services/stringee/stringee_service.dart' as _i21;
import '../core/socket/chat_socket.dart' as _i10;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i38;
import '../data/data_sources/remote/auth_api.dart' as _i75;
import '../data/data_sources/remote/call_api.dart' as _i79;
import '../data/data_sources/remote/chat_api.dart' as _i84;
import '../data/data_sources/remote/community_api.dart' as _i88;
import '../data/data_sources/remote/ecom_api.dart' as _i25;
import '../data/data_sources/remote/following_api.dart' as _i30;
import '../data/data_sources/remote/friend_api.dart' as _i34;
import '../data/data_sources/remote/marshop_api.dart' as _i39;
import '../data/data_sources/remote/notification_api.dart' as _i43;
import '../data/data_sources/remote/open_weather_api.dart' as _i47;
import '../data/data_sources/remote/place_information_api.dart' as _i51;
import '../data/data_sources/remote/place_information_provider.dart' as _i52;
import '../data/data_sources/remote/protector_api.dart' as _i56;
import '../data/data_sources/remote/resource_api.dart' as _i60;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i65;
import '../data/data_sources/remote/user_api.dart' as _i69;
import '../data/models/responses/resource_response.dart' as _i100;
import '../data/repositories/auth_repository.dart' as _i76;
import '../data/repositories/ecom_repository.dart' as _i27;
import '../data/repositories/following_repository.dart' as _i31;
import '../data/repositories/impl/auth_repository_impl.dart' as _i77;
import '../data/repositories/impl/call_repository_impl.dart' as _i81;
import '../data/repositories/impl/chat_repository_impl.dart' as _i86;
import '../data/repositories/impl/community_repository.impl.dart' as _i90;
import '../data/repositories/impl/ecom_repository_impl.dart' as _i28;
import '../data/repositories/impl/following_repository_impl.dart' as _i32;
import '../data/repositories/impl/friend_repository_impl.dart' as _i36;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i41;
import '../data/repositories/impl/media_picker_impl.dart' as _i15;
import '../data/repositories/impl/notification_repository.impl.dart' as _i45;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i49;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i54;
import '../data/repositories/impl/protector_repository_impl.dart' as _i58;
import '../data/repositories/impl/resource_repository.impl.dart' as _i62;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i67;
import '../data/repositories/impl/user_repository_impl.dart' as _i71;
import '../data/repositories/marshop_repository.dart' as _i40;
import '../data/repositories/media_picker.dart' as _i14;
import '../data/repositories/notification_repository.dart' as _i44;
import '../data/repositories/protector_repository.dart' as _i57;
import '../data/repositories/user_repository.dart' as _i70;
import '../domain/repository/call_repository.dart' as _i80;
import '../domain/repository/chat_repository.dart' as _i85;
import '../domain/repository/community_repository.dart' as _i89;
import '../domain/repository/friend_repository.dart' as _i35;
import '../domain/repository/open_weather_repository.dart' as _i48;
import '../domain/repository/place_information_repository.dart' as _i53;
import '../domain/repository/resource_repository.dart' as _i61;
import '../domain/repository/upgrade_account_repository.dart' as _i66;
import '../domain/usecases/authentication_usecase.dart' as _i78;
import '../domain/usecases/call_usecase.dart' as _i82;
import '../domain/usecases/chat_usecase.dart' as _i87;
import '../domain/usecases/community_usecase.dart' as _i91;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i24;
import '../domain/usecases/ecom_usecase.dart' as _i29;
import '../domain/usecases/following_usecase.dart' as _i33;
import '../domain/usecases/friend_usecase.dart' as _i37;
import '../domain/usecases/marshop_usecase.dart' as _i42;
import '../domain/usecases/notification_usecase.dart' as _i46;
import '../domain/usecases/open_weather_usecase.dart' as _i50;
import '../domain/usecases/place_information_usecase.dart' as _i55;
import '../domain/usecases/protector_usecase.dart' as _i59;
import '../domain/usecases/resource_usecase.dart' as _i63;
import '../domain/usecases/upgrade_account_usecase.dart' as _i68;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i22;
import '../domain/usecases/user_usecase.dart' as _i72;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/call/call_routes.dart' as _i8;
import '../presentation/call/phone_book/tabs/all_friends/cubit/all_friends_cubit.dart'
    as _i73;
import '../presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart'
    as _i116;
import '../presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart'
    as _i106;
import '../presentation/call/service/call_service.dart' as _i6;
import '../presentation/call/service/models/call_service_models.dart' as _i7;
import '../presentation/call/stringee_bloc/stringee_bloc.dart' as _i64;
import '../presentation/chat/add_member/cubit/add_member_cubit.dart' as _i111;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i117;
import '../presentation/chat/chat_routes.dart' as _i9;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i93;
import '../presentation/chat/create_room/cubit/create_room_cubit.dart' as _i94;
import '../presentation/chat/member/tab/admin/cubit/admin_tab_cubit.dart'
    as _i112;
import '../presentation/chat/member/tab/member/cubit/member_tab_cubit.dart'
    as _i102;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i103;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i96;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i97;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i105;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i95;
import '../presentation/dashboard/dashboard_module.dart' as _i122;
import '../presentation/dashboard/dashboard_routes.dart' as _i11;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i83;
import '../presentation/general_setting/contracts/bloc/contract_bloc_cubit.dart'
    as _i92;
import '../presentation/general_setting/general_routes.dart' as _i13;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i12;
import '../presentation/notification/notification_routes.dart' as _i16;
import '../presentation/notification/state/notification_bloc.dart' as _i104;
import '../presentation/otp_verify/email_otp_verify.dart' as _i98;
import '../presentation/routes.dart' as _i18;
import '../presentation/settings/setting_routes.dart' as _i19;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i114;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i109;
import 'modules/config_module.dart' as _i120;
import 'modules/data_source_module.dart' as _i119;

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
  gh.factory<_i11.DashboardRoutes>(() => _i11.DashboardRoutes());
  gh.factory<_i12.DeeplinkBloc>(() => _i12.DeeplinkBloc());
  gh.factory<_i13.GeneralRoutes>(() => _i13.GeneralRoutes());
  gh.lazySingleton<_i14.MediaPicker>(() => _i15.MediaPickerImpl());
  gh.factory<_i16.NotificationRoutes>(() => _i16.NotificationRoutes());
  gh.singleton<_i17.NotificationService>(
      _i17.NotificationService(gh<_i3.LoggerService>()));
  gh.singleton<_i18.Routes>(_i18.Routes());
  gh.factory<_i19.SettingRoutes>(() => _i19.SettingRoutes());
  await gh.singletonAsync<_i20.SharedPreferences>(
    () => dataSourceModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i21.StringeeService>(_i21.StringeeService());
  gh.factory<_i22.UserSharePreferencesUsecase>(
      () => _i22.UserSharePreferencesUsecase(gh<_i20.SharedPreferences>()));
  gh.singleton<_i23.WalletConfigurations>(
      configModule.createWalletConfigurations());
  gh.factory<_i24.DashboardSharePreferenceUseCase>(
      () => _i24.DashboardSharePreferenceUseCase(gh<_i20.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i20.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i25.EcomAPI>(() => _i25.EcomAPI(gh<_i26.Dio>()));
  gh.factory<_i27.EcomRepository>(
      () => _i28.EcomRepositoryImpl(gh<_i25.EcomAPI>()));
  gh.factory<_i29.EcomUsecase>(
      () => _i29.EcomUsecase(gh<_i27.EcomRepository>()));
  gh.factory<_i30.FollowingAPI>(() => _i30.FollowingAPI(gh<_i3.Dio>()));
  gh.factory<_i31.FollowingRepository>(
      () => _i32.FollowingRepositoryImpl(gh<_i30.FollowingAPI>()));
  gh.factory<_i33.FollowingUsecase>(
      () => _i33.FollowingUsecase(gh<_i31.FollowingRepository>()));
  gh.factory<_i34.FriendApi>(() => _i34.FriendApi(gh<_i26.Dio>()));
  gh.factory<_i35.FriendRepository>(
      () => _i36.FriendRepositoryImpl(gh<_i34.FriendApi>()));
  gh.factory<_i37.FriendUsecase>(
      () => _i37.FriendUsecase(gh<_i35.FriendRepository>()));
  gh.factory<_i38.InformationPDoneSharePreferencesUsecase>(() =>
      _i38.InformationPDoneSharePreferencesUsecase(
          gh<_i20.SharedPreferences>()));
  gh.factory<_i39.MarshopAPI>(() => _i39.MarshopAPI(gh<_i26.Dio>()));
  gh.factory<_i40.MarshopRepository>(
      () => _i41.MarshopRepositoryImpl(gh<_i39.MarshopAPI>()));
  gh.factory<_i42.MarshopUsecase>(
      () => _i42.MarshopUsecase(gh<_i40.MarshopRepository>()));
  gh.factory<_i43.NotificationAPI>(() => _i43.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i44.NotificationRepository>(
      () => _i45.NotificationRepositoryImpl(gh<_i43.NotificationAPI>()));
  gh.factory<_i46.NotificationUsecase>(
      () => _i46.NotificationUsecase(gh<_i44.NotificationRepository>()));
  gh.lazySingleton<_i47.OpenWeatherApi>(
      () => _i47.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i48.OpenWeatherRepository>(
      () => _i49.OpenWeatherRepositoryImpl(gh<_i47.OpenWeatherApi>()));
  gh.factory<_i50.OpenWeatherUseCase>(
      () => _i50.OpenWeatherUseCase(gh<_i48.OpenWeatherRepository>()));
  gh.factory<_i51.PlaceInformationAPI>(
      () => _i51.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i52.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i20.SharedPreferences>(),
        gh<_i52.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i53.PlaceInformationRepository>(() =>
      _i54.PlaceInformationRepositoryImpl(gh<_i51.PlaceInformationAPI>()));
  gh.factory<_i55.PlaceInformationUsecase>(() =>
      _i55.PlaceInformationUsecase(gh<_i53.PlaceInformationRepository>()));
  gh.lazySingleton<_i56.ProtectorAPI>(() => _i56.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i57.ProtectorRepository>(
      () => _i58.ProtectorRepositoryImpl(gh<_i56.ProtectorAPI>()));
  gh.factory<_i59.ProtectorUseCase>(
      () => _i59.ProtectorUseCase(gh<_i57.ProtectorRepository>()));
  gh.factory<_i60.ResourceApi>(() => _i60.ResourceApi(gh<_i26.Dio>()));
  gh.factory<_i61.ResourceRepository>(
      () => _i62.ResourceRepositoryImpl(gh<_i60.ResourceApi>()));
  gh.factory<_i63.ResourceUsecase>(
      () => _i63.ResourceUsecase(gh<_i61.ResourceRepository>()));
  gh.singleton<_i64.StringeeBloc>(_i64.StringeeBloc(
    gh<_i21.StringeeService>(),
    gh<_i22.UserSharePreferencesUsecase>(),
  ));
  gh.factory<_i65.UpgradeAccountApi>(
      () => _i65.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i66.UpgradeAccountRepository>(
      () => _i67.UpgradeAccountRepositoryImpl(
            gh<_i65.UpgradeAccountApi>(),
            gh<_i60.ResourceApi>(),
          ));
  gh.factory<_i68.UpgradeAccountUsecase>(
      () => _i68.UpgradeAccountUsecase(gh<_i66.UpgradeAccountRepository>()));
  gh.factory<_i69.UserApi>(() => _i69.UserApi(gh<_i3.Dio>()));
  gh.factory<_i70.UserRepository>(
      () => _i71.AuthRepositoryImpl(gh<_i69.UserApi>()));
  gh.factory<_i72.UserUsecase>(() => _i72.UserUsecase(
        gh<_i70.UserRepository>(),
        gh<_i22.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i73.AllFriendsCubit>(
      () => _i73.AllFriendsCubit(gh<_i37.FriendUsecase>()));
  gh.factory<_i74.ApprovedRequestCubit>(
      () => _i74.ApprovedRequestCubit(gh<_i72.UserUsecase>()));
  gh.factory<_i75.AuthApi>(() => _i75.AuthApi(gh<_i26.Dio>()));
  gh.factory<_i76.AuthRepository>(
      () => _i77.AuthRepositoryImpl(gh<_i75.AuthApi>()));
  gh.factory<_i78.AuthenticationUsecase>(() => _i78.AuthenticationUsecase(
        gh<_i76.AuthRepository>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i70.UserRepository>(),
        gh<_i17.NotificationService>(),
        gh<_i10.ChatSocket>(),
      ));
  gh.factory<_i79.CallApi>(() => _i79.CallApi(gh<_i26.Dio>()));
  gh.factory<_i80.CallRepository>(
      () => _i81.CallRepositoryImpl(gh<_i79.CallApi>()));
  gh.factory<_i82.CallUseCase>(
      () => _i82.CallUseCase(gh<_i80.CallRepository>()));
  gh.factory<_i83.ChangePasswordController>(
      () => _i83.ChangePasswordController(gh<_i78.AuthenticationUsecase>()));
  gh.factory<_i84.ChatApi>(() => _i84.ChatApi(gh<_i26.Dio>()));
  gh.factory<_i85.ChatRepository>(
      () => _i86.ChatRepositoryImpl(gh<_i84.ChatApi>()));
  gh.factory<_i87.ChatUseCase>(() => _i87.ChatUseCase(
        gh<_i85.ChatRepository>(),
        gh<_i35.FriendRepository>(),
      ));
  gh.factory<_i88.CommunityApi>(() => _i88.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i89.CommunityRepository>(
      () => _i90.CommunityRepositoryImpl(gh<_i88.CommunityApi>()));
  gh.factory<_i91.CommunityUsecase>(
      () => _i91.CommunityUsecase(gh<_i89.CommunityRepository>()));
  gh.factory<_i92.ContractBlocCubit>(() => _i92.ContractBlocCubit(
        gh<_i63.ResourceUsecase>(),
        gh<_i72.UserUsecase>(),
      ));
  gh.singleton<_i93.ConversationCubit>(
      _i93.ConversationCubit(gh<_i87.ChatUseCase>()));
  gh.factory<_i94.CreateRoomCubit>(
      () => _i94.CreateRoomCubit(gh<_i87.ChatUseCase>()));
  gh.factory<_i95.DashBoardBgController>(() =>
      _i95.DashBoardBgController(gh<_i24.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i96.DashBoardScreenController>(() =>
      _i96.DashBoardScreenController(
          gh<_i24.DashboardSharePreferenceUseCase>()));
  gh.factory<_i97.DashboardCommunityBloc>(() =>
      _i97.DashboardCommunityBloc(gh<_i24.DashboardSharePreferenceUseCase>()));
  gh.factory<_i97.DashboardEcommerceBloc>(() =>
      _i97.DashboardEcommerceBloc(gh<_i24.DashboardSharePreferenceUseCase>()));
  gh.factory<_i97.DashboardPersonalBloc>(() =>
      _i97.DashboardPersonalBloc(gh<_i24.DashboardSharePreferenceUseCase>()));
  gh.factory<_i98.EmailVerifyController>(
      () => _i98.EmailVerifyController(gh<_i72.UserUsecase>()));
  gh.factory<_i99.GetDetailBlocParam1<_i100.GlobalSettingResponse, String>>(
      () => blocModule.getGlobalBloc(gh<_i63.ResourceUsecase>()));
  gh.factory<_i99.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i91.CommunityUsecase>()));
  gh.factory<_i101.MarshopCubit>(
      () => _i101.MarshopCubit(gh<_i42.MarshopUsecase>()));
  gh.singleton<_i102.MemberTabCubit>(_i102.MemberTabCubit(
    gh<_i87.ChatUseCase>(),
    gh<_i72.UserUsecase>(),
  ));
  gh.factory<_i103.NewMessageCubit>(
      () => _i103.NewMessageCubit(gh<_i87.ChatUseCase>()));
  gh.factory<_i104.NotificationBloc>(
      () => _i104.NotificationBloc(gh<_i46.NotificationUsecase>()));
  gh.factory<_i105.OpenWeatherBloc>(
      () => _i105.OpenWeatherBloc(gh<_i50.OpenWeatherUseCase>()));
  gh.factory<_i106.PhoneBookDetailCubit>(
      () => _i106.PhoneBookDetailCubit(gh<_i82.CallUseCase>()));
  gh.factory<_i107.TeamRequestCubit>(
      () => _i107.TeamRequestCubit(gh<_i91.CommunityUsecase>()));
  gh.factory<_i108.UserActionCubit>(
      () => _i108.UserActionCubit(gh<_i72.UserUsecase>()));
  gh.factory<_i109.UserBloc>(() => _i109.UserBloc(
        gh<_i78.AuthenticationUsecase>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i72.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i110.UserCubit>(() => _i110.UserCubit(
        gh<_i78.AuthenticationUsecase>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i72.UserUsecase>(),
      ));
  gh.factory<_i111.AddMemberCubit>(
      () => _i111.AddMemberCubit(gh<_i87.ChatUseCase>()));
  gh.factory<_i112.AdminTabCubit>(
      () => _i112.AdminTabCubit(gh<_i87.ChatUseCase>()));
  gh.factory<_i113.AppCubit>(() => _i113.AppCubit(
        gh<_i63.ResourceUsecase>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i78.AuthenticationUsecase>(),
      ));
  gh.singleton<_i114.AppSettingBloc>(
      _i114.AppSettingBloc(gh<_i78.AuthenticationUsecase>()));
  gh.factory<_i115.AuthCubit>(
      () => _i115.AuthCubit(gh<_i78.AuthenticationUsecase>()));
  gh.factory<_i116.CallHistoryCubit>(
      () => _i116.CallHistoryCubit(gh<_i82.CallUseCase>()));
  gh.singleton<_i117.ChatRoomCubit>(_i117.ChatRoomCubit(
    gh<_i87.ChatUseCase>(),
    gh<_i72.UserUsecase>(),
    gh<_i68.UpgradeAccountUsecase>(),
    gh<_i14.MediaPicker>(),
  ));
  await _i118.WalletPackageModule().init(gh);
  return getIt;
}

class _$DataSourceModule extends _i119.DataSourceModule {}

class _$ConfigModule extends _i120.ConfigModule {}

class _$PlaceModule extends _i52.PlaceModule {}

class _$BlocModule extends _i121.BlocModule {}

class _$DashBoardModule extends _i122.DashBoardModule {}
