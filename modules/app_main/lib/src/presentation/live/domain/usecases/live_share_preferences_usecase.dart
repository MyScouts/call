import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _liveCreateKey = '_liveCreateKey';

@injectable
class LiveSharePreferenceUseCase {
  final SharedPreferences _shared;

  LiveSharePreferenceUseCase(this._shared);

  void saveLiveCreate(int uid, String value) {
    _shared.setString('$_liveCreateKey $uid', value);
  }

  Map<String, dynamic> getLiveCreate(int uid) {
    final res = _shared.getString('$_liveCreateKey $uid');
    if (res == null) return {};
    return Map<String, dynamic>.from(jsonDecode(res));
  }
}
