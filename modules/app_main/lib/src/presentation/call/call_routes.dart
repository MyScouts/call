import 'package:app_core/app_core.dart';
import 'package:app_main/src/domain/entities/friend/friend_model.dart';
import 'package:app_main/src/presentation/call/call_1v1/call_1v1_page.dart';
import 'package:app_main/src/presentation/call/phone_book_detail/phone_book_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'phone_book/phone_book_page.dart';

@injectable
class CallRoutes extends RouteModule {
  @override
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        PhoneBookPage.routeName: (context) {
          return const PhoneBookPage();
        },
        Call1V1Page.routeName: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          return Call1V1Page(
            key: args['key'],
            fromUserId: args['fromUserId'],
            toUserId: args['toUserId'],
            isVideo: args['isVideo'],
          );
        },
        PhoneBookDetailPage.routeName: (context) {
          return PhoneBookDetailPage(
            data: settings.arguments as FriendModel,
          );
        },
      };
}
