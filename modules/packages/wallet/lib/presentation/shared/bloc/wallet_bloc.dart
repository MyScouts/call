import 'package:app_core/app_core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wallet/core/configuratons/configurations.dart';
import 'package:wallet/data/datasources/models/response/wallet_info_response.dart';

import '../../../domain/entities/wallet/vnd_wallet_info/vnd_wallet_info.dart';
import '../../../domain/repository/wallet_repository.dart';
import '../../wallet_constant.dart';

part 'wallet_bloc.freezed.dart';

part 'wallet_event.dart';

part 'wallet_state.dart';

@singleton
class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository _walletRepository;
  late VndWalletInfo vndWalletInfo = const VndWalletInfo();

  WalletBloc(this._walletRepository) : super(const _Initial()) {
    on<_GetWalletInfoEvent>((event, emit) async {
      try {
        emit(const _GetWalletInfoLoading());
        final wallet = await _walletRepository.getWalletInfo();
        if (wallet != null) {
          WalletInjectedData.setUserWallet = wallet;
        }
        emit(_GetWalletInfoSuccess(wallet: wallet));
      } on DioException catch (e) {
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errorMessage));
      } catch (e) {
        debugPrint(e.toString());
        const errorMessage = 'Đã xảy ra lỗi';
        emit(const _Error(errorMessage));
      }
    });
  }
}
