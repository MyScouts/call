import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/core/bloc/core_state.dart';
import 'package:app_main/src/domain/entities/notification/notification_data.dart';
import 'package:app_main/src/domain/usecases/notification_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class NotificationBloc extends CoreBloc<NotificationEvent, NotificationState> {
  final NotificationUsecase useCase;

  NotificationBloc(this.useCase) : super(NotificationState()) {
    on<Fetch>(onFetch);
    on<LoadMore>(
      onLoadMore,
      transformer: (event, mapper) => event.exhaustMap(mapper),
    );
    on<Search>(
      onSearch,
      transformer: (event, mapper) => event
          .debounceTime(const Duration(milliseconds: 150))
          .switchMap(mapper),
    );
    add(Fetch());
  }

  int _page = 1;

  final RefreshController _controller = RefreshController();

  RefreshController get controller => _controller;

  void onFetch(_, Emitter<NotificationState> emit) async {
    _page = 1;
    final res = await useCase.list(_page);
    _controller.refreshCompleted();
    bool hasLoadMore = true;
    if (res.length < 10) hasLoadMore = false;
    emit(state.copyWith(
      status: StateStatus.success,
      items: res,
      hasLoadMore: hasLoadMore,
    ));
  }

  void onLoadMore(_, Emitter<NotificationState> emit) async {
    _page++;
    final res = await useCase.list(_page);
    _controller.loadComplete();
    bool hasLoadMore = true;
    if (res.length < 10) hasLoadMore = false;
    emit(state.copyWith(
      status: StateStatus.success,
      items: [...state.items, ...res],
      hasLoadMore: hasLoadMore,
    ));
  }

  void onSearch(Search event, Emitter<NotificationState> emit) async {
    if (event.keyword.trim().isEmpty) {
      emit(state.copyWith(
        isSearching: true,
        search: state.items.map((e) => e).toList(),
      ));
    }
    final search =
        state.items.where((e) => e.message.contains(event.keyword)).toList();
    emit(state.copyWith(
      isSearching: true,
      search: search,
    ));
  }
}

abstract class NotificationEvent {}

class Fetch extends NotificationEvent {}

class LoadMore extends NotificationEvent {}

class Search extends NotificationEvent {
  final String keyword;

  Search(this.keyword);
}

class NotificationState extends CoreState with EquatableMixin {
  final List<NotificationData> items;
  final bool isSearching;
  final List<NotificationData> search;
  final bool hasLoadMore;

  NotificationState({
    this.items = const [],
    this.search = const [],
    this.isSearching = false,
    this.hasLoadMore = true,
    super.status,
  });

  NotificationState copyWith({
    StateStatus? status,
    List<NotificationData>? items,
    List<NotificationData>? search,
    bool? isSearching,
    bool? hasLoadMore,
  }) {
    return NotificationState(
      status: status ?? this.status,
      items: items ?? this.items,
      search: search ?? this.search,
      isSearching: isSearching ?? this.isSearching,
      hasLoadMore: hasLoadMore ?? this.hasLoadMore,
    );
  }

  @override
  List<Object?> get props => [items, search, isSearching, hasLoadMore];
}
