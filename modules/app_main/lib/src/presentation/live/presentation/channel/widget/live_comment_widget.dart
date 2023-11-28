import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_comment.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_member.dart';
import 'package:flutter/material.dart';

final comments = [
  LiveComment(
    member: const LiveMember(
      info: LiveMemberInfo(userID: 0, name: 'tan hoang', avatar: ''),
    ),
    message: '',
    type: LiveCommentType.join,
  ),
  LiveComment(
    member: const LiveMember(
      info: LiveMemberInfo(userID: 0, name: 'tan hoang', avatar: ''),
    ),
    message: '',
    type: LiveCommentType.join,
  ),
  LiveComment(
    member: const LiveMember(
      info: LiveMemberInfo(userID: 0, name: 'tan hoang', avatar: ''),
    ),
    message: '',
    type: LiveCommentType.join,
  ),
  LiveComment(
    member: const LiveMember(
      info: LiveMemberInfo(userID: 0, name: 'tan hoang', avatar: ''),
    ),
    message: '',
    type: LiveCommentType.join,
  ),
];

class LiveCommentWidget extends StatelessWidget {
  const LiveCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      reverse: true,
      itemBuilder: (_, index) {
        return LiveCommentCard(
          comment: comments[index],
        );
      },
      separatorBuilder: (_, index) => const SizedBox(height: 6),
      itemCount: comments.length,
    );
  }
}

class LiveCommentCard extends StatelessWidget {
  const LiveCommentCard({
    super.key,
    required this.comment,
  });

  final LiveComment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(90),
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleNetworkImage(
                url: '',
                size: 17,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Builder(
                  builder: (_) {
                    return RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: comment.member.info.name,
                          style: const TextStyle(
                            color: Color(0xffB6B5BA),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text: ' tham gia',
                          style: TextStyle(
                            color: Color(0xffAAF6A3),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
