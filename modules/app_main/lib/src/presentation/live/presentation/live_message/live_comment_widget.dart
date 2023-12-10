import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_comment.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class LiveCommentWidget extends StatelessWidget {
  const LiveCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveMessageBloc, LiveMessageState>(
      builder: (_, state) {
        return AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(microseconds: 300),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            reverse: true,
            itemBuilder: (_, index) {
              final list = state.comments.reversed.toList();
              return LiveCommentCard(comment: list[index]);
            },
            separatorBuilder: (_, index) => const SizedBox(height: 6),
            itemCount: state.comments.length,
          ),
        );
      },
    );
  }
}

class LiveCommentCard extends StatelessWidget {
  const LiveCommentCard({
    super.key,
    required this.comment,
  });

  final LiveMessageData comment;

  @override
  Widget build(BuildContext context) {
    if (comment is JoinMessage) {
      final cm = comment as JoinMessage;
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
                if (cm.member.info.avatar.trim().isEmpty)
                  SizedBox.square(
                    dimension: 17,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17 / 2),
                      child: ImageWidget(
                        ImageConstants.defaultUserAvatar,
                      ),
                    ),
                  )
                else
                  CircleNetworkImage(
                    url: cm.member.info.avatar,
                    size: 17,
                  ),
                const SizedBox(width: 4),
                Flexible(
                  child: Builder(
                    builder: (_) {
                      return RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: cm.member.info.name,
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

    if (comment is SystemMessage) {
      return Align(
        alignment: Alignment.centerLeft,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 4,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: comment.message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final cm = comment as UserMessage;

    return Align(
      alignment: Alignment.centerLeft,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (cm.member.info.avatar.trim().isEmpty)
                SizedBox.square(
                  dimension: 17,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17 / 2),
                    child: ImageWidget(
                      ImageConstants.defaultUserAvatar,
                    ),
                  ),
                )
              else
                CircleNetworkImage(
                  url: cm.member.info.avatar,
                  size: 17,
                ),
              const SizedBox(width: 4),
              Flexible(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '${cm.member.info.name}: ',
                      style: const TextStyle(
                        color: Color(0xffB6B5BA),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: cm.message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
