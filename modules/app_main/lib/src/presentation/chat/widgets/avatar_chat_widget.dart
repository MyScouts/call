//import 'dart:developer' as developer;
import 'package:app_main/src/domain/entities/chat/member_response_model.dart';
import 'package:app_main/src/presentation/chat/widgets/avatar_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class AvatarChatWidget extends StatelessWidget {
  final List<MemberResponseModel> members;
  final int type;
  const AvatarChatWidget({super.key, required this.members, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Stack(
        children: [
          if (type == 1)
            AvatarMemberWidget(
              size: 36,
              avatar: members.first.member.avatar ?? '',
            ),
          if (type == 2) ...[
            Positioned(
              top: 0,
              right: 0,
              child: AvatarWidget(avatar: members.first.member.avatar ?? '', size: 24),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: AvatarMemberWidget(avatar: members[1].member.avatar ?? '', size: 24),
            ),
          ]
        ],
      ),
    );
  }
}
