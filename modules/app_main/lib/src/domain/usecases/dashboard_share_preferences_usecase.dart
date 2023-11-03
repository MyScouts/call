import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _dashboardItems = '_dashboardItems';

@injectable
class DashboardSharePreferenceUseCase {
  final SharedPreferences _shared;

  DashboardSharePreferenceUseCase(this._shared);

  Future<bool> saveDashboardItems(List<String> items) async {
    return _shared.setStringList(_dashboardItems, items);
  }

  List<String> getDashBoardItems() =>
      _shared.getStringList(_dashboardItems) ?? [];
}
