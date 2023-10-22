

enum DeeplinkScreen {
  profile,
  comment,
  post,
  conversation,
  joinLive,
  hostStartLive
}

DeeplinkScreen? convertToDeeplinkScreen(String value) {
  final map = {
    'profile': DeeplinkScreen.profile,
    'comment': DeeplinkScreen.comment,
    'post': DeeplinkScreen.post,
    'joinLive': DeeplinkScreen.joinLive,
    'conversation': DeeplinkScreen.conversation,
    'hostStartLive': DeeplinkScreen.hostStartLive
  };

  return map[value];
}

// extension NotificExt on NotificationInfo {
//   String toLink() {
//     final deeplinkType = convertToNotificationType(type);
//     switch (deeplinkType) {
//       case NotificationType.follow:
//       case NotificationType.friended:
//         return '${DeeplinkConstants.deeplinkPrefix}${DeeplinkScreen.profile.name}/$fromUserId';
//       case NotificationType.likePost:
//       case NotificationType.commentPost:
//       case NotificationType.postNews:
//       case NotificationType.replayComment:
//         return '${DeeplinkConstants.deeplinkPrefix}${DeeplinkScreen.comment.name}/$postId';
//       case NotificationType.joinLive:
//         return '${DeeplinkConstants.deeplinkPrefix}${DeeplinkScreen.joinLive.name}/${metaData?.liveId}:${metaData?.liveType}';
//       case NotificationType.hostStartLive:
//         return '${DeeplinkConstants.deeplinkPrefix}${DeeplinkScreen.hostStartLive.name}/${metaData?.liveId}:${metaData?.liveType}';
//       default:
//         break;
//     }

//     return '';
//   }
// }
