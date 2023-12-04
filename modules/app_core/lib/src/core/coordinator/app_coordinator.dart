import 'package:flutter/material.dart';

import 'app_coodinator_shared.dart';

abstract class AppCoordinatorCore extends AppCoordinatorShared {
  static GlobalKey<NavigatorState> root = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> exploreKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> liveKey = GlobalKey<NavigatorState>();
}
