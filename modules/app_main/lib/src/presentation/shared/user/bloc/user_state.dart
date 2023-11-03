part of 'user_bloc.dart';

@immutable
abstract class UserState {
  User? get currentUser {
    final userState = this;
    if (userState is Authenticated) {
      return userState.userInfo;
    }
    return null;
  }
}

class UserInitial extends UserState {}

class Authenticated extends UserState {
  final User userInfo;
  final int timespan;

  Authenticated(this.userInfo, this.timespan);
}

class UserAddFollowSuccess extends Authenticated {
  final bool isAddFollow;
  final int targetUserId;
  final bool? isUnfollow;

  UserAddFollowSuccess(
    super.userInfo,
    super.timespan,
    this.isAddFollow,
    this.targetUserId,
    this.isUnfollow,
  );
}

class UpgradeAccountSuccess extends Authenticated {
  final PDoneActionType type;

  UpgradeAccountSuccess(
    super.userInfo,
    super.timespan,
    this.type,
  );
}

class UserLogOutFailure extends UserState {
  final String error;

  UserLogOutFailure({
    required this.error,
  });
}

class UserLogoutOutSuccess extends UserState {}

class UserDeleteAccountSuccess extends UserState {}

class AuthenticationError extends UserInitial {
  final String message;
  final dynamic error;

  AuthenticationError(this.message, this.error);
}

class RegisterError extends UserInitial {
  final String message;
  final dynamic error;

  RegisterError(this.message, this.error);
}

class RegisterSuccess extends UserState {
  final String token;
  final String username;
  final CredentialType type;

  RegisterSuccess({
    required this.token,
    required this.username,
    required this.type,
  });
}

class UserAddFollowFail extends Authenticated {
  final bool isAddFollow;

  UserAddFollowFail(
    super.userInfo,
    super.timespan,
    this.isAddFollow,
  );
}
