import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/configuratons/configurations.dart';
import '../../../domain/entities/wallet/vnd_wallet_info/vnd_wallet_info.dart';
import '../../../domain/repository/wallet_repository.dart';
import '../../../domain/usecases/wallet_usecase.dart';
import '../../wallet_constant.dart';

part 'wallet_bloc.freezed.dart';

part 'wallet_event.dart';

part 'wallet_state.dart';

@singleton
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletUseCase _walletUseCase;
  final WalletRepository _walletRepository;
  late VndWalletInfo vndWalletInfo = const VndWalletInfo();

  WalletBloc(this._walletUseCase, this._walletRepository) : super(const _Initial()) {
    on<_ReloadVndWalletInfo>((event, emit) {
      emit(const WalletState.reloadVndWalletInfoSuccess());
    });
    on<_ReloadDiamondWalletInfo>((event, emit) {
      emit(const WalletState.reloadDiamondWalletInfoSuccess());
    });
    on<_GetVndWalletInfoEvent>((event, emit) async {
      try {
        emit(const _VndWalletInfoLoading());
        vndWalletInfo = await _walletUseCase.getVndWalletInfo();
        WalletInjectedData.setVndWalletInfo = vndWalletInfo;
        emit(_VndWalletInfoLoaded(vndWalletInfo));
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';
        final String code = (e.response?.data?['code'] ?? '') as String;
        if (code.contains('NOT_JA')) {
          emit(const _NeedToRegisterJA(walletType: WalletType.coinVnd));
          return;
        }
        emit(const _Error(errorMessage));
      }
    });
    on<_GetDiamondWalletInfo>((event, emit) async {
      try {
        emit(const _GetDiamondWalletInfoLoading());
        final diamondWalletInfo = await _walletUseCase.getDiamondWalletInfo();
        WalletInjectedData.setDiamondWalletInfo = diamondWalletInfo;
        emit(const _GetDiamondWalletInfoLoaded());
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';
        final String code = (e.response?.data?['code'] ?? '') as String;
        if (code.contains('NOT_JA')) {
          emit(const _NeedToRegisterJA(walletType: WalletType.diamond));
          return;
        }
        emit(const _Error(errorMessage));
      }
    });
    on<_GetCoinWalletInfo>((event, emit) async {
      try {
        emit(const _GetCoinWalletInfoLoading());
        final coinWalletInfo = await _walletUseCase.getCoinWalletInfo();
        WalletInjectedData.setCoinWalletInfo = coinWalletInfo;
        emit(const _GetCoinWalletInfoLoaded());
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';
        final String code = (e.response?.data?['code'] ?? '') as String;
        if (code.contains('NOT_JA')) {
          emit(const _NeedToRegisterJA(walletType: WalletType.coin));
          return;
        }
        emit(const _Error(errorMessage));
      }
    });

    on<_GetWalletInfoEvent>((event, emit) async {
      try {
        emit(const _GetWalletInfoLoading());
        await _walletRepository.getWalletInfo();
        emit(const _GetWalletInfoSuccess());
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';

        emit(const _Error(errorMessage));
      }
    });
  }
}
