import 'package:design_system/design_system.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../../wallet.dart';
import '../../../core/theme/wallet_theme.dart';
import '../../wallet_constant.dart';
import 'form_element.dart';

typedef DropdownItemBuilder<T> = Widget Function(T item);

class SearchableDropdownButton<T> extends StatefulWidget {
  final List<T> items;
  final T? value;
  final DropdownItemBuilder<T> builderItem;
  final Widget? hintWidget;
  final ValueChanged<T?>? onChanged;
  final ValueChanged<String>? onSearch;
  final bool Function(T item, String searchValue) onSearchFn;
  final DropdownButtonBuilder? selectedBuilder;

  const SearchableDropdownButton({
    Key? key,
    required this.items,
    this.value,
    required this.builderItem,
    this.hintWidget,
    this.onChanged,
    this.onSearch,
    required this.onSearchFn,
    this.selectedBuilder,
  }) : super(key: key);

  @override
  State<SearchableDropdownButton<T>> createState() =>
      _SearchableDropdownButtonState<T>();
}

class _SearchableDropdownButtonState<T>
    extends State<SearchableDropdownButton<T>> {
  T? _valueSelected;
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  late final dropdownMaxHeight = MediaQuery.of(context).size.height -
      190 -
      MediaQuery.of(context).padding.bottom;

  @override
  void initState() {
    super.initState();
    _valueSelected = widget.value;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontal12,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: WalletConstant.borderRadius10,
        boxShadow: [
          BoxShadow(
            color: WalletTheme.black.withOpacity(0.12),
            blurRadius: 7,
            spreadRadius: 0,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          items: widget.items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: widget.builderItem(item),
                ),
              )
              .toList(),
          iconStyleData: IconStyleData(
            icon: ImageWidget(IconAppConstants.icArrowLeft),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.zero,
          ),
          selectedItemBuilder: widget.selectedBuilder,
          isExpanded: true,
          hint: widget.hintWidget ??
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Select Item',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          value: _valueSelected,
          onChanged: (T? value) {
            setState(() {
              _valueSelected = value;
              widget.onChanged?.call(value);
            });
          },
          dropdownStyleData: DropdownStyleData(
            maxHeight: dropdownMaxHeight,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: searchController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: FormElement(
                name: 'searchBank',
                hintText: 'Tìm kiếm tên ngân hàng',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ImageWidget(IconAppConstants.icArrowLeft),
                ),
                controller: searchController,
              ),
            ),
            searchMatchFn: (item, searchValue) {
              if (item.value != null) {
                return widget.onSearchFn(item.value as T, searchValue);
              }
              return false;
            },
          ),
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }
}
