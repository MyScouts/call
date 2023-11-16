part of 'information_update_profil_bloc.dart';

@immutable
abstract class InformationEvent {}

class InformationUpdateProfilEvent extends InformationEvent {
  final UpdatePDoneProfilePayload? updatePDoneProfilePayload;

  InformationUpdateProfilEvent(this.updatePDoneProfilePayload);
}

class InformationNoneUpdateProfilEvent extends InformationEvent {
  final UpdateNonePDoneProfilePayload? updateNonePDoneProfilePayload;

  InformationNoneUpdateProfilEvent(this.updateNonePDoneProfilePayload);
}

class GetInformationPDoneProfileEvent extends InformationEvent {}
