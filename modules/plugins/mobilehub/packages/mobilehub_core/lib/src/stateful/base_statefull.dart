// Copyright 2021 Fighttech.vn, Ltd. All rights reserved.

import 'package:flutter/material.dart';

import '../services/device_service.dart';

abstract class StatefulWidgetBase<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  DeviceService get deviceService;

  Color buttomNavigationBarColor = const Color(0xFF232323);
  bool isDark = false;

  void updateNavigationBarColor(bool isDark) {
    deviceService.updateNavigationBarColors(isDark, buttomNavigationBarColor);
  }

  @override
  void initState() {
    updateNavigationBarColor(isDark);
    deviceService.statusbar(isDark);

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    updateNavigationBarColor(isDark);
    deviceService.statusbar(isDark);

    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      updateNavigationBarColor(true);
      deviceService.statusbar(isDark);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    updateNavigationBarColor(!isDark);
    deviceService.statusbar(!isDark);
    super.dispose();
  }
}
