import 'package:flutter/widgets.dart';

class SliverListSeparator extends SliverList {
  SliverListSeparator({
    super.key,
    required SliverChildBuilderDelegate delegate,
    required IndexedWidgetBuilder separatorBuilder,
  }) : super(
          delegate: SliverChildBuilderDelegate((context, index) {
            if (index % 2 == 0) {
              return delegate.builder(context, index ~/ 2);
            }
            return separatorBuilder(context, index);
          },
              childCount:
                  (delegate.childCount ?? 0) + (delegate.childCount ?? 1) - 1),
        );
}
