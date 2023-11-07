import 'package:flutter/material.dart';

class SliverLayoutNestedScrollView extends StatefulWidget {
  final Widget Function(ScrollController) bodyBuilder;
  final Widget? cover;
  final Widget? header;
  final Widget? actionAppBar;
  final Color? backBtnColor;

  const SliverLayoutNestedScrollView({
    super.key,
    required this.bodyBuilder,
    this.header,
    this.cover,
    this.actionAppBar,
    this.backBtnColor,
  });

  @override
  State<SliverLayoutNestedScrollView> createState() =>
      _SliverLayoutNestedScrollViewState();
}

class _SliverLayoutNestedScrollViewState
    extends State<SliverLayoutNestedScrollView> {
  final mainScrollController = ScrollController();
  final bgScrollController = ScrollController();
  final _posinedCtr = ValueNotifier<double>(0.0);

  void _listenerScrollToUpdate() {
    final scrollMain = mainScrollController.position.pixels;
    final scrollBG = bgScrollController.position.pixels;

    _posinedCtr.value = scrollMain != 0 ? scrollMain : scrollBG;
  }

  @override
  void initState() {
    bgScrollController.addListener(_listenerScrollToUpdate);
    mainScrollController.addListener(_listenerScrollToUpdate);
    super.initState();
  }

  @override
  void dispose() {
    bgScrollController.removeListener(_listenerScrollToUpdate);
    mainScrollController.removeListener(_listenerScrollToUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder<double>(
          valueListenable: _posinedCtr,
          builder: (_, pos, __) {
            return Positioned(
              top: -pos,
              child: (widget.cover != null)
                  ? SizedBox(
                      height: MediaQuery.of(context).padding.top + 100.0,
                      child: Center(
                        child: widget.cover!,
                      ),
                    )
                  : const SizedBox(),
            );
          },
        ),
        SafeArea(
          bottom: false,
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            floatHeaderSlivers: false,
            controller: bgScrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                key: const ValueKey('btnSliverlayoutBack'),
                                onTap: Navigator.of(context).pop,
                                child: Icon(
                                  Icons.arrow_back_sharp,
                                  color: widget.backBtnColor ?? const Color(0xff333333),
                                ),
                              ),
                              if (widget.actionAppBar != null)
                                widget.actionAppBar!,
                            ],
                          ),
                        ),
                        if (widget.header != null) widget.header!,
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: widget.bodyBuilder(mainScrollController),
          ),
        ),
      ],
    );
  }
}
