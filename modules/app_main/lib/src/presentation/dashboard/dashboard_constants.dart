import 'package:app_main/src/presentation/community/community.component.dart';
import 'package:app_main/src/presentation/qr_code/qr_code_screen.dart';
import 'package:app_main/src/presentation/qr_code/scan_qr_code_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';

import '../upgrade_account/upgrade_pdone/upgrade_pdone_screen.dart';

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

  bool get isIcon => this is DashBoardIconItem;

  bool get isGroup => this is DashBoardGroupItem;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'background_image': backgroundImage,
      'path': path,
      'width': width,
      'height': height,
      ...childToJson(),
    };
  }

  Map<String, dynamic> childToJson();
}

class DashBoardIconItem extends DashBoardItem {
  const DashBoardIconItem({
    required super.id,
    required super.title,
    required super.backgroundImage,
    super.path,
  }) : super(width: 1, height: 1);

  @override
  List<Object?> get props => [id, title];

  factory DashBoardIconItem.empty() => const DashBoardIconItem(
        id: 'ic_',
        title: '',
        backgroundImage: '',
      );

  @override
  Map<String, dynamic> childToJson() => {};

  factory DashBoardIconItem.fromJson(Map<String, dynamic> json) {
    return DashBoardIconItem(
      id: json['id'],
      title: json['title'],
      backgroundImage: json['background_image'],
      path: json['path'],
    );
  }
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

  @override
  Map<String, dynamic> childToJson() => {};

  factory DashBoardWidgetItem.fromJson(Map<String, dynamic> json) {
    return DashBoardWidgetItem(
      id: json['id'],
      title: json['title'],
      backgroundImage: json['background_image'],
      width: json['width'],
      height: json['height'],
      path: json['path'],
    );
  }
}

class DashBoardGroupItem extends DashBoardItem {
  final List<DashBoardIconItem> items;

  const DashBoardGroupItem({
    required super.id,
    required super.title,
    required super.backgroundImage,
    required this.items,
    super.path,
  }) : super(width: 1, height: 1);

  @override
  List<Object?> get props => [items, id, title];

  @override
  Map<String, dynamic> childToJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  factory DashBoardGroupItem.fromJson(Map<String, dynamic> json) {
    return DashBoardGroupItem(
      id: json['id'],
      title: json['title'],
      backgroundImage: json['background_image'],
      path: json['path'],
      items: List.from(json['items'] ?? [])
          .map((e) => DashBoardIconItem.fromJson(e))
          .toList(),
    );
  }

  DashBoardGroupItem copyWith({
    String? title,
    List<DashBoardIconItem>? items,
  }) {
    return DashBoardGroupItem(
      id: id,
      title: title ?? this.title,
      backgroundImage: backgroundImage,
      path: path,
      items: items ?? this.items,
    );
  }
}

class DashBoardEmptyItem extends DashBoardItem {
  const DashBoardEmptyItem()
      : super(
          width: 1,
          height: 1,
          backgroundImage: '',
          title: '',
          id: 'empty',
        );

  @override
  Map<String, dynamic> childToJson() => {};

  @override
  List<Object?> get props => [];
}

final Map<String, DashBoardItem> mapItems = {
  'wg_weather': DashBoardWidgetItem(
    id: 'wg_weather',
    title: 'Thời tiết',
    backgroundImage: IconAppConstants.icClock,
    width: 2,
    height: 2,
  ),
  'wg_clock': DashBoardWidgetItem(
    id: 'wg_clock',
    title: 'Đồng hồ',
    backgroundImage: IconAppConstants.icClock,
    width: 2,
    height: 2,
  ),
  'ic_contact': DashBoardIconItem(
    id: 'ic_contact',
    title: 'Danh bạ',
    backgroundImage: IconAppConstants.icDashboardContact,
  ),
  'ic_group_team': DashBoardIconItem(
    id: 'ic_group_team',
    title: 'Group',
    backgroundImage: IconAppConstants.icGroupTeam,
  ),
  'ic_team': DashBoardIconItem(
    id: 'ic_team',
    title: 'Team',
    backgroundImage: IconAppConstants.icDashboardContact,
  ),
  'ic_my_driver': DashBoardIconItem(
    id: 'ic_my_driver',
    title: 'My Driver',
    backgroundImage: IconAppConstants.icDoc,
  ),
  'ic_my_doctor': DashBoardIconItem(
    id: 'ic_my_doctor',
    title: 'Bác sĩ của tôi',
    backgroundImage: IconAppConstants.icDashboardContact,
  ),
  'ic_my_job': DashBoardIconItem(
    id: 'ic_my_job',
    title: 'Việc làm của tôi',
    backgroundImage: IconAppConstants.icGroupTeam,
  ),
};

final communityDefault = {
  'wg_weather': DashBoardWidgetItem(
    id: 'wg_weather',
    title: 'Thời tiết',
    backgroundImage: IconAppConstants.icClock,
    width: 2,
    height: 2,
  ),
  'wg_clock': DashBoardWidgetItem(
    id: 'wg_clock',
    title: 'Đồng hồ',
    backgroundImage: IconAppConstants.icClock,
    width: 2,
    height: 2,
  ),
  "ic_tv": DashBoardIconItem(
    id: 'ic_tv',
    title: 'Kênh',
    backgroundImage: IconAppConstants.icTv,
  ),
  "ic_bird": DashBoardIconItem(
    id: 'ic_bird',
    title: 'Nữ thần hoà bình',
    backgroundImage: IconAppConstants.icBird,
  ),
};

final personalDefault = {
  'ic_group_team': DashBoardIconItem(
    id: 'ic_group_team',
    title: 'Group/Team',
    backgroundImage: IconAppConstants.icGroupTeam,
    path: CommunityWidget.routeName,
  ),
  "ic_payment": DashBoardIconItem(
    id: 'ic_payment',
    title: 'QRCode',
    backgroundImage: IconAppConstants.icPayment,
    path: ScanQrCodeScanScreen.routeName,
  ),
  "ic_v_store": DashBoardIconItem(
    id: 'ic_v_store',
    title: 'V-Store',
    backgroundImage: IconAppConstants.icVStore,
  ),
  "ic_b_to_b": DashBoardIconItem(
    id: 'ic_b_to_b',
    title: 'B to B',
    backgroundImage: IconAppConstants.icBToB,
  ),
};

final eCommerceDefault = {
  'wg_banner': DashBoardWidgetItem(
    id: 'wg_banner',
    title: 'Big Sale',
    backgroundImage: ImageApp.banner.path,
    width: 4,
    height: 2,
  ),
  'wg_weather': DashBoardWidgetItem(
    id: 'wg_weather',
    title: 'Thời tiết',
    backgroundImage: IconAppConstants.icClock,
    width: 2,
    height: 2,
  ),
  'wg_clock': DashBoardWidgetItem(
    id: 'wg_clock',
    title: 'Đồng hồ',
    backgroundImage: IconAppConstants.icClock,
    width: 2,
    height: 2,
  ),
  "ic_tv": DashBoardIconItem(
    id: 'ic_tv',
    title: 'Kênh',
    backgroundImage: IconAppConstants.icTv,
  ),
  "ic_bird": DashBoardIconItem(
    id: 'ic_bird',
    title: 'Nữ thần hoà bình',
    backgroundImage: IconAppConstants.icBird,
  ),
  "ic_v_shop": DashBoardIconItem(
    id: 'ic_v_shop',
    title: 'V-Shop',
    backgroundImage: IconAppConstants.icDashboardContact,
  ),
  "ic_payment": DashBoardIconItem(
    id: 'ic_payment',
    title: 'QR Code',
    backgroundImage: IconAppConstants.icPayment,
    path: ScanQrCodeScanScreen.routeName,
  ),
  "ic_v_store": DashBoardIconItem(
    id: 'ic_v_store',
    title: 'V-Store',
    backgroundImage: IconAppConstants.icVStore,
  ),
  "ic_b_to_b": DashBoardIconItem(
    id: 'ic_b_to_b',
    title: 'B to B',
    backgroundImage: IconAppConstants.icBToB,
  ),
};

final mapData = {
  ...communityDefault,
  ...personalDefault,
  ...eCommerceDefault,
  ...mapItems,
};
