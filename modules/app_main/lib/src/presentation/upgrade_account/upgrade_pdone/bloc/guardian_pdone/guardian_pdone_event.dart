part of 'guardian_pdone_bloc.dart';

@immutable
abstract class GuardianPDoneEvent {}


class GuardianPDoneCheckProtectorInfoEvent extends GuardianPDoneEvent{
  final PDoneVerifyProtectorRequest payload;
  GuardianPDoneCheckProtectorInfoEvent({required this.payload});
}
