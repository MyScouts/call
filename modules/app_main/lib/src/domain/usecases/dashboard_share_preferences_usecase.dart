import 'dart:convert';

import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _dashboardItems = '_dashboardItems';

@injectable
class DashboardSharePreferenceUseCase {
  final SharedPreferences _shared;

  DashboardSharePreferenceUseCase(this._shared);

  Future<bool> saveDashboardItems(String key, List<DashBoardItem> items) async {
    return _shared.setString(
        '$key $_dashboardItems', jsonEncode(items.map((e) => e.toJson()).toList()));
  }

  List<DashBoardItem> getDashBoardItems(String key) {
    final str = _shared.getString('$key $_dashboardItems');
    if (str == null) return [];
    final list = List<Map<String, dynamic>>.from(jsonDecode(str));
    return list.map((e) {
      final String id = e['id'] ?? '';
      if (id.trim().isEmpty) return DashBoardIconItem.empty();
      if (id.contains('wg_')) {
        return DashBoardWidgetItem.fromJson(e);
      } else if (id.contains('ic_')) {
        return DashBoardIconItem.fromJson(e);
      }
      return DashBoardGroupItem.fromJson(e);
    }).toList();
  }
}
