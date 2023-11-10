import 'package:app_main/src/presentation/information_profile/screens/information_profile_screen.dart';
import 'package:flutter/material.dart';

extension InformationProfileCoordinator on BuildContext {
  Future<T?> startInformationProfile<T>() {
    return Navigator.of(this).pushNamed(InformationProfileScreen.routeName);
  }
}
