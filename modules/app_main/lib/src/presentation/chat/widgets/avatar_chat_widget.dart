
//import 'dart:developer' as developer;
import 'package:app_main/src/domain/entities/chat/member_response_model.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AvatarChatWidget extends StatelessWidget {
  final List<MemberResponseModel> members;
  const AvatarChatWidget({super.key, required this.members});

  @override
  Widget build(BuildContext context) {
    return AvatarWidget(
      size: 36,
      avatar: members.first.member.avatar,
    );
  }
}