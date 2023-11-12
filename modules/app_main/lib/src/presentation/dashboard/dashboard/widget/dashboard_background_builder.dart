import 'package:app_main/src/core/services/notification_center.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/domain/usecases/dashboard_share_preferences_usecase.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

final bgs = [
  ImageConstants.bg1,
  ImageConstants.bg2,
  ImageConstants.bg3,
  ImageConstants.bg4,
  ImageConstants.bg5,
  ImageConstants.bg6,
  ImageConstants.bg7,
  ImageConstants.bg8,
  ImageConstants.bg9,
  ImageConstants.bg10,
  ImageConstants.bg11,
];

class DashBoardBackgroundBuilder extends StatefulWidget {
  const DashBoardBackgroundBuilder({
    super.key,
    required this.builder,
    required this.page,
  });

  final int page;
  final Widget Function(String imagePath) builder;

  @override
  State<DashBoardBackgroundBuilder> createState() =>
      _DashBoardBackgroundBuilderState();
}

class _DashBoardBackgroundBuilderState
    extends State<DashBoardBackgroundBuilder> {
  late final DashBoardBgController controller;

  @override
  void initState() {
    controller = getIt<DashBoardBgController>()..page = widget.page;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DashBoardBackgroundBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.page != widget.page) {
      controller.page = widget.page;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, __) => widget.builder(controller.path),
    );
  }
}

@injectable
class DashBoardBgController extends ChangeNotifier {
  final DashboardSharePreferenceUseCase useCase;

  DashBoardBgController(this.useCase) {
    NotificationCenter.subscribe(
      channel: changeBg,
      observer: this,
      onNotification: (option) {
        useCase.saveDashBoardBg('bg $_page', option);
        path = option;
      },
    );
  }

  String getImage(int page) {
    final path = useCase.getDashBoardBg('bg 0');
    if (path.isEmpty) {
      String image = '';
      if (page == 0) image = ImageConstants.bg1;
      if (page == 1) image = ImageConstants.bg1;
      if (page == 2) image = ImageConstants.bg1;
      useCase.saveDashBoardBg('bg $_page', image);
      return image;
    }
    return path;
  }

  int _page = 0;

  String _path = '';

  String get path => _path;

  set page(int value) {
    _page = value;
    _path = getImage(_page);
    notifyListeners();
  }

  set path(String value) {
    _path = value;
    notifyListeners();
  }

  @override
  void dispose() {
    NotificationCenter.unsubscribe(channel: changeBg, observer: this);
    super.dispose();
  }
}
