import 'package:flutter/material.dart';

class RequirementCheckListWidget extends StatefulWidget {
  const RequirementCheckListWidget({
    super.key,
    required this.controller,
    this.color = Colors.white,
    this.doneColor = Colors.green,
  });

  final CheckListController controller;
  final Color color;
  final Color doneColor;

  @override
  State<RequirementCheckListWidget> createState() =>
      RequirementCheckListWidgetState();
}

class RequirementCheckListWidgetState
    extends State<RequirementCheckListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CheckListValue>(
        valueListenable: widget.controller,
        builder: (_, value, __) {
          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final e = value.items[index];
              final color = e.isDone ? widget.doneColor : widget.color;
              return Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: color,
                    size: 14,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    e.title,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontWeight: FontWeight.w500, color: color),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: value.items.length,
          );
        });
  }
}

class CheckListController extends ValueNotifier<CheckListValue> {
  CheckListController(
    List<RequirementItem> items,
  ) : super(CheckListValue(items));
  bool validation() {
    value = value.copyWith(isActiveValidate: true);

    bool done = true;
    for (var i = 0; i < value.items.length; i++) {
      final isDoneItem = value.items[i].validator();
      value.items[i] = value.items[i].copyWith(isDone: isDoneItem);
      if (isDoneItem == false && done) {
        done = false;
      }
    }

    notifyListeners();
    return done;
  }
}

class CheckListValue {
  final List<RequirementItem> _items;
  final bool _isActiveValidate;

  CheckListValue(
    List<RequirementItem> items, [
    bool isActiveValidate = false,
  ])  : _items = items,
        _isActiveValidate = isActiveValidate;

  List<RequirementItem> get items => _items;

  void update(RequirementItem item) {
    final index = _items.indexWhere((element) => element.title == item.title);

    if (index >= 0) {
      _items[index] = item;
    }
  }

  bool get isActive => _isActiveValidate;

  bool get isDone {
    for (final element in _items) {
      if (element.isDone == false) {
        return false;
      }
    }

    return true;
  }

  CheckListValue copyWith({
    List<RequirementItem>? items,
    bool? isActiveValidate,
  }) {
    return CheckListValue(
        items ?? _items, isActiveValidate ?? _isActiveValidate);
  }
}

class RequirementItem {
  final String title;
  final bool isDone;
  final bool Function() validator;

  RequirementItem({
    required this.title,
    this.isDone = false,
    required this.validator,
  });

  RequirementItem copyWith({
    String? title,
    bool? isDone,
    bool Function()? validator,
  }) {
    return RequirementItem(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      validator: validator ?? this.validator,
    );
  }
}
