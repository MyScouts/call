abstract class AppCoordinatorShared {
  // AppCoordinatorCore get appCoordinatorShared => injector.get();

  // @override
  // BuildContext? get context => appCoordinatorShared.context;

  Future<T?> startChat<T>(int userId, {String? name, String? avatar});

  Future<T?> startUserProfile<T>(int userId);

  Future<T?> startDialogUpgradeKyc<T>();

  Future<T?> startUpgradeJA<T>();

  Future<T?> startUpgradeVShopScreen<T>();

  Future<T?> startLogin<T>(bool hasDashboard);

  void openDashboardDrawerMenu();
}
