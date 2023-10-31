import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverDecorationWidget extends SliverStack {
  final Widget sliver;

  final BoxDecoration? decoration;

  SliverDecorationWidget({
    required this.sliver,
    this.decoration,
    super.key,
  }) : super(children: [
          SliverPositioned.fill(
            child: Container(decoration: decoration),
          ),
          sliver,
        ]);
}
