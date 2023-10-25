import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/usecases/authentication_usecase.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

@singleton
class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final AuthenticationUsecase _authenticationUsecase;
  // final UserSharePreferencesUsecase _userSharePreferencesUsecase;

  AppSettingBloc(
    this._authenticationUsecase,
    // this._userSharePreferencesUsecase,
  ) : super(const AppStateInitial(
          '', // _userSharePreferencesUsecase.getLanguage(),
          '', // _userSharePreferencesUsecase.getCountry(),
          0, // _userSharePreferencesUsecase.getBottomBarIndex(),
        )) {
    on<SaveLanguageEvent>(mapSaveLanguageEvent);
    on<BottomBarItemSelected>(_mapBottomBarItemSelected);
    on<UserLogoutEvent>(_mapUserLogoutEvent, transformer: sequential());
    on<OpenDashboardDrawerMenuEvent>(_mapOpenDashboardDrawerMenuEvent);
  }

  FutureOr<void> mapSaveLanguageEvent(
      SaveLanguageEvent event, Emitter<AppSettingState> emit) async {
    // final isSaved =
    //     await _userSharePreferencesUsecase.saveLanguage(event.language);

    // if (isSaved) {
    //   emit(SaveLanguageSuccess(event.language, state.countryCode, state.index));
    // }
  }

  FutureOr<void> _mapBottomBarItemSelected(
      BottomBarItemSelected event, Emitter<AppSettingState> emit) {
    if (event.index != state.index) {
      emit(ButtombarSelected(
          state.languageCode, state.countryCode, event.index, event.handler));
    }
  }

  FutureOr<void> _mapUserLogoutEvent(
      UserLogoutEvent event, Emitter<AppSettingState> emit) async {
    try {
      await _authenticationUsecase.signOut(event.force);
      // final lang = _userSharePreferencesUsecase.getLanguage();
      // emit(AppForceLogoutSuccess(
      //   lang,
      //   state.countryCode,
      //   0,
      //   DateTime.now().microsecondsSinceEpoch,
      // ));
    } catch (e) {
      if (kDebugMode) {
        throw Exception(e);
      }
    }
  }

  FutureOr<void> _mapOpenDashboardDrawerMenuEvent(
      OpenDashboardDrawerMenuEvent event, Emitter<AppSettingState> emit) {
    emit(OpenDashboardDrawerMenuState(
        state.languageCode, state.countryCode, state.index));
  }
}
