//import 'dart:developer' as developer;
import 'package:app_main/src/domain/entities/chat/member_response_model.dart';
import 'package:app_main/src/presentation/chat/widgets/avatar_member_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AvatarConversationWidget extends StatelessWidget {
  final List<MemberResponseModel> members;
  final List<MemberResponseModel> membersNotMe;
  final int type;
  const AvatarConversationWidget(
      {super.key, required this.members, required this.membersNotMe, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        if (type == 1 || members.length == 1)
          if (membersNotMe.isNotEmpty)
            AvatarMemberWidget(
              size: 60,
              avatar: membersNotMe.first.member.avatar ?? '',
            )
          else
            AvatarMemberWidget(
              size: 60,
              avatar: members.first.member.avatar ?? '',
            )
        else if (members.length == 2) ...[
          Positioned(
            top: 0,
            right: 0,
            child: AvatarMemberWidget(avatar: members.first.member.avatar ?? '', size: 40),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: AvatarMemberWidget(avatar: members[1].member.avatar ?? '', size: 40),
          ),
        ] else if (members.length >= 3) ...[
          Positioned(
            top: 0,
            left: 0,
            child: AvatarMemberWidget(avatar: members[0].member.avatar ?? '', size: 24),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: AvatarMemberWidget(avatar: members[1].member.avatar ?? '', size: 24),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: members.length == 3 ? 0 : null,
            child: AvatarMemberWidget(avatar: members[2].member.avatar ?? '', size: 24),
          ),
          if (members.length > 3)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0x33000000),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  members.length - 3 >= 9 ? '9' : (members.length - 3).toString(),
                  style: context.text.bodyMedium
                      ?.copyWith(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 11),
                ),
              ),
            )
        ]
      ]),
    );
  }
}
