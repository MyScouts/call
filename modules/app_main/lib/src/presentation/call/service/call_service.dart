import 'dart:async';
import 'dart:io';

import 'package:app_core/app_core.dart';
import 'package:app_main/src/core/services/stringee/stringee_service.dart';
import 'package:app_main/src/presentation/call/service/call_manager/impl/ios_call_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';
import 'package:callkeep/callkeep.dart';

import '../models/custom_call_data.dart';
import 'models/call_service_models.dart';

part 'call_service.impl.dart';

abstract class Call1vs1Service {
  final CallServiceContext context;

  DateTime? _startTime;

  MakeCallParams? _makeCallParams;

  Call1vs1Service(
    this.context,
  );

  get call => context.userCall2 ? context.call2 : context.call;

  StringeeClient get client => context.client;

  bool get isIncomingCall => context.isIncomingCall;

  DateTime? get startTime => _startTime;

  Stream<CallEvent> get callEventStream;

  void initCall();

  void dispose() {
    call.destroy();
  }

  /// CALL FUNCTION
  Future<bool?> initAnswer();

  Future<bool?> answerCall();

  Future<bool?> makeCall(MakeCallParams params);

  Future<bool?> hangup();

  Future<bool?> reject();

  Future<bool?> mute(bool isMute);

  Future<bool?> setSpeakerphoneOn(bool isSpeaker);

  Future<bool?> switchCamera();

  Future<bool?> enableVideo(bool isEnabled);

  @override
  String toString() {
    return '''Call1vs1Service(
  client: ${client.hasConnected}, 
  call: ${call.id} - from: ${call.from} - to: ${call.to}, 
  isIncomingCall: $isIncomingCall, 
  startTime: $_startTime, 
  makeCallParams: ${_makeCallParams?.toJson()}
)''';
  }
}
