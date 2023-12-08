import 'package:flutter/material.dart';

const _extentSizeForBottom = 20.0;

class TabbarDynamicWidget extends StatefulWidget {
  const TabbarDynamicWidget({
    super.key,
    required this.tabController,
    required this.children,
    this.heightDefault = 200.0,
    this.physics,
  });

  final TabController tabController;
  final List<Widget> children;
  final double heightDefault;
  final ScrollPhysics? physics;

  @override
  State<TabbarDynamicWidget> createState() => _TabbarDynamicWidgetState();
}

class _TabbarDynamicWidgetState extends State<TabbarDynamicWidget> {
  final _heightOfTab = [];
  late final _sizeTabbar = ValueNotifier(_heightTitleTabbar);

  double get _heightTitleTabbar => widget.heightDefault;

  void _onChangeTabbar() {
    _sizeTabbar.value =
        _heightOfTab[widget.tabController.index] ?? _heightTitleTabbar;
  }

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_onChangeTabbar);
    for (var i = 0; i < widget.children.length; i++) {
      _heightOfTab.add(_heightTitleTabbar);
    }
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_onChangeTabbar);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: _sizeTabbar,
      builder: (_, heightTabbar, __) {
        return SizedBox(
          height: heightTabbar,
          child: TabBarView(
            controller: widget.tabController,
            physics: widget.physics,
            children: List.generate(
              widget.children.length,
              (index) {
                final item = widget.children[index];
                return _DetectorSizeChildWidget(
                  onGetSize: (p0, p1) {
                    _heightOfTab[index] = p0.height + _extentSizeForBottom;
                    if (index == widget.tabController.index) {
                      _sizeTabbar.value =
                          _heightOfTab[index] ?? _heightTitleTabbar;
                    }
                  },
                  child: item,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _DetectorSizeChildWidget extends StatefulWidget {
  const _DetectorSizeChildWidget({
    required this.child,
    required this.onGetSize,
  });

  final Widget child;
  final void Function(Size, BuildContext) onGetSize;

  @override
  State<_DetectorSizeChildWidget> createState() =>
      _DetectorSizeChildWidgetState();
}

class _DetectorSizeChildWidgetState extends State<_DetectorSizeChildWidget> {
  GlobalKey globalKeyCenterButton = GlobalKey();

  void _getSize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final RenderBox renderBox =
          globalKeyCenterButton.currentContext!.findRenderObject() as RenderBox;
      widget.onGetSize(renderBox.size, context);
    });
  }

  @override
  void initState() {
    super.initState();
    _getSize();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        key: globalKeyCenterButton,
        child: widget.child,
      ),
    );
  }
}
