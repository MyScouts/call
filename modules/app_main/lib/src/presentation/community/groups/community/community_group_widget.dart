import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

class CommunityGroupWidget extends StatefulWidget {
  const CommunityGroupWidget({
    super.key,
    required this.groups,
    this.onTap,
  });

  final List<Group> groups;
  final ValueChanged<Group>? onTap;

  @override
  State<CommunityGroupWidget> createState() => _CommunityGroupWidgetState();
}

class _CommunityGroupWidgetState extends State<CommunityGroupWidget> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final page = <List<Group>>[[]];
    const maxItem = 6;
    int indexPage = 0;

    for (var i = 0; i < widget.groups.length; i++) {
      final group = widget.groups[i];
      if (page[indexPage].length < maxItem) {
        page[indexPage].add(group);
      } else {
        indexPage++;
        page.add([group]);
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      height: 285,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: List.generate(
                page.length,
                (index) {
                  final pageData = page[index];
                  return GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 6,
                    ),
                    children: pageData
                        .asMap()
                        .entries
                        .map(
                          (e) => GestureDetector(
                            key: ValueKey('btnGroupItem_${e.key}'),
                            onTap: () {
                              widget.onTap?.call(e.value);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12)
                                      .copyWith(top: 10),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: ImageWidget(
                                          e.value.banner?.optimizeSize400 ??
                                              ImageConstants.imgdefault,
                                          borderRadius: 100,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(
                                        e.value.name!,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              height: 1.4,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF333333),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
            child: PageIndicatorWidget(
              countItem: page.length,
              controller: _pageController,
              color: AppColors.grey5,
              size: const Size(7, 7),
              activeSize: const Size(13, 7),
              colorActive: AppColors.blue15,
            ),
          ),
        ],
      ),
    );
  }
}
