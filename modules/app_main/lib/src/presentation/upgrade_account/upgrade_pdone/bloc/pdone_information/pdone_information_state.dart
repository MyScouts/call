part of 'pdone_information_bloc.dart';

@immutable
abstract class PDoneInformationState {}

@immutable
class PDoneInformationInitial extends PDoneInformationState {}

@immutable
class PDoneLoadingInformation extends PDoneInformationState {}

@immutable
class PDoneLoadedSuccessInformation extends PDoneInformationState {
  final PDoneInformationData data;

  PDoneLoadedSuccessInformation({required this.data});
}

@immutable
class PDoneNotYetRegisterState extends PDoneInformationState {
  PDoneNotYetRegisterState();
}

@immutable
class PDoneLoadedFailureInformation extends PDoneInformationState {
  final String errorMessage;

  PDoneLoadedFailureInformation({required this.errorMessage});
}
