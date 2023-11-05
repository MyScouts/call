import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/upgrade_pdone_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:injectable/injectable.dart';

abstract class DashboardBaseBloc
    extends Bloc<DashboardBaseEvent, DashboardBaseState> {
  final DashboardSharePreferenceUseCase dashboardSharePreferenceUseCase;

  DashboardBaseBloc(this.dashboardSharePreferenceUseCase)
      : super(DashboardBaseInitial()) {
    on<_FetchDashBoardItems>(onFetchDashBoardItems);
    on<AddItem>(
      onAddItem,
      transformer: (event, mapper) => event.asyncExpand(mapper),
    );
    on<RemoveItem>(
      onRemoveItem,
      transformer: (event, mapper) => event.asyncExpand(mapper),
    );
    on<ChangeItem>(onChangeItem);
    on<AddItemToGroup>(onAddItemToGroup);
    on<ChangeGroup>(onChangeGroup);
    add(_FetchDashBoardItems());
  }

  String cacheKey = '';

  void onChangeGroup(
    ChangeGroup event,
    Emitter<DashboardBaseState> emit,
  ) {
    if (state is DashboardBaseInitial) return;
    final s = (state as DashboardBaseFetchDataSuccess);
    final result = s.items.map((e) {
      if (e.id == event.group.id) return event.group;
      return e;
    }).toList();
    dashboardSharePreferenceUseCase.saveDashboardItems(
      cacheKey,
      result.map((e) => e).toList(),
    );
    emit(DashboardBaseFetchDataSuccess(items: result));
  }

  void onAddItemToGroup(
    AddItemToGroup event,
    Emitter<DashboardBaseState> emit,
  ) {
    if (state is DashboardBaseInitial) return;
    final s = (state as DashboardBaseFetchDataSuccess);
    final ids = event.newItems.map((e) => e.id).toList();
    List<DashBoardItem> result =
        s.items.where((e) => !ids.contains(e.id)).toList();
    result = result.map((e) {
      if (e.id == event.group.id) return event.group;
      return e;
    }).toList();
    dashboardSharePreferenceUseCase.saveDashboardItems(
      cacheKey,
      result.map((e) => e).toList(),
    );
    emit(DashboardBaseFetchDataSuccess(items: result));
  }

  void onFetchDashBoardItems(
    _FetchDashBoardItems event,
    Emitter<DashboardBaseState> emit,
  ) {
    final res = dashboardSharePreferenceUseCase.getDashBoardItems(cacheKey);
    if (res.isEmpty) {
      setDashboardDefault();
      return;
    }
    emit(DashboardBaseFetchDataSuccess(items: res));
  }

  void onAddItem(
    AddItem event,
    Emitter<DashboardBaseState> emit,
  ) {
    if (state is DashboardBaseInitial) return;
    final s = state as DashboardBaseFetchDataSuccess;
    List<DashBoardItem> list = [...s.items, event.item];
    if (event.item is DashBoardGroupItem) {
      final gIds =
          (event.item as DashBoardGroupItem).items.map((e) => e.id).toList();
      list = list.where((e) => !gIds.contains(e.id)).toList();
    }
    dashboardSharePreferenceUseCase.saveDashboardItems(
      cacheKey,
      list.map((e) => e).toList(),
    );
    emit(DashboardBaseFetchDataSuccess(items: list));
  }

  void onRemoveItem(
    RemoveItem event,
    Emitter<DashboardBaseState> emit,
  ) {
    if (state is DashboardBaseInitial) return;
    final s = state as DashboardBaseFetchDataSuccess;
    final list = s.items.where((e) => e.id != event.item.id).toList();
    dashboardSharePreferenceUseCase.saveDashboardItems(
      cacheKey,
      list.map((e) => e).toList(),
    );
    emit(DashboardBaseFetchDataSuccess(items: list));
  }

  void onChangeItem(ChangeItem event, Emitter<DashboardBaseState> emit) {
    if (state is DashboardBaseInitial) return;
    final list = event.item.map((e) => e).toList();
    dashboardSharePreferenceUseCase.saveDashboardItems(
        cacheKey, list);
    emit(DashboardBaseFetchDataSuccess(items: list));
  }

  void setDashboardDefault();
}

@injectable
class DashboardCommunityBloc extends DashboardBaseBloc {
  DashboardCommunityBloc(super.dashboardSharePreferenceUseCase);

  @override
  void setDashboardDefault() {
    emit(
      DashboardBaseFetchDataSuccess(
        items: communityDefault.values.toList(),
      ),
    );
  }

  @override
  String get cacheKey => 'community';
}

@injectable
class DashboardPersonalBloc extends DashboardBaseBloc {
  DashboardPersonalBloc(super.dashboardSharePreferenceUseCase);

  @override
  void setDashboardDefault() {
    emit(
      DashboardBaseFetchDataSuccess(
        items: personalDefault.values.toList(),
      ),
    );
  }

  @override
  String get cacheKey => 'personal';
}

@injectable
class DashboardEcommerceBloc extends DashboardBaseBloc {
  DashboardEcommerceBloc(super.dashboardSharePreferenceUseCase);

  @override
  void setDashboardDefault() {
    emit(
      DashboardBaseFetchDataSuccess(items: eCommerceDefault.values.toList()),
    );
  }

  @override
  String get cacheKey => 'ecommerce';
}

abstract class DashboardBaseEvent {}

class _FetchDashBoardItems extends DashboardBaseEvent {}

class AddItem extends DashboardBaseEvent {
  final DashBoardItem item;

  AddItem(this.item);
}

class RemoveItem extends DashboardBaseEvent {
  final DashBoardItem item;

  RemoveItem(this.item);
}

class ChangeItem extends DashboardBaseEvent {
  final List<DashBoardItem> item;

  ChangeItem(this.item);
}

class AddItemToGroup extends DashboardBaseEvent {
  final DashBoardGroupItem group;
  final List<DashBoardItem> newItems;

  AddItemToGroup(this.group, this.newItems);
}

class ChangeGroup extends DashboardBaseEvent {
  final DashBoardGroupItem group;

  ChangeGroup(this.group);
}

abstract class DashboardBaseState {}

class DashboardBaseInitial extends DashboardBaseState {}

class DashboardBaseFetchDataSuccess extends DashboardBaseState
    with EquatableMixin {
  final List<DashBoardItem> items;

  DashboardBaseFetchDataSuccess({this.items = const []});

  @override
  List<Object?> get props => [items];
}
