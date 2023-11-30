import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/community/widgets/circle_image.dart';
import 'package:app_main/src/presentation/live/domain/entities/live_comment.dart';
import 'package:app_main/src/presentation/live/presentation/live_message/state/live_message_bloc.dart';
import 'package:flutter/material.dart';

class LiveCommentWidget extends StatelessWidget {
  const LiveCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiveMessageBloc, LiveMessageState>(
      builder: (_, state) {
        return ListView.separated(
          reverse: true,
          itemBuilder: (_, index) {
            final list = state.comments.reversed.toList();
            return LiveCommentCard(comment: list[index]);
          },
          separatorBuilder: (_, index) => const SizedBox(height: 6),
          itemCount: state.comments.length,
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

  final LiveComment comment;

  @override
  Widget build(BuildContext context) {
    if (comment.type == LiveCommentType.join) {
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
                CircleNetworkImage(
                  url: comment.member.info.avatar,
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
              CircleNetworkImage(
                url: comment.member.info.avatar,
                size: 17,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '${comment.member.info.name}: ',
                      style: const TextStyle(
                        color: Color(0xffB6B5BA),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: comment.message,
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
