import 'package:app_main/src/presentation/social/my_profile/screens/common/subordinate_scroll.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ReelsTab extends StatefulWidget {
  const ReelsTab({super.key});

  @override
  State<ReelsTab> createState() => _ReelsTabState();
}

class _ReelsTabState extends State<ReelsTab>
    with AutomaticKeepAliveClientMixin {
  SubordinateScrollController? scrollController;

  @override
  void initState() {
    super.initState();

    _initController();
  }

  void _initController() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final parentController = PrimaryScrollController.of(context);
      if (scrollController?.parent != parentController) {
        scrollController?.dispose();
        scrollController = SubordinateScrollController(parentController);
      }

      scrollController?.addListener(() {
        if (scrollController!.position.pixels >=
            scrollController!.position.maxScrollExtent) {
          // bloc.add(PostTabLoadMore());
        }
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return scrollController == null
        ? const SizedBox.shrink()
        : CustomScrollView(
            shrinkWrap: true,
            key: widget.key,
            physics: const ClampingScrollPhysics(),
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Thước phim'),
                    ],
                  ),
                ),
              )
            ],
          );
  }

  @override
  bool get wantKeepAlive => true;
}
