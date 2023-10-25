import 'package:flutter/material.dart';

import 'app_coordinator_shared.dart';

abstract class AppCoordinator extends AppCoordinatorShared {
  static GlobalKey<NavigatorState> root = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> exploreKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> liveKey = GlobalKey<NavigatorState>();
}
