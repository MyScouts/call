//@GeneratedMicroModule;AppCorePackageModule;package:app_core/src/dependency_injection/appcore_micro.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:app_core/src/core/services/logger_service.dart' as _i4;
import 'package:app_core/src/domain/usecase/user_share_preferences_usecase.dart'
    as _i5;
import 'package:app_core/src/presentation/user_information_bloc.dart' as _i7;
import 'package:injectable/injectable.dart' as _i1;
import 'package:mobilehub_core/mobilehub_core.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

class AppCorePackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    await _i3.MobilehubCorePackageModule().init(gh);
    gh.factory<_i4.LoggerService>(() => _i4.LoggerService());
    gh.factory<_i5.UserInfoSharePreferencesUsecase>(
        () => _i5.UserInfoSharePreferencesUsecase(gh<_i6.SharedPreferences>()));
    gh.singleton<_i7.UserInformationCubit>(_i7.UserInformationCubit());
  }
}
