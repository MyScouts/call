import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/create_post/create_post_screen.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/type_scope/type_scope_screen.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/my_profile_screen.dart';
import 'package:flutter/material.dart';

extension MyProfileCoordinator on BuildContext {
  Future<T?> startMyProfile<T>() {
    return Navigator.of(this).pushNamed(MyProfileScreen.routeName);
  }

  Future<T?> startCreatePost<T>({
    required PostType postType,
    required User? user,
    bool isShowMedia = false,
  }) {
    return Navigator.of(this).pushNamed(
      CreatePostScreen.routeName,
      arguments: {
        "postType": postType,
        "user": user,
        "isShowMedia": isShowMedia,
      },
    );
  }

  Future<T?> startTypeScope<T>({
    required PostType postType,
    required ScopeType typeScopeSelected,
  }) {
    return Navigator.of(this).pushNamed(
      TypeScopeScreen.routeName,
      arguments: {
        "postType": postType,
        "typeScopeSelected": typeScopeSelected,
      },
    );
  }
}
