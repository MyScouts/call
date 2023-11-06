part of 'fan_group_detail_bloc.dart';

abstract class FanGroupDetailEvent {}

class FetchFanGroupDetailEvent extends FanGroupDetailEvent {
  final int id;

  FetchFanGroupDetailEvent(this.id);
}

class RegisterFanGroupEvent extends FanGroupDetailEvent {
  final int id;

  RegisterFanGroupEvent(this.id);
}

class UpdateFanGroupEvent extends FanGroupDetailEvent {
  final FanGroup newData;

  UpdateFanGroupEvent(this.newData);
}
