import 'package:app_main/src/presentation/marshop/register_marshop/register_marshop_screen.dart';
import 'package:app_main/src/presentation/upgrade_account/upgrade_pdone/upgrade_pdone_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppItem {
  final int id;
  final String title;
  final String avatar;
  final String? routeName;
  final int width;
  final int height;

  AppItem({
    required this.id,
    required this.avatar,
    required this.title,
    this.routeName,
    this.height = 1,
    this.width = 1,
  });

  static List<AppItem> get personalApps => [
        AppItem(
          id: 1,
          avatar: IconAppConstants.icGroupTeam,
          title: "Group/Team",
          routeName: UpgradePDoneScreen.routeName,
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
          routeName: RegisterMarshopScreen.routeName,
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
          routeName: RegisterMarshopScreen.routeName,
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

abstract class DashBoardItem extends Equatable {
  final String id;
  final String title;
  final String backgroundImage;
  final String? path;
  final int width;
  final int height;

  const DashBoardItem({
    required this.id,
    required this.title,
    required this.backgroundImage,
    required this.width,
    required this.height,
    this.path,
  });

  bool get isWidget => this is DashBoardWidgetItem;
}

class DashBoardIconItem extends DashBoardItem {
  const DashBoardIconItem({
    required super.id,
    required super.title,
    required super.backgroundImage,
    super.path,
    int? width,
    int? height,
  }) : super(width: 1, height: 1);

  @override
  List<Object?> get props => [id];

  factory DashBoardIconItem.empty() => const DashBoardIconItem(
        id: '',
        title: '',
        backgroundImage: '',
        width: 1,
        height: 1,
      );
}

class DashBoardWidgetItem extends DashBoardItem {
  const DashBoardWidgetItem({
    required super.id,
    required super.title,
    required super.backgroundImage,
    required super.width,
    required super.height,
    super.path,
  });

  @override
  List<Object?> get props => [id];
}

final Map<String, DashBoardItem> mapItems = {
  'weather': DashBoardWidgetItem(
    id: 'weather',
    title: 'Thời tiết',
    backgroundImage: IconAppConstants.icClock,
    width: 2,
    height: 2,
  ),
  'clock': DashBoardWidgetItem(
    id: 'clock',
    title: 'Đồng hồ',
    backgroundImage: IconAppConstants.icClock,
    width: 2,
    height: 2,
  ),
  'contact': DashBoardIconItem(
    id: 'contact',
    title: 'Danh bạ',
    backgroundImage: IconAppConstants.icDashboardContact,
    width: 1,
    height: 1,
  ),
  'group': DashBoardIconItem(
    id: 'group',
    title: 'Group',
    backgroundImage: IconAppConstants.icDashboardContact,
    width: 1,
    height: 1,
  ),
  'team': DashBoardIconItem(
    id: 'Team',
    title: 'Team',
    backgroundImage: IconAppConstants.icDashboardContact,
    width: 1,
    height: 1,
  ),
};
