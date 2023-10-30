import 'package:design_system/design_system.dart';

class AppItem {
  final int id;
  final String title;
  final String avatar;
  final String? routeName;
  final int width;
  final int height;
  int sort;

  AppItem({
    required this.id,
    required this.avatar,
    required this.title,
    this.routeName,
    this.height = 1,
    this.width = 1,
    this.sort = 0,
  });

  static List<AppItem> get personalApps => [
        AppItem(
          id: 1,
          avatar: IconAppConstants.icGroupTeam,
          title: "Group/Team",
        ),
        AppItem(
          id: 2,
          avatar: IconAppConstants.icPayment,
          title: "Thanh Toán",
        ),
        AppItem(
          id: 3,
          avatar: IconAppConstants.icVStore,
          title: "VStore",
        ),
        AppItem(
          id: 4,
          avatar: IconAppConstants.icBToB,
          title: "B To B",
        ),
      ];

  static List<AppItem> get personalStore => [
        AppItem(
          id: 1,
          avatar: IconAppConstants.icGroupTeam,
          title: "Group/Team",
        ),
        AppItem(
          id: 2,
          avatar: IconAppConstants.icPayment,
          title: "Thanh Toán",
        ),
        AppItem(
          id: 3,
          avatar: IconAppConstants.icVStore,
          title: "VStore",
        ),
        AppItem(
          id: 4,
          avatar: IconAppConstants.icBToB,
          title: "B To B",
        ),
        AppItem(
          id: 5,
          avatar: IconAppConstants.icChanel,
          title: "Kênh",
        ),
        AppItem(
          id: 6,
          avatar: IconAppConstants.icWheelOfFortune,
          title: "Vòng quay may mắn",
          height: 2,
          width: 2,
        ),
      ];
}

enum DashboardType { community, personal, ecommerce }
