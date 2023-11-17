import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/bloc/core_bloc.dart';
import 'package:app_main/src/core/bloc/core_state.dart';
import 'package:app_main/src/core/utils/toast_message/toast_message.dart';
import 'package:app_main/src/data/models/payloads/user/user_action_payload.dart';
import 'package:app_main/src/data/models/responses/user_response.dart';
import 'package:app_main/src/domain/entities/update_account/information_none_pdone_profile.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class UserProfileBloc extends CoreBloc<UserProfileEvent, UserProfileState> {
  final UserUsecase useCase;

  UserProfileBloc(this.useCase) : super(UserProfileState()) {
    on<_FetchData>(onFetchData);
    on<SubmitDataNonePDone>(
      onSubmitDataNonePDone,
      transformer: (event, mapper) => event.exhaustMap(mapper),
    );
    add(_FetchData());
  }

  void onSubmitDataNonePDone(
    SubmitDataNonePDone event,
    Emitter<UserProfileState> emit,
  ) async {
    AppCoordinator.root.currentContext?.showLoading();
    try {
      final res = await useCase.updateNonePNoneDoneProfile(event.payload);
      AppCoordinator.root.currentContext?.hideLoading();
      AppCoordinator.root.currentContext?.showToastMessage(
        'Cập nhật thông tin thành công',
      );
      emit(state.copyWith(pDoneProfile: res.profile));
    } catch (e) {
      AppCoordinator.root.currentContext?.hideLoading();
      AppCoordinator.root.currentContext?.showToastMessage(
        'Cập nhật thông tin không thành công',
        ToastMessageType.error,
      );
    }
  }

  void onFetchData(
    _FetchData event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    final res = await Future.wait([
      useCase.onboarding(),
      useCase.getProfile(),
    ]);

    final onBoarding = res.first as OnboardingResponse;
    final profile = res.last as User?;

    emit(state.copyWith(user: profile, isPDone: onBoarding.isPdone));

    try {
      final res = await useCase.getPDoneProfile();
      emit(state.copyWith(pDoneProfile: res.profile));
    } catch (e) {

    }

    emit(state.copyWith(status: StateStatus.success));
  }
}

class UserProfileState extends CoreState {
  final bool isPDone;
  final InformationNonePdoneProfile? pDoneProfile;
  final User? user;

  UserProfileState({
    this.isPDone = false,
    this.pDoneProfile,
    this.user,
    super.status,
  });

  UserProfileState copyWith({
    StateStatus? status,
    bool? isPDone,
    InformationNonePdoneProfile? pDoneProfile,
    User? user,
  }) {
    return UserProfileState(
      status: status ?? this.status,
      isPDone: isPDone ?? this.isPDone,
      pDoneProfile: pDoneProfile ?? this.pDoneProfile,
      user: user ?? this.user,
    );
  }

  bool get isInfoEmpty {
    return pDoneProfile == null;
  }
}

abstract class UserProfileEvent {}

class _FetchData extends UserProfileEvent {}

class SubmitDataNonePDone extends UserProfileEvent {
  final UpdateNonePDoneProfilePayload payload;

  SubmitDataNonePDone(this.payload);
}
