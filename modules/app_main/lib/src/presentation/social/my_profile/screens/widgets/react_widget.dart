import 'package:app_core/app_core.dart';
import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_event.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_intereact_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class ReactWidget extends StatefulWidget {
  const ReactWidget({required this.post, super.key});
  final Post post;

  @override
  State<ReactWidget> createState() => _ReactWidgetState();
}

class _ReactWidgetState extends State<ReactWidget> {
  final myProfileBloc = getIt<MyProfileBloc>();
  late bool isHearted;
  late int totalReaction;

  @override
  void initState() {
    super.initState();
    isHearted = widget.post.getIsHearted;
    totalReaction = widget.post.getTotalReaction;
  }

  @override
  Widget build(BuildContext context) {

    final hasShowTotalReact = totalReaction != 0;
    final reactText = MyProfileConstant.reactText(
      totalReact: totalReaction,
      isHearted: isHearted,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: !hasShowTotalReact
                  ? const SizedBox.shrink()
                  : Row(
                      children: [
                        ImageWidget(
                          IconAppConstants.icHeartRd,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          reactText,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey76,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Text(
                '${widget.post.getTotalComment} bình luận',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey76,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        _buildInteract(
          postId: widget.post.id!,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const VerticalDivider(),
    );
  }

  Widget _buildInteract({required int postId}) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: ReactIntereactWidget(
              text: 'Thích',
              iconName: IconAppConstants.icHeart,
              iconActivedName: IconAppConstants.icHeartActive,
              isShowActiveImageWhenTapped: true,
              isHearted: isHearted,
              onChange: (bool isLiked) {
                setState(() {
                  isHearted = isLiked;
                  totalReaction = isHearted ? ++totalReaction : --totalReaction;
                });
                myProfileBloc.add(ReactPostTapped(
                  postId: postId,
                  isHearted: isLiked,
                ));
              },
              parentHeight: 40,
            ),
          ),
          _buildDivider(),
          Expanded(
            child: ReactIntereactWidget(
              text: 'Bình luận',
              iconName: IconAppConstants.icComment,
              parentHeight: 40,
            ),
          ),
          _buildDivider(),
          Expanded(
            child: ReactIntereactWidget(
              text: 'Chia sẻ',
              iconName: IconAppConstants.icShare,
              parentHeight: 40,
            ),
          ),
        ],
      ),
    );
  }
}
