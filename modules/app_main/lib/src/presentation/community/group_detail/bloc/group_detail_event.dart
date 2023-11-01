part of 'group_detail_bloc.dart';

@immutable
abstract class GroupDetailEvent {}

class FetchGroupDetailEvent extends GroupDetailEvent {
  final int id;

  FetchGroupDetailEvent(this.id);
}

class UpdateGroupDetailEvent extends GroupDetailEvent {
  final Group group;

  UpdateGroupDetailEvent(this.group);
}
