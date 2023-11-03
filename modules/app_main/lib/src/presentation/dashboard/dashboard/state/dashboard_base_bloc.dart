import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/upgrade_pdone_screen.dart';
import 'package:design_system/design_system.dart';
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
    add(_FetchDashBoardItems());
  }

  void onFetchDashBoardItems(
    _FetchDashBoardItems event,
    Emitter<DashboardBaseState> emit,
  ) {
    final res = dashboardSharePreferenceUseCase.getDashBoardItems();
    if (res.isEmpty) {
      setDashboardDefault();
      return;
    }
    final list = res
        .map<DashBoardItem>((e) => mapItems[e] ?? DashBoardIconItem.empty())
        .toList();
    emit(DashboardBaseFetchDataSuccess(item: list));
  }

  void onAddItem(
    AddItem event,
    Emitter<DashboardBaseState> emit,
  ) {
    if (state is DashboardBaseInitial) return;
    final s = state as DashboardBaseFetchDataSuccess;
    final list = [...s.item, event.item];
    dashboardSharePreferenceUseCase
        .saveDashboardItems(list.map((e) => e.id).toList());
    emit(DashboardBaseFetchDataSuccess(item: list));
  }

  void onRemoveItem(
    RemoveItem event,
    Emitter<DashboardBaseState> emit,
  ) {
    if (state is DashboardBaseInitial) return;
    final s = state as DashboardBaseFetchDataSuccess;
    final list = s.item.where((e) => e.id != event.item.id).toList();
    dashboardSharePreferenceUseCase
        .saveDashboardItems(list.map((e) => e.id).toList());
    emit(DashboardBaseFetchDataSuccess(item: list));
  }

  void onChangeItem(ChangeItem event, Emitter<DashboardBaseState> emit) {
    if (state is DashboardBaseInitial) return;
    emit(DashboardBaseFetchDataSuccess(item: event.item));
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
        item: [
          DashBoardWidgetItem(
            id: 'custom_widget',
            title: 'shop live',
            backgroundImage: ImageApp.live.path,
            width: 2,
            height: 4,
          ),
          DashBoardWidgetItem(
            id: 'widget',
            title: 'Vòng quay trúng thưởng',
            backgroundImage: IconApp.icWheelOfFortune.path,
            width: 2,
            height: 2,
          ),
          DashBoardIconItem(
            id: 'tv',
            title: 'Kênh',
            backgroundImage: IconAppConstants.icTv,
            width: 1,
            height: 1,
          ),
          DashBoardIconItem(
            id: 'bird',
            title: 'Nữ thần hoà bình',
            backgroundImage: IconAppConstants.icBird,
            width: 1,
            height: 1,
          ),
        ],
      ),
    );
  }
}

@injectable
class DashboardPersonalBloc extends DashboardBaseBloc {
  DashboardPersonalBloc(super.dashboardSharePreferenceUseCase);

  @override
  void setDashboardDefault() {
    emit(
      DashboardBaseFetchDataSuccess(
        item: [
          DashBoardIconItem(
            id: 'tv',
            title: 'Kênh',
            backgroundImage: IconAppConstants.icTv,
            width: 1,
            height: 1,
          ),
          DashBoardIconItem(
            id: 'bird',
            title: 'Nữ thần hoà bình',
            backgroundImage: IconAppConstants.icBird,
            width: 1,
            height: 1,
          ),
          DashBoardIconItem(
            id: 'group/team',
            title: 'Group/Team',
            backgroundImage: IconAppConstants.icGroupTeam,
            path: UpgradePDoneScreen.routeName,
            width: 1,
            height: 1,
          ),
        ],
      ),
    );
  }
}

@injectable
class DashboardEcommerceBloc extends DashboardBaseBloc {
  DashboardEcommerceBloc(super.dashboardSharePreferenceUseCase);

  @override
  void setDashboardDefault() {
    emit(
      DashboardBaseFetchDataSuccess(
        item: [
          DashBoardWidgetItem(
            id: 'banner_widget',
            title: 'Big Sale',
            backgroundImage: ImageApp.banner.path,
            width: 4,
            height: 2,
          ),
          DashBoardWidgetItem(
            id: 'custom_widget',
            title: 'shop live',
            backgroundImage: ImageApp.live.path,
            width: 2,
            height: 4,
          ),
          DashBoardWidgetItem(
            id: 'widget',
            title: 'Vòng quay trúng thưởng',
            backgroundImage: IconApp.icWheelOfFortune.path,
            width: 2,
            height: 2,
          ),
          DashBoardIconItem(
            id: 'tv',
            title: 'Kênh',
            backgroundImage: IconAppConstants.icTv,
            width: 1,
            height: 1,
          ),
          DashBoardIconItem(
            id: 'bird',
            title: 'Nữ thần hoà bình',
            backgroundImage: IconAppConstants.icBird,
            width: 1,
            height: 1,
          ),
        ],
      ),
    );
  }
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

abstract class DashboardBaseState {}

class DashboardBaseInitial extends DashboardBaseState {}

class DashboardBaseFetchDataSuccess extends DashboardBaseState {
  final List<DashBoardItem> item;

  DashboardBaseFetchDataSuccess({this.item = const []});
}
