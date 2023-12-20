import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

import 'item_model.dart';

double maxHeight = 0.0;

double itemCell = 0.0;

class CustomerMultiChildView extends StatefulWidget {
  final int columnNum;
  final List<CustomerItem> itemAll;
  final double padding;
  final Function(List<CustomerItem> items)? onChildrenChanged;
  final Function()? onDragStarted;
  final Function()? onDragEnd;
  final bool isDraggable;
  final Function(CustomerItem moveData, CustomerItem toData)? onGroup;

  const CustomerMultiChildView(
    this.itemAll,
    this.columnNum,
    this.padding,
    this.onChildrenChanged,
    this.onDragStarted,
    this.onDragEnd,
    this.isDraggable,
    this.onGroup, {
    Key? key,
  }) : super(key: key);

  @override
  _CustomerMultiChildViewState createState() => _CustomerMultiChildViewState();
}

class _CustomerMultiChildViewState extends State<CustomerMultiChildView>
    with SingleTickerProviderStateMixin {
  String? dragId;

  Offset? dragPosition;

  int nowMoveIndex = -1;

  int nowAcceptIndex = -1;

  double process = 0.0;

  List<CustomerItem> itemAll = [];

  List<CustomerItem> itemChangeAll = [];

  final Map<String, Offset> _mapPosition = {};

  final Map<String, Size> _mapSize = {};

  final Map<String, BuildContext> _mapContext = {};

  late AnimationController _controller;

  @override
  void initState() {
    itemAll = widget.itemAll;
    _controller = AnimationController(
      lowerBound: 0.0,
      upperBound: 1.0,
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        process = _controller.value;
        if (_controller.isCompleted) {
          changeItemChangeAllToItemAll();
          _controller.reset();
        }
        setState(() {});
      });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});
    });
  }

  Timer? _timer;

  void exchangeItem(moveIndex, toIndex) {
    if (itemChangeAll.isEmpty) {
      for (var element in itemAll) {
        itemChangeAll.add(element);
      }
    }
    setState(() {
      var moveData = itemChangeAll[moveIndex];
      var reIndex = itemChangeAll.indexOf(moveData);
      var receiveData = itemChangeAll[toIndex];
      itemChangeAll.remove(moveData);
      var receiveIndex = itemChangeAll.indexOf(receiveData);
      if (receiveIndex >= reIndex) receiveIndex += 1;
      itemChangeAll.insert(receiveIndex, moveData);
    });
  }

  changeItemChangeAllToItemAll() async {
    itemAll = itemChangeAll;
    itemChangeAll = [];
  }

  @override
  void didUpdateWidget(covariant CustomerMultiChildView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isDraggable != widget.isDraggable) {
      if (mounted) {
        setState(() {});
      }
    }
    if (oldWidget.itemAll != widget.itemAll) {
      setState(() {
        itemAll = widget.itemAll;
      });
    }
  }

  Widget generateItem(int index) {
    Widget child = SizedBox(
      width: itemAll[index].crossAxisCellCount! * itemCell,
      height: itemAll[index].mainAxisCellCount! * itemCell,
      child: Center(
        child: itemAll[index].child,
      ),
    );

    if (widget.isDraggable) {
      child = Draggable(
        data: itemAll[index].id,
        child: DragTarget(
          builder: (ctx, candidateData, rejectedData) {
            _mapContext[itemAll[index].id] = ctx;
            return itemAll[index].child;
          },
          onWillAccept: (moveData) {
            var accept = moveData != null;
            if (accept &&
                dragId != itemAll[index].id &&
                itemAll[index].id != moveData) {
              nowMoveIndex = itemAll.indexWhere((e) => e.id == moveData);
              nowAcceptIndex = index;
            }
            return accept;
          },
          onLeave: (moveData) {
            final index = itemAll.indexWhere((e) => e.id == moveData);
            if (index == nowMoveIndex) {
              nowMoveIndex = -1;
            }
            if (index == nowAcceptIndex) {
              nowAcceptIndex = -1;
            }
          },
        ),
        childWhenDragging: const SizedBox.shrink(),
        feedback: SizedBox(
          width: itemAll[index].crossAxisCellCount! * itemCell,
          height: itemAll[index].mainAxisCellCount! * itemCell,
          child: child,
        ),
        onDragStarted: () {
          dragId = itemAll[index].id;
          widget.onDragStarted?.call();
        },
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          if (_timer != null) _timer?.cancel();
          dragPosition = null;
        },
        onDragEnd: (_) {
          if (_timer != null) _timer?.cancel();
          widget.onDragEnd?.call();
          widget.onChildrenChanged?.call(itemAll);
        },
        onDragUpdate: (detail) {
          if (dragPosition == null) {
            calculatePosition();
          }
          dragPosition ??= _mapPosition[dragId] ?? Offset.zero;
          dragPosition = Offset(
            dragPosition!.dx + detail.delta.dx,
            dragPosition!.dy + detail.delta.dy,
          );
          calculateChangeItem();
        },
        onDragCompleted: () {
          if (_timer != null) _timer?.cancel();
          dragPosition = null;
          dragId = null;
          nowAcceptIndex = -1;
          nowMoveIndex = -1;
        },
      );
    }
    return LayoutId(
      id: itemAll[index].id,
      child: child,
    );
  }

  void calculatePosition() {
    for (final i in itemAll) {
      final ctx = _mapContext[i.id]!;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null) continue;
      _mapPosition[i.id] = box.localToGlobal(Offset.zero);
      _mapSize[i.id] = box.size;
    }
  }

  void calculateChangeItem() {
    int _nowAcceptIndex = nowAcceptIndex;
    int _nowMoveIndex = nowMoveIndex;
    if (_nowAcceptIndex == -1 || _nowMoveIndex == -1) return;
    Future.delayed(const Duration(milliseconds: 150), () {
      if (_nowAcceptIndex == nowAcceptIndex && _nowMoveIndex == nowMoveIndex) {
        nowAcceptIndex = -1;
        nowMoveIndex = -1;

        final moveIndexType = itemAll[_nowMoveIndex].type;
        final acceptIndexType = itemAll[_nowAcceptIndex].type;

        if (moveIndexType == CustomerItemType.icon) {
          if (acceptIndexType == CustomerItemType.icon ||
              acceptIndexType == CustomerItemType.group) {
            if (groupAvailable(_nowMoveIndex, _nowAcceptIndex)) {
              groupActive(_nowMoveIndex, _nowAcceptIndex);
              return;
            }
          }
        }

        if (_timer != null) _timer?.cancel();

        if (!_controller.isAnimating) {
          exchangeItem(_nowMoveIndex, _nowAcceptIndex);
          _controller.forward();
        } else {
          _controller.reset();
          exchangeItem(_nowMoveIndex, _nowAcceptIndex);
          _controller.forward();
        }
      }
    });
  }

  void groupActive(moveIndex, toIndex) {
    if (_timer != null) _timer?.cancel();
    _timer = Timer(const Duration(seconds: 1), () {
      if (groupAvailable(moveIndex, toIndex)) {
        widget.onGroup?.call(itemAll[moveIndex], itemAll[toIndex]);
      }
      _timer?.cancel();
    });
  }

  bool groupAvailable(moveIndex, toIndex) {
    if (dragPosition == null) return false;

    final data = itemAll[toIndex];

    final fromOffset = _mapPosition[data.id] ?? Offset.zero;
    final fromSize = _mapSize[data.id] ?? Size.zero;

    final d = fromSize.width >= fromSize.height
        ? fromSize.height / 2
        : fromSize.width / 2;

    final centerFromOffset = Offset(
      fromOffset.dx + fromSize.width / 2,
      fromOffset.dy + fromSize.height / 2,
    );

    final moveData = itemAll[moveIndex];

    final sizeDrag = _mapSize[moveData.id] ?? Size.zero;

    final centerDrag = Offset(
      dragPosition!.dx + sizeDrag.width / 2,
      dragPosition!.dy + sizeDrag.height / 2,
    );

    final m = sqrt(pow(centerDrag.dx - centerFromOffset.dx, 2) +
        pow(centerDrag.dy - centerFromOffset.dy, 2));
    return m <= d * 0.6;
  }

  List<Widget> generateList() {
    List<Widget> list = [];
    for (var index = 0; index < itemAll.length; index++) {
      list.add(generateItem(index));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: CustomMultiChildLayout(
            delegate: ProxyClass(itemAll, itemChangeAll, process,
                widget.columnNum, widget.padding),
            children: generateList(),
          ),
        ),
      ),
    );
  }
}

class ProxyClass extends MultiChildLayoutDelegate {
  final List<CustomerItem> itemAll;
  final List<CustomerItem> itemChangeAll;
  final double process;
  final int columnNum;
  final double padding;

  ProxyClass(this.itemAll, this.itemChangeAll, this.process, this.columnNum,
      this.padding) {
    columnH = List.generate(columnNum, (index) {
      return 0.0;
    });

    columnLastH = List.generate(columnNum, (index) {
      return 0.0;
    });
  }

  late List columnH;
  late List columnLastH;

  int checkNowRow(Size size, double itemCell, List columnH, List columnLastH) {
    int insertIndex = -1;
    double maxHeight = columnH.fold(
        columnH[0],
        (previousValue, element) =>
            previousValue > element ? previousValue : element);

    for (var indexX = 0; indexX < columnH.length; indexX++) {
      if (columnH[indexX] - columnLastH[indexX] < itemCell) {
        int length = size.width ~/ itemCell;
        if (columnH.length - indexX >= length) {
          insertIndex = indexX;
          for (var indexY = 0; indexY < length; indexY++) {
            if (columnH[indexY + indexX] - columnLastH[indexY + indexX] <
                itemCell) {
            } else if (maxHeight - columnH[indexY + indexX] < size.height) {
              insertIndex = -1;
              break;
            }
          }
          return insertIndex;
        }
      }
    }

    for (var indexX = 0; indexX < columnH.length; indexX++) {
      if (maxHeight - columnH[indexX] >= size.height) {
        int length = size.width ~/ itemCell;
        if (columnH.length - indexX >= length) {
          insertIndex = indexX;
          for (var indexY = 0; indexY < length; indexY++) {
            if (columnH[indexY + indexX] - columnLastH[indexY + indexX] <
                itemCell) {
            } else if (maxHeight - columnH[indexY + indexX] < size.height) {
              insertIndex = -1;
              break;
            }
          }
          break;
        }
      }
    }
    if (insertIndex == -1) {
      updateColumnH(columnH, columnLastH);
    }
    return insertIndex;
  }

  void updateColumnH(List columnH, List columnLastH) {
    double maxHeight = columnH.fold(
        columnH[0],
        (previousValue, element) =>
            previousValue > element ? previousValue : element);
    for (var index = 0; index < columnH.length; index++) {
      columnH[index] = maxHeight;
      columnLastH[index] = maxHeight;
    }
  }

  List<ItemPosition> calculateFormLayout(List<CustomerItem> itemAll) {
    List<ItemPosition> calculateItemPosition = [];
    double offsetX = 0;

    int nowRowIndex = 0;
    for (int i = 0; i < itemAll.length; i++) {
      Size itemSize = layoutChild(
          itemAll[i].id,
          BoxConstraints(
              minWidth: itemCell * (itemAll[i].crossAxisCellCount!) +
                  ((itemAll[i].crossAxisCellCount!) - 1) * padding,
              maxWidth: itemCell * (itemAll[i].crossAxisCellCount!) +
                  ((itemAll[i].crossAxisCellCount!) - 1) * padding,
              minHeight: itemCell * (itemAll[i].mainAxisCellCount!) +
                  ((itemAll[i].mainAxisCellCount!) - 1) * padding,
              maxHeight: itemCell * (itemAll[i].mainAxisCellCount!) +
                  ((itemAll[i].mainAxisCellCount!) - 1) * padding));

      if (true) {
        int insertIndex = checkNowRow(itemSize, itemCell, columnH, columnLastH);
        if (insertIndex == -1) {
          offsetX = 0;
          nowRowIndex = 0;
        } else {
          offsetX = insertIndex * itemCell +
              (insertIndex >= 1 ? insertIndex : 0) * padding;
          nowRowIndex = insertIndex;
        }
      }

      calculateItemPosition.add(ItemPosition(itemAll[i].id,
          Offset(offsetX + padding * 0.5, columnH[nowRowIndex])));

      offsetX += padding +
          itemCell * (itemAll[i].crossAxisCellCount ?? 1) +
          ((itemAll[i].crossAxisCellCount ?? 1) - 1) * padding;

      for (var c = 0; c < itemAll[i].crossAxisCellCount!; c++) {
        columnH[nowRowIndex] += itemSize.height + padding;
        if (nowRowIndex < columnNum - 1) {
          nowRowIndex++;
        }
      }
    }
    calculateItemPosition.sort((a, b) => a.id.compareTo(b.id));
    return calculateItemPosition;
  }

  void positionItem(List<ItemPosition> itemPositionList) {
    for (var element in itemPositionList) {
      positionChild(element.id, element.offset);
    }
    columnH.clear();
    columnLastH.clear();
  }

  List<ItemPosition> calculateOffset(List<ItemPosition> itemPositionList,
      List<ItemPosition> dragItemPosition) {
    List<ItemPosition> item = [];
    for (var index = 0; index < itemAll.length; index++) {
      Offset offset =
          dragItemPosition[index].transform(itemPositionList[index]);
      item.add(ItemPosition(
          itemPositionList[index].id,
          Offset(itemPositionList[index].offset.dx + offset.dx * process,
              itemPositionList[index].offset.dy + offset.dy * process)));
    }
    return item;
  }

  @override
  void performLayout(Size size) {
    double actualWidth = size.width - (columnNum + 1) * padding;

    itemCell = actualWidth / columnNum;

    List<ItemPosition> itemPositionList = calculateFormLayout(itemAll);

    if (itemChangeAll.isEmpty) {
      positionItem(itemPositionList);
    } else {
      List<ItemPosition> dragItemPosition =
          calculateDragFormLayout(itemChangeAll);
      var item = calculateOffset(itemPositionList, dragItemPosition);
      positionItem(item);
    }

    for (var element in columnH) {
      maxHeight = max(maxHeight, element);
    }
  }

  @override
  bool shouldRelayout(covariant ProxyClass oldDelegate) {
    if (itemChangeAll.isEmpty || oldDelegate.itemChangeAll.isEmpty) {
      return false;
    }
    for (var index = 0; index < itemAll.length; index++) {
      bool itemEqual = oldDelegate.itemAll[index].compare(itemAll[index]);
      if (!itemEqual) {
        return true;
      }
      bool itemChangeEqual =
          oldDelegate.itemChangeAll[index].compare(itemChangeAll[index]);
      if (!itemChangeEqual) {
        return true;
      }
      bool itemCompareEqual =
          oldDelegate.itemAll[index].compare(itemChangeAll[index]);
      if (!itemCompareEqual) {
        return true;
      }
    }
    if (oldDelegate.process != process) {
      return true;
    }
    return false;
  }

  List<ItemPosition> calculateDragFormLayout(List<CustomerItem> itemChangeAll) {
    List<ItemPosition> calculateItemPosition = [];

    List columnH = List.generate(columnNum, (index) {
      return 0.0;
    });

    List columnLastH = List.generate(columnNum, (index) {
      return 0.0;
    });

    double offsetX = 0;

    int nowRowIndex = 0;
    for (int i = 0; i < itemChangeAll.length; i++) {
      Size itemSize = getSize(BoxConstraints(
          minWidth: itemCell * (itemChangeAll[i].crossAxisCellCount!) +
              ((itemChangeAll[i].crossAxisCellCount!) - 1) * padding,
          maxWidth: itemCell * (itemChangeAll[i].crossAxisCellCount!) +
              ((itemChangeAll[i].crossAxisCellCount!) - 1) * padding,
          minHeight: itemCell * (itemChangeAll[i].mainAxisCellCount!) +
              ((itemChangeAll[i].mainAxisCellCount!) - 1) * padding,
          maxHeight: itemCell * (itemChangeAll[i].mainAxisCellCount!) +
              ((itemChangeAll[i].mainAxisCellCount!) - 1) * padding));

      if (true) {
        int insertIndex = checkNowRow(itemSize, itemCell, columnH, columnLastH);
        if (insertIndex == -1) {
          offsetX = 0;
          nowRowIndex = 0;
        } else {
          offsetX = insertIndex * itemCell +
              (insertIndex >= 1 ? insertIndex : 0) * padding;
          nowRowIndex = insertIndex;
        }
      }

      calculateItemPosition.add(ItemPosition(itemChangeAll[i].id!,
          Offset(offsetX + padding * 0.5, columnH[nowRowIndex])));

      offsetX += padding +
          itemCell * (itemChangeAll[i].crossAxisCellCount ?? 1) +
          ((itemChangeAll[i].crossAxisCellCount ?? 1) - 1) * padding;

      for (var c = 0; c < itemChangeAll[i].crossAxisCellCount!; c++) {
        columnH[nowRowIndex] += itemSize.height + padding;
        if (nowRowIndex < columnNum - 1) {
          nowRowIndex++;
        }
      }
    }
    calculateItemPosition.sort((a, b) => a.id.compareTo(b.id));
    return calculateItemPosition;
  }
}
