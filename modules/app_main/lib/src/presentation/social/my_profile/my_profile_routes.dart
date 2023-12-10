import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/create_post/create_post_screen.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/post_detail/post_detail_screen.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/components/post_preview/post_preview_screen.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/my_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobilehub_core/mobilehub_core.dart';

import 'screens/components/type_scope/type_scope_screen.dart';

@injectable
class MyProfileRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        MyProfileScreen.routeName: (context) {
          return const MyProfileScreen();
        },
        CreatePostScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return CreatePostScreen(
            postType: args["postType"],
            user: args["user"],
            isShowMedia: args["isShowMedia"],
          );
        },
        TypeScopeScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return TypeScopeScreen(
            postType: args["postType"],
            typeScopeSelected: args["typeScopeSelected"],
          );
        },
        PostDetailScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return PostDetailScreen(
            post: args["post"],
            imageScrollType: args["imageScrollType"],
            myProfileBloc: args["myProfileBloc"],
          );
        },
        PostPreviewScreen.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;

          return PostPreviewScreen(
            post: args["post"],
            currentMediaIndex: args["currentMediaIndex"],
            myProfileBloc: args["myProfileBloc"],
            onChange: args["onChange"],
          );
        },
      };
}
