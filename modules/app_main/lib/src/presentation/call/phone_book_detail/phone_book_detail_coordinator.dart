import 'package:app_main/src/domain/entities/friend/friend_model.dart';
import 'package:app_main/src/presentation/call/phone_book_detail/phone_book_detail_page.dart';
import 'package:flutter/material.dart';

extension PhoneBookDetailCoordinator on BuildContext {
  Future<T?> startPhoneBookDetail<T>(FriendModel friendData) {
    return Navigator.of(this).pushNamed(PhoneBookDetailPage.routeName, arguments: friendData);
  }
}
