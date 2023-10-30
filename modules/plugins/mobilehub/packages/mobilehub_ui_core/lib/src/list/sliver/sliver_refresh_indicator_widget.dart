import 'dart:math';

import 'package:flutter/cupertino.dart';

class SliverRefreshIndicatorWidget extends CupertinoSliverRefreshControl {
  SliverRefreshIndicatorWidget({
    super.key,
    required Future<void> Function() onRefresh,
    double offsetPadding = 0,
  }) : super(
          onRefresh: onRefresh,
          builder: (context, refreshState, pulledExtent,
              refreshTriggerPullDistance, refreshIndicatorExtent) {
            const Curve opacityCurve =
                Interval(0.4, 0.8, curve: Curves.easeInOut);
            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: offsetPadding),
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Opacity(
                  opacity: opacityCurve.transform(
                      min(pulledExtent / refreshIndicatorExtent, 1.0)),
                  child: const CupertinoActivityIndicator(radius: 10.0),
                ),
              ),
            );
          },
        );
}
