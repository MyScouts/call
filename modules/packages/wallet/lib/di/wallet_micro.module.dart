//@GeneratedMicroModule;WalletPackageModule;package:wallet/di/wallet_micro.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i7;
import 'package:wallet/core/core.dart' as _i6;
import 'package:wallet/data/data.dart' as _i20;
import 'package:wallet/data/datasources/remote/diamond_wallet_api.dart' as _i9;
import 'package:wallet/data/datasources/remote/point_wallet_api.dart' as _i10;
import 'package:wallet/data/datasources/remote/remote.dart' as _i14;
import 'package:wallet/data/datasources/remote/vnd_wallet_api.dart' as _i11;
import 'package:wallet/data/repository/wallet_diamond_repository.impl.dart'
    as _i13;
import 'package:wallet/data/repository/wallet_point_repository.impl.dart'
    as _i17;
import 'package:wallet/data/repository/wallet_vnd_repository.impl.dart' as _i19;
import 'package:wallet/domain/domain.dart' as _i12;
import 'package:wallet/domain/repository/wallet_diamond_repository.dart'
    as _i16;
import 'package:wallet/domain/repository/wallet_point_repository.dart' as _i24;
import 'package:wallet/domain/repository/wallet_vnd_repository.dart' as _i22;
import 'package:wallet/domain/usecases/wallet_diamond_usecase.dart' as _i15;
import 'package:wallet/domain/usecases/wallet_point_usecase.dart' as _i18;
import 'package:wallet/domain/usecases/wallet_usecase.dart' as _i23;
import 'package:wallet/domain/usecases/wallet_vnd_usecase.dart' as _i21;
import 'package:wallet/presentation/shared/bloc/wallet_bloc.dart' as _i25;
import 'package:wallet/presentation/wallet_diamond/wallet_diamond_routes.dart'
    as _i4;
import 'package:wallet/presentation/wallet_module.dart' as _i26;
import 'package:wallet/presentation/wallet_point/wallet_point_routes.dart'
    as _i5;
import 'package:wallet/presentation/wallet_routes.dart' as _i3;
import 'package:wallet/presentation/wallet_vnd/wallet_vnd_routes.dart' as _i8;
import '../presentation/wallet_diamond/bloc/wallet_diamond_bloc.dart' as _i26;

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
    gh.factory<_i12.WalletDiamondRepository>(
        () => _i13.WalletDiamondRepositoryImpl(gh<_i14.DiamondWalletApi>()));
    gh.factory<_i15.WalletDiamondUseCase>(
        () => _i15.WalletDiamondUseCase(gh<_i16.WalletDiamondRepository>()));
    gh.factory<_i12.WalletPointRepository>(
        () => _i17.WalletPointRepositoryImpl(gh<_i14.PointWalletApi>()));
    gh.factory<_i18.WalletPointUseCase>(
        () => _i18.WalletPointUseCase(gh<_i12.WalletPointRepository>()));
    gh.factory<_i12.WalletVndRepository>(
        () => _i19.WalletVndRepositoryImpl(gh<_i20.VndWalletApi>()));
    gh.factory<_i21.WalletVndUseCase>(
        () => _i21.WalletVndUseCase(gh<_i22.WalletVndRepository>()));
    gh.factory<_i23.WalletUseCase>(() => _i23.WalletUseCase(
          gh<_i22.WalletVndRepository>(),
          gh<_i16.WalletDiamondRepository>(),
          gh<_i24.WalletPointRepository>(),
        ));
    gh.singleton<_i25.WalletBloc>(_i25.WalletBloc(gh<_i23.WalletUseCase>()));
    gh.factory<_i26.WalletDiamondBloc>(
        () => _i26.WalletDiamondBloc(gh<_i15.WalletDiamondUseCase>()));
  }
}

class _$WalletModule extends _i26.WalletModule {}