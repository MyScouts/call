// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_core/app_core.dart' as _i3;
import 'package:dio/dio.dart' as _i25;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobilehub_bloc/mobilehub_bloc.dart' as _i98;
import 'package:shared_preferences/shared_preferences.dart' as _i20;

import '../app_delegate.dart' as _i4;
import '../blocs/app/app_cubit.dart' as _i112;
import '../blocs/approved_request/approved_request_cubit.dart' as _i73;
import '../blocs/auth/auth_cubit.dart' as _i114;
import '../blocs/bloc.dart' as _i118;
import '../blocs/community/team_request/team_request_cubit.dart' as _i106;
import '../blocs/marshop/marshop_cubit.dart' as _i100;
import '../blocs/user/user_cubit.dart' as _i109;
import '../blocs/user_action/user_action_cubit.dart' as _i107;
import '../core/services/notifications/notification_service.dart' as _i17;
import '../core/services/stringee/stringee_service.dart' as _i21;
import '../core/socket/chat_socket.dart' as _i10;
import '../data/data_sources/local/information_pdone_profile/information_pdone_profile_local.dart'
    as _i37;
import '../data/data_sources/remote/auth_api.dart' as _i74;
import '../data/data_sources/remote/call_api.dart' as _i78;
import '../data/data_sources/remote/chat_api.dart' as _i83;
import '../data/data_sources/remote/community_api.dart' as _i87;
import '../data/data_sources/remote/ecom_api.dart' as _i24;
import '../data/data_sources/remote/following_api.dart' as _i29;
import '../data/data_sources/remote/friend_api.dart' as _i33;
import '../data/data_sources/remote/marshop_api.dart' as _i38;
import '../data/data_sources/remote/notification_api.dart' as _i42;
import '../data/data_sources/remote/open_weather_api.dart' as _i46;
import '../data/data_sources/remote/place_information_api.dart' as _i50;
import '../data/data_sources/remote/place_information_provider.dart' as _i51;
import '../data/data_sources/remote/protector_api.dart' as _i55;
import '../data/data_sources/remote/resource_api.dart' as _i59;
import '../data/data_sources/remote/upgrade_account_api.dart' as _i64;
import '../data/data_sources/remote/user_api.dart' as _i68;
import '../data/models/responses/resource_response.dart' as _i99;
import '../data/repositories/auth_repository.dart' as _i75;
import '../data/repositories/ecom_repository.dart' as _i26;
import '../data/repositories/following_repository.dart' as _i30;
import '../data/repositories/impl/auth_repository_impl.dart' as _i76;
import '../data/repositories/impl/call_repository_impl.dart' as _i80;
import '../data/repositories/impl/chat_repository_impl.dart' as _i85;
import '../data/repositories/impl/community_repository.impl.dart' as _i89;
import '../data/repositories/impl/ecom_repository_impl.dart' as _i27;
import '../data/repositories/impl/following_repository_impl.dart' as _i31;
import '../data/repositories/impl/friend_repository_impl.dart' as _i35;
import '../data/repositories/impl/marshop_repository_impl.dart' as _i40;
import '../data/repositories/impl/media_picker_impl.dart' as _i15;
import '../data/repositories/impl/notification_repository.impl.dart' as _i44;
import '../data/repositories/impl/open_weather_repository_impl.dart' as _i48;
import '../data/repositories/impl/place_information_repository.impl.dart'
    as _i53;
import '../data/repositories/impl/protector_repository_impl.dart' as _i57;
import '../data/repositories/impl/resource_repository.impl.dart' as _i61;
import '../data/repositories/impl/upgrade_account_repository.impl.dart' as _i66;
import '../data/repositories/impl/user_repository_impl.dart' as _i70;
import '../data/repositories/marshop_repository.dart' as _i39;
import '../data/repositories/media_picker.dart' as _i14;
import '../data/repositories/notification_repository.dart' as _i43;
import '../data/repositories/protector_repository.dart' as _i56;
import '../data/repositories/user_repository.dart' as _i69;
import '../domain/repository/call_repository.dart' as _i79;
import '../domain/repository/chat_repository.dart' as _i84;
import '../domain/repository/community_repository.dart' as _i88;
import '../domain/repository/friend_repository.dart' as _i34;
import '../domain/repository/open_weather_repository.dart' as _i47;
import '../domain/repository/place_information_repository.dart' as _i52;
import '../domain/repository/resource_repository.dart' as _i60;
import '../domain/repository/upgrade_account_repository.dart' as _i65;
import '../domain/usecases/authentication_usecase.dart' as _i77;
import '../domain/usecases/call_usecase.dart' as _i81;
import '../domain/usecases/chat_usecase.dart' as _i86;
import '../domain/usecases/community_usecase.dart' as _i90;
import '../domain/usecases/dashboard_share_preferences_usecase.dart' as _i23;
import '../domain/usecases/ecom_usecase.dart' as _i28;
import '../domain/usecases/following_usecase.dart' as _i32;
import '../domain/usecases/friend_usecase.dart' as _i36;
import '../domain/usecases/marshop_usecase.dart' as _i41;
import '../domain/usecases/notification_usecase.dart' as _i45;
import '../domain/usecases/open_weather_usecase.dart' as _i49;
import '../domain/usecases/place_information_usecase.dart' as _i54;
import '../domain/usecases/protector_usecase.dart' as _i58;
import '../domain/usecases/resource_usecase.dart' as _i62;
import '../domain/usecases/upgrade_account_usecase.dart' as _i67;
import '../domain/usecases/user_share_preferences_usecase.dart' as _i22;
import '../domain/usecases/user_usecase.dart' as _i71;
import '../presentation/authentication/authentication_routes.dart' as _i5;
import '../presentation/call/call_routes.dart' as _i8;
import '../presentation/call/phone_book/tabs/all_friends/cubit/all_friends_cubit.dart'
    as _i72;
import '../presentation/call/phone_book/tabs/call_history/cubit/call_history_cubit.dart'
    as _i115;
import '../presentation/call/phone_book_detail/cubit/phone_book_detail_cubit.dart'
    as _i105;
import '../presentation/call/service/call_service.dart' as _i6;
import '../presentation/call/service/models/call_service_models.dart' as _i7;
import '../presentation/call/stringee_bloc/stringee_bloc.dart' as _i63;
import '../presentation/chat/add_member/cubit/add_member_cubit.dart' as _i110;
import '../presentation/chat/chat_room/cubit/chat_room_cubit.dart' as _i116;
import '../presentation/chat/chat_routes.dart' as _i9;
import '../presentation/chat/conversation/cubit/conversation_cubit.dart'
    as _i92;
import '../presentation/chat/create_room/cubit/create_room_cubit.dart' as _i93;
import '../presentation/chat/member/tab/admin/cubit/admin_tab_cubit.dart'
    as _i111;
import '../presentation/chat/member/tab/member/cubit/member_tab_cubit.dart'
    as _i101;
import '../presentation/chat/new_message/cubit/new_message_cubit.dart' as _i102;
import '../presentation/dashboard/dashboard/dashboard_screen.dart' as _i95;
import '../presentation/dashboard/dashboard/state/dashboard_base_bloc.dart'
    as _i96;
import '../presentation/dashboard/dashboard/state/open_weather_bloc.dart'
    as _i104;
import '../presentation/dashboard/dashboard/widget/dashboard_background_builder.dart'
    as _i94;
import '../presentation/dashboard/dashboard_module.dart' as _i119;
import '../presentation/dashboard/dashboard_routes.dart' as _i11;
import '../presentation/dashboard/system_setting/change_password_screen.dart'
    as _i82;
import '../presentation/general_setting/contracts/bloc/contract_bloc_cubit.dart'
    as _i91;
import '../presentation/general_setting/general_routes.dart' as _i13;
import '../presentation/notification/deeplink/bloc/deeplink_bloc.dart' as _i12;
import '../presentation/notification/notification_routes.dart' as _i16;
import '../presentation/notification/state/notification_bloc.dart' as _i103;
import '../presentation/otp_verify/email_otp_verify.dart' as _i97;
import '../presentation/routes.dart' as _i18;
import '../presentation/settings/setting_routes.dart' as _i19;
import '../presentation/shared/app_setting/bloc/app_setting_bloc.dart' as _i113;
import '../presentation/shared/user/bloc/user_bloc.dart' as _i108;
import 'modules/data_source_module.dart' as _i117;

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
  gh.factory<_i23.DashboardSharePreferenceUseCase>(
      () => _i23.DashboardSharePreferenceUseCase(gh<_i20.SharedPreferences>()));
  gh.factory<_i3.Dio>(
    () => dataSourceModule.dioProd(gh<_i20.SharedPreferences>()),
    registerFor: {_prod},
  );
  gh.factory<_i24.EcomAPI>(() => _i24.EcomAPI(gh<_i25.Dio>()));
  gh.factory<_i26.EcomRepository>(
      () => _i27.EcomRepositoryImpl(gh<_i24.EcomAPI>()));
  gh.factory<_i28.EcomUsecase>(
      () => _i28.EcomUsecase(gh<_i26.EcomRepository>()));
  gh.factory<_i29.FollowingAPI>(() => _i29.FollowingAPI(gh<_i3.Dio>()));
  gh.factory<_i30.FollowingRepository>(
      () => _i31.FollowingRepositoryImpl(gh<_i29.FollowingAPI>()));
  gh.factory<_i32.FollowingUsecase>(
      () => _i32.FollowingUsecase(gh<_i30.FollowingRepository>()));
  gh.factory<_i33.FriendApi>(() => _i33.FriendApi(gh<_i25.Dio>()));
  gh.factory<_i34.FriendRepository>(
      () => _i35.FriendRepositoryImpl(gh<_i33.FriendApi>()));
  gh.factory<_i36.FriendUsecase>(
      () => _i36.FriendUsecase(gh<_i34.FriendRepository>()));
  gh.factory<_i37.InformationPDoneSharePreferencesUsecase>(() =>
      _i37.InformationPDoneSharePreferencesUsecase(
          gh<_i20.SharedPreferences>()));
  gh.factory<_i38.MarshopAPI>(() => _i38.MarshopAPI(gh<_i25.Dio>()));
  gh.factory<_i39.MarshopRepository>(
      () => _i40.MarshopRepositoryImpl(gh<_i38.MarshopAPI>()));
  gh.factory<_i41.MarshopUsecase>(
      () => _i41.MarshopUsecase(gh<_i39.MarshopRepository>()));
  gh.factory<_i42.NotificationAPI>(() => _i42.NotificationAPI(gh<_i3.Dio>()));
  gh.factory<_i43.NotificationRepository>(
      () => _i44.NotificationRepositoryImpl(gh<_i42.NotificationAPI>()));
  gh.factory<_i45.NotificationUsecase>(
      () => _i45.NotificationUsecase(gh<_i43.NotificationRepository>()));
  gh.lazySingleton<_i46.OpenWeatherApi>(
      () => _i46.OpenWeatherApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i47.OpenWeatherRepository>(
      () => _i48.OpenWeatherRepositoryImpl(gh<_i46.OpenWeatherApi>()));
  gh.factory<_i49.OpenWeatherUseCase>(
      () => _i49.OpenWeatherUseCase(gh<_i47.OpenWeatherRepository>()));
  gh.factory<_i50.PlaceInformationAPI>(
      () => _i50.PlaceInformationAPI(gh<_i3.Dio>()));
  gh.factory<_i51.PlaceInformationProvider>(() => placeModule.placeProviderProd(
        gh<_i20.SharedPreferences>(),
        gh<_i51.PlaceInformationConfigurations>(),
      ));
  gh.factory<_i52.PlaceInformationRepository>(() =>
      _i53.PlaceInformationRepositoryImpl(gh<_i50.PlaceInformationAPI>()));
  gh.factory<_i54.PlaceInformationUsecase>(() =>
      _i54.PlaceInformationUsecase(gh<_i52.PlaceInformationRepository>()));
  gh.lazySingleton<_i55.ProtectorAPI>(() => _i55.ProtectorAPI(gh<_i3.Dio>()));
  gh.lazySingleton<_i56.ProtectorRepository>(
      () => _i57.ProtectorRepositoryImpl(gh<_i55.ProtectorAPI>()));
  gh.factory<_i58.ProtectorUseCase>(
      () => _i58.ProtectorUseCase(gh<_i56.ProtectorRepository>()));
  gh.factory<_i59.ResourceApi>(() => _i59.ResourceApi(gh<_i25.Dio>()));
  gh.factory<_i60.ResourceRepository>(
      () => _i61.ResourceRepositoryImpl(gh<_i59.ResourceApi>()));
  gh.factory<_i62.ResourceUsecase>(
      () => _i62.ResourceUsecase(gh<_i60.ResourceRepository>()));
  gh.singleton<_i63.StringeeBloc>(_i63.StringeeBloc(
    gh<_i21.StringeeService>(),
    gh<_i22.UserSharePreferencesUsecase>(),
  ));
  gh.factory<_i64.UpgradeAccountApi>(
      () => _i64.UpgradeAccountApi(gh<_i3.Dio>()));
  gh.factory<_i65.UpgradeAccountRepository>(
      () => _i66.UpgradeAccountRepositoryImpl(
            gh<_i64.UpgradeAccountApi>(),
            gh<_i59.ResourceApi>(),
          ));
  gh.factory<_i67.UpgradeAccountUsecase>(
      () => _i67.UpgradeAccountUsecase(gh<_i65.UpgradeAccountRepository>()));
  gh.factory<_i68.UserApi>(() => _i68.UserApi(gh<_i3.Dio>()));
  gh.factory<_i69.UserRepository>(
      () => _i70.AuthRepositoryImpl(gh<_i68.UserApi>()));
  gh.factory<_i71.UserUsecase>(() => _i71.UserUsecase(
        gh<_i69.UserRepository>(),
        gh<_i22.UserSharePreferencesUsecase>(),
      ));
  gh.factory<_i72.AllFriendsCubit>(
      () => _i72.AllFriendsCubit(gh<_i36.FriendUsecase>()));
  gh.factory<_i73.ApprovedRequestCubit>(
      () => _i73.ApprovedRequestCubit(gh<_i71.UserUsecase>()));
  gh.factory<_i74.AuthApi>(() => _i74.AuthApi(gh<_i25.Dio>()));
  gh.factory<_i75.AuthRepository>(
      () => _i76.AuthRepositoryImpl(gh<_i74.AuthApi>()));
  gh.factory<_i77.AuthenticationUsecase>(() => _i77.AuthenticationUsecase(
        gh<_i75.AuthRepository>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i69.UserRepository>(),
        gh<_i17.NotificationService>(),
        gh<_i10.ChatSocket>(),
      ));
  gh.factory<_i78.CallApi>(() => _i78.CallApi(gh<_i25.Dio>()));
  gh.factory<_i79.CallRepository>(
      () => _i80.CallRepositoryImpl(gh<_i78.CallApi>()));
  gh.factory<_i81.CallUseCase>(
      () => _i81.CallUseCase(gh<_i79.CallRepository>()));
  gh.factory<_i82.ChangePasswordController>(
      () => _i82.ChangePasswordController(gh<_i77.AuthenticationUsecase>()));
  gh.factory<_i83.ChatApi>(() => _i83.ChatApi(gh<_i25.Dio>()));
  gh.factory<_i84.ChatRepository>(
      () => _i85.ChatRepositoryImpl(gh<_i83.ChatApi>()));
  gh.factory<_i86.ChatUseCase>(() => _i86.ChatUseCase(
        gh<_i84.ChatRepository>(),
        gh<_i34.FriendRepository>(),
      ));
  gh.factory<_i87.CommunityApi>(() => _i87.CommunityApi(gh<_i3.Dio>()));
  gh.factory<_i88.CommunityRepository>(
      () => _i89.CommunityRepositoryImpl(gh<_i87.CommunityApi>()));
  gh.factory<_i90.CommunityUsecase>(
      () => _i90.CommunityUsecase(gh<_i88.CommunityRepository>()));
  gh.factory<_i91.ContractBlocCubit>(() => _i91.ContractBlocCubit(
        gh<_i62.ResourceUsecase>(),
        gh<_i71.UserUsecase>(),
      ));
  gh.singleton<_i92.ConversationCubit>(
      _i92.ConversationCubit(gh<_i86.ChatUseCase>()));
  gh.factory<_i93.CreateRoomCubit>(
      () => _i93.CreateRoomCubit(gh<_i86.ChatUseCase>()));
  gh.factory<_i94.DashBoardBgController>(() =>
      _i94.DashBoardBgController(gh<_i23.DashboardSharePreferenceUseCase>()));
  gh.lazySingleton<_i95.DashBoardScreenController>(() =>
      _i95.DashBoardScreenController(
          gh<_i23.DashboardSharePreferenceUseCase>()));
  gh.factory<_i96.DashboardCommunityBloc>(() =>
      _i96.DashboardCommunityBloc(gh<_i23.DashboardSharePreferenceUseCase>()));
  gh.factory<_i96.DashboardEcommerceBloc>(() =>
      _i96.DashboardEcommerceBloc(gh<_i23.DashboardSharePreferenceUseCase>()));
  gh.factory<_i96.DashboardPersonalBloc>(() =>
      _i96.DashboardPersonalBloc(gh<_i23.DashboardSharePreferenceUseCase>()));
  gh.factory<_i97.EmailVerifyController>(
      () => _i97.EmailVerifyController(gh<_i71.UserUsecase>()));
  gh.factory<_i98.GetDetailBlocParam1<_i99.GlobalSettingResponse, String>>(
      () => blocModule.getGlobalBloc(gh<_i62.ResourceUsecase>()));
  gh.factory<_i98.GetListBloc<_i3.Team>>(
      () => dashBoardModule.getMyTeams(gh<_i90.CommunityUsecase>()));
  gh.factory<_i100.MarshopCubit>(
      () => _i100.MarshopCubit(gh<_i41.MarshopUsecase>()));
  gh.singleton<_i101.MemberTabCubit>(_i101.MemberTabCubit(
    gh<_i86.ChatUseCase>(),
    gh<_i71.UserUsecase>(),
  ));
  gh.factory<_i102.NewMessageCubit>(
      () => _i102.NewMessageCubit(gh<_i86.ChatUseCase>()));
  gh.factory<_i103.NotificationBloc>(
      () => _i103.NotificationBloc(gh<_i45.NotificationUsecase>()));
  gh.factory<_i104.OpenWeatherBloc>(
      () => _i104.OpenWeatherBloc(gh<_i49.OpenWeatherUseCase>()));
  gh.factory<_i105.PhoneBookDetailCubit>(
      () => _i105.PhoneBookDetailCubit(gh<_i81.CallUseCase>()));
  gh.factory<_i106.TeamRequestCubit>(
      () => _i106.TeamRequestCubit(gh<_i90.CommunityUsecase>()));
  gh.factory<_i107.UserActionCubit>(
      () => _i107.UserActionCubit(gh<_i71.UserUsecase>()));
  gh.factory<_i108.UserBloc>(() => _i108.UserBloc(
        gh<_i77.AuthenticationUsecase>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i71.UserUsecase>(),
        gh<_i3.UserInformationCubit>(),
      ));
  gh.factory<_i109.UserCubit>(() => _i109.UserCubit(
        gh<_i77.AuthenticationUsecase>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i71.UserUsecase>(),
      ));
  gh.factory<_i110.AddMemberCubit>(
      () => _i110.AddMemberCubit(gh<_i86.ChatUseCase>()));
  gh.factory<_i111.AdminTabCubit>(
      () => _i111.AdminTabCubit(gh<_i86.ChatUseCase>()));
  gh.factory<_i112.AppCubit>(() => _i112.AppCubit(
        gh<_i62.ResourceUsecase>(),
        gh<_i22.UserSharePreferencesUsecase>(),
        gh<_i77.AuthenticationUsecase>(),
      ));
  gh.singleton<_i113.AppSettingBloc>(
      _i113.AppSettingBloc(gh<_i77.AuthenticationUsecase>()));
  gh.factory<_i114.AuthCubit>(
      () => _i114.AuthCubit(gh<_i77.AuthenticationUsecase>()));
  gh.factory<_i115.CallHistoryCubit>(
      () => _i115.CallHistoryCubit(gh<_i81.CallUseCase>()));
  gh.singleton<_i116.ChatRoomCubit>(_i116.ChatRoomCubit(
    gh<_i86.ChatUseCase>(),
    gh<_i71.UserUsecase>(),
    gh<_i67.UpgradeAccountUsecase>(),
    gh<_i14.MediaPicker>(),
  ));
  return getIt;
}

class _$DataSourceModule extends _i117.DataSourceModule {}

class _$PlaceModule extends _i51.PlaceModule {}

class _$BlocModule extends _i118.BlocModule {}

class _$DashBoardModule extends _i119.DashBoardModule {}
