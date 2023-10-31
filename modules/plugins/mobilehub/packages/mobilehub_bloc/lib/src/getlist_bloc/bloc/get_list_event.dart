part of 'get_list_bloc.dart';

@immutable
abstract class GetListEvent extends Equatable {}

class GetListDataEvent extends GetListEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetListDateTypeSearchText<T> extends GetListEvent {
  final bool Function(dynamic element) where;

  GetListDateTypeSearchText(this.where);

  @override
  List<Object?> get props => [where];
}

class GetListDataParam1Event extends GetListEvent {
  final dynamic param1;

  GetListDataParam1Event(this.param1);
  @override
  List<Object?> get props => [param1];
}

class GetListDataParam2Event extends GetListEvent {
  final dynamic param1;
  final dynamic param2;
  final bool fetchNewData;

  GetListDataParam2Event(this.param1, this.param2, {this.fetchNewData = true});

  @override
  List<Object?> get props => [param1, param2, fetchNewData];
}

class GetListDataParam3Event extends GetListEvent {
  final dynamic param1;
  final dynamic param2;
  final dynamic param3;

  GetListDataParam3Event(this.param1, this.param2, this.param3);
  @override
  List<Object?> get props => [param1, param2, param3];
}

class RemoveItemFromListEvent<T> extends GetListEvent {
  final bool Function(dynamic element) where;

  RemoveItemFromListEvent(this.where);

  @override
  List<Object?> get props => [where];
}

class AddItemIntoListEvent<T> extends GetListEvent {
  final T item;

  AddItemIntoListEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveItemEvent<T> extends GetListEvent {
  final T item;

  RemoveItemEvent(this.item);
  @override
  List<Object?> get props => [item];
}

class AddItemEvent<P> extends GetListEvent {
  final P param;

  AddItemEvent(this.param);
  @override
  List<Object?> get props => [param];
}

class AddItemToListEvent<T> extends GetListEvent {
  final T item;
  final int index;

  AddItemToListEvent(this.item, [this.index = 0]);

  @override
  List<Object?> get props => [item, index];
}

class UpdateItemToListEvent<T> extends GetListEvent {
  final T item;
  final bool Function(T element) where;

  UpdateItemToListEvent(this.item, this.where);

  @override
  List<Object?> get props => [item, where];
}

class UpdateDataListEvent<T> extends GetListEvent {
  final List<T> Function(List<T> element) onUpdate;

  UpdateDataListEvent(this.onUpdate);

  @override
  List<Object?> get props => [onUpdate];
}

enum TypeFetchPaging { fetch, refresh, renew }

class GetListPagingEvent<P1, P2, P3> extends GetListEvent {
  final P1 param1;
  final P2 offset;
  final P3 limit;
  final TypeFetchPaging type;

  GetListPagingEvent(
    this.param1, {
    required this.offset,
    required this.limit,
    required this.type,
  });

  @override
  List<Object?> get props => [param1, type, offset, limit];
}
