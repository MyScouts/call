import 'dart:async';

import 'package:flutter/material.dart';
import 'deeplink_constants.dart';
import 'deeplink_type.dart';

extension DeeplinkCoordinator on BuildContext {
  ///
  /// deeplink epic example
  /// deeplink://profile/1
  /// deeplink://comment/1
  ///
  Future<T?> startDeeplink<T>(String url) async {
    if (url.contains(DeeplinkConstants.deeplinkPrefix)) {
      final params = url.split('/');
      if (params.length > 3) {
        final epic = params[2];
        final deeplinkScreen = convertToDeeplinkScreen(epic);
        final id = params[3];

        final liveID = id.split(':').first;
        final type = id.split(':').last;

        // switch (deeplinkScreen) {
        //   case DeeplinkScreen.comment:
        //     return startCommentWithPostId(int.parse(id));
        //   case DeeplinkScreen.profile:
        //     return startPDoneByUserId(int.parse(id));
        //   case DeeplinkScreen.joinLive:
        //     return joinLive(int.parse(liveID), type);
        //   case DeeplinkScreen.hostStartLive:
        //     return joinLive(int.parse(liveID), type);
        //   case DeeplinkScreen.conversation:
        //     return startConversationDetailWithUserId(int.parse(id));
        //   default:
        //     break;
        // }
      }
    }
    return null;
  }
}
