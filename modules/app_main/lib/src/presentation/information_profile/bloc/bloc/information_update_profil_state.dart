part of 'information_update_profil_bloc.dart';

@immutable
sealed class InformationUpdateProfilState {}

final class InformationUpdateProfilInitial extends InformationUpdateProfilState {}

final class InformationUpdateProfilLoading extends InformationUpdateProfilState {}

final class InformationNoneUpdateProfilSuccess extends InformationUpdateProfilState {}

final class InformationUpdateProfilSuccess extends InformationUpdateProfilState {}

final class GetInformationPDoneProfileLoading extends InformationUpdateProfilState {}

final class GetInformationPDoneProfileSuccess extends InformationUpdateProfilState {
  final UpdateNonePDoneProfileReponse user;

  GetInformationPDoneProfileSuccess({required this.user});
}

final class GetInformationPDoneProfileFailed extends InformationUpdateProfilState {
  final String? message;

  GetInformationPDoneProfileFailed({required this.message});
}

final class InformationUpdateProfilFailed extends InformationUpdateProfilState {
  final String? message;

  InformationUpdateProfilFailed({required this.message});
}
