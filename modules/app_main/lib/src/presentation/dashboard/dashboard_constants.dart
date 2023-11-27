import 'package:app_main/src/presentation/community/community.component.dart';
import 'package:app_main/src/presentation/dashboard/system_setting/system_setting.dart';
import 'package:app_main/src/presentation/call/phone_book/phone_book_page.dart';
import 'package:app_main/src/presentation/qr_code/scan_qr_code_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:staggered_reorderable/staggered_reorderable.dart';

enum DashboardType { community, personal, ecommerce }

enum AppId { team }

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

  CustomerItemType get type;

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

  @override
  CustomerItemType get type => CustomerItemType.icon;
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
  CustomerItemType get type => CustomerItemType.widget;

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
  CustomerItemType get type => CustomerItemType.group;

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

final Map<String, DashBoardItem> mapItems = {
  'wg_weather': const DashBoardWidgetItem(
    id: 'wg_weather',
    title: 'Thời tiết',
    backgroundImage: '',
    width: 2,
    height: 2,
  ),
  'wg_clock': const DashBoardWidgetItem(
    id: 'wg_clock',
    title: 'Đồng hồ',
    backgroundImage: '',
    width: 2,
    height: 2,
  ),
  'ic_tv': DashBoardIconItem(
    id: 'ic_tv',
    title: 'Kênh',
    backgroundImage: IconAppConstants.icTv,
  ),
  'ic_live': DashBoardIconItem(
    id: 'ic_live',
    title: 'Live',
    backgroundImage: IconAppConstants.icLive,
  ),
  'ic_bird': DashBoardIconItem(
    id: 'ic_bird',
    title: 'Nữ thần hoà bình',
    backgroundImage: IconAppConstants.icBird,
  ),
  'ic_my_driver': DashBoardIconItem(
    id: 'ic_my_driver',
    title: 'QR Code',
    backgroundImage: IconAppConstants.icDoc,
    path: ScanQrCodeScanScreen.routeName,
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
  'ic_tv': DashBoardIconItem(
    id: 'ic_tv',
    title: 'Kênh',
    backgroundImage: IconAppConstants.icTv,
  ),
  'ic_live': DashBoardIconItem(
    id: 'ic_live',
    title: 'Live',
    backgroundImage: IconAppConstants.icLive,
  ),
  'ic_bird': DashBoardIconItem(
    id: 'ic_bird',
    title: 'Nữ thần hoà bình',
    backgroundImage: IconAppConstants.icBird,
  ),
  'ic_qr': DashBoardIconItem(
    id: 'ic_qr',
    title: 'QR Code',
    backgroundImage: IconAppConstants.icQr,
    path: ScanQrCodeScanScreen.routeName,
  ),
  'ic_group': DashBoardIconItem(
    id: 'ic_group',
    title: 'Group Team',
    backgroundImage: IconAppConstants.icGroupTeam,
    path: CommunityWidget.routeName,
  ),
  'ic_team': DashBoardIconItem(
    id: 'ic_team',
    title: 'Team',
    backgroundImage: IconAppConstants.icTeam,
  ),
  'ic_calenda': DashBoardIconItem(
    id: 'ic_calenda',
    title: 'Lịch',
    backgroundImage: IconAppConstants.icAppCalenda,
  ),
  'ic_wallet': DashBoardIconItem(
    id: 'ic_wallet',
    title: 'Ví',
    backgroundImage: IconAppConstants.icWallet,
  ),
  'ic_mess': DashBoardIconItem(
    id: 'ic_mess',
    title: 'Tin nhắn',
    backgroundImage: IconAppConstants.icMess,
  ),
};

final personalDefault = {
  'wg_weather': DashBoardWidgetItem(
    id: 'wg_weather',
    title: 'Thời tiết',
    backgroundImage: IconAppConstants.icClock,
    width: 2,
    height: 2,
  ),
  'ic_tv': DashBoardIconItem(
    id: 'ic_tv',
    title: 'Kênh',
    backgroundImage: IconAppConstants.icTv,
  ),
  'ic_qr': DashBoardIconItem(
    id: 'ic_qr',
    title: 'QR Code',
    backgroundImage: IconAppConstants.icQr,
    path: ScanQrCodeScanScreen.routeName,
  ),
  'ic_call': DashBoardIconItem(
    id: 'ic_call',
    title: 'Điện thoại',
    backgroundImage: IconAppConstants.icCall,
    path: PhoneBookPage.routeName,
  ),
  'wg_weather_banner': DashBoardWidgetItem(
    id: 'wg_weather_banner',
    title: 'Thời gian và thời tiết',
    backgroundImage: IconAppConstants.icClock,
    width: 4,
    height: 2,
  ),
  'ic_setting': DashBoardIconItem(
    id: 'ic_setting',
    title: 'Cài đặt',
    backgroundImage: IconAppConstants.appSetting,
    path: SystemSetting.routerName,
  ),
  'ic_mess': DashBoardIconItem(
    id: 'ic_mess',
    title: 'Tin nhắn',
    backgroundImage: IconAppConstants.icMess,
  ),
  'ic_bird': DashBoardIconItem(
    id: 'ic_bird',
    title: 'Nữ thần hoà bình',
    backgroundImage: IconAppConstants.icBird,
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
  'ic_profile': DashBoardIconItem(
    id: 'ic_profile',
    title: 'Profile',
    backgroundImage: IconAppConstants.icProfile,
  ),
  "ic_bird": DashBoardIconItem(
    id: 'ic_bird',
    title: 'Nữ thần hoà bình',
    backgroundImage: IconAppConstants.icBird,
  ),
  'ic_live': DashBoardIconItem(
    id: 'ic_live',
    title: 'Live',
    backgroundImage: IconAppConstants.icLive,
  ),
};

final mapData = {
  ...communityDefault,
  ...personalDefault,
  ...eCommerceDefault,
  ...mapItems,
};
