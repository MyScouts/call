import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:app_main/src/presentation/call/phone_book/phone_book_page.dart';
import 'package:app_main/src/presentation/chat/conversation/conversation_page.dart';
import 'package:app_main/src/presentation/dashboard/dashboard_constants.dart';
import 'package:app_main/src/presentation/live/presentation/live_home/live_home_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'app_widget.dart';

class DockWidget extends StatefulWidget {
  const DockWidget({super.key});

  @override
  State<DockWidget> createState() => _DockWidgetState();
}

class _DockWidgetState extends State<DockWidget> {
  int _page = 0;

  @override
  void initState() {
    super.initState();
    NotificationCenter.subscribe(
      channel: dashboardPageChange,
      observer: this,
      onNotification: (page) {
        setState(() {
          _page = page;
        });
      },
    );
  }

  @override
  void dispose() {
    NotificationCenter.unsubscribe(
      channel: dashboardPageChange,
      observer: this,
    );
    super.dispose();
  }

  late final Map<int, List<DashBoardIconItem>> _map = {
    0: _doc0,
    1: _doc1,
    2: _doc2,
  };

  final List<DashBoardIconItem> _doc0 = [
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icLive,
      title: "",
      id: "ic_live",
      path: LiveHomeScreen.routeName,
    ),
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icVDone,
      title: "",
      id: "vDone",
    ),
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icGroupTeam,
      title: "",
      id: "ic_group_team",
    ),
  ];

  final List<DashBoardIconItem> _doc1 = [
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icMess,
      title: "",
      id: "message",
      path: ConversationPage.routeName,
    ),
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icVDone,
      title: "",
      id: "vDone",
    ),
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icCall,
      title: "",
      id: "call",
      path: PhoneBookPage.routeName,
    ),
  ];

  final List<DashBoardIconItem> _doc2 = [
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icMaShop,
      title: "",
      id: "ic_mashop",
    ),
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icVDone,
      title: "",
      id: "vDone",
    ),
    DashBoardIconItem(
      backgroundImage: IconAppConstants.icMarket,
      title: "",
      id: "ic_market",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _map[_page]!.map((item) {
          if (_map[_page]!.first == item || _map[_page]!.last == item) {
            return SizedBox(
              width: 60,
              height: 60,
              child: AppWidget(app: item),
            );
          }
          return const Opacity(
            opacity: 0.0,
            child: SizedBox.square(dimension: 80),
          );
        }).toList(),
      ),
    );
  }
}
