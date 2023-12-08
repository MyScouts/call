import 'package:app_main/src/di/di.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_bloc.dart';
import 'package:app_main/src/presentation/social/my_profile/blocs/my_profile_event.dart';
import 'package:app_main/src/presentation/social/my_profile/screens/widgets/react_intereact_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ReactCommentWidget extends StatefulWidget {
  const ReactCommentWidget({
    required this.latestCommentTotalReaction,
    required this.commentId,
    required this.isHearted,
    super.key,
  });
  final int latestCommentTotalReaction;
  final int commentId;
  final bool isHearted;
  @override
  State<ReactCommentWidget> createState() => _ReactCommentWidgetState();
}

class _ReactCommentWidgetState extends State<ReactCommentWidget> {
  final myProfileBloc = getIt<MyProfileBloc>();

  late int latestCommentTotalReaction;
  @override
  void initState() {
    super.initState();
    latestCommentTotalReaction = widget.latestCommentTotalReaction;
  }

  @override
  Widget build(BuildContext context) {
    return ReactIntereactWidget(
      text: latestCommentTotalReaction.toString(),
      iconName: IconAppConstants.icHeart,
      iconActivedName: IconAppConstants.icHeartActive,
      isShowActiveImageWhenTapped: true,
      isHearted: widget.isHearted,
      onChange: (bool isLiked) {
        setState(() {
          latestCommentTotalReaction = isLiked
              ? ++latestCommentTotalReaction
              : --latestCommentTotalReaction;
          myProfileBloc.add(ReactLatestCommentTapped(
            commentId: widget.commentId,
            isHearted: isLiked,
          ));
        });
      },
    );
  }
}
