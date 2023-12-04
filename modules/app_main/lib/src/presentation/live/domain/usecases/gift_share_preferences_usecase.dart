import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class GiftSharePreferencesUseCase {
  final SharedPreferences _shared;

  GiftSharePreferencesUseCase(this._shared);

  Future<void> saveGift(String path) async {
    await _shared.setString(path, path);
  }

  File? getGift(String path) {
    final stringPath = _shared.getString(path);
    if (stringPath == null) {
      return null;
    }
    return File(stringPath);
  }
}
