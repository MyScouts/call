import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_detail_event.dart';
part 'get_detail_state.dart';

typedef GetDetailFuture<T> = Future<T> Function();

class GetDetailBloc<T> extends Bloc<GetDetailEvent, GetDetailState> {
  final GetDetailFuture<T> _usecase;

  GetDetailBloc(this._usecase) : super(GetDetailInitial()) {
    on<GetDetailDataEvent>(_mapGetDetailDataEvent);
  }

  FutureOr<void> _mapGetDetailDataEvent(
      GetDetailDataEvent event, Emitter<GetDetailState> emit) async {
    try {
      emit(GetDetailDataLoading<T>());

      final data = await _usecase();
      if (data != null) {
        emit(GetDetailDataSuccess<T>(data));
      }
    } on DioError catch (e) {
      emit(GetDetailError<T>(e));
      if (kDebugMode) {
        rethrow;
      }
    } catch (e) {
      emit(GetDetailError<T>(e));
      if (kDebugMode) {
        rethrow;
      }
    }
  }
}

/// Param1
typedef GetDetailFutureParam1<T, P1> = Future<T> Function(P1 param1);

class GetDetailBlocParam1<T, P1> extends Bloc<GetDetailEvent, GetDetailState> {
  final GetDetailFutureParam1<T, P1> _usecase;

  GetDetailBlocParam1(this._usecase) : super(GetDetailInitial()) {
    on<GetDetailDataParam1Event>(_mapGetDetailDataParam1Event);
  }

  FutureOr<void> _mapGetDetailDataParam1Event(
      GetDetailDataParam1Event event, Emitter<GetDetailState> emit) async {
    try {
      emit(GetDetailDataLoading<T>());

      final data = await _usecase(event.param1);
      emit(GetDetailDataSuccess<T>(data));
    } on DioError catch (e) {
      emit(GetDetailError<T>(e));
      if (kDebugMode) {
        rethrow;
      }
    } catch (e) {
      emit(GetDetailError<T>(e));
      if (kDebugMode) {
        rethrow;
      }
    }
  }
}

/// Param2
typedef GetDetailFutureParam2<T, P1, P2> = Future<T> Function(
    P1 param1, P2 param2);

class GetDetailBlocParam2<T, P1, P2>
    extends Bloc<GetDetailEvent, GetDetailState> {
  final GetDetailFutureParam2<T, P1, P2> _usecase;

  GetDetailBlocParam2(this._usecase) : super(GetDetailInitial()) {
    on<GetDetailDataParam2Event>(_mapGetDetailDataParam2Event);
  }

  FutureOr<void> _mapGetDetailDataParam2Event(
      GetDetailDataParam2Event event, Emitter<GetDetailState> emit) async {
    try {
      emit(GetDetailDataLoading<T>());

      final data = await _usecase(event.param1, event.param2);

      emit(GetDetailDataSuccess<T>(data));
    } on DioError catch (e) {
      emit(GetDetailError<T>(e));
    } catch (e, trace) {
      if (kDebugMode) {
        log(e.toString());
        log(trace.toString());
      }
      final currentState = state;
      if (currentState is GetDetailDataSuccess<T>) {
        emit(GetDetailErrorHasData<T>(currentState.data, e));
      }
    }
  }
}

/// Param3
typedef GetDetailFutureParam3<T, P1, P2, P3> = Future<T> Function(
    P1 param1, P2 param2, P3 param3);

class GetDetailBlocParam3<T, P1, P2, P3>
    extends Bloc<GetDetailEvent, GetDetailState> {
  final GetDetailFutureParam3<T, P1, P2, P3> _usecase;

  GetDetailBlocParam3(this._usecase) : super(GetDetailInitial()) {
    on<GetDetailDataParam3Event>(_mapGetDetailDataParam3Event);
  }

  FutureOr<void> _mapGetDetailDataParam3Event(
      GetDetailDataParam3Event event, Emitter<GetDetailState> emit) async {
    try {
      emit(GetDetailDataLoading<T>());

      final data = await _usecase(event.param1, event.param2, event.param3);

      emit(GetDetailDataSuccess<T>(data));
    } on DioError catch (e) {
      emit(GetDetailError<T>(e));
    } catch (e) {
      emit(GetDetailError<T>(e));
    }
  }
}
