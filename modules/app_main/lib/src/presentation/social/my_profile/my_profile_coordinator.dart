

import 'package:app_main/src/presentation/social/my_profile/screens/my_profile_screen.dart';
import 'package:flutter/material.dart';

extension MyProfileCoordinator on BuildContext {
  Future<T?> startMyProfile<T>() {
    return Navigator.of(this).pushNamed(MyProfileScreen.routeName);
  }
}