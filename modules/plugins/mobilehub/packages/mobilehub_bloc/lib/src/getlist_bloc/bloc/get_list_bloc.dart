import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../usecase/usecase_add.dart';
import '../../usecase/usecase_delete.dart';

part 'get_list_event.dart';

part 'get_list_state.dart';

typedef LoadListFuture<T> = Future<List<T>> Function();

class GetListBloc<T> extends Bloc<GetListEvent, GetListState> {
  final LoadListFuture<T> _usecase;

  GetListBloc(this._usecase) : super(GetListBlocInitial()) {
    on<GetListDataEvent>(_mapGetListDataEvent);
    on<RemoveItemFromListEvent>(_mapRemoveItemFromListEvent);
    on<GetListDateTypeSearchText>(_mapGetListDateTypeSearchText,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 300))
            .switchMap(mapper));
  }

  FutureOr<void> _mapGetListDataEvent(
      GetListDataEvent event, Emitter<GetListState> emit) async {
    try {
      final stateCurrent = state;
      if (stateCurrent is! GetListDataSuccess<T>) {
        emit(GetListDataLoading<T>());
      }

      final data = await _usecase();

      emit(GetListDataSuccess<T>(data));
    } catch (e) {
      emit(GetListDataError<T>(e.toString(), e));
    }
  }

  FutureOr<void> _mapRemoveItemFromListEvent(
      RemoveItemFromListEvent event, Emitter<GetListState> emit) {
    final currentState = state;

    if (currentState is GetListDataSuccess) {
      final result = List.from(currentState.data);
      result.removeWhere(event.where);
      emit(GetListDataSuccess<T>(result.map((e) => e as T).toList()));
    }
  }

  FutureOr<void> _mapGetListDateTypeSearchText(
      GetListDateTypeSearchText event, Emitter<GetListState> emit) {
    final currentState = state;

    if (currentState is GetListDataSuccess) {
      final searchResult = currentState.data.where((element) {
        return event.where(element);
      }).toList() as List<T>;
      emit(GetListDataTypeSearchResult<T>(currentState.data, searchResult));
    }
  }
}

/// Bloc with 1 parameter
typedef LoadListFutureParam1<T, P1> = Future<List<T>> Function(P1 param1);

class GetListBlocParam1<T, P1> extends Bloc<GetListEvent, GetListState> {
  final LoadListFutureParam1<T, P1> _usecaseParam1;

  GetListBlocParam1(this._usecaseParam1) : super(GetListBlocInitial()) {
    on<GetListDataParam1Event>(_mapGetDetailDataParam1Event);
    on<RemoveItemFromListEvent>(_mapRemoveItemFromListEvent);
    on<AddItemIntoListEvent>(_mapAddItemIntoListEvent);
  }

  FutureOr<void> _mapGetDetailDataParam1Event(
      GetListDataParam1Event event, Emitter<GetListState> emit) async {
    try {
      emit(GetListDataLoading<T>());

      final data = await _usecaseParam1(event.param1);

      emit(GetListDataSuccess<T>(data));
    } catch (e) {
      emit(GetListDataError<T>(e.toString(), e));
    }
  }

  FutureOr<void> _mapRemoveItemFromListEvent(
      RemoveItemFromListEvent event, Emitter<GetListState> emit) {
    final currentState = state;

    if (currentState is GetListDataSuccess) {
      final result = List.from(currentState.data);
      result.removeWhere(event.where);
      emit(GetListDataSuccess<T>(result.map((e) => e as T).toList()));
    }
  }

  FutureOr<void> _mapAddItemIntoListEvent(
      AddItemIntoListEvent event, Emitter<GetListState> emit) {
    final currentState = state;

    if (currentState is GetListDataSuccess) {
      final result = List.from(currentState.data);
      result.add(event.item);
      emit(GetListDataSuccess<T>(result.map((e) => e as T).toList()));
    }
  }
}

/// Bloc with 2 parameter
typedef LoadListFutureParam2<T, P1, P2> = Future<List<T>> Function(
    P1 param1, P2 param2);

class GetListBlocParam2<T, P1, P2> extends Bloc<GetListEvent, GetListState> {
  final LoadListFutureParam2<T, P1, P2> _usecaseParam2;

  GetListBlocParam2(this._usecaseParam2) : super(GetListBlocInitial()) {
    on<GetListDataParam2Event>(_mapGetListDataParam2Event);
  }

  FutureOr<void> _mapGetListDataParam2Event(
      GetListDataParam2Event event, Emitter<GetListState> emit) async {
    try {
      final stateCurrent = state;
      final dataCurrent = <T>[];

      if (stateCurrent is GetListDataSuccess<T> &&
          event.fetchNewData == false) {
        dataCurrent.addAll(stateCurrent.data);
        emit(GetListDataLoadingSuccess<T>(dataCurrent));
      } else {
        emit(GetListDataLoading());
      }

      final data = await _usecaseParam2(event.param1, event.param2);

      emit(GetListDataSuccess<T>([...dataCurrent, ...data]));
    } catch (e) {
      emit(GetListDataError<T>(e.toString(), e));
    }
  }
}

/// Bloc with 3 parameter
/// Bloc with 3 parameter support loadmore paging
typedef LoadListFutureParam3<T, P1, P2, P3> = Future<List<T>> Function(
    P1 param1, P2 param2, P3 param3);

class GetListBlocParam3<T, P1, P2, P3>
    extends Bloc<GetListEvent, GetListState> {
  final LoadListFutureParam3<T, P1, P2, P3> _usecaseParam3;
  final UsecaseDelete<T, dynamic>? _usecaseDeleteApi;
  final UsecaseAdd<T, dynamic>? _usecaseAddApi;

  GetListBlocParam3(
    this._usecaseParam3, {
    UsecaseDelete<T, dynamic>? usecaseDeleteApi,
    UsecaseAdd<T, dynamic>? usecaseAddApi,
  })  : _usecaseDeleteApi = usecaseDeleteApi,
        _usecaseAddApi = usecaseAddApi,
        super(GetListBlocInitial()) {
    on<GetListDataParam3Event>(_mapGetListDataParam3Event);
    on<GetListPagingEvent<P1, P2, P3>>(_mapGetListPagingEvent,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 500))
            .switchMap(mapper));
    on<RemoveItemFromListEvent>(_mapRemoveItemFromListEvent);
    on<RemoveItemEvent>(_mapRemoveItemEvent);
    on<AddItemEvent>(_mapAddItemEvent);
    on<AddItemToListEvent>(_mapAddItemToListEvent);
    on<UpdateItemToListEvent<T>>(_mapUpdateItemToListEvent);
    on<UpdateDataListEvent<T>>(_mapUpdateDataListEvent);
  }

  FutureOr<void> _mapGetListDataParam3Event(
      GetListDataParam3Event event, Emitter<GetListState> emit) async {
    try {
      final stateCurrent = state;
      if (stateCurrent is! GetListDataSuccess<T>) {
        emit(GetListDataLoading<T>());
      }

      final data =
          await _usecaseParam3(event.param1, event.param2, event.param3);

      emit(GetListDataSuccess<T>(data));
    } catch (e) {
      emit(GetListDataError<T>(e.toString(), e));
    }
  }

  FutureOr<void> _mapGetListPagingEvent(
      GetListPagingEvent<P1, P2, P3> event, Emitter<GetListState> emit) async {
    try {
      final stateCurrent = state;
      final dataCurrent = <T>[];

      if (stateCurrent is GetListDataPagingSuccess<T, P2, P3> &&
          [TypeFetchPaging.fetch, TypeFetchPaging.refresh]
              .contains(event.type)) {
        if (event.type == TypeFetchPaging.fetch) {
          dataCurrent.addAll(stateCurrent.data);
        }
      } else {
        emit(GetListDataLoading<T>());
      }

      final data =
          await _usecaseParam3(event.param1, event.offset, event.limit);

      /// Data of State
      final listData = [...dataCurrent, ...data];
      final limitPerPage = event.limit; // with type P3
      final offset = (event.offset as int) + 1;
      final hasLoadMore = data.isNotEmpty;

      if (event.type == TypeFetchPaging.refresh) {
        emit(PullToRefreshSuccess<T, P2, P3>(
          listData,
          offset: offset as P2,
          limit: limitPerPage,
          hasLoadMore: hasLoadMore,
          timespan: DateTime.now().millisecondsSinceEpoch,
        ));
      } else {
        emit(
          GetListDataPagingSuccess<T, P2, P3>(
            listData,
            offset: offset as P2,
            limit: limitPerPage,
            hasLoadMore: hasLoadMore,
          ),
        );
      }
    } catch (e) {
      emit(GetListDataError<T>(e.toString(), e));
    }
  }

  FutureOr<void> _mapRemoveItemFromListEvent(
      RemoveItemFromListEvent event, Emitter<GetListState> emit) {
    try {
      final currentState = state;

      if (currentState is GetListDataPagingSuccess) {
        final result = List.from(currentState.data);
        result.removeWhere(event.where);

        emit(GetListDataPagingSuccess<T, P2, P3>(
          result.map((e) => e as T).toList(),
          offset: currentState.offset,
          limit: currentState.limit,
          hasLoadMore: currentState.hasLoadMore,
          timespan: DateTime.now().microsecondsSinceEpoch,
        ));
      }
    } catch (e) {
      emit(GetListDataError<T>(e.toString(), e));
    }
  }

  FutureOr<void> _mapRemoveItemEvent(
      RemoveItemEvent event, Emitter<GetListState> emit) async {
    try {
      final currentState = state;

      if (currentState is GetListDataPagingSuccess) {
        if (_usecaseDeleteApi != null) {
          final response = await _usecaseDeleteApi!(event.item);
          if (response != true) {
            // failed delete.
            return;
          }
        }

        final currentData = List.from(currentState.data);
        currentData.remove(event.item);

        emit(GetListDataPagingSuccess<T, P2, P3>(
          currentData.map((e) => e as T).toList(),
          offset: currentState.offset,
          limit: currentState.limit,
          hasLoadMore: currentState.hasLoadMore,
          timespan: DateTime.now().microsecondsSinceEpoch,
        ));
      }
    } catch (e) {
      emit(
        GetListDataError<T>(e.toString(), e),
      );
    }
  }

  FutureOr<void> _mapAddItemToListEvent(
      AddItemToListEvent event, Emitter<GetListState> emit) {
    try {
      final currentState = state;

      if (currentState is GetListDataPagingSuccess) {
        final result = List.from(currentState.data);
        if (event.index >= 0) {
          result.insert(event.index, event.item);
        } else {
          result.add(event.item);
        }

        emit(GetListDataPagingSuccess<T, P2, P3>(
          result.map((e) => e as T).toList(),
          offset: currentState.offset,
          limit: currentState.limit,
          hasLoadMore: currentState.hasLoadMore,
          timespan: DateTime.now().microsecondsSinceEpoch,
        ));
      }
    } catch (e) {
      emit(GetListDataError<T>(e.toString(), e));
    }
  }

  FutureOr<void> _mapAddItemEvent(
      AddItemEvent event, Emitter<GetListState> emit) async {
    try {
      final currentState = state;
      T? itemNew;

      if (currentState is GetListDataPagingSuccess) {
        if (_usecaseAddApi != null) {
          itemNew = await _usecaseAddApi!(event.param);
        } else if (event.param is T) {
          itemNew = event.param;
        }

        if (itemNew == null) {
          return;
        }

        final currentData = List.from(currentState.data);
        currentData.insert(0, itemNew);

        emit(GetListDataPagingSuccess<T, P2, P3>(
          currentData.map((e) => e as T).toList(),
          offset: currentState.offset,
          limit: currentState.limit,
          hasLoadMore: currentState.hasLoadMore,
          timespan: DateTime.now().microsecondsSinceEpoch,
        ));
      }
    } catch (e) {
      emit(GetListDataError<T>(e.toString(), e));
    }
  }

  FutureOr<void> _mapUpdateItemToListEvent(
      UpdateItemToListEvent<T> event, Emitter<GetListState> emit) async {
    try {
      final currentState = state;

      if (currentState is GetListDataPagingSuccess<T, P2, P3>) {
        final result = List<T>.from(currentState.data);
        final idexItem = result.indexWhere(event.where);
        if (idexItem >= 0) {
          result[idexItem] = event.item;
        }

        emit(GetListDataPagingSuccess<T, P2, P3>(
          result,
          offset: currentState.offset,
          limit: currentState.limit,
          hasLoadMore: currentState.hasLoadMore,
          timespan: DateTime.now().microsecondsSinceEpoch,
        ));
      }
    } catch (e) {
      emit(GetListDataError<T>(e.toString(), e));
    }
  }

  FutureOr<void> _mapUpdateDataListEvent(
      UpdateDataListEvent<T> event, Emitter<GetListState> emit) async {
    try {
      final currentState = state;

      if (currentState is GetListDataPagingSuccess<T, P2, P3>) {
        final listData = List<T>.from(currentState.data);
        final result = event.onUpdate(listData);

        emit(GetListDataPagingSuccess<T, P2, P3>(
          result,
          offset: currentState.offset,
          limit: currentState.limit,
          hasLoadMore: currentState.hasLoadMore,
          timespan: DateTime.now().microsecondsSinceEpoch,
        ));
      }
    } catch (e) {
      emit(GetListDataError<T>(e.toString(), e));
    }
  }
}
