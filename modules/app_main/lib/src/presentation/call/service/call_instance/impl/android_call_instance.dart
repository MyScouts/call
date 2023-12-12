import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

import '../call_instance.dart';

class AndroidCallInstance extends CallInstance {
  AndroidCallInstance(super.bloc);

  @override
  bool ended() {
    if (signalingState == StringeeSignalingState.busy ||
        signalingState == StringeeSignalingState.ended) {
      return true;
    }

    return false;
  }
}
