part of 'information_update_profil_bloc.dart';

@immutable
sealed class InformationUpdateProfilState {}

final class InformationUpdateProfilInitial extends InformationUpdateProfilState {}

final class InformationUpdateProfilLoading extends InformationUpdateProfilState {}

final class InformationNoneUpdateProfilSuccess extends InformationUpdateProfilState {
  final UpdateNonePDoneProfileReponse user;

  InformationNoneUpdateProfilSuccess({required this.user});
}

final class InformationUpdateProfilSuccess extends InformationUpdateProfilState {
  final UpdatePDoneProfileReponse user;

  InformationUpdateProfilSuccess({required this.user});
}

final class InformationUpdateProfilFailed extends InformationUpdateProfilState {
  final String? message;

  InformationUpdateProfilFailed({required this.message});
}
