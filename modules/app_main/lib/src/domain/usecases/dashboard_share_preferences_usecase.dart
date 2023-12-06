import 'dart:convert';

import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _dashboardItems = '_dashboardItems';
const _dashboardPage = '_dashboardPage';
const _dashboardFav = '_dashboardFav';
const _dashboardPath = '_dashboardPath';

@injectable
class DashboardSharePreferenceUseCase {
  final SharedPreferences _shared;

  DashboardSharePreferenceUseCase(this._shared);

  Future<bool> saveDashboardItems(String key, List<DashBoardItem> items) async {
    return _shared.setString('$key $_dashboardItems',
        jsonEncode(items.map((e) => e.toJson()).toList()));
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

  String getDashBoardBg(String key) {
    return _shared.getString('$key $_dashboardItems') ?? '';
  }

  Future<bool> saveDashBoardBg(String key, String path) {
    return _shared.setString('$key $_dashboardItems', path);
  }

  int? getPageInitial(String key) {
    return _shared.getInt('$key $_dashboardPage');
  }

  void savePage(String key, int page) {
    _shared.setInt('$key $_dashboardPage', page);
  }

  void removePage(String key) {
    _shared.remove('$key $_dashboardPage');
  }

  Future<bool> saveDashboardItemsFav(List<DashBoardItem> items) async {
    return _shared.setString(
        _dashboardFav, jsonEncode(items.map((e) => e.toJson()).toList()));
  }

  List<DashBoardItem> getDashBoardFav() {
    final str = _shared.getString(_dashboardFav);
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

  void saveInitPath(String key, String id) {
    _shared.setString('$key $_dashboardPath', id);
  }

  String? getInitPath(String key) {
    return _shared.getString('$key $_dashboardPath');
  }

  void removeInitPath(String key) {
    _shared.remove('$key $_dashboardPath');
  }
}
