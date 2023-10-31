import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../getlist_bloc/bloc/get_list_bloc.dart';
import '../../mobilehub_constants.dart';
import '../../widgets/empty_widget.dart';
import '../listing_builder_widget.dart';

typedef SliverTitleBuillder<T> = Widget Function(List<T> listItems);

class ListViewBuilderWidget<B extends StateStreamable<GetListState>, T, P>
    extends StatefulWidget {
  final P param;
  final EdgeInsets scrollbarPaddingContent;
  final EdgeInsets paddingList;
  final int offsetWillLoadMore;
  final ListingBuillder<T> builder;
  final int limitDefault;
  final int offsetDefault;
  final bool enableRefresh;
  final bool autoFetchWhenInit;
  final Widget Function()? initStateBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final bool reverse;
  final ScrollToItemType? typeScroll;
  final ScrollController? scrollController;
  final Widget? errorWidget;
  final Widget emptyWidget;
  final Widget? title;
  final SliverTitleBuillder? sliverTitle;
  final Widget? footer;
  final PageStorageKey? pageStorageKey;
  final ScrollPhysics? physics;
  final String? keyName;
  final bool enableSliverOverlapInjector;

  const ListViewBuilderWidget.listview({
    Key? key,
    required this.param,
    required this.builder,
    this.initStateBuilder,
    this.offsetWillLoadMore = 3,
    this.limitDefault = 10,
    this.offsetDefault = 1,
    this.enableRefresh = true,
    this.autoFetchWhenInit = true,
    this.scrollbarPaddingContent = paddingDefault,
    this.paddingList = EdgeInsets.zero,
    this.emptyWidget = emptyWidgetDefault,
    this.separatorBuilder,
    this.reverse = false,
    this.typeScroll,
    this.errorWidget,
    this.title,
    this.footer,
    this.scrollController,
    this.pageStorageKey,
    this.sliverTitle,
    this.physics,
    this.keyName,
    this.enableSliverOverlapInjector = true,
  }) : super(key: key);

  @override
  State<ListViewBuilderWidget> createState() =>
      _ListViewBuilderWidgetState<B, T, P>();
}

class _ListViewBuilderWidgetState<B extends StateStreamable<GetListState>, T, P>
    extends State<ListViewBuilderWidget<B, T, P>> {
  Completer? completer;
  P? paramSearch;
  late ScrollController controller;
  ListScrollController? listScrollController;
  bool hasLoadMore = true;

  void _onListenerListingBloc(BuildContext context, GetListState state) {
    if (state is GetListDataPagingSuccess<T, int, int>) {
      if (state is GetListDataFromItemSuccess<T, int, int>) {
        final jumpIndex = state.index;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (widget.typeScroll != null) {
            listScrollController?.to(jumpIndex, widget.typeScroll!);
          }
        });
      }
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
    controller = widget.scrollController ?? ScrollController();
    paramSearch = widget.param;
    if (widget.typeScroll != null) {
      listScrollController = ListScrollController();
    }
    if (widget.autoFetchWhenInit) {
      _fetchListData(widget.offsetDefault, TypeFetchPaging.refresh);
    }
  }

  @override
  void didUpdateWidget(covariant ListViewBuilderWidget<B, T, P> oldWidget) {
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

        final bodyWidget = CustomScrollView(
          physics: widget.enableSliverOverlapInjector
              ? const NeverScrollableScrollPhysics()
              : null,
          key: PageStorageKey<String>(
              'namexxx:name${widget.keyName ?? hashCode}'),
          slivers: <Widget>[
            if (widget.title != null)
              SliverToBoxAdapter(
                child: widget.title,
              ),
            if (UniversalPlatform.isAndroid == false)
              SliverRefreshIndicatorWidget(
                onRefresh: _onRefresh,
                offsetPadding: offsetRefreshLoadingIOS,
              ),
            if (widget.enableSliverOverlapInjector)
              SliverOverlapInjector(
                // This is the flip side of the SliverOverlapAbsorber above.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
            if (widget.sliverTitle != null)
              SliverToBoxAdapter(child: widget.sliverTitle!(listData)),
            if (isLoading)
              const SliverFillRemaining(child: LoadingWidget())
            else if (listData.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (widget.separatorBuilder == null) {
                      return builder(index, listData);
                    }

                    if (index % 2 == 0) {
                      return builder(index ~/ 2, listData);
                    }
                    return widget.separatorBuilder!(context, index);
                  },
                  childCount: widget.separatorBuilder == null
                      ? listData.length
                      : (listData.length + listData.length - 1),
                ),
              )
            else if (listData.isEmpty && isLoading == false)
              SliverFillRemaining(child: widget.emptyWidget),
          ],
        );

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
