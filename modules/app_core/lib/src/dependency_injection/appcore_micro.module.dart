//@GeneratedMicroModule;AppCorePackageModule;package:app_core/src/dependency_injection/appcore_micro.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:app_core/src/core/services/logger_service.dart' as _i6;
import 'package:app_core/src/domain/usecase/gift_share_preferences_usecase.dart'
    as _i4;
import 'package:app_core/src/domain/usecase/user_share_preferences_usecase.dart'
    as _i7;
import 'package:app_core/src/presentation/user_information_bloc.dart' as _i8;
import 'package:injectable/injectable.dart' as _i1;
import 'package:mobilehub_core/mobilehub_core.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

class AppCorePackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    await _i3.MobilehubCorePackageModule().init(gh);
    gh.factory<_i4.GiftSharePreferencesUseCase>(
        () => _i4.GiftSharePreferencesUseCase(gh<_i5.SharedPreferences>()));
    gh.factory<_i6.LoggerService>(() => _i6.LoggerService());
    gh.factory<_i7.UserInfoSharePreferencesUsecase>(
        () => _i7.UserInfoSharePreferencesUsecase(gh<_i5.SharedPreferences>()));
    gh.singleton<_i8.UserInformationCubit>(_i8.UserInformationCubit());
  }
}
