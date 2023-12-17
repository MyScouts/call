import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/post_tab_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/create_post/create_post_screen.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/post_detail/post_detail_screen.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/post_preview/post_preview_screen.dart';
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

  Future<T?> startPostDetail<T>({
    required Post post,
    required PostTabBloc postTabBloc,
    ImageScrollType? imageScrollType,
  }) {
    return Navigator.of(this).pushNamed(
      PostDetailScreen.routeName,
      arguments: {
        "post": post,
        "imageScrollType": imageScrollType,
        "postTabBloc": postTabBloc,
      },
    );
  }

  Future<T?> startPostPreview<T>({
    required Post post,
    required int currentMediaIndex,
    required PostTabBloc postTabBloc,
    required Function(Post) onChange,
  }) {
    return Navigator.of(this).pushNamed(
      PostPreviewScreen.routeName,
      arguments: {
        "post": post,
        "currentMediaIndex": currentMediaIndex,
        "postTabBloc": postTabBloc,
        "onChange": onChange,
      },
    );
  }

  
}
