import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../getlist_bloc/bloc/get_list_bloc.dart';
import '../../mobilehub_constants.dart';
import '../../widgets/empty_widget.dart';

typedef SliverBodyBuilder<T> = List<Widget> Function(List<T> items);

class ListBlockBuilderWidget<B extends StateStreamable<GetListState>, T>
    extends StatefulWidget {
  final EdgeInsets paddingList;
  final int limitDefault;
  final int offsetDefault;
  final bool enableRefresh;
  final bool autoFetchWhenInit;
  final ScrollController? scrollController;
  final Widget? errorWidget;
  final Widget emptyWidget;
  final Widget? title;
  final ScrollPhysics? physics;
  final SliverBodyBuilder<T> sliverItemsBlockBuilder;

  const ListBlockBuilderWidget({
    Key? key,
    this.limitDefault = 10,
    this.offsetDefault = 1,
    this.enableRefresh = true,
    this.autoFetchWhenInit = true,
    this.paddingList = EdgeInsets.zero,
    this.emptyWidget = emptyWidgetDefault,
    this.errorWidget,
    this.title,
    this.scrollController,
    this.physics,
    required this.sliverItemsBlockBuilder,
  }) : super(key: key);

  @override
  State<ListBlockBuilderWidget> createState() =>
      _ListBlockBuilderWidgetState<B, T>();
}

class _ListBlockBuilderWidgetState<B extends StateStreamable<GetListState>, T>
    extends State<ListBlockBuilderWidget<B, T>> {
  Completer? completer;
  late ScrollController controller;

  void _onListenerListingBloc(BuildContext context, GetListState state) {
    if (state is GetListDataSuccess<T>) {
      if (completer?.isCompleted == false) {
        completer?.complete();
        completer = null;
      }
    }
  }

  Future<void> _onRefresh() async {
    (context.read<B>() as Bloc).add(GetListDataEvent());
    completer = Completer();
    await completer?.future;
  }

  @override
  void initState() {
    super.initState();
    controller = widget.scrollController ?? ScrollController();

    if (widget.autoFetchWhenInit) {
      _onRefresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, GetListState>(
      listener: _onListenerListingBloc,
      builder: (context, state) {
        final listData = <T>[];

        if (state is GetListDataSuccess<T>) {
          listData.addAll(state.data);
        }

        final isLoading =
            state is GetListDataLoading || state is GetListBlocInitial;

        final bodyWidget = CustomScrollView(
          slivers: <Widget>[
            if (widget.enableRefresh && UniversalPlatform.isAndroid == false)
              SliverRefreshIndicatorWidget(
                onRefresh: _onRefresh,
                offsetPadding: offsetRefreshLoadingIOS,
              ),
            if (widget.title != null) SliverToBoxAdapter(child: widget.title!),
            if (isLoading)
              const SliverFillRemaining(child: LoadingWidget())
            else if (listData.isNotEmpty)
              ...widget.sliverItemsBlockBuilder(listData)
            else if (listData.isEmpty && isLoading == false)
              SliverFillRemaining(child: widget.emptyWidget),
          ],
        );

        if (widget.enableRefresh && UniversalPlatform.isAndroid) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            edgeOffset: offsetRefreshLoadingAndroid,
            child: bodyWidget,
          );
        }

        return bodyWidget;
      },
    );
  }
}
