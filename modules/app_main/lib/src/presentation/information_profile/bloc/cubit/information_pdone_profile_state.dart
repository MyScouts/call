part of 'information_pdone_profile_cubit.dart';

@immutable
sealed class InformationPdoneProfileState {
  InformationPdoneProfile? get currentInforPDone {
    final userState = this;
    if (userState is GetInforProfileSuccess) {
      return userState.userInfo;
    }
    return null;
  }

  InformationNonePdoneProfile? get currentInforNonePDone {
    final userState = this;
    if (userState is GetInforNoneProfileSuccess) {
      return userState.userInfo;
    }
    return null;
  }
}

class GetInforProfileSuccess extends InformationPdoneProfileState {
  final InformationPdoneProfile? userInfo;

  GetInforProfileSuccess(this.userInfo);
}

class GetInforProfileError extends InformationPdoneProfileState {
  final String message;

  GetInforProfileError(this.message);
}

class GetInforNoneProfileSuccess extends InformationPdoneProfileState {
  final InformationNonePdoneProfile? userInfo;

  GetInforNoneProfileSuccess(this.userInfo);
}

class GetInforNoneProfileError extends InformationPdoneProfileState {
  final String message;

  GetInforNoneProfileError(this.message);
}

final class InformationPdoneProfileInitial extends InformationPdoneProfileState {}
