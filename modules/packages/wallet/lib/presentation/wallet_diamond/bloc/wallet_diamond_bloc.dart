import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';
import '../screens/screens.dart';
import '../wallet_diamond_screen.dart';

part 'wallet_diamond_event.dart';
part 'wallet_diamond_state.dart';

class WalletDiamondNestedRoute {
  WalletDiamondNestedRoute._();

  static const root = '/';
  static const chargeDiamondToVnd = '/charge_diamond_to_vnd';

  static final navigatorKey = GlobalKey<NavigatorState>();

  static CupertinoPageRoute generateMainRoute(RouteSettings settings,
      {bool isPIP = false}) {
    final routes = <String, WidgetBuilder>{
      //handle close popup register ja in PIP Live
      root: (_) => WalletDiamondDefaultScreen(isPIP: isPIP),
      chargeDiamondToVnd: (_) => const ChargeDiamondToVndScreen(),
    };

    final routeBuilder = routes[settings.name];

    return CupertinoPageRoute(
      builder: routeBuilder!,
      settings: RouteSettings(name: settings.name),
    );
  }
}

class WalletDiamondBloc extends Bloc<WalletDiamondEvent, WalletDiamondState> {
  final WalletDiamondUseCase _walletDiamondUseCase;

  WalletDiamondBloc(this._walletDiamondUseCase)
      : super(WalletDiamondInitial()) {
    on<NavigateToTransactionHistoryScreen>(
        _onNavigateToTransactionHistoryScreen);
    on<LoadWalletDiamondInfo>(_onLoadWalletDiamondInfo);
    on<UpdateExchangeDiamondVND>(_onUpdateExchangeDiamondVND);
    on<SetExchangeDiamondVND>(_onSetExchangeDiamondVND);
    on<ExchangeDiamond>(_onExchangeDiamond);
  }

  Future<void> _onNavigateToTransactionHistoryScreen(
      NavigateToTransactionHistoryScreen event,
      Emitter<WalletDiamondState> emit) async {
    emit(WalletDiamondNavigateToTransactionHistoryScreen());
  }

  Future<void> _onLoadWalletDiamondInfo(
      LoadWalletDiamondInfo event, Emitter<WalletDiamondState> emit) async {
    try {
      final walletDiamondInfo = await _walletDiamondUseCase.getWalletInfo();

      emit(WalletDiamondLoaded(walletDiamondInfo));
    } catch (e) {
      emit(WalletDiamondError(e.toString()));
    }
  }

  Future<void> _onUpdateExchangeDiamondVND(
    UpdateExchangeDiamondVND event,
    Emitter<WalletDiamondState> emit,
  ) async {
    try {
      final exchangeVND =
          await _walletDiamondUseCase.estimateDiamond(event.exchangeDiamondVND);

      emit(ExchangeVNDValueUpdated(exchangeVND));
    } catch (e) {
      emit(WalletDiamondError(e.toString()));
    }
  }

  Future<void> _onSetExchangeDiamondVND(
      SetExchangeDiamondVND event, Emitter<WalletDiamondState> emit) async {
    emit(ExchangeVNDValueUpdated(event.exchangeDiamondVND));
  }

  Future<void> _onExchangeDiamond(
      ExchangeDiamond event, Emitter<WalletDiamondState> emit) async {
    try {
      final body = {
        'diamond': event.exchangeDiamondVND,
      };

      await _walletDiamondUseCase.exchangeDiamond(body);

      emit(ExchangeDiamondSuccess());
    } catch (e) {
      emit(ExchangeDiamondFailure('Có lỗi xảy ra, vui lòng thử lại'));
    }
  }
}
