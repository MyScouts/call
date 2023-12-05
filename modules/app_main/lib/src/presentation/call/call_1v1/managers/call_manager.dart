
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stringee_flutter_plugin/stringee_flutter_plugin.dart';

const String kFrom = 'from';
const String kTo = 'to';
const String kisVideoCall = 'isVideoCall';
const String kCustomData = 'customData';
const String kVideoQuality = 'videoQuality';

class CallManager {


  final StringeeClient client = StringeeClient();
  final FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();

  static CallManager? _instance;
  static CallManager get shared {
    _instance ??= CallManager._internal();
    return _instance!;
  }
  CallManager._internal();
}