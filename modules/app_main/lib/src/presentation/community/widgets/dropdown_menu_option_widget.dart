import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

import '../group_detail/group_detail_constants.dart';

class DropdownMenuOptionWidget extends StatelessWidget {
  const DropdownMenuOptionWidget({
    super.key,
    required this.onChanged,
  });

  final Function(GroupDetailAction?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownMenuButton<GroupDetailAction>(
      builder: (item) => DropdownItemWidget(
        text: item.getText(context),
      ),
      // onChanged: (type) {
      //   if (type == GroupDetailAction.edit) {
      //     _onTapEdit(group!);
      //   }
      // },
      onChanged: onChanged,
      dropdownWidth: 180,
      items: GroupDetailAction.values,
      customButton: GestureDetector(
        child: const Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
