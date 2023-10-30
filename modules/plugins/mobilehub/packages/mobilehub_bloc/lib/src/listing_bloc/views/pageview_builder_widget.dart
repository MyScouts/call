import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../getlist_bloc/bloc/get_list_bloc.dart';
import '../../mobilehub_constants.dart';
import '../../widgets/empty_widget.dart';
import '../listing_builder_widget.dart';

class PageViewBuilderWidget<B extends StateStreamable<GetListState>, T, P>
    extends StatefulWidget {
  final P param;
  final int offsetWillLoadMore;
  final ListingBuillder<T> builder;
  final int limitDefault;
  final int offsetDefault;
  final bool enableRefresh;
  final bool autoFetchWhenInit;
  final PageController? pageController;
  final Widget emptyWidget;
  final Axis scrollDirection;

  const PageViewBuilderWidget({
    Key? key,
    required this.param,
    required this.builder,
    this.offsetWillLoadMore = 3,
    this.limitDefault = 10,
    this.offsetDefault = 1,
    this.enableRefresh = true,
    this.autoFetchWhenInit = true,
    this.emptyWidget = emptyWidgetDefault,
    this.pageController,
    this.scrollDirection = Axis.horizontal,
  }) : super(key: key);

  @override
  State<PageViewBuilderWidget> createState() =>
      _PageViewBuilderWidgetState<B, T, P>();
}

class _PageViewBuilderWidgetState<B extends StateStreamable<GetListState>, T, P>
    extends State<PageViewBuilderWidget<B, T, P>> {
  Completer? completer;
  P? paramSearch;
  bool hasLoadMore = true;

  void _onListenerListingBloc(BuildContext context, GetListState state) {
    if (state is GetListDataPagingSuccess<T, int, int>) {
      if (completer?.isCompleted == false) {
        completer?.complete();
        completer = null;
      }
    }
  }

  Future<void> _onRefresh() async {
    _fetchListData(widget.offsetDefault, TypeFetchPaging.refresh);
    completer = Completer();
    await completer?.future;
  }

  void _fetchListData(
      [int? offset, TypeFetchPaging type = TypeFetchPaging.fetch]) {
    final currentState = (context.read<B>() as Bloc).state;

    var offsetCurrent = offset ?? widget.offsetDefault;
    var limitCurrent = widget.limitDefault;

    if (currentState is GetListDataPagingSuccess<T, int, int>) {
      offsetCurrent = offset ?? currentState.offset;
      limitCurrent = currentState.limit;
    }

    (context.read<B>() as Bloc).add(
      GetListPagingEvent<P, int, int>(
        paramSearch as P,
        limit: limitCurrent,
        offset: offsetCurrent,
        type: type,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    paramSearch = widget.param;

    if (widget.autoFetchWhenInit) {
      _fetchListData(widget.offsetDefault);
    }
  }

  @override
  void didUpdateWidget(covariant PageViewBuilderWidget<B, T, P> oldWidget) {
    if (oldWidget.param != widget.param) {
      paramSearch = widget.param;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, GetListState>(
      listener: _onListenerListingBloc,
      builder: (context, state) {
        final listData = <T>[];

        /// A function that returns a widget when the state is an error.

        if (state is GetListDataPagingSuccess<T, int, int>) {
          listData.addAll(state.data);
          hasLoadMore = state.hasLoadMore;
        }

        final isLoading =
            state is GetListDataLoading || state is GetListBlocInitial;
        late Widget bodyWidget;
        if (isLoading) {
          bodyWidget = const LoadingWidget();
        } else {
          if (listData.isEmpty) {
            bodyWidget = widget.emptyWidget;
          } else {
            bodyWidget = PreloadPageView.builder(
              // controller: widget.pageController,
              preloadPagesCount: 4,
              scrollDirection: widget.scrollDirection,
              itemCount: listData.length,
              itemBuilder: (context, index) {
                return builder(index, listData);
              },
            );
          }
        }

        if (UniversalPlatform.isAndroid && widget.enableRefresh) {
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

  Widget builder(int index, List<T> listData) {
    final isEnd = index == (listData.length - widget.offsetWillLoadMore);

    if (hasLoadMore && isEnd) {
      hasLoadMore = false;
      _fetchListData();
    }

    return widget.builder(context, listData, index, listData[index]);
  }
}
