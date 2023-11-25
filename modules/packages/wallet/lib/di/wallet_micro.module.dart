//@GeneratedMicroModule;WalletPackageModule;package:wallet/di/wallet_micro.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i7;
import 'package:wallet/core/core.dart' as _i6;
import 'package:wallet/data/data.dart' as _i23;
import 'package:wallet/data/datasources/remote/diamond_wallet_api.dart' as _i9;
import 'package:wallet/data/datasources/remote/point_wallet_api.dart' as _i10;
import 'package:wallet/data/datasources/remote/remote.dart' as _i15;
import 'package:wallet/data/datasources/remote/vnd_wallet_api.dart' as _i11;
import 'package:wallet/data/datasources/remote/wallet_api.dart' as _i12;
import 'package:wallet/data/repository/wallet_diamond_repository.impl.dart'
    as _i14;
import 'package:wallet/data/repository/wallet_point_repository.impl.dart'
    as _i18;
import 'package:wallet/data/repository/wallet_repository.impl.dart' as _i21;
import 'package:wallet/data/repository/wallet_vnd_repository.impl.dart' as _i22;
import 'package:wallet/domain/domain.dart' as _i13;
import 'package:wallet/domain/repository/wallet_diamond_repository.dart'
    as _i17;
import 'package:wallet/domain/repository/wallet_point_repository.dart' as _i28;
import 'package:wallet/domain/repository/wallet_repository.dart' as _i20;
import 'package:wallet/domain/repository/wallet_vnd_repository.dart' as _i25;
import 'package:wallet/domain/usecases/wallet_diamond_usecase.dart' as _i16;
import 'package:wallet/domain/usecases/wallet_point_usecase.dart' as _i19;
import 'package:wallet/domain/usecases/wallet_usecase.dart' as _i27;
import 'package:wallet/domain/usecases/wallet_vnd_usecase.dart' as _i24;
import 'package:wallet/presentation/shared/bloc/wallet_bloc.dart' as _i26;
import 'package:wallet/presentation/wallet_diamond/wallet_diamond_routes.dart'
    as _i4;
import 'package:wallet/presentation/wallet_module.dart' as _i29;
import 'package:wallet/presentation/wallet_point/wallet_point_routes.dart'
    as _i5;
import 'package:wallet/presentation/wallet_routes.dart' as _i3;
import 'package:wallet/presentation/wallet_vnd/wallet_vnd_routes.dart' as _i8;

class WalletPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final walletModule = _$WalletModule();
    gh.factory<_i3.AppWalletRoutes>(() => _i3.AppWalletRoutes());
    gh.factory<_i4.WalletDiamondRoutes>(() => _i4.WalletDiamondRoutes());
    gh.factory<_i5.WalletPointRoutes>(() => _i5.WalletPointRoutes());
    gh.factory<_i6.WalletProvider>(() => walletModule.walletProviderProd(
          gh<_i7.SharedPreferences>(),
          gh<_i6.WalletConfigurations>(),
        ));
    gh.factory<_i3.WalletRoutes>(() => _i3.WalletRoutes());
    gh.factory<_i8.WalletVndRoutes>(() => _i8.WalletVndRoutes());
    gh.factory<_i9.DiamondWalletApi>(
        () => _i9.DiamondWalletApi(gh<_i6.WalletProvider>()));
    gh.factory<_i10.PointWalletApi>(
        () => _i10.PointWalletApi(gh<_i6.WalletProvider>()));
    gh.factory<_i11.VndWalletApi>(
        () => _i11.VndWalletApi(gh<_i6.WalletProvider>()));
    gh.factory<_i12.WalletApi>(() => _i12.WalletApi(gh<_i6.WalletProvider>()));
    gh.factory<_i13.WalletDiamondRepository>(
        () => _i14.WalletDiamondRepositoryImpl(gh<_i15.DiamondWalletApi>()));
    gh.factory<_i16.WalletDiamondUseCase>(
        () => _i16.WalletDiamondUseCase(gh<_i17.WalletDiamondRepository>()));
    gh.factory<_i13.WalletPointRepository>(
        () => _i18.WalletPointRepositoryImpl(gh<_i15.PointWalletApi>()));
    gh.factory<_i19.WalletPointUseCase>(
        () => _i19.WalletPointUseCase(gh<_i13.WalletPointRepository>()));
    gh.factory<_i20.WalletRepository>(
        () => _i21.WalletRepositoryImpl(gh<_i12.WalletApi>()));
    gh.factory<_i13.WalletVndRepository>(
        () => _i22.WalletVndRepositoryImpl(gh<_i23.VndWalletApi>()));
    gh.factory<_i24.WalletVndUseCase>(
        () => _i24.WalletVndUseCase(gh<_i25.WalletVndRepository>()));
    gh.singleton<_i26.WalletBloc>(_i26.WalletBloc(gh<_i20.WalletRepository>()));
    gh.factory<_i27.WalletUseCase>(() => _i27.WalletUseCase(
          gh<_i25.WalletVndRepository>(),
          gh<_i17.WalletDiamondRepository>(),
          gh<_i28.WalletPointRepository>(),
        ));
  }
}

class _$WalletModule extends _i29.WalletModule {}
