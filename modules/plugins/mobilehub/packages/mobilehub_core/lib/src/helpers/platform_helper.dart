import 'package:universal_platform/universal_platform.dart';

bool get isMobile => UniversalPlatform.isIOS || UniversalPlatform.isAndroid;
bool get isAndroid => UniversalPlatform.isAndroid;
bool get isIOS => UniversalPlatform.isIOS;

String get currentPlatformName {
  if (UniversalPlatform.isIOS) {
    return 'ios';
  } else if (UniversalPlatform.isAndroid) {
    return 'android';
  } else if (UniversalPlatform.isMacOS) {
    return 'macos';
  } else if (UniversalPlatform.isWeb) {
    return 'web';
  } else if (UniversalPlatform.isWindows) {
    return 'windows';
  }
  return 'unknow';
}

class PlatformUniversal {
  bool get isAndroid => UniversalPlatform.isAndroid;
  bool get isIOS => UniversalPlatform.isIOS;

  String get platform => currentPlatformName;
}
