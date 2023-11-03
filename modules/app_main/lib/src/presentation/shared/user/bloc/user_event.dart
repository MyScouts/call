part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoadUserEvent extends UserEvent {
  final User user;
  final String token;
  final String? stringeeToken;

  LoadUserEvent({
    required this.user,
    required this.token,
    this.stringeeToken,
  });
}

class LoginEvent extends UserEvent {
  final AuthenticationPayload payload;
  final CredentialType type;

  LoginEvent(this.payload, this.type);
}

class LoadUserInformationEvent extends UserEvent {
  final User user;

  LoadUserInformationEvent(this.user);
}

class RegisterEvent extends UserEvent {
  final AuthenticationPayload payload;
  final CredentialType type;

  RegisterEvent(this.payload, this.type);
}

class LogOutEvent extends UserEvent {}

class AutoLoginEvent extends UserEvent {}

class FetchUserInfoEvent extends UserEvent {}

class UserUpdateAvatarEvent extends UserEvent {
  final String imgUrl;

  UserUpdateAvatarEvent(this.imgUrl);
}

class UserUpdateBirthDayEvent extends UserEvent {
  final DateTime birthDay;

  UserUpdateBirthDayEvent(this.birthDay);
}

class UserUpdateBgImageEvent extends UserEvent {
  final User user;

  UserUpdateBgImageEvent(this.user);
}

class UserSetDefaultBgImageEvent extends UserEvent {
  final User user;

  UserSetDefaultBgImageEvent(this.user);
}

class UserUpgradeAccountEvent extends UserEvent {
  final PDoneActionType type;

  UserUpgradeAccountEvent(this.type);
}

class AddFollowEvent extends UserEvent {
  final int userId;
  final bool isAddFollow;
  final bool isFriend;

  AddFollowEvent(
    this.userId,
    this.isAddFollow, {
    this.isFriend = false,
  });
}

class DeleteAccountEvent extends UserEvent {}
