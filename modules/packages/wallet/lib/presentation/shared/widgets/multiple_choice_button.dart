import 'package:app_core/app_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class MultipleChoiceButton<T> extends StatefulWidget {
  final List<T>? defaultValue;
  final List<String> titles;
  final List<T> values;
  final ValueChanged<List<T>> onSelected;

  const MultipleChoiceButton({
    Key? key,
    this.defaultValue,
    required this.titles,
    required this.values,
    required this.onSelected,
  })  : assert(
          titles.length == values.length,
          'titles.length != values.length',
        ),
        super(key: key);

  @override
  MultipleChoiceButtonState<T> createState() => MultipleChoiceButtonState();
}

class MultipleChoiceButtonState<T> extends State<MultipleChoiceButton<T>> {
  final _selectedIndex = <int>[];

  void setSelectedIndex(int index) => setState(
        () => index.let(
          _selectedIndex.contains(index)
              ? _selectedIndex.remove
              : _selectedIndex.add,
        ),
      );

  @override
  void initState() {
    if (widget.defaultValue != null) {
      _selectedIndex
        ..clear()
        ..addAll(
          widget.defaultValue!
              .map(widget.values.indexOf)
              .where((element) => element != -1),
        );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 3.5,
      ),
      children: widget.titles
          .asMap()
          .entries
          .map(
            (e) => OutlinedButton(
              onPressed: () {
                setSelectedIndex(e.key);

                final selectedValues =
                    _selectedIndex.map(widget.values.elementAt).toList();
                widget.onSelected(selectedValues);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(4),
                backgroundColor: _selectedIndex.contains(e.key)
                    ? WalletTheme.blueCheckedColor
                    : AppColors.blue5,
                side: const BorderSide(
                  color: WalletTheme.blueCheckedColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 1,
              ),
              child: Text(
                e.value,
                textAlign: TextAlign.center,
                style: context.text.bodyMedium!.copyWith(
                  color: _selectedIndex.contains(e.key)
                      ? AppColors.white
                      : WalletTheme.black,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
