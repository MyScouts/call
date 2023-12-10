import 'package:app_core/app_core.dart';
import 'package:app_main/src/data/models/payloads/call/new_call_payload.dart';
import 'package:app_main/src/data/models/payloads/call/update_call_payload.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/entities/call/result_response_model.dart';
import 'package:app_main/src/domain/usecases/call_usecase.dart';
import 'package:app_main/src/domain/usecases/user_usecase.dart';
import 'package:app_main/src/presentation/call/call_1v1/cubit/call_state.dart';
import 'package:app_main/src/presentation/call/call_1v1/managers/android_call_manager.dart';
import 'package:app_main/src/presentation/call/call_1v1/managers/ios_call_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class CallCubit extends Cubit<CallState> {
  final CallUseCase _callUseCase;
  final UserUsecase _userUseCase;

  AndroidCallManager androidCallManager = AndroidCallManager.shared;
  IOSCallManager iOSCallManager = IOSCallManager.shared;
  CallCubit(this._callUseCase, this._userUseCase)
      : super(const CallStateData(callId: 0, isVideo: false));

  Future<void> init({required NewCallPayload payload, required bool isVideo}) async {
    final ResultResponseModel response = await _callUseCase.newCall(payload: payload);
    emit(CallStateData(callId: response.result, isVideo: isVideo));
  }

  Future<void> getParticipant(int id) async {
    final User? _user = await _userUseCase.geSynctUserById(id);
    emit(state.copyWith(participant: _user));
  }

  Future<void> updateCall() async {
    await _callUseCase.updateCall(
        payload: UpdateCallPayload(type: state.isVideo ? 2 : 1), callId: state.callId);
  }
}
