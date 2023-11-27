// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';

import 'package:app_core/app_core.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/exceptions/api_exception.dart';
import '../../../../data/models/payloads/auth/authentication_payload.dart';
import '../../../../domain/entities/commity_action_type.dart';
import '../../../../domain/usecases/authentication_usecase.dart';
import '../../../../domain/usecases/user_share_preferences_usecase.dart';
import '../../../../domain/usecases/user_usecase.dart';
import '../../../../core/extensions/response_dio_ext.dart';

part 'user_event.dart';

part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthenticationUsecase _authenticationUsecase;
  final UserSharePreferencesUsecase _userSharePreferencesUsecase;
  final UserUsecase _userUsecase;
  final UserInformationCubit _userInformationCubit;

  UserBloc(
    this._authenticationUsecase,
    this._userSharePreferencesUsecase,
    this._userUsecase,
    this._userInformationCubit,
  ) : super(UserInitial()) {
    on<LoadUserEvent>(_mapLoadUserEvent);
    on<LogOutEvent>(_mapLogOutEvent);
    on<AutoLoginEvent>(_mapAutoLoginEvent);
    on<LoginEvent>(_mapLoginEvent);
    on<RegisterEvent>(_mapRegisterEvent);
    on<UserUpdateAvatarEvent>(_mapUserUpdateInfoEvent);
    on<UserUpdateBgImageEvent>(_mapUserUpdateBgImageEvent);
    on<UserUpgradeAccountEvent>(_mapUserUpgradeAccountEvent);
    on<AddFollowEvent>(_mapAddFollowEvent);
    on<DeleteAccountEvent>(_mapDeleteAccountEvent);
    on<FetchUserInfoEvent>(_mapFetchUserInfoEvent);
    on<UserSetDefaultBgImageEvent>(_mapUserSetDefaultBgImageEvent);
    on<UserUpdateBirthDayEvent>(_mapUserUpdateBirthDayEvent);

    _subscriptions.add(_userInformationCubit.stream.listen((event) {
      if (!isClosed) {
        // LoadUserEvent()
      }
    }));
    _subscriptions.add(stream.listen((_) {
      _userInformationCubit.notifyUserChange(state.currentUser);
    }));
  }

  final List<StreamSubscription> _subscriptions = [];

  @override
  Future<void> close() {
    for (final element in _subscriptions) {
      element.cancel();
    }
    return super.close();
  }

  // Future<User> _loginWith(AuthenticationPayload payload, CredentialType type,
  //     bool savedPassword) async {
  //   final result =
  //       await _authenticationUsecase.login(payload: payload, type: type);
  //
  //   return result.userInfo!;
  // }

  FutureOr<void> _mapLoginEvent(
      LoginEvent event, Emitter<UserState> emit) async {
    // try {
    //   final result = await _loginWith(event.payload, event.type, true);
    //
    //   emit(Authenticated(result, DateTime.now().microsecondsSinceEpoch));
    // } on DioError catch (e) {
    //   final message = e.response?.statusCode == 502
    //       ? 'Hệ thống đang bảo trì, Vui lòng thử lại sau.'
    //       : e.response?.apiException.message ?? '-';
    //   emit(AuthenticationError(message, e));
    // } on ApiException catch (e) {
    //   emit(AuthenticationError(e.message, e));
    // } catch (e) {
    //   emit(AuthenticationError(e.toString(), e));
    // }
  }

  FutureOr<void> _mapLoadUserEvent(
      LoadUserEvent event, Emitter<UserState> emit) async {
    print('stringgee token ${event.stringeeToken}');
    // await _userSharePreferencesUsecase.saveToken(event.token);
    // emit(Authenticated(event.user, DateTime.now().microsecondsSinceEpoch));
  }

  FutureOr<void> _mapLogOutEvent(
      LogOutEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLogoutOutSuccess());
    } on Exception catch (e) {
      emit(UserLogOutFailure(
        error: 'Some thing went wrong!!!\n${kDebugMode ? e.toString() : ''}',
      ));
    }
  }

  FutureOr<void> _mapAutoLoginEvent(
      AutoLoginEvent event, Emitter<UserState> emit) async {
    final userInfo = _userSharePreferencesUsecase.getUserInfo();
    if (userInfo != null) {
      emit(Authenticated(userInfo, DateTime.now().microsecondsSinceEpoch));
    }
    final id = userInfo?.id;

    if (id != null) {
      final user = await _userUsecase.geSynctUserById(id);
      if (user != null) {
        emit(Authenticated(user, DateTime.now().microsecondsSinceEpoch));
      }
    }
  }

  FutureOr<void> _mapRegisterEvent(
      RegisterEvent event, Emitter<UserState> emit) async {
    // try {
    //   if (event.type == CredentialType.phone) {
    //     final result =
    //         await _authenticationUsecase.registerWithPhone(event.payload);
    //     emit(RegisterSuccess(
    //       username: event.payload.username,
    //       type: event.type,
    //       token: result.token,
    //     ));
    //   } else {
    //     final token =
    //         await _authenticationUsecase.registerWithEmail(event.payload);
    //     emit(RegisterSuccess(
    //       username: event.payload.username,
    //       type: event.type,
    //       token: token,
    //     ));
    //   }
    // } on DioError catch (e) {
    //   emit(RegisterError(e.response?.apiException.message ?? '-', e));
    // } on ApiException catch (e) {
    //   emit(RegisterError(e.message, e));
    // } catch (e) {
    //   final message = 'Some thing went wrong!${kDebugMode ? e.toString() : ''}';
    //   emit(RegisterError(message, e));
    // }
  }

  FutureOr<void> _mapUserUpdateInfoEvent(
      UserUpdateAvatarEvent event, Emitter<UserState> emit) async {
    final currentState = state;
    if (currentState is Authenticated) {
      final newUser = currentState.userInfo.copyWith(avatar: event.imgUrl);

      await _userSharePreferencesUsecase.saveUserInfo(newUser);
      emit(Authenticated(newUser, DateTime.now().microsecondsSinceEpoch));
    }
  }

  FutureOr<void> _mapUserUpdateBgImageEvent(
      UserUpdateBgImageEvent event, Emitter<UserState> emit) async {
    final currentState = state;
    if (currentState is Authenticated) {
      final newUser = currentState.userInfo
          .copyWith(backgroundImages: event.user.backgroundImages);

      await _userSharePreferencesUsecase.saveUserInfo(newUser);
      emit(Authenticated(newUser, DateTime.now().microsecondsSinceEpoch));
    }
  }

  FutureOr<void> _mapUserUpgradeAccountEvent(
      UserUpgradeAccountEvent event, Emitter<UserState> emit) async {
    final currentState = state;
    if (currentState is Authenticated) {
      final newUser = event.type == PDoneActionType.registerJA
          ? currentState.userInfo.copyWith(isJA: true)
          : currentState.userInfo.copyWith(isPDone: true);
      // : (event.type == PDoneActionType.registerVShop
      //     ? currentState.userInfo.copyWith(isVShop: true)
      //     : currentState.userInfo.copyWith(isPDone: true));

      await _userSharePreferencesUsecase.saveUserInfo(newUser);
      emit(
        UpgradeAccountSuccess(
            newUser, DateTime.now().microsecondsSinceEpoch, event.type),
      );
    }
  }

  FutureOr<void> _mapAddFollowEvent(
      AddFollowEvent event, Emitter<UserState> emit) async {
    final currentState = state;
    bool? isUnfollow;
    // try {
    //   if (currentState is Authenticated) {
    //     var user = currentState.userInfo;
    //
    //     if (event.isFriend) {
    //       // bạn bè -> remove
    //       final result =
    //           await _userUsecase.unfollow(UnfollowPayload(event.userId));
    //       // final count = result ? 1 : -1;
    //       if (result) {
    //         user = user.copyWith(
    //           totalFriend: user.totalFriend - 1,
    //         );
    //         isUnfollow = true;
    //       }
    //     } else {
    //       if (event.isAddFollow) {
    //         // người hâm hộ -> check friends để + totalFriend
    //         final result =
    //             await _userUsecase.addFollow(FollowPayload(id: event.userId));
    //
    //         final isFriend = result.isFriend ?? false;
    //         final countFriend = isFriend ? 1 : 0;
    //
    //         user = user.copyWith(
    //           totalFriend: user.totalFriend + countFriend,
    //           totalFollower: user.totalFollower + (countFriend == 1 ? -1 : 0),
    //           totalFollowing: user.totalFollowing + 1,
    //         );
    //
    //         await _userSharePreferencesUsecase.saveUserInfo(user);
    //         isUnfollow = false;
    //       } else {
    //         // đang theo dõi
    //         final result =
    //             await _userUsecase.unfollow(UnfollowPayload(event.userId));
    //         isUnfollow = true;
    //         // final count = result ? 1 : -1;
    //         if (result) {
    //           user = user.copyWith(
    //             totalFollowing: user.totalFollowing - 1,
    //           );
    //         }
    //       }
    //     }
    //
    //     emit(UserAddFollowSuccess(
    //       user,
    //       DateTime.now().microsecondsSinceEpoch,
    //       event.isAddFollow,
    //       event.userId,
    //       isUnfollow,
    //     ));
    //   }
    // } catch (e) {
    //   final currentState = state;
    //   if (currentState is Authenticated) {
    //     final user = currentState.userInfo;
    //     emit(
    //       UserAddFollowFail(
    //         user,
    //         DateTime.now().microsecondsSinceEpoch,
    //         event.isAddFollow,
    //       ),
    //     );
    //   }
    //   log(e.toString());
    // }
  }

  FutureOr<void> _mapDeleteAccountEvent(
      DeleteAccountEvent event, Emitter<UserState> emit) async {
    try {
      // await _userSharePreferencesUsecase.logout();

      await Future.delayed(const Duration(seconds: 2));
      emit(UserDeleteAccountSuccess());
    } on Exception catch (e) {
      emit(UserLogOutFailure(
        error: 'Some thing went wrong!!!\n${kDebugMode ? e.toString() : ''}',
      ));
    }
  }

  FutureOr<void> _mapFetchUserInfoEvent(
      FetchUserInfoEvent event, Emitter<UserState> emit) async {
    final userInfo = _userSharePreferencesUsecase.getUserInfo();
    final id = userInfo?.id;

    if (id != null) {
      final user = await _userUsecase.geSynctUserById(id);

      if (user != null) {
        await _userSharePreferencesUsecase.saveUserInfo(user);
        emit(Authenticated(user, DateTime.now().microsecondsSinceEpoch));
      }
    }
  }

  FutureOr<void> _mapUserSetDefaultBgImageEvent(
      UserSetDefaultBgImageEvent event, Emitter<UserState> emit) async {
    final currentState = state;
    if (currentState is Authenticated) {
      final newUser = currentState.userInfo
          .copyWith(defaultBackground: event.user.defaultBackground);

      await _userSharePreferencesUsecase.saveUserInfo(newUser);
      emit(Authenticated(newUser, DateTime.now().microsecondsSinceEpoch));
    }
  }

  FutureOr<void> _mapUserUpdateBirthDayEvent(
      UserUpdateBirthDayEvent event, Emitter<UserState> emit) async {
    final currentState = state;
    if (currentState is Authenticated) {
      // final newUser = currentState.userInfo.copyWith(birthday: event.birthDay);
      //
      // await _userSharePreferencesUsecase.saveUserInfo(newUser);
      // emit(Authenticated(newUser, DateTime.now().microsecondsSinceEpoch));
    }
  }
}
