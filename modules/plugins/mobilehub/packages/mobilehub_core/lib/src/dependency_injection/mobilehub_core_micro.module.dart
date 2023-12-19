//@GeneratedMicroModule;MobilehubCorePackageModule;package:mobilehub_core/src/dependency_injection/mobilehub_core_micro.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;
import 'package:mobilehub_core/src/services/device_service.dart' as _i3;
import 'package:mobilehub_core/src/services/storage_service.dart' as _i4;

class MobilehubCorePackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.DeviceService>(() => _i3.DeviceService());
    gh.factory<_i4.StorageService>(() => _i4.StorageServiceImpl());
  }
}
