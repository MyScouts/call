import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilehub_ui_core/mobilehub_ui_core.dart';

import '../getlist_bloc/bloc/get_list_bloc.dart';
import '../getlist_bloc/views/getlist_builder.dart';
import '../widgets/empty_widget.dart';

typedef ListingBuillder<T> = Widget Function(
    BuildContext context, List<T> listItems, int index, T item);

class ListingBuilderWidget<B extends StateStreamable<GetListState>, T, P>
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
  final Widget? sliverTitle;
  final Widget? footer;
  final PageStorageKey? pageStorageKey;
  final ScrollPhysics? physics;
  final SliverGridDelegate? _gridDelegate;
  final Function(BuildContext context, GetListState state)? listener;

  const ListingBuilderWidget.listview({
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
    this.listener,
  })  : _gridDelegate = null,
        super(key: key);

  const ListingBuilderWidget.gridview({
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
    this.emptyWidget = emptyWidgetDefault,
    this.reverse = false,
    SliverGridDelegate? gridDelegate,
    this.errorWidget,
    this.title,
    this.paddingList = EdgeInsets.zero,
    this.footer,
    this.scrollController,
    this.pageStorageKey,
    this.sliverTitle,
    this.physics,
    this.listener,
  })  : _gridDelegate = gridDelegate ?? _kGridDelegate,
        separatorBuilder = null,
        typeScroll = null,
        super(key: key);

  @override
  State<ListingBuilderWidget> createState() =>
      _ListingBuilderWidgetState<B, T, P>();
}

class _ListingBuilderWidgetState<B extends StateStreamable<GetListState>, T, P>
    extends State<ListingBuilderWidget<B, T, P>> {
  Completer? completer;
  P? paramSearch;
  late ScrollController controller;
  ListScrollController? listScrollController;
  bool hasLoadMore = true;

  void _onListenerListingBloc(BuildContext context, GetListState state) {
    widget.listener?.call(context, state);
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
  void didUpdateWidget(covariant ListingBuilderWidget<B, T, P> oldWidget) {
    if (oldWidget.param != widget.param) {
      paramSearch = widget.param;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GetListParam3Builder<B, GetListState>(
      initStateBuilder: widget.initStateBuilder,
      listener: _onListenerListingBloc,
      useLoading: false,
      builderError: widget.errorWidget != null
          ? (context, data) {
              return widget.errorWidget!;
            }
          : null,
      builder: (context, state) {
        final listData = <T>[];

        if (state is GetListDataPagingSuccess<T, int, int>) {
          listData.addAll(state.data);
          hasLoadMore = state.hasLoadMore;
        }

        return Scrollbar(
          controller: controller,
          child: Padding(
            padding: widget.scrollbarPaddingContent,
            child: ListBuilderWidget(
              sliverTitle: widget.sliverTitle,
              pageStorageKey: widget.pageStorageKey,
              physics: widget.physics ??
                  (widget.enableRefresh == false && listData.isEmpty
                      ? const NeverScrollableScrollPhysics()
                      : null),
              separatorBuilder: widget.separatorBuilder,
              listScrollController: listScrollController,
              emptyWidget: widget.emptyWidget,
              isLoading: state is GetListDataLoading,
              scrollController: controller,
              padding: widget.paddingList,
              reverse: widget.reverse,
              title: widget.title,
              footer: widget.footer,
              onRefresh: widget.enableRefresh ? _onRefresh : null,
              builder: (context, index) {
                final isEnd =
                    index == (listData.length - widget.offsetWillLoadMore);

                if (hasLoadMore && isEnd) {
                  hasLoadMore = false;
                  _fetchListData();
                }

                return widget.builder(
                    context, listData, index, listData[index]);
              },
              childCount: listData.length,
              gridDelegate: widget._gridDelegate,
            ),
          ),
        );
      },
    );
  }
}

class JumpToItem {
  final int index;

  JumpToItem(this.index);
}

const _kGridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 300,
  mainAxisExtent: 290,
  crossAxisSpacing: 6,
  mainAxisSpacing: 5,
);
