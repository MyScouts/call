import 'package:app_core/app_core.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_event.dart';
import 'package:app_main/src/presentation/social/my_profile/my_profile_constants.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_intereact_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class ReactWidget extends StatefulWidget {
  const ReactWidget({
    required this.post,
    required this.myProfileBloc,
    this.isNewPost = false,
    this.isDarkMode = false,
    this.onChange,
    super.key,
  });
  final Post post;
  final bool isNewPost;
  final MyProfileBloc myProfileBloc;
  final Function(Post)? onChange;
  final bool isDarkMode;

  @override
  State<ReactWidget> createState() => _ReactWidgetState();
}

class _ReactWidgetState extends State<ReactWidget> {
  late Post post;

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  @override
  Widget build(BuildContext context) {
    final hasShowTotalReact = post.getTotalReaction != 0;
    final reactText = MyProfileConstant.reactText(
      totalReact: post.getTotalReaction,
      isHearted: post.getIsHearted,
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
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: widget.isDarkMode
                                ? AppColors.grey77
                                : AppColors.grey76,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Text(
                '${post.getTotalComment} bình luận',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color:
                      widget.isDarkMode ? AppColors.grey77 : AppColors.grey76,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        _buildInteract(postId: widget.post.id ?? -1),
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
              isHearted: post.getIsHearted,
              onChange: _handleOnChangeReact,
              parentHeight: 40,
              isDarkMode: widget.isDarkMode,
            ),
          ),
          _buildDivider(),
          Expanded(
            child: ReactIntereactWidget(
              text: 'Bình luận',
              iconName: IconAppConstants.icComment,
              parentHeight: 40,
              isDarkMode: widget.isDarkMode,
            ),
          ),
          _buildDivider(),
          Expanded(
            child: ReactIntereactWidget(
              text: 'Chia sẻ',
              iconName: IconAppConstants.icShare,
              parentHeight: 40,
              isDarkMode: widget.isDarkMode,
            ),
          ),
        ],
      ),
    );
  }

  void _handleOnChangeReact(bool isLiked) {
    setState(() {
      var totalReaction = post.getTotalReaction;

      post = post.copyWith(
        isHearted: isLiked,
        totalReaction: isLiked ? ++totalReaction : --totalReaction,
      );

      widget.myProfileBloc.add(ReactPostTapped(newPost: post));
      if (widget.onChange != null) {
        widget.onChange!(post);
      }
    });
  }
}
