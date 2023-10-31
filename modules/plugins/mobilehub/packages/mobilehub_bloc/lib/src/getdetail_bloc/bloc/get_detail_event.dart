part of 'get_detail_bloc.dart';

@immutable
abstract class GetDetailEvent {}

class GetDetailDataEvent extends GetDetailEvent {}

class GetDetailDataParam1Event extends GetDetailEvent {
  final dynamic param1;

  GetDetailDataParam1Event(this.param1);
}

class GetDetailDataParam2Event extends GetDetailEvent {
  final dynamic param1;
  final dynamic param2;

  GetDetailDataParam2Event(this.param1, this.param2);
}

class GetDetailDataParam3Event extends GetDetailEvent {
  final dynamic param1;
  final dynamic param2;
  final dynamic param3;

  GetDetailDataParam3Event(this.param1, this.param2, this.param3);
}
