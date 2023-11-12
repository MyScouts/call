part of 'guardian_pdone_bloc.dart';

@immutable
abstract class GuardianPDoneState {}


class GuardianPDoneInitialState extends GuardianPDoneState {}


class GuardianPDoneCheckingProtectorInfoState extends GuardianPDoneState {}

class GuardianPDoneCheckSuccessProtectorInfoState extends GuardianPDoneState {}

class GuardianPDoneCheckFailureProtectorInfoState extends GuardianPDoneState {
  final String errorMessage;

  GuardianPDoneCheckFailureProtectorInfoState({required this.errorMessage});
}
