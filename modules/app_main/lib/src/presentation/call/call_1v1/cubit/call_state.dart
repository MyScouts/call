import 'package:app_core/app_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'call_state.freezed.dart';

@freezed
abstract class CallState with _$CallState {
  const factory CallState({User? participant,required int callId,
  required bool isVideo,
  }) = CallStateData;

}
