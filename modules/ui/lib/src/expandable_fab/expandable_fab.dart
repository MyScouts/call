import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'dart:ui' as ui;

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    Key? key,
    this.icon,
    this.color,
    this.fabSize,
    this.actionButtonSize,
    this.fabElevation,
    this.actionButtonElevation,
    this.fabMargin,
    this.controller,
    required this.children,
  }) : super(key: key);

  final List<ActionButton> children;
  final Widget? icon;
  final Color? color;
  final double? fabSize;
  final double? actionButtonSize;
  final double? fabElevation;
  final double? actionButtonElevation;
  final double? fabMargin;
  final ExpandableFabController? controller;

  @override
  State<ExpandableFab> createState() => ExpandableFabState();
}

class ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  bool _isMenuClosed = true;
  late final AnimationController _animationController;
  late final Animation _animation;
  List<Alignment> _alignments = [
    const Alignment(0.0, 0.8),
    const Alignment(0.0, 0.8),
    const Alignment(0.0, 0.8)
  ];
  double _fabSize = 56.0;
  double _actionButtonSize = 66.0;
  double _fabElevation = 4.0;
  double _actionButtonElevation = 4.0;
  double _fabMargin = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller?.setParent(this);
    _fabSize = widget.fabSize ?? _fabSize;
    _actionButtonSize = widget.actionButtonSize ?? _actionButtonSize;
    _fabElevation = widget.fabElevation ?? _fabElevation;
    _actionButtonElevation =
        widget.actionButtonElevation ?? _actionButtonElevation;
    _fabMargin = widget.fabMargin ?? _fabMargin;
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 350),
        reverseDuration: const Duration(milliseconds: 275));
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(_fabMargin),
      height: 350.0,
      width: 350.0,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ..._buildExpandingActionButtons(),
          _buildExpandableFab(),
        ],
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final buttons = <Widget>[];
    for (int i = 0; i < widget.children.length; i++) {
      buttons.add(AnimatedAlign(
        alignment: _alignments[i],
        duration: Duration(milliseconds: _isMenuClosed ? 150 : 200),
        curve: _isMenuClosed ? Curves.easeIn : Curves.easeIn,
        child: GestureDetector(
          onTap: () {
                widget.children[i].onPressed?.call();
                _toggleExpandableFab();
          },
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: Duration(milliseconds: _isMenuClosed ? 150 : 200),
            curve: _isMenuClosed ? Curves.easeIn : Curves.easeIn,
            height: _actionButtonSize,
            width: _actionButtonSize,
            child:  widget.children[i].icon,
            // child: FloatingActionButton(
            //   backgroundColor: widget.children[i].color ?? Colors.black87,
            //   elevation: _isMenuClosed ? 0 : _actionButtonElevation,
            //   onPressed: () {
            //     widget.children[i].onPressed?.call();
            //     _toggleExpandableFab();
            //   },
            //   child: widget.children[i].icon,
            // ),
          ),
        ),
      ));
    }
    return buttons;
  }

  Widget _buildExpandableFab() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: _toggleExpandableFab,
        behavior: HitTestBehavior.opaque,
        child: SizedBox.square(
          dimension: 114,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(114 / 2),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: !_isMenuClosed ? 114 : 80,
                    width: !_isMenuClosed ? 114 : 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isMenuClosed
                          ? const Color.fromRGBO(0, 87, 189, 0.20)
                          : const Color.fromRGBO(51, 86, 177, 0.20),
                    ),
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: !_isMenuClosed ? 80 : 66,
                      width: !_isMenuClosed ? 80 : 66,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: !_isMenuClosed
                              ? const Color(0xffAFCFFF)
                              : const Color(0xffAFD4FF),
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(85, 143, 255, 0.46),
                            Color(0xff0058AA),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: !_isMenuClosed
                              ? const Color(0xff47A4FF)
                              : const Color(0xff47A4FF),
                          border: Border.all(
                            color: !_isMenuClosed
                                ? const Color(0xffE1D7FF)
                                : const Color(0xffD7F8FF),
                          ),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff47A4FF),
                              Color(0xff006AD1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 1.0],
                          ),
                        ),
                        duration: const Duration(milliseconds: 300),
                        alignment: Alignment.center,
                        child: Transform.rotate(
                          angle: _animation.value * pi / 2,
                          child: ImageWidget(IconAppConstants.icSetting),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleExpandableFab() {
    setState(() {
      if (_isMenuClosed) {
        _isMenuClosed = !_isMenuClosed;
        _animationController.forward();
        Future.delayed(const Duration(milliseconds: 100), () {
          _alignments[0] = const Alignment(-0.6, 0.3);
          _alignments[1] = const Alignment(0.0, 0.1);
          _alignments[2] = const Alignment(0.6, 0.3);
        });
      } else {
        _isMenuClosed = !_isMenuClosed;
        _animationController.reverse();
        _alignments = [
          const Alignment(0.0, 0.8),
          const Alignment(0.0, 0.8),
          const Alignment(0.0, 0.8)
        ];
      }
    });
  }
}

class ExpandableFabController {
  ExpandableFabState? expandableFabState;

  void setParent(ExpandableFabState expandableFabState) {
    this.expandableFabState = expandableFabState;
  }

  void closeFab() {
    if (expandableFabState?._isMenuClosed == false) {
      expandableFabState?._toggleExpandableFab();
    }
  }

  void openFab() {
    if (expandableFabState?._isMenuClosed != false) {
      expandableFabState?._toggleExpandableFab();
    }
  }
}

class ActionButton {
  const ActionButton({this.onPressed, required this.icon, this.color});

  final VoidCallback? onPressed;
  final Widget icon;
  final Color? color;
}
